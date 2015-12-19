package gamecore;

import gamecore.cache.redis.JedisUtilJson;
import gamecore.db.DBManager;
import server.ConfigManager;
import server.WebRoot;
import server.security.SecurityRoot;

/**
 * 初始化系统
 * 
 * @author SYJ
 */
public class BootStrap {

	public BootStrap() {

		// 初始化数据库连接池
		DBManager.getInstance().initConnPools();

		// 初始化redis缓存
		JedisUtilJson.getInstance().init();

		// 加载服务配置文件
		ConfigManager.getInstance();

		// 初始化权限子系统
		SecurityRoot.getInstance().startup();
		// 初始化web子系统
		WebRoot.getInstance().startup();

	}

}
