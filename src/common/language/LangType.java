package common.language;

import java.util.HashMap;


/** 
 * 语言类型
 */
public enum LangType {

	//	　中文 : zh_CN  英文 en_US  西班牙  es_ES
	zh_CN(0), en_US(1), es_ES(2), zh_TW(3);

	private int sc;

	private LangType(int code) {
		this.sc = code;
	}

	public int asCode() {
		return this.sc;
	}

	public static LangType asEnum(int code) {
		for (LangType langType : LangType.values()) {
			if (langType.asCode() == code) {
				return langType;
			}
		}
		return null;
	}

	public static LangType asEnum(String code) {
		for (LangType langType : LangType.values()) {
			if (langType.toString().toUpperCase().equals(code.toUpperCase())) {
				return langType;
			}
		}
		return null;
	}
	
	public static HashMap<String, Integer> toMap(){
		HashMap<String, Integer > map = new HashMap<>();
		
		for(LangType langType : LangType.values()){
			map.put(langType.name(), langType.asCode());
		}
		
		return map;
	}

}
