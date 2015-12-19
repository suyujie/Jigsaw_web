package server.security;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.security.system.LogSystem;
import server.security.system.UserSystem;

/** 系统根，所有子系统引导类。
 */
public final class SecurityRoot {

	private final static Logger logger = LogManager.getLogger(SecurityRoot.class.getName());

	private final static SecurityRoot instance = new SecurityRoot();

	public static UserSystem userSystem = null;
	public static LogSystem logSystem = null;

	private SecurityRoot() {
	}

	public static SecurityRoot getInstance() {
		return SecurityRoot.instance;
	}

	public boolean initAndStartSystem() {
		//初始化子系统
		userSystem = new UserSystem();
		logSystem = new LogSystem();

		if (!userSystem.startup()) {
			logger.error("userSystem startup failed");
			return false;
		}
		
		if (!logSystem.startup()){
			logger.error("logSystem startup failed");
			return false;
		}

		return true;
	}

	public void shutdownSystem() {
		if(userSystem != null){
			userSystem.shutdown();
		}
		if(logSystem != null){
			logSystem.shutdown();
		}
	}

	public void startup() {

		if (!initAndStartSystem()) {
			if (logger.isDebugEnabled()) {
				logger.error("start securityRoot error");
			}
			System.exit(1);
		} else {
			if (logger.isDebugEnabled()) {
				logger.info("start securityRoot success");
			}
		}
		
	}
	
}
