package common.coin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/** 
 * 货币类型
 */
public enum CoinType {

	//	　　人民币(CNY)  美元  USD  英镑 GBP 
	CNY(0),
	USD(1), 
//	GBP(2), 
//	CAD(3)
	;

	private int sc;

	private CoinType(int code) {
		this.sc = code;
	}

	public int asCode() {
		return this.sc;
	}

	public static CoinType asEnum(int code) {
		for (CoinType coinType : CoinType.values()) {
			if (coinType.asCode() == code) {
				return coinType;
			}
		}
		return null;
	}

	public static CoinType asEnum(String code) {
		for (CoinType coinType : CoinType.values()) {
			if (coinType.toString().toUpperCase().equals(code.toUpperCase())) {
				return coinType;
			}
		}
		return null;
	}

	public static HashMap<String, Integer> toMap() {
		HashMap<String, Integer> map = new HashMap<>();

		for (CoinType coinType : CoinType.values()) {
			map.put(coinType.name(), coinType.asCode());
		}

		return map;
	}
	
	public static List<String> getNames() {
		List<String> names = new ArrayList<>();

		for (CoinType coinType : CoinType.values()) {
			names.add(coinType.name());
		}

		return names;
	}

}
