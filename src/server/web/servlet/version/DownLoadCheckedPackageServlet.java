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

@WebServlet("/node/download_checked_package")
public class DownLoadCheckedPackageServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = -2734386919850599446L;
	private static final Logger logger = LogManager.getLogger(DownLoadCheckedPackageServlet.class.getName());

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/node/download_checked_package post");
		}
		
		String fileType = request.getParameter("fileType");
		String[] fileNames = request.getParameterValues(fileType);
		
		WebRoot.versionSystem.packCheckedFiles(fileType, fileNames);
		WebRoot.versionSystem.downloadCheckedPackageFile(fileType, response);
	}

}
