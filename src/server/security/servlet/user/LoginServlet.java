package server.security.servlet.user;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import gamecore.servlet.AbstractHttpServlet;
import server.ConfigManager;
import server.security.SecurityManager;
import server.security.SecurityRoot;

@WebServlet("/login")
public class LoginServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -3239656731705207482L;
	private static final String LOCALE = "locale";
	private static final Logger logger = LogManager.getLogger(LoginServlet.class.getName());

	public static final String UserStr = "user";
	public static final String Username = "username";
	public static final String Password = "password";
	public static final String Token = "token";

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("login get");
		}

		HttpSession session = request.getSession();

		forward(request, response, "/jsp/login.jsp");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		logger.info("login post");

		String username = request.getParameter(Username);
		String password = request.getParameter(Password);

		boolean result = SecurityRoot.userSystem.login(username, password);

		if (result) {
			request.getSession().setAttribute("User", SecurityManager.getInstance().users.get(username));
			sendRedirect(request, response, "/index");
		} else {
			sendRedirect(request, response, "/login");
		}
		return;

	}

}
