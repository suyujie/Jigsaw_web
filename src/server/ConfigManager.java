package server;

import java.io.File;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

/**
 * 服务器配置。
 */
public class ConfigManager implements Serializable {

	private static final long serialVersionUID = -1878191790142520632L;

	protected static ConfigManager configManager = new ConfigManager();

	private final static Logger logger = LogManager.getLogger(ConfigManager.class.getName());

	// 逻辑服务器的地址
	public HashMap<Integer, Node> nodes = new HashMap<Integer, Node>();
	public List<Node> nodeList = new ArrayList<Node>();

	// 项目目录
	public String resourceBase;
	// 项目跟路径
	public String contextPath;
	// 工作端口。
	public int workPort;
	// 工作连接器队列大小。
	public int workQueueSize;

	public ConfigManager() {
	}

	/**
	 * 获取唯一实例.
	 * 
	 * @return
	 */
	public static ConfigManager getInstance() {
		return configManager;
	}

	// 从配置文件加载配置
	public boolean load() {
		String fileName = null;
		try {
			fileName = URLDecoder.decode(this.getClass().getResource("/").getPath() + "properties/node.xml", "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		File file = new File(fileName);

		if (!file.exists()) {
			logger.error("NOT FOUND node config file!");
			return false;
		}

		SAXReader reader = new SAXReader();
		try {
			Document doc = reader.read(file);
			Element root = doc.getRootElement();

			// server
			Element server = root.element("server");
			this.resourceBase = server.element("resourceBase").getTextTrim();
			this.contextPath = server.element("contextPath").getTextTrim();
			this.workPort = Integer.parseInt(server.element("work-port").getTextTrim());
			this.workQueueSize = Integer.parseInt(server.element("work-queue-size").getTextTrim());

			// 集群逻辑服务器列表
			Element nodeElements = root.element("nodes");
			if (null != nodeElements) {
				@SuppressWarnings("unchecked")
				List<Element> nodeElementArray = nodeElements.elements("node");
				if (null != nodeElements) {
					for (Element el : nodeElementArray) {
						Integer nTag = Integer.parseInt(el.attributeValue("tag"));
						String address = el.getTextTrim();
						Node node = new Node(nTag, address);
						this.nodes.put(nTag, node);
						this.nodeList.add(node);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}
