package server.web.servlet.img;

import gamecore.servlet.AbstractHttpServlet;
import gamecore.util.ImgUtils;
import server.ConfigManager;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 获取图片
 */
@WebServlet("/img")
public class ImgServlet extends AbstractHttpServlet {
	
	private static final long serialVersionUID = -6548572478406317625L;
	private static final Logger logger = LogManager.getLogger(ImgServlet.class.getName());

	public ImgServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getParameter("path");

		if (logger.isDebugEnabled()) {
			logger.info("doget path: " + path);
		}

		response.setContentType("image/JPEG");

		OutputStream out = response.getOutputStream();

		byte[] img = ImgUtils.getBytes(path);
		if (img == null) {
			img = ImgUtils.getBytes(ConfigManager.getInstance().noticePicPath + "notFindImg.jpg");
		}

		if (img == null) {
			return;
		}

		InputStream is = new ByteArrayInputStream(img);

		BufferedInputStream bis = new BufferedInputStream(is);

		byte[] b = new byte[1024];
		int len = -1;
		while ((len = bis.read(b, 0, 1024)) != -1) {
			out.write(b, 0, len);
		}
		out.flush();
		bis.close();
		out.close();

	}
}
