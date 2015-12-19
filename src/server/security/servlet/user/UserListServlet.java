package server.security.servlet.user;

import gamecore.servlet.AbstractHttpServlet;
import gamecore.util.Paging;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.security.SecurityRoot;

@WebServlet("/user/list")
public class UserListServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = -1034642755361947967L;

	private static final Logger logger = LogManager.getLogger(UserListServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("sysmanagers get");
		}
		request.setCharacterEncoding("UTF-8");
		
		int begin = request.getParameter("begin") == null ? 1:Integer.parseInt(request.getParameter("begin"));
		int rowNum = request.getParameter("rowNum") == null ? 15:Integer.parseInt(request.getParameter("rowNum"));

		Paging paging = SecurityRoot.userSystem.readUsers(begin,rowNum);
		
		HashMap<String, Object> m = new HashMap<>();
		m.put("paging", paging.toMap());
		
		forward(request, response, "/jsp/security/userList.jsp", m);

	}

}
