package server.web.servlet.forNode;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

@WebServlet("/forNode/gameversion")
public class GameVersionServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 4686932276141896612L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONObject json = new JSONObject();

		Integer gameVerison = WebRoot.versionSystem.getGameVersion();
		String gameUrl = WebRoot.versionSystem.getNewVersionUrl();

		json.put("gameVerison", gameVerison);
		json.put("gameUrl", gameUrl);

		toJson(response, json);
	}

}
