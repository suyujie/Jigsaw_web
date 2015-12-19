package gamecore.servlet;

import gamecore.util.HttpUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.http.HttpHeader;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

/** 
 * 抽象 HTTP Servlet
 */
public class AbstractHttpServlet extends HttpServlet {

	private static final long serialVersionUID = -824199080913869265L;
	public final static String COOKIE = HttpHeader.COOKIE.asString();

	public AbstractHttpServlet() {
		super();
	}
	
	/** 
	 * 封装响应数据,转发页面
	 */
	@SuppressWarnings("unchecked")
	protected void forward(HttpServletRequest request, HttpServletResponse response, String jspUrl, HashMap<String, Object>... maps) {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		HashMap<String, Object> allMap = new HashMap<String, Object>();
		for (HashMap<String, Object> hashMap : maps) {
			allMap.putAll(hashMap);
		}

		request.setAttribute("result", allMap);

		try {
			request.getRequestDispatcher(jspUrl).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return;
	}

	/** 
	 * 封装响应数据,转发url
	 */
	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url) {
		response.setCharacterEncoding("UTF-8");
		try {
			response.sendRedirect("/robot_web" + url);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	/** 
	 * 封装响应数据,转发url
	 */
	@SuppressWarnings("unchecked")
	protected void sendRedirect(HttpServletRequest request, HttpServletResponse response, String url, HashMap<String, Object>... maps) {
		response.setCharacterEncoding("UTF-8");
		StringBuffer sb = new StringBuffer("/robot_web").append(url);
		boolean firstp = true;

		for (HashMap<String, Object> hashMap : maps) {
			for (String key : hashMap.keySet()) {
				if (firstp) {
					sb.append("?").append(key).append("=").append(hashMap.get(key));
					firstp = false;
				} else {
					sb.append("&").append(key).append("=").append(hashMap.get(key));
				}
			}
		}
		try {
			response.sendRedirect(sb.toString());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	/** 读取包体数据并转为 JSON
	 * @throws IOException 
	 */
	protected JSONObject readRequestAsJson(HttpServletRequest request) throws IOException, JSONException {
		return HttpUtils.readRequestStreamAsJSON(request);
	}

	/** 封装并写入 JSON 数据。
	 * @throws IOException 
	 */
	protected void wrapResponse(HttpServletResponse response, JSONObject json) throws IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		response.setStatus(HttpServletResponse.SC_OK);

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(json.toString());
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				out.close();
			} catch (Exception e) {
			}
		}
	}

	/** 封装响应数据。
	 */
	protected void wrapResponse(HttpServletResponse response, int status) throws IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		response.setStatus(status);
		response.setHeader("Server", "Node");

		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.println("{}");
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				out.close();
			} catch (Exception e) {
			}
		}
	}

	/** 封装为 200 状态，并写入 JSON 数据。
	 * @throws IOException 
	 */
	protected void toJson(HttpServletResponse response, JSONObject json) throws IOException {
		response.setContentType("text/json");
		response.setCharacterEncoding("UTF-8");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = null;

		try {
			out = response.getWriter();
			out.print(json.toJSONString());
		} catch (IOException e) {
			throw e;
		} finally {
			try {
				out.flush();
				out.close();
			} catch (Exception e) {
			}
		}
	}

}