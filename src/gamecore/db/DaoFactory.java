package gamecore.db;

import javolution.util.FastTable;
import server.security.dao.LogDao;
import server.security.dao.UserDao;

/**
 * DAO 工厂。
 */
public final class DaoFactory {

	private static DaoFactory instance = new DaoFactory();

	/* web dao */
	private FastTable<UserDao> userDaos;
	private FastTable<LogDao> logDaos;

	private DaoFactory() {

		/* ---------------------- Web ------------------------- */
		userDaos = new FastTable<UserDao>();
		userDaos.add(new UserDao());

		logDaos = new FastTable<LogDao>();
		logDaos.add(new LogDao());

	}

	public static DaoFactory getInstance() {
		return DaoFactory.instance;
	}

	/* ---------------------- Web ------------------------- */
	public UserDao borrowUserDao() {
		synchronized (userDaos) {
			if (userDaos.isEmpty()) {
				return new UserDao();
			} else {
				return userDaos.removeFirst();
			}
		}
	}

	public void returnUserDao(UserDao dao) {
		synchronized (userDaos) {
			userDaos.add(dao);
		}
	}

	public LogDao borrowLogDao() {
		synchronized (logDaos) {
			if (logDaos.isEmpty()) {
				return new LogDao();
			} else {
				return logDaos.removeFirst();
			}
		}
	}

	public void returnLogDao(LogDao dao) {
		synchronized (logDaos) {
			logDaos.add(dao);
		}
	}


}
