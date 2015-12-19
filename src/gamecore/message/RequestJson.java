package gamecore.message;

import com.alibaba.fastjson.JSONObject;

/**
 * 后台服务器 发送给逻辑服务器的请求消息
 */
public class RequestJson {

	private String commandId;
	private JSONObject body;

	public RequestJson(String commandId, JSONObject body) {
		this.commandId = commandId;
		this.body = body;
	}

	public String getCommandId() {
		return commandId;
	}

	public void setCommandId(String commandId) {
		this.commandId = commandId;
	}

	public JSONObject getBody() {
		return body;
	}

	public void setBody(JSONObject body) {
		this.body = body;
	}

}
