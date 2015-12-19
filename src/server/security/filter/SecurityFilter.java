package server.security.filter;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import server.ConfigManager;
import server.Node;
import server.security.SecurityManager;
import server.security.bean.User;

@WebFilter(filterName = "securityFilter", urlPatterns = "/*")
public class SecurityFilter implements Filter {

	public static final String USER = "User";

	public SecurityFilter() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		String ip = request.getRemoteAddr();
		String servletPath = request.getServletPath();
		// 逻辑节点访问特定请求无需权限限制
		if (ignoreCheckForNode(ip, servletPath)) {
			chain.doFilter(request, response);
			return;
		}

		// 停机请求无需验证
		if (isStopServer(ip, servletPath)) {
			chain.doFilter(request, response);
			return;
		}

		// 开放资源不需要验证权限
		if (ignoreCheckForOpen(servletPath)) {
			chain.doFilter(request, response);
			return;
		}

		// 受限资源，需要权限验证
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(USER);

		if (user == null) {
			request.getRequestDispatcher("/jsp/error/401.jsp").forward(request, response);
			return;
		}

		Set<Integer> roleSet = user.getRoleSet();

		for (int roleId : roleSet) {
			Set<String> resources = SecurityManager.getInstance().role_resources.get(roleId);
			for (String resource : resources) {
				if (resource.equals(servletPath)) {
					chain.doFilter(request, response);
					return;
				}
			}
		}

		request.getRequestDispatcher("/jsp/error/403.jsp").forward(request, response);
	}

	/**
	 * 逻辑节点访问特定请求无需权限限制
	 * 
	 * @param ip
	 * @param servletPath
	 * @return true无需权限验证,false 需要权限验证
	 */
	public boolean ignoreCheckForNode(String ip, String servletPath) {
		for (Node node : ConfigManager.getInstance().nodeList) {
			if (node.getUrl().split(":")[0].equals(ip)
					&& SecurityManager.getInstance().forNodeResources.contains(servletPath)) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 服务停机 不需要权限
	 * 
	 * @param ip
	 * @param servletPath
	 * @return
	 */
	public boolean isStopServer(String ip, String servletPath) {
		if (ip.equals("127.0.0.1") && servletPath.contains("stopserver")) {
			return true;
		}
		return false;
	}

	/**
	 * 开放资源无需权限限制
	 * 
	 * @param servletPath
	 * @return true无需权限验证,false 需要权限验证
	 */
	public boolean ignoreCheckForOpen(String servletPath) {
		HashSet<String> openResources = SecurityManager.getInstance().openResources;
		Iterator<String> iterator = openResources.iterator();
		while (iterator.hasNext()) {
			String openResource = iterator.next();

			if (openResource.contains("*")) {
				String[] array = openResource.split("\\*");
				String prefix = array[0];
				if (!servletPath.startsWith(prefix)) {
					continue;
				}

				if (array.length > 1) {
					String suffix = array[array.length - 1];
					if (!servletPath.endsWith(suffix)) {
						continue;
					}
				}
				return true;
			} else {
				if (openResource.equals(servletPath)) {
					return true;
				}
			}
		}

		return false;
	}

}
