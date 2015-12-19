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
 * 修改user
 */
@WebServlet("/user/edit")
public class EditUserServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 5326623391467281843L;
	private static final Logger logger = LogManager.getLogger(EditUserServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()){
			logger.info("/user/edit get");
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String username=request.getParameter("username");
		
		User user = SecurityManager.getInstance().users.get(username);
		map.put("user", user.toMap());
		map.put("roles", SecurityManager.getInstance().roles);
		
		forward(request, response, "/jsp/security/editUser.jsp", map);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()){
			logger.info("/user/edit post");
		}
		
		request.setCharacterEncoding("UTF-8");
		User user = (User)request.getSession().getAttribute("User");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String[] roles = request.getParameterValues("role");
		String role = "";
		
		if(roles!=null && roles.length>0){
			StringBuffer sBuffer = new StringBuffer();
			for(int i=0; i<roles.length; i++){
				if(i<roles.length-1){
					sBuffer.append(roles[i]).append(",");
				}else{
					sBuffer.append(roles[i]);
				}
			}
			role = sBuffer.toString();
		}
		
		User editUser = new User(username, password, role);

		SecurityRoot.userSystem.edit(user.getUsername(), editUser);
		
		sendRedirect(request, response, "/user/list");
	}

}
