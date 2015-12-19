package server.web.servlet.forNode;

import gamecore.servlet.AbstractHttpServlet;
import server.WebRoot;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@WebServlet("/forNode/enabled_recharge_package")
public class EnabledRechargePackageServlet extends AbstractHttpServlet {
	private static final long serialVersionUID = 315115695964827563L;
	private static final Logger logger = LogManager.getLogger(EnabledRechargePackageServlet.class.getName());

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		JSONObject json = new JSONObject();

		JSONArray jsonArray = WebRoot.rechargePackageSystem.getEnabledRechargePackages();

		json.put("enabledRechargePackages", jsonArray);
		
		if(logger.isDebugEnabled()){
			logger.info("result: " + json);
		}

		toJson(response, json);
	}

}
