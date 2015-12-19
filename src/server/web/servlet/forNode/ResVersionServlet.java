package server.web.servlet.forNode;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

@WebServlet("/forNode/resversion")
public class ResVersionServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -6867753457676151397L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONObject json = new JSONObject();

		String resVersion = WebRoot.versionSystem.getResVersionStr();

		json.put("resVersion", resVersion);

		toJson(response, json);
	}

}
