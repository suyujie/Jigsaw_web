package server.security.servlet.user;

import gamecore.servlet.AbstractHttpServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.security.SecurityRoot;
import server.security.bean.User;

@WebServlet("/logout")
public class LogoutServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 3259972206375057189L;
	private static final Logger logger = LogManager.getLogger(LogoutServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("logout get");
		}
		User user = (User)request.getSession().getAttribute("User");

		if(user != null){
			SecurityRoot.userSystem.logout(user);
		}
		
		request.getSession().invalidate();
		sendRedirect(request, response, "/login");
		return;
	}

}
