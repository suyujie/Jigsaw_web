/* ----------------------------------------------------------------------------
 * Hero Journey
 * ----------------------------------------------------------------------------
 */

package gamecore.db;

/**
 * 数据库操作符。
 */
public enum DBOperator {

	Node_M("node_m"),
	Node_S("node_s"),
	Node_Log("node_log"),
	Web("web");

	private String code;

	private DBOperator(String code) {
		this.code = code;
	}

	public String asString() {
		return this.code;
	}
}
