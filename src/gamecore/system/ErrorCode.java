package gamecore.system;

/**
 * 错误码。
 */
public final class ErrorCode {

	// 没有错误
	public final static int NO_ERROR = 0;
	// 用户未登陆或者session失效
	public final static int NO_LOGIN = 1;
	//校验错误
	public final static int CHECK_ERROR = 2;
	//参数错误
	public final static int PARAM_ERROR = 8;
	// 未知错误
	public final static int UNKNOWN_ERROR = 9;

	//玩家钻石不够
	public final static int GOLD_NOT_ENOUGH = 101;
	//玩家现金不够
	public final static int CASH_NOT_ENOUGH = 102;

	//关卡收获时间还没到,不能收获
	public final static int GAIN_TIME_NOT_OK = 201;

	//不能免费抽奖
	public final static int FREE_LOTTERY_TIME = 202;

	//没有战斗,不能通关
	public final static int POINT_NO_OPEN = 301;

	//没有战斗,不能通关
	public final static int NO_BATTLE_NO_PASS = 302;

	//换装问题
	public final static int CHANGE_PART_ERROR = 401;
	public final static int CHANGE_PART_NO_PART = 402;

	//修理工
	public final static int NOT_FREE_WORKERMAN = 405;
	//修理完成时间误差过大
	public final static int REPAIRTIME_GAP_TO_LARGE = 406;
	//花钻修理,gold<=0
	public final static int REPAIR_GOLD_0 = 407;
	//花钻修理,gold不够
	public final static int REPAIR_GOLD_NOT_ENOUGH = 408;
	//花钻修理,gold不统一
	public final static int REPAIR_GOLD_NOT_PAIR = 409;

	//涂装,颜色瓶不够
	public final static int PAINT_COLOR_NO_ENOUGH = 411;
	//涂装,gold不够
	public final static int PAINT_GOLD_NO_ENOUGH = 421;
	//涂装,gold跟前端传过来的不一致
	public final static int PAINT_GOLD_NO_PAIR = 422;

	//part升级
	public final static int PART_UPDATE_ERROR_NO_ROBOT = 501;
	//part升级,没有升级部件
	public final static int PART_UPDATE_ERROR_NO_PART = 502;
	//part升级,没有消耗部件
	public final static int PART_UPDATE_ERROR_NO_USEPART = 503;
	//eggpag
	public final static int NO_EGG_BAG = 505;
	//eggpag
	public final static int EGG_BAG_NO_THIS_PART = 506;

	//订单已存在
	public final static int RENTORDER_EXIST = 601;
	//租金设定不合适
	public final static int RENTORDER_CASH_NO_SUITABLE = 602;
	//钱不够租不起
	public final static int ORDER_RENT_CASH_NO_ENOUGH = 603;

	//pvp
	public final static int NO_PVP_BATTLE = 701;

	//check
	public final static int CHECK_MIS_BATTLE_ATTACK_ERROR = 1001;//战斗验证数据,attacker的机器人数值不一致
	public final static int CHECK_MIS_BATTLE_DEFENDER_ERROR = 1002;//战斗验证数据,defender的机器人数值不一致
	public final static int CHECK_MIS_BATTLE_RENT_ERROR = 1003;//战斗验证数据,rent的机器人数值不一致
	public final static int CHECK_PVP_BATTLE_ATTACK_ERROR = 1004;//战斗验证数据,attacker的机器人数值不一致
	public final static int CHECK_PVP_BATTLE_DEFENDER_ERROR = 1005;//战斗验证数据,defender的机器人数值不一致
	public final static int CHECK_PVP_BATTLE_RENT_ERROR = 1006;//战斗验证数据,rent的机器人数值不一致

}
