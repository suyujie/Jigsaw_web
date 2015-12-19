package server.web.servlet.version;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@WebServlet("/node/download_version_package")
public class DownLoadPackageServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = 6485222887629882632L;
	private static final Logger logger = LogManager.getLogger(DownLoadPackageServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/node/download_version_package get");
		}
		
		String fileType = request.getParameter("fileType");
		
		WebRoot.versionSystem.downloadPackageFile(fileType, response);
	}

}
