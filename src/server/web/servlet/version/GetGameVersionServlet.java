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

@WebServlet("/version/game_version")
public class GetGameVersionServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -5763599296058507529L;
	private static final Logger logger = LogManager.getLogger(GetGameVersionServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/game_version get");
		}
		
		HashMap<String, Object> map = new HashMap<>();

		Integer gameVersion = WebRoot.versionSystem.getGameVersion();
		String gameUrl = WebRoot.versionSystem.getNewVersionUrl();

		map.put("gameVersion", gameVersion);
		map.put("newVersionUrl", gameUrl);

		forward(request, response, "/jsp/version/gameVersion.jsp", map);
	}

}
