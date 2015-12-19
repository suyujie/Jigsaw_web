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

import com.alibaba.fastjson.JSONObject;

@WebServlet("/node/pack")
public class PackFileServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = 814310920317806736L;
	private static final Logger logger = LogManager.getLogger(PackFileServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/node/pack get");
		}
		
		User user = (User) request.getSession().getAttribute("User");
		String fileType = request.getParameter("fileType");
		
		//打包最新版本的文件
		WebRoot.versionSystem.packNewFiles(fileType);
		WebRoot.versionSystem.publishMessage(VersionMessage.Pack, user.getUsername(), fileType);
		
		JSONObject jsonResult = new JSONObject();
		jsonResult.put("packMsg", fileType + " file pack over!");

		toJson(response, jsonResult);
	}

}
