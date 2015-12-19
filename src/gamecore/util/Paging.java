package gamecore.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;

public class Paging {
	//总页数
	private static final String Total = "total";
	//每页记录数
	private static final String RowNum = "rowNum";
	//起始位置
	private static final String Begin = "begin";
	//截止位置
	private static final String End = "end";
	//当前页码
	private static final String Page = "page";
	//总记录数
	private static final String Records = "records";
	//查询结果集
	private static final String Rows = "rows";
	
	private Integer total;
	private Integer rowNum;
	private Integer begin;
	private Integer end;
	private Integer page;
	private Integer records;
	private List<Map<String, Object>> rows;

	public Paging(Integer records,Integer rowNum,Integer begin,List<Map<String, Object>> rows) {
		this.records = records==null?0:records;
		this.rowNum = rowNum;
		this.begin = begin;
		this.rows = rows;
		this.page = (int) Math.ceil((float)begin/(float)rowNum);
		this.total = records==null?0:(int) Math.ceil((float)records/(float)rowNum);
		if(page<total){
			this.end = begin + rowNum - 1;
		}else{
			this.end = records==null?0:records;
		}
	}
	
	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public Integer getRowNum() {
		return rowNum;
	}

	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}

	public Integer getBegin() {
		return begin;
	}

	public void setBegin(Integer begin) {
		this.begin = begin;
	}

	public Integer getEnd() {
		return end;
	}

	public void setEnd(Integer end) {
		this.end = end;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRecords() {
		return records;
	}

	public void setRecords(Integer records) {
		this.records = records;
	}

	public List<Map<String, Object>> getRows() {
		return rows;
	}

	public void setRows(List<Map<String, Object>> rows) {
		this.rows = rows;
	}

	public HashMap<String, Object> toMap(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put(Total, total);
		map.put(RowNum, rowNum);
		map.put(Begin, begin);
		map.put(End, end);
		map.put(Page, page);
		map.put(Records, records);
		map.put(Rows, rows);
		
		return map;
	}
	
	public JSONObject toJson(){
		JSONObject jo = new JSONObject();
		jo.put(Total, total);
		jo.put(RowNum, rowNum);
		jo.put(Begin, begin);
		jo.put(End, end);
		jo.put(Page, page);
		jo.put(Records, records);
		jo.put(Rows, rows);
		
		return jo;
	}

}
