package gamecore.util;

import java.util.ArrayList;
import java.util.List;

/**
 * 基本权重池
 */
public final class BaseWeightPool {

	private int weightSum;//分母

	private List<BaseWeight> baseWeights;

	public BaseWeightPool() {
		this.weightSum = 0;
		this.baseWeights = new ArrayList<BaseWeight>();
	}

	public void addWeight(int num, Object value) {
		baseWeights.add(new BaseWeight(weightSum, weightSum + num, value));
		this.weightSum += num;
	}

	public Object getValue() {
		int base = Utils.randomInt(0, weightSum - 1);
		for (BaseWeight bw : baseWeights) {
			if (base >= bw.getBegin() && base < bw.getEnd()) {//判断区间
				return bw.getValue();
			}
		}
		return null;
	}

	//	public static void main(String[] args) {
	//		BaseWeightPool pool = new BaseWeightPool();
	//
	//		pool.addWeight(1, 1);
	//		pool.addWeight(9, 2);
	//
	//		int value1 = 0;
	//		int value2 = 0;
	//
	//		for (int i = 0; i < 10000; i++) {
	//			int value = (int) pool.getValue();
	//			if (value == 1) {
	//				value1++;
	//			}
	//			if (value == 2) {
	//				value2++;
	//			}
	//		}
	//
	//		System.out.println((double) value1 / (double) (value1 + value2));
	//
	//	}

}
