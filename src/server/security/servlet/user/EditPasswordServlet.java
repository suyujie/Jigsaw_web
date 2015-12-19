package server.security.servlet.user;

import gamecore.servlet.AbstractHttpServlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.security.SecurityManager;
import server.security.SecurityRoot;
import server.security.bean.User;

/**
 * 修改密码
 */
@WebServlet("/user/edit_password")
public class EditPasswordServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 8043026595308432051L;
	private static final Logger logger = LogManager.getLogger("EditPasswordServlet");

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()){
			logger.info("edit_password get");
		}
		User user = (User)request.getSession().getAttribute("User");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String username=request.getParameter("username");
		
		if(username == null){
			map.put("user", user.toMap());
		}else{
			User user2 = SecurityManager.getInstance().users.get(username);
			map.put("user", user2.toMap());
		}
		
		forward(request, response, "/jsp/security/editPassword.jsp", map);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()){
			logger.info("edit_password post");
		}
		
		request.setCharacterEncoding("UTF-8");
		String username=request.getParameter("username");
		String newpassword=request.getParameter("newpassword");
		
		User user2 = SecurityManager.getInstance().users.get(username);
		user2.setPassword(newpassword);
		
		SecurityRoot.userSystem.updatePassword(user2);
		
		sendRedirect(request, response, "/welcome");
		return;
	}

}
