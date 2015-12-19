package gamecore.cache.redis;

/** 
 * 缓存redis 帮助类
 */
public final class RedisHelperJson {

	private RedisHelperJson() {
	}

	public static void removeSession(String mobileId) {
		JedisUtilJson.getInstance().del("session_"+mobileId);
	}

	public static void removeAccountImg(Long playerId){
		JedisUtilJson.getInstance().del("account_img_"+playerId);
	}

	public static void removePlayer(Long playerId) {
		JedisUtilJson.getInstance().del("player_"+playerId);
	}

	public static void removeRobotBag(Long playerId) {
		JedisUtilJson.getInstance().del("robot_bag_"+playerId);
	}

	public static void removePartBag(Long playerId) {
		JedisUtilJson.getInstance().del("partbag_"+playerId);
	}

	public static void removeEggPartBag(Long playerId) {
		JedisUtilJson.getInstance().del("egg_partbag_"+playerId);
	}

	public static void removeColorBag(Long playerId) {
		JedisUtilJson.getInstance().del("colorbag_"+playerId);
	}

	public static void removeMissonBag(Long playerId) {
		JedisUtilJson.getInstance().del("missionbag_"+playerId);
	}

	public static void removeJobBag(Long playerId) {
		JedisUtilJson.getInstance().del("job_bag_"+playerId);
	}

	public static void removeTaskBag(Long playerId) {
		JedisUtilJson.getInstance().del("task_bag_"+playerId);
	}

	public static void removeFriendBag(Long playerId) {
		JedisUtilJson.getInstance().del("friend_bag_"+playerId);
	}

	public static void removeGiftBag(Long playerId) {
		JedisUtilJson.getInstance().del("gift_bag_"+playerId);
	}

	public static void removePveBattle(Long playerId) {
		JedisUtilJson.getInstance().del("pve_"+playerId);
	}

	public static void removeLotteryBag(Long playerId) {
		JedisUtilJson.getInstance().del("lottery_bag_"+playerId);
	}

	public static void removePvpBattle(Long playerId) {
		JedisUtilJson.getInstance().del("pvp_"+playerId);
	}

	public static void removeToturial(Long playerId) {
		JedisUtilJson.getInstance().del("toturial_"+playerId);
	}

	public static void removeRentOrderBag(Long playerId) {
		JedisUtilJson.getInstance().del("order_bag_"+playerId);
	}

	public static void removeRecordBag(Long playerId) {
		JedisUtilJson.getInstance().del("record_bag_"+playerId);
	}

	public static void removePlayerChangeBean(Long playerId) {
		JedisUtilJson.getInstance().del("player_change_"+playerId);
	}

	public static void removeNoticeBag(Long playerId) {
		JedisUtilJson.getInstance().del("noticebag_"+playerId);
	}

	public static void removeExpPartBag(Long playerId) {
		JedisUtilJson.getInstance().del("exp_part_bag_"+playerId);
	}

	public static void removeBergBag(Long playerId) {
		JedisUtilJson.getInstance().del("berg_bag_"+playerId);
	}

	public static void removeRechargePackageBag(Long playerId) {
		JedisUtilJson.getInstance().del("recharge_package_bag_"+playerId);
	}

	public static void removePointFlushBag(Long playerId) {
		JedisUtilJson.getInstance().del("point_flush_bag_"+playerId);
	}

	public static void removeChipBag(Long playerId) {
		JedisUtilJson.getInstance().del("chip_bag_"+playerId);
	}

	public static void removeDeathWheel(Long playerId) {
		JedisUtilJson.getInstance().del("d_w_"+playerId);
	}

	public static void removeBergWheel(Long playerId) {
		JedisUtilJson.getInstance().del("b_w_"+playerId);
	}

	public static void removeTreasureIsland(Long playerId) {
		JedisUtilJson.getInstance().del("treasure_island_"+playerId);
	}

	public static void removeBlackMarket(Long playerId) {
		JedisUtilJson.getInstance().del("black_market_"+playerId);
	}

	public static void removePve(Long playerId) {
		JedisUtilJson.getInstance().del("pve_"+playerId);
	}

	public static void removeMonthCard(Long playerId) {
		JedisUtilJson.getInstance().del("month_card_"+playerId);
	}

	public static void removePvp(Long playerId) {
		JedisUtilJson.getInstance().del("pvp_"+playerId);
	}

	public static void removeRepeatOpponents(Long playerId) {
		JedisUtilJson.getInstance().del("repeat_opponents_"+playerId);
	}

	public static void removeHandbook(Long playerId) {
		JedisUtilJson.getInstance().del("handbook_bag_"+playerId);
	}

	public static void removePvpLose(Long playerId) {
		JedisUtilJson.getInstance().del("pvp_lose_"+playerId);
	}
	
}
