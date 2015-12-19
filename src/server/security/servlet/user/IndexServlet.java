package server.security.servlet.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gamecore.servlet.AbstractHttpServlet;
import server.Node;
import server.WebRoot;
import server.security.bean.User;

@WebServlet("/index")
public class IndexServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = -2191463752935973863L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("User");
		Locale locale = (Locale) request.getSession().getAttribute("localeStr");

		List<Node> nodes = WebRoot.nodeSystem.getNodes();

		List<Map<String, Object>> list = new ArrayList<>();
		for (Node node : nodes) {
			list.add(node.toMap());
		}

		HashMap<String, Object> m = new HashMap<>();
		m.put("nodes", list);
		m.put("username", user.getUsername());
		if (locale != null) {
			m.put("languageTag", locale.toLanguageTag());
		}

		forward(request, response, "/jsp/index.jsp", m);
		return;
	}

}
