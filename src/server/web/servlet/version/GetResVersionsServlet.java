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

@WebServlet("/version/res_versions")
public class GetResVersionsServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -8802633419607840684L;

	private static final Logger logger = LogManager.getLogger(GetResVersionsServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/res_versions get");
		}
		request.setCharacterEncoding("UTF-8");

		HashMap<String, Object> map = new HashMap<>();

		HashMap<String, Integer> resVersion = WebRoot.versionSystem.getResVersion();

		map.put("resVersion", resVersion);

		forward(request, response, "/jsp/version/resVersion.jsp", map);
	}

}
