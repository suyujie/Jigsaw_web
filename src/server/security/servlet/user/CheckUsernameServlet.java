package server.security.servlet.user;

import gamecore.servlet.AbstractHttpServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.security.SecurityManager;
import server.security.bean.User;

@WebServlet("/user/check_username")
public class CheckUsernameServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = -6365227078867997757L;

	private static final Logger logger = LogManager.getLogger(CheckUsernameServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("check username get");
		}

		//注册失败,返回表单自动填充
		String username = request.getParameter("username");
		String result = "OK";
		
		User user = SecurityManager.getInstance().users.get(username);
		
		if(user != null){
			result = "用户名已存在！";
		}
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.flush();
		out.close();
	}

}
