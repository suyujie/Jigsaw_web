package server.security.system;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import gamecore.AbstractSystem;
import gamecore.db.DaoFactory;
import gamecore.util.Paging;
import server.security.bean.Log;
import server.security.dao.LogDao;

public class LogSystem extends AbstractSystem {

	public LogSystem() {
		super();
	}

	public void addLog(Log log) {
		LogDao dao = DaoFactory.getInstance().borrowLogDao();
		dao.addLog(log);
		DaoFactory.getInstance().returnLogDao(dao);
	}
	
	public Paging readLogByNameAndTime(String name, Long time, int begin, int rowNum){
		LogDao dao = DaoFactory.getInstance().borrowLogDao();
		List<Map<String, Object>> list = dao.readLogByNameAndTime(name, time, begin-1, rowNum);
		DaoFactory.getInstance().returnLogDao(dao);
		
		Integer records = null;
		List<Map<String, Object>> logs = new ArrayList<Map<String,Object>>();
		if(list != null && list.size()>0){
			for(Map<String, Object> map : list){
				if(records == null){
					records = ((Long)map.get("records")).intValue();
				}
				Long id = (Long)map.get("id");
				String operatorName = map.get("operator_name").toString();
				Long operateTime = ((BigInteger)map.get("operate_time")).longValue();
				String operation = map.get("operation").toString();
				
				Log log = new Log(id, operatorName, operateTime, operation);
				logs.add(log.toMap());
			}
		}
		Paging paging = new Paging(records, rowNum, begin, logs);
		
		return paging;
	}

	@Override
	public boolean startup() {
		return true;
	}

	@Override
	public void shutdown() {
	}
}
