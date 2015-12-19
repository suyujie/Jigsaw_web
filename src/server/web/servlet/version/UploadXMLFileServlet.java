package server.web.servlet.version;

import gamecore.servlet.AbstractHttpServlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import server.StorageManager;
import server.WebRoot;
import server.security.bean.User;
import trigger.message.VersionMessage;

@WebServlet("/version/upload_xml")
public class UploadXMLFileServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = -4685592121785310685L;
	private static final Logger logger = LogManager.getLogger(UploadXMLFileServlet.class.getName());

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/upload_xml get");
		}
		request.setCharacterEncoding("UTF-8");

		forward(request, response, "/jsp/version/uploadXML.jsp");
	}

	@SuppressWarnings("rawtypes")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (logger.isDebugEnabled()) {
			logger.info("/version/upload_xml post");
		}
		request.setCharacterEncoding("UTF-8");
		User user = (User) request.getSession().getAttribute("User");

		try {
			//创建一个基于硬盘的FileItem工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			//设置向硬盘写数据时所用的缓冲区的大小，此处为4K
			factory.setSizeThreshold(4 * 1024);
			//设置目录
			File f = new File(StorageManager.getInstance().xmlPath);
			if (!f.exists()) {
				f.mkdirs();
			}

			factory.setRepository(f);

			//创建一个文件上传处理器
			ServletFileUpload upload = new ServletFileUpload(factory);
			//设置允许上传的文件的最大尺寸，此处为100M
			upload.setSizeMax(100 * 1024 * 1024);
			List items = upload.parseRequest(request);
			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (!item.isFormField()) {
					String fileName = item.getName();
					String extension = fileName.substring(fileName.lastIndexOf(".") + 1);

					if (extension.equals("xml")) {
						WebRoot.versionSystem.uploadXmlFile(item);
					}
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		WebRoot.versionSystem.publishMessage(VersionMessage.Upload, user.getUsername(), "xml");
		sendRedirect(request, response, "/version/xml_versions");
	}

}
