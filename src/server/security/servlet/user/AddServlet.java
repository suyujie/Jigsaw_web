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

@WebServlet("/user/add")
public class AddServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 5369314800643800132L;
	private static final Logger logger = LogManager.getLogger(AddServlet.class.getName());
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("add user do get");
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("roles", SecurityManager.getInstance().roles);
		
		forward(request, response, "/jsp/security/addUser.jsp",map);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("add user do post");
		
		request.setCharacterEncoding("UTF-8");
		User user = (User)request.getSession().getAttribute("User");
		String username = request.getParameter("username");
		String[] roles = request.getParameterValues("role");
		String password = username;
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
		
		User newUser = new User(username, password, role);

		SecurityRoot.userSystem.add(user.getUsername(), newUser);
		
		sendRedirect(request, response, "/user/list");
		
	}

}
