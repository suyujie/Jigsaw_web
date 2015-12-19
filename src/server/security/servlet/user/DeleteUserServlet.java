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

/**
 * 修改user有效状态
 */
@WebServlet("/user/delete")
public class DeleteUserServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 2200751935711058127L;
	private static final Logger logger = LogManager.getLogger(DeleteUserServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()){
			logger.info("user delete---get");
		}
		User user = (User)request.getSession().getAttribute("User");
		
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		
		SecurityRoot.userSystem.delete(user.getUsername(), username);
		
		forward(request, response, "/user/list");
	}

}
