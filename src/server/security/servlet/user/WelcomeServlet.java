package server.security.servlet.user;

import gamecore.servlet.AbstractHttpServlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/welcome")
public class WelcomeServlet extends AbstractHttpServlet {

	private static final long serialVersionUID = 8646769803344653774L;

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		Double utilization = GameRoot.robotSystem.getWarehouseUtilization();
		//
		//		HashMap<String, Object> m = new HashMap<>();
		//		m.put("wareHouseUtilization", utilization);

		HashMap<String, Object> m = new HashMap<>();
		m.put("wareHouseUtilization", "暂停试用，此处查询太占资源");

		forward(request, response, "/jsp/welcome.jsp", m);
		return;

	}

}
