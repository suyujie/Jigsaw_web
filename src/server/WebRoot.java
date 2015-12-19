package server;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.web.system.VersionSystem;

/**
 * 系统根，所有子系统引导类。
 */
public final class WebRoot {

	private final static Logger logger = LogManager.getLogger(WebRoot.class.getName());

	private final static WebRoot instance = new WebRoot();

	public static Long FirstRegisterDay = null;
	public static final long OneDayInMillis = 24 * 60 * 60 * 1000;

	public static VersionSystem versionSystem = null;

	private WebRoot() {
	}

	public static WebRoot getInstance() {
		return WebRoot.instance;
	}

	public boolean initAndStartSystem() {
		// 初始化子系统
		versionSystem = new VersionSystem();

		return true;
	}

	public void shutdownSystem() {
		if (versionSystem != null) {
			versionSystem.shutdown();
		}
	}

	public void startup() {
		if (!initAndStartSystem()) {
			if (logger.isDebugEnabled()) {
				logger.error("start WebRoot error");
			}
			System.exit(1);
		} else {
			if (logger.isDebugEnabled()) {
				logger.info("start WebRoot success");
			}
		}

	}

}
