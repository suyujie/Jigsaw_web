package server.security.bean;

import gamecore.util.DateUtils;

import java.util.HashMap;

public class Log {
	// ID
	private final static String Id = "id";
	// 操作者用户名
	private final static String OperatorName = "operatorName";
	// 操作时间
	private final static String OperateTime = "operateTime";
	// 操作内容
	private final static String Operation = "operation";
	
	private Long id;
	private String operatorName;
	private Long operateTime;
	private String operation;

	public Log(Long id,String operatorName,Long operateTime,String operation) {
		this.id=id;
		this.operatorName=operatorName;
		this.operateTime=operateTime;
		this.operation=operation;
	}
	
	public Log(String operatorName,Long operateTime,String operation) {
		this.operatorName=operatorName;
		this.operateTime=operateTime;
		this.operation=operation;
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public Long getOperateTime() {
		return operateTime;
	}

	public void setOperateTime(Long operateTime) {
		this.operateTime = operateTime;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

	public HashMap<String, Object> toMap(){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put(Id, id);
		map.put(OperatorName, operatorName);
		map.put(OperateTime, DateUtils.long2String_s(operateTime));
		map.put(Operation, operation);
		
		return map;
	}

}
