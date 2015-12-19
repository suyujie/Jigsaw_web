package server.security.servlet.log;

import gamecore.servlet.AbstractHttpServlet;
import gamecore.util.DateUtils;
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

@WebServlet("/log/system_log")
public class SystemLogServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = 2456530776576947689L;
	private static final Logger logger = LogManager.getLogger(SystemLogServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("system log get");
		}
		request.setCharacterEncoding("UTF-8");
		
		if(request.getParameter("begin")!=null && request.getParameter("rowNum")!=null){
			doPost(request, response);
		}else{
			forward(request, response, "/jsp/log/systemLog.jsp");
		}
	}
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("system log post");
		}
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("operatorName").trim();
		Long time = request.getParameter("time")==""?null:DateUtils.string2Long(request.getParameter("time"));
		
		int begin = request.getParameter("begin")==null?1:Integer.parseInt(request.getParameter("begin"));
		int rowNum = request.getParameter("rowNum")==null?15:Integer.parseInt(request.getParameter("rowNum"));
		
		Paging paging = SecurityRoot.logSystem.readLogByNameAndTime(name, time, begin, rowNum);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging.toMap());
		map.put("operatorName", name);
		map.put("time", request.getParameter("time"));
		
		forward(request, response, "/jsp/log/systemLog.jsp", map);
	}

}
