package gamecore.gamedata;

import javolution.util.FastTable;

public class AbstractReadData {

	public FastTable<Integer> string2FastTable(String str) {
		String[] ss = str.split("\\|");
		FastTable<Integer> fastTable = new FastTable<>();
		for (int i = 0; i < ss.length; i++) {
			fastTable.add(Integer.parseInt(ss[i].trim()));
		}
		return fastTable;
	}

}
