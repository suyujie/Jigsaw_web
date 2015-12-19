package server;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gamecore.cache.redis.JedisUtilJson;
import gamecore.db.DBManager;
import gamecore.util.Clock;
import server.security.SecurityManager;
import server.security.SecurityRoot;

/**
 * 初始化系统
 * 
 * @author SYJ
 */
public class BootStrap {

	private static Logger logger = LogManager.getLogger(BootStrap.class.getName());

	public BootStrap() {

	}

	public static void main(String[] args) {
		// 报告标签
		logger.info("Server Web");

		// 加载服务配置文件
		if (!ConfigManager.getInstance().load()) {
			logger.error("load node config file error");
			System.exit(1);
		} else {
			logger.info("load node config file success");
		}

		// 加载存储配置文件
		if (!StorageManager.getInstance().load()) {
			logger.error("load storage config file error");
			System.exit(1);
		} else {
			logger.info("load storage config file success");
		}

		// 报告配置信息
		StringBuilder buf = new StringBuilder("Server config:\n");
		buf.append(ConfigManager.getInstance().toString());
		logger.info(buf.toString());
		buf = null;

		// 初始化redis缓存
		if (!JedisUtilJson.getInstance().init()) {
			logger.error("redis init error");
			Clock.stop();
			System.exit(1);
		} else {
			logger.info("**init redis is OK");
		}

		// 初始化数据库连接池
		if (!DBManager.getInstance().initConnPools()) {
			logger.error("dbmanager init error");
			Clock.stop();
			System.exit(1);
		} else {
			logger.info("**init mysql OK");
		}

		// 初始化权限子系统
		SecurityRoot.getInstance().startup();
		// 初始化web子系统
		WebRoot.getInstance().startup();

		// 初始化权限系统
		if (!SecurityManager.getInstance().load()) {
			if (logger.isDebugEnabled()) {
				logger.error("load  security file error");
			}
			System.exit(1);
		} else {
			if (logger.isDebugEnabled()) {
				logger.info("load  security file success");
			}
		}

		logger.info("child system start success");

		// 启动服务
		NodeServer.getInstance().startup();

	}

}
