package server;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.client.HttpClient;
import org.eclipse.jetty.client.api.ContentResponse;
import org.eclipse.jetty.http.HttpMethod;

/**
 * 
 */
public final class StopServer {
	private static final Logger logger = LogManager.getLogger(StopServer.class.getName());

	public static void main(String[] args) {
		logger.info("> Try to stop local server");

		HttpClient client = new HttpClient();
		try {
			client.start();
			ConfigManager.getInstance().load();
			logger.info("=======http://127.0.0.1:" + ConfigManager.getInstance().workPort + ConfigManager.getInstance().contextPath + "/stopserver");
			ContentResponse response = client.newRequest("http://127.0.0.1:" + ConfigManager.getInstance().workPort + ConfigManager.getInstance().contextPath + "/stopserver").method(HttpMethod.POST).send();
			logger.info("=======" + response.getContentAsString());
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		try {
			client.stop();
		} catch (Exception e) {
		}

		logger.info("> Posted stop local server");

		System.exit(0);
	}
}
