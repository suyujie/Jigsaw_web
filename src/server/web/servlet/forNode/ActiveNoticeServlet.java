package server.web.servlet.forNode;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@WebServlet("/forNode/active_notice")
public class ActiveNoticeServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -8223445055276077732L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONObject json = new JSONObject();

		JSONArray jsonArray = WebRoot.noticeSystem.getActiveNotices();

		json.put("activeNotices", jsonArray);

		toJson(response, json);
	}

}
