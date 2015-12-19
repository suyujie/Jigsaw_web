package server.security.dao;

import gamecore.TaskCenter;
import gamecore.db.AsyncDBTask;
import gamecore.db.DBOperator;
import gamecore.db.DataAccessObject;
import gamecore.db.SyncDBUtil;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import server.security.bean.Log;

public class LogDao extends DataAccessObject {

	public LogDao() {
		super();
	}

	/**
	 * 添加log，异步
	 * @param log
	 */
	public void addLog(Log log) {
		String sql = "insert into t_log(operator_name,operate_time,operation) values(?,?,?)";
		Object[] args = { log.getOperatorName(), log.getOperateTime(), log.getOperation() };
		TaskCenter.getInstance().executeWithSlidingWindow(new AsyncDBTask(DBOperator.Web, new Long(log.getOperatorName().hashCode()), sql, args));
	}
	
	/**
	 * 读取日志
	 */
	public List<Map<String, Object>> readLogByNameAndTime(String name, Long time, int begin, int rowNum){
		List<String> sqlList = new ArrayList<>();
		List<Object> argsList = new ArrayList<>();
		StringBuffer condition = new StringBuffer();
		
		if(name != null && name!=""){
			sqlList.add(" operator_name=?");
			argsList.add(name);
		}
		if(time != null){
			sqlList.add(" from_unixtime(operate_time/1000,'%Y-%m-%d')=from_unixtime(?/1000,'%Y-%m-%d')");
			argsList.add(time);
		}
		
		for(int i=0;i<sqlList.size();i++){
			if(i==0){
				condition.append(" where");
			}else{
				condition.append(" and");
			}
			condition.append(sqlList.get(i));
			argsList.add(argsList.get(i));
		}
		argsList.add(begin);
		argsList.add(rowNum);
		
		String sql = "select *,(select count(*) from t_log " + condition.toString() + ") as records from t_log " + condition.toString() + " order by operate_time desc limit ?,?";
		
		List<Map<String, Object>> list = SyncDBUtil.readList(DBOperator.Web, sql.toString(), argsList.toArray());
		
		return list;
	}
}
