package server.web.servlet.version;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/version/xml_versions")
public class GetXmlVersionsServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -7873384492029695330L;
	private static final Logger logger = LogManager.getLogger(GetXmlVersionsServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/xml_versions get");
		}
		
		HashMap<String, Object> map = new HashMap<>();

		HashMap<String, Integer> xmlVersion = WebRoot.versionSystem.getXmlVersion();

		map.put("xmlVersion", xmlVersion);

		forward(request, response, "/jsp/version/xmlVersion.jsp", map);
	}

}
