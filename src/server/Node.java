package server;

import java.util.HashMap;
import java.util.Map;

public class Node {

	public final static String Tag = "tag";
	public final static String Url = "url";

	private int tag;
	private String url;

	public Node(int tag, String url) {
		super();
		this.tag = tag;
		this.url = url;
	}

	public int getTag() {
		return tag;
	}

	public void setTag(int tag) {
		this.tag = tag;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Map<String, Object> toMap() {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put(Tag, this.tag);
		m.put(Url, this.url);
		return m;
	}

}
