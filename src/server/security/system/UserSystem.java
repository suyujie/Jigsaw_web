package server.security.system;

import gamecore.AbstractSystem;
import gamecore.db.DaoFactory;
import gamecore.util.Paging;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import server.security.SecurityManager;
import server.security.bean.User;
import server.security.dao.UserDao;

public class UserSystem extends AbstractSystem {

	public UserSystem() {
		super();
	}

	public boolean login(String username, String password) {
		if (username == null || password == null) {
			return false;
		}

		User user = SecurityManager.getInstance().users.get(username);

		if (user == null) {
			return false;
		}
		if (!password.equals(user.getPassword())) {
			return false;
		}

		return true;
	}

	/**
	 * 删除
	 */
	public void delete(String manager, String username) {
		SecurityManager.getInstance().users.remove(username);

		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		dao.deleteUser(username);
		DaoFactory.getInstance().returnUserDao(dao);
	}

	/**
	 * 修改
	 */
	public void edit(String manager, User user) {
		SecurityManager.getInstance().users.put(user.getUsername(), user);

		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		dao.editUser(user);
		DaoFactory.getInstance().returnUserDao(dao);
	}

	/**
	 * 修改自己的密码
	 */
	public void updatePassword(User user) {
		SecurityManager.getInstance().users.put(user.getUsername(), user);

		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		dao.updatePassword(user);
		DaoFactory.getInstance().returnUserDao(dao);
	}

	/**
	 * 新增用户
	 */
	public void add(String manager, User newUser) {
		SecurityManager.getInstance().users.put(newUser.getUsername(), newUser);

		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		dao.addUser(newUser);
		DaoFactory.getInstance().returnUserDao(dao);

	}

	public User readUserByUserNameFromDB(String username) {
		Map<String, Object> map = null;
		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		map = dao.readUserByUsername(username);
		DaoFactory.getInstance().returnUserDao(dao);

		User user = null;

		if (map != null) {
			String password = map.get("password").toString();
			String role = map.get("role").toString();
			user = new User(username, password, role);
		}

		return user;
	}

	public Paging readUsers(Integer begin, Integer rowNum) {
		List<Map<String, Object>> rows = new ArrayList<>();
		Integer records = SecurityManager.getInstance().users.size();

		Iterator<Map.Entry<String, User>> iterator = SecurityManager.getInstance().users.entrySet().iterator();
		int count = 0;
		while (iterator.hasNext()) {
			count++;
			Entry<String, User> entry = iterator.next();
			User user = entry.getValue();

			if (count >= begin && count <= rowNum) {
				rows.add(user.toMap());
			}
		}
		Paging paging = new Paging(records, rowNum, begin, rows);

		return paging;
	}

	public List<User> readUsersFromDB() {
		List<Map<String, Object>> list = null;
		UserDao dao = DaoFactory.getInstance().borrowUserDao();
		list = dao.readUsers();
		DaoFactory.getInstance().returnUserDao(dao);

		List<User> users = new ArrayList<>();

		if (list != null && !list.isEmpty()) {
			for (Map<String, Object> map : list) {
				String username = map.get("username").toString();
				String password = map.get("password").toString();
				String role = map.get("role") == null ? null : map.get("role").toString();

				User user = new User(username, password, role);
				users.add(user);
			}
		}

		return users;
	}

	@Override
	public boolean startup() {
		return true;
	}

	@Override
	public void shutdown() {
	}

}
