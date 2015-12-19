package server.security.dao;

import gamecore.db.DBOperator;
import gamecore.db.DataAccessObject;
import gamecore.db.SyncDBUtil;

import java.util.List;
import java.util.Map;

import server.security.bean.User;

public class UserDao extends DataAccessObject {

	public UserDao() {
		super();
	}

	public List<Map<String, Object>> readUsers() {
		String sql = "select * from t_user order by username desc";
		Object[] args = {};
		return SyncDBUtil.readList(DBOperator.Web, sql, args);
	}

	public List<Map<String, Object>> readUsers(int begin, int rowNum) {
		String sql = "select *,(select count(*) from t_user)as records from t_user limit ?,?";
		Object[] args = { begin, rowNum };
		List<Map<String, Object>> list = SyncDBUtil.readList(DBOperator.Web, sql, args);
		return list;
	}

	public Map<String, Object> readUserByUsername(String username) {
		String sql = "select * from t_user where username=?";
		Object[] args = { username };
		return SyncDBUtil.readMap(DBOperator.Web, sql, args);
	}

	public Map<String, Object> readUserByNameAndPass(String username, String password) {
		String sql = "select * from t_user where username = ? and password = ?";
		Object[] args = { username, password };
		Map<String, Object> map = SyncDBUtil.readMap(DBOperator.Web, sql, args);
		return map;
	}

	public void addUser(User user) {
		String sql = "insert into t_user(username,password,role) values(?,?,?)";
		Object[] args = { user.getUsername(), user.getPassword(), user.getRole() };
		SyncDBUtil.execute(DBOperator.Web, 1L, sql, args);
	}

	public void updatePassword(User user) {
		String sql = "update t_user set password=? where username=?";
		Object[] args = { user.getPassword(), user.getUsername() };
		SyncDBUtil.execute(DBOperator.Web, 1L, sql, args);
	}

	public void editUser(User user) {
		String sql = "update t_user set password=?,role=? where username=?";
		Object[] args = { user.getPassword(), user.getRole(), user.getUsername() };
		SyncDBUtil.execute(DBOperator.Web, 1L, sql, args);
	}

	public void deleteUser(String username) {
		String sql = "delete from t_user where username=?";
		Object[] args = { username };
		SyncDBUtil.execute(DBOperator.Web, 1L, sql, args);
	}

}
