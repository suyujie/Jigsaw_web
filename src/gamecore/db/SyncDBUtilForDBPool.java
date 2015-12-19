package gamecore.db;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 同步执行sql，专门针对分库查询
 * @author zhangdanli
 */
public class SyncDBUtilForDBPool extends DataAccessObject {

	private static Logger logger = LogManager.getLogger(SyncDBUtilForDBPool.class.getName());

	/**
	 * 此方法只适用于  select count(*) from table 类型的查询
	 * @param dBOperator
	 * @param sql
	 * @param args
	 * @return
	 */
	public static Map<String, Object> readMap(DBOperator dBOperator, String sql, Object[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<Integer, Connection> connections = getConns(dBOperator);
		if (connections == null) {
			logger.error("no connection");
		}

		ExecutorService pool = Executors.newFixedThreadPool(connections.size());
		List<Future<Map<String, Object>>> list = new ArrayList<Future<Map<String, Object>>>();
		Iterator<Entry<Integer, Connection>> it = connections.entrySet().iterator();
		while (it.hasNext()) {
			Entry<Integer, Connection> entry = (Entry<Integer, Connection>) it.next();
			Callable<Map<String, Object>> c = new DBCallableReadMap((Integer) entry.getKey(), (Connection) entry.getValue(), sql, args);
			Future<Map<String, Object>> f = pool.submit(c);
			list.add(f);
		}
		pool.shutdown();

		//合并各个数据库的查询结果
		for (Future<Map<String, Object>> f : list) {
			try {
				Map<String, Object> m = f.get();
				if(map.isEmpty()){
					map.putAll(m);
				}else{
					Iterator<Entry<String, Object>> iterator = m.entrySet().iterator();
					while (iterator.hasNext()) {
						Entry<String, Object> entry = iterator.next();
						String key = entry.getKey();
						int value = ((Long)map.get(key)).intValue();
						
						if(map.containsKey(key)){
							int val = ((Long)map.get(key)).intValue();
							value = value + val;
						}
						map.put(key, value);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return map;

	}

	public static List<Map<String, Object>> readList(DBOperator dBOperator, String sql, Object[] args) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<Integer, Connection> connections = getConns(dBOperator);
		
		ExecutorService pool = Executors.newFixedThreadPool(connections.size());
		List<Future<List<Map<String, Object>>>> futureList = new ArrayList<Future<List<Map<String, Object>>>>();
		Iterator<Entry<Integer, Connection>> it = connections.entrySet().iterator();
		while (it.hasNext()) {
			Entry<Integer, Connection> entry = (Entry<Integer, Connection>) it.next();
			Callable<List<Map<String, Object>>> c = new DBCallableReadList((Integer) entry.getKey(), (Connection) entry.getValue(), sql, args);
			Future<List<Map<String, Object>>> f = pool.submit(c);
			futureList.add(f);
		}
		pool.shutdown();
		
		for (Future<List<Map<String, Object>>> f : futureList) {
			try {
				list.addAll(f.get());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list.isEmpty() ? null : list;
	}

}

