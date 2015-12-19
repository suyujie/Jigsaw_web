package server.web.servlet.version;

import gamecore.servlet.AbstractHttpServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.WebRoot;
import server.security.bean.User;
import trigger.message.VersionMessage;

@WebServlet("/version/edit_game_version")
public class EditGameVersionServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = -5187186681660928160L;
	private static final Logger logger = LogManager.getLogger(EditGameVersionServlet.class.getName());

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/edit_game_version post");
		}
		request.setCharacterEncoding("UTF-8");
		User user = (User) request.getSession().getAttribute("User");
		
		Integer gameVersion = request.getParameter("gameVersion")==null ? null:Integer.parseInt(request.getParameter("gameVersion"));
		String newVersionUrl = request.getParameter("newVersionUrl");

		WebRoot.versionSystem.updateGameVersion(gameVersion,newVersionUrl);
		WebRoot.versionSystem.publishMessage(VersionMessage.UpdateGameVersion, user.getUsername(), "game");

		sendRedirect(request, response, "/version/game_version");
	}

}
