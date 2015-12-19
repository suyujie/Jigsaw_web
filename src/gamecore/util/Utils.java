package gamecore.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

/** 实用函数库。
 */
public final class Utils {

	// 随机数
	private final static Random sRandom = new Random(System.currentTimeMillis());

	// 格式化时间
	private final static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private Utils() {
	}

	/** 生成随机长整数。
	 */
	public static long randomLong() {
		return sRandom.nextLong();
	}

	/** 生成随机整数。
	 */
	public static int randomInt() {
		return sRandom.nextInt();
	}

	/** 生成指定范围内的随机整数。
	 */
	public static int randomInt(final int floor, final int ceil) {
		if (floor > ceil) {
			return floor;
		}

		int realFloor = floor + 1;
		int realCeil = ceil + 1;

		return (sRandom.nextInt(realCeil) % (realCeil - realFloor + 1) + realFloor) - 1;
	}

	/** 随机选择数组。
	 */
	public static List<?> randomSelect(List<?> items, int num) {
		// 采用删除差额方式

		ArrayList<Object> list = new ArrayList<Object>(items.size());
		list.addAll(items);

		if (num >= items.size()) {
			return list;
		}

		do {
			int index = Utils.randomInt(0, list.size() - 1);
			list.remove(index);
		} while (list.size() > num);

		return list;
	}

	/** 随机选择数组,排除部分。
	 */
	public static List<?> randomSelect(List<?> items, int num, List<?> excludes) {
		// 采用删除差额方式

		ArrayList<Object> list = new ArrayList<Object>(items.size());
		list.addAll(items);

		if (num >= items.size()) {
			return list;
		}

		for (Object object : excludes) {
			list.remove(object);
		}

		do {
			int index = Utils.randomInt(0, list.size() - 1);
			list.remove(index);
		} while (list.size() > num);

		return list;
	}

	/** 随机选择数组。
	 */
	public static List<?> randomSelectWithRepeat(List<?> items, int num) {
		ArrayList<Object> list = new ArrayList<Object>();

		while (list.size() < num) {
			list.add(items.get(Utils.randomInt(0, items.size() - 1)));
		}

		return list;
	}

	/**随机一个
	 * @param <T>
	 */
	public static <T> T randomSelectOne(List<T> items) {
		int index = Utils.randomInt(0, items.size() - 1);
		return (T) items.get(index);
	}
	
//	/** 随机选择数
//	 */
//	public static Object randomSelectOne(List<?> items) {
//		ArrayList<Object> list = new ArrayList<Object>(items.size());
//		list.addAll(items);
//
//		if (1 >= items.size()) {
//			return list;
//		}
//
//		int index = Utils.randomInt(0, list.size() - 1);
//		list.remove(index);
//
//		return list;
//	}

	/**
	 * 格式化输出字符串格式的时间。
	 */
	public static String formatTime(long time) {
		return dateFormat.format(new Date(time));
	}

	/**
	 * 格式化输出字符串格式的时间。
	 */
	public static String formatDate(Date date) {
		return dateFormat.format(date);
	}

	/**
	 * 根据分子分母 ，判断是否成功
	 * Numerator and denominator
	 */
	public static boolean successRate(int numerator, int denominator) {
		int rate = Utils.randomInt(0, denominator - 1);
		if (numerator > rate) {
			return true;
		}
		return false;
	}

	public static int hashCode(Object id) {
		return Math.abs(id.hashCode());
	}

	public static int getUuidHashAbs() {
		return Math.abs(UUID.randomUUID().toString().hashCode());
	}

	public static HashMap<Long, HashSet<Long>> idInMillis = new HashMap<>();

	//一毫秒100个
	private static Long getOneLongId(Integer hostTag) {
		synchronized (idInMillis) {
			Long t = System.currentTimeMillis();
			HashSet<Long> ids = idInMillis.get(t) == null ? new HashSet<Long>() : idInMillis.get(t);
			synchronized (ids) {
				idInMillis.clear();//清理掉以前的所有数据
				Long resultId = t * 100 + randomInt(0, 99);
				int i = 0;
				if (!ids.isEmpty()) {//这个t内已经生成过数据
					while (ids.contains(resultId)) {
						if (++i > 100) {
							try {
								Thread.sleep(1);
								t = System.currentTimeMillis();
							} catch (InterruptedException e) {
								e.printStackTrace();
							}
						}
						resultId = t * 100 + randomInt(0, 99);
					}
				}

				ids.add(resultId);
				resultId += hostTag * 1000000000000000L;

				idInMillis.put(t, ids);
				return resultId;
			}
		}
	}
	
	/**
	 * 得到一个永不重复的long id
	 */
	public static long getOneId() {
		long id = Math.abs(Clock.currentTimeSecond() + getUUID().hashCode());
		return id;
	}
	
	/**
	 * 得到一个永不重复的int id
	 */
	public static int getOneIntId() {
		int id = Math.abs(getUUID().hashCode());
		return id;
	}

	/**
	 * 得到一个uuid
	 */
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}
	
	public static int getSixFigure(){
		int data = 0;
		data = (int)((Math.random()*9+1)*100000);
		return data;
	}

	public static void main(String[] args) {

		long t = System.currentTimeMillis();

		Set<Long> set = new HashSet<>();

		for (int i = 0; i < 10000; i++) {
			long id = getOneLongId(7);
			set.add(id);
			//System.out.println(i + "--:--" + id);
		}

		System.out.println("time use : " + (System.currentTimeMillis() - t));
		System.out.println(set.size());
		System.out.println(Integer.MAX_VALUE);
		System.out.println(Long.MAX_VALUE);
		
	}

}
