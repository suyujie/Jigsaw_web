package server;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.webapp.WebAppContext;

import gamecore.servlet.FilterCapsule;
import gamecore.servlet.ServletCapsule;
import gamecore.util.Clock;
import server.security.SecurityRoot;

/**
 * 系统根，所有子系统引导类。
 */
public final class NodeServer {

	private final static Logger logger = LogManager.getLogger(NodeServer.class.getName());

	private final static NodeServer instance = new NodeServer();

	private Server server;

	private NodeServer() {
	}

	public static NodeServer getInstance() {
		return instance;
	}

	public void startup() {
		// 初始化服务器
		server = initServer();
		// 启动服务器
		try {
			logger.info("server start...");
			server.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("server start success");

		try {
			server.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		// 权限子系统
		SecurityRoot.getInstance().shutdownSystem();
		// web子系统
		WebRoot.getInstance().shutdownSystem();

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			logger.error(e);
		}

		logger.info("Server stopped");

		// 关闭时钟
		Clock.stop();

		System.exit(0);
	}

	public Server initServer() {

		// 创建 Jetty 服务器
		Server server = new Server();
		// WebAppContext
		WebAppContext context = new WebAppContext(); // 声明上下文对象
		context.setDescriptor(ConfigManager.getInstance().resourceBase + "/WEB-INF/web.xml"); // 指定web.xml文件，可选
		context.setResourceBase(ConfigManager.getInstance().resourceBase); // 设置项目路径
		context.setContextPath(ConfigManager.getInstance().contextPath);

		ServletCapsule.getInstance().registerServlets("server.security.servlet", context);
		ServletCapsule.getInstance().registerServlets("server.node.servlet", context);
		ServletCapsule.getInstance().registerServlets("server.web.servlet", context);
		ServletCapsule.getInstance().registerServlets("export", context);
		ServletCapsule.getInstance().registerServlets("locale.servlet", context);

		FilterCapsule.getInstance().registerFilters("server.security.filter", context);

		server.setHandler(context);

		// 工作服务
		ServerConnector work = new ServerConnector(server);
		work.setPort(ConfigManager.getInstance().workPort);
		work.setAcceptQueueSize(ConfigManager.getInstance().workQueueSize);

		// 设置连接器
		server.setConnectors(new Connector[] { work });

		return server;
	}

	public void stopServer() {
		try {
			this.server.stop();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
