/**
 * 创建日志库
 */
create database robot_web default charset utf8;


/**
 * 选择数据库
 */
use robot_web;


/**
 * 管理员 
 */
DROP TABLE IF EXISTS t_user ;
CREATE TABLE t_user (
  username VARCHAR(20) NOT NULL UNIQUE,
  password VARCHAR(100) NOT NULL,
  role VARCHAR(50) NOT NULL,
  PRIMARY KEY (username)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 管理员操作日志
 */
DROP TABLE IF EXISTS t_log ;
CREATE TABLE t_log(
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  operator_name VARCHAR(20) NOT NULL,
  operate_time BIGINT(20) UNSIGNED NOT NULL DEFAULT 0,
  operation VARCHAR(5000) NOT NULL,
  PRIMARY KEY(id)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 公告信息
 */
DROP TABLE IF EXISTS t_notice_public ;
CREATE TABLE t_notice_public (
  id bigint(20) UNSIGNED NOT NULL,
  notice_type INT (2) NOT NULL,
  title_en_US VARCHAR(100) DEFAULT NULL,
  title_es_ES VARCHAR(100) DEFAULT NULL,
  title_zh_CN VARCHAR(100) DEFAULT NULL,
  cont_en_US VARCHAR(2000) DEFAULT NULL,
  cont_es_ES VARCHAR(2000) DEFAULT NULL,
  cont_zh_CN VARCHAR(2000) DEFAULT NULL,
  picUrl VARCHAR(50) DEFAULT NULL,
  read_close int(2) NOT NULL,
  gold int(4) NOT NULL,
  begin_time bigint(11) UNSIGNED NOT NULL,
  end_time bigint(11) UNSIGNED NOT NULL,
  PRIMARY KEY (id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 玩家黑名单
 */
DROP TABLE IF EXISTS t_blacklist ;
CREATE TABLE t_blacklist (
  player_id bigint(20) UNSIGNED NOT NULL,
  t bigint(11) UNSIGNED NOT NULL,
  PRIMARY KEY (player_id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 留存率
 */
DROP TABLE IF EXISTS t_retain ;
CREATE TABLE t_retain (
  datetime bigint(11) UNSIGNED NOT NULL,
  registerNum int(11) UNSIGNED default NULL,
  retainNum1 int(11) UNSIGNED default NULL,
  retainNum2 int(11) UNSIGNED default NULL,
  retainNum3 int(11) UNSIGNED default NULL,
  retainNum7 int(11) UNSIGNED default NULL,
  retainNum14 int(11) UNSIGNED default NULL,
  retainNum30 int(11) UNSIGNED default NULL,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 流失率
 */
DROP TABLE IF EXISTS t_loss ;
CREATE TABLE t_loss (
  datetime BIGINT(11) UNSIGNED NOT NULL,
  todayLoginNum INT(11) UNSIGNED DEFAULT NULL,
  nextDayReloginNum INT(11) UNSIGNED DEFAULT NULL,
  nextWeekReloginNum INT(11) UNSIGNED DEFAULT NULL,
  nextMonthReloginNum INT(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 付费
 */
DROP TABLE IF EXISTS t_pay ;
CREATE TABLE t_pay (
  datetime bigint(11) UNSIGNED NOT NULL,
  totalPlayerNum int(11) UNSIGNED default 0,
  totalPayNum int(11) UNSIGNED default 0,
  totalAmount int(11) default 0,
  todayPayNum int(11) UNSIGNED default 0,
  todayLoginNum int(11) UNSIGNED default 0,
  todayAmount int(11) default 0,
  thisWeekPayNum int(11) UNSIGNED default 0,
  thisWeekLoginNum int(11) UNSIGNED default 0,
  thisWeekAmount int(11) default 0,
  thisMonthPayNum int(11) UNSIGNED default 0,
  thisMonthLoginNum int(11) UNSIGNED default 0,
  thisMonthAmount int(11) default 0,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 登陆统计
 */
DROP TABLE IF EXISTS t_login;
CREATE TABLE t_login(
  datetime bigint(11) UNSIGNED NOT NULL,
  dayActivePlayers int(11) UNSIGNED DEFAULT 0,
  weekActivePlayers int(11) UNSIGNED DEFAULT 0,
  monthActivePlayers int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 在线统计
 */
DROP TABLE IF EXISTS t_online;
CREATE TABLE t_online(
  datetime bigint(11) UNSIGNED NOT NULL,
  object blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * Gold消费统计
 */
DROP TABLE IF EXISTS t_gold_cost ;
CREATE TABLE t_gold_cost (
  datetime bigint(11) UNSIGNED NOT NULL,
  todayPaintCost bigint default 0,
  todayRepairRobotCost bigint default 0,
  todayCancelRentOrderCost bigint default 0,
  todayGetEggPartCost bigint default 0,
  todayForceLotteryCost bigint default 0,
  todayLotteryCost bigint default 0,
  todayReflushRentOrderCost bigint default 0,
  todayRobotPartUpCost bigint default 0,
  todayRobotPartUpWithGoldCost bigint default 0,
  todayBuyBlackItem bigint default 0,
  todayResetDeathWheel bigint default 0,
  todayBergUpgrade bigint default 0,
  todayResetBergWheel bigint default 0,
  todayReliveBergWheel bigint default 0,
  todayResetTreasureIsland bigint default 0,
  todayRobotPartEvolutionCost bigint default 0,
 PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * Gold获得统计
 */
DROP TABLE IF EXISTS t_gold_get ;
CREATE TABLE t_gold_get (
  datetime bigint(11) UNSIGNED NOT NULL,
  todayManagerGive bigint default 0,
  todayBuy bigint default 0,
  todayMissionGet bigint default 0,
  todayTaskGet bigint default 0,
  todayDailyJobGet bigint default 0,
  todayToturialGet bigint default 0,
  todayNoticeGive bigint default 0,
  todayPointGive bigint default 0,
  todayInitGive bigint default 0,
  todayHandBookReward bigint default 0,
  todayCompensate bigint default 0,
  todayMonthCard bigint default 0,
  todayFirstBuyDouble bigint default 0,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * Cash获得统计
 */
DROP TABLE IF EXISTS t_cash_get ;
CREATE TABLE t_cash_get (
  datetime bigint(11) UNSIGNED NOT NULL,
  todayManagerGive bigint default 0,
  todayPointGet bigint default 0,
  todayRentRobotGet bigint default 0,
  todayToturialGet bigint default 0,
  todayPVPGet bigint default 0,
  todaySellPart bigint default 0,
  todayInitGive bigint default 0,
  todayMissionGain bigint default 0,
  todayBuyBlackItem bigint default 0,
  todayTreasureIslandGet bigint default 0,
  todayCompensate bigint default 0,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * Cash消费统计
 */
DROP TABLE IF EXISTS t_cash_cost ;
CREATE TABLE t_cash_cost (
  datetime bigint(11) UNSIGNED NOT NULL,
  todayRentRobotCost bigint default 0,
  todayRobotPartUpCost bigint default 0,
  todayPVPLose bigint default 0,
  todayLotteryCost bigint default 0,
  todayPVPUse bigint default 0,
  todayPartRarityUpgrade bigint default 0,
  todayBergUpgrade bigint default 0,
  todayRobotPartEvolution bigint default 0,
  PRIMARY KEY (datetime)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 新增玩家统计
 */
DROP TABLE IF EXISTS t_register;
CREATE TABLE t_register(
  datetime bigint(11) UNSIGNED NOT NULL,
  dayRegisterPlayerNum int(11) UNSIGNED DEFAULT 0,
  monthRegisterPlayerNum int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * PVE通关率统计
 */
DROP TABLE IF EXISTS t_pve_pass_rate;
CREATE TABLE t_pve_pass_rate(
  datetime bigint(11) UNSIGNED NOT NULL,
  object blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * PVE通关耗时统计
 */
DROP TABLE IF EXISTS t_pve_pass_time;
CREATE TABLE t_pve_pass_time(
  datetime bigint(11) UNSIGNED NOT NULL,
  object mediumblob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * PVP挑战获胜率统计
 */
DROP TABLE IF EXISTS t_pvp_attack_win_rate;
CREATE TABLE t_pvp_attack_win_rate(
  datetime bigint(11) UNSIGNED NOT NULL,
  newPlayerNum int(11) UNSIGNED DEFAULT 0,
  newPlayerFirstPvpCount int(11) UNSIGNED DEFAULT 0,
  newPlayerFirstPvpWinCount int(11) UNSIGNED DEFAULT 0,
  object blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * PVP每日抽蛋率统计
 */
DROP TABLE IF EXISTS t_pvp_get_egg_rate;
CREATE TABLE t_pvp_get_egg_rate(
  datetime bigint(11) UNSIGNED NOT NULL,
  pvpWinTimes int(11) UNSIGNED DEFAULT 0,
  pvpGetEggNum int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 每日任务完成率
 */
DROP TABLE IF EXISTS t_daily_job_complete_rate;
CREATE TABLE t_daily_job_complete_rate(
  datetime bigint(11) UNSIGNED NOT NULL,
  object blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 每日武器使用率
 */
DROP TABLE IF EXISTS t_daily_weapon_usage;
CREATE TABLE t_daily_weapon_usage(
  datetime bigint(11) UNSIGNED NOT NULL,
  firstRobotWeaponUsage blob,
  allRobotWeaponUsage blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 每日主城升级时间
 */
DROP TABLE IF EXISTS t_daily_level_upgrade_time;
CREATE TABLE t_daily_level_upgrade_time(
  datetime bigint(11) UNSIGNED NOT NULL,
  levelUpgradeTime blob,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 兑换包
 */
DROP TABLE IF EXISTS t_recharge_package ;
CREATE TABLE t_recharge_package (
  id VARCHAR(50) NOT NULL,
  name VARCHAR(500) NOT NULL,
  item VARCHAR(100) NOT NULL,
  price VARCHAR(100) NOT NULL,
  description VARCHAR(1000) NOT NULL,
  picUrl VARCHAR(50) NOT NULL,
  priority INT(4) NOT NULL,
  enable INT(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET = utf8 ;


/**
 * 金银岛金钱统计
 */
DROP TABLE IF EXISTS t_treasure_island_cash;
CREATE TABLE t_treasure_island_cash(
  datetime bigint(11) UNSIGNED NOT NULL,
  challengePlayers int(11) UNSIGNED DEFAULT 0,
  dayActivePlayers int(11) UNSIGNED DEFAULT 0,
  getCashNum int(11) UNSIGNED DEFAULT 0,
  resetTimes int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 金银岛经验统计
 */
DROP TABLE IF EXISTS t_treasure_island_exp;
CREATE TABLE t_treasure_island_exp(
  datetime bigint(11) UNSIGNED NOT NULL,
  challengePlayers int(11) UNSIGNED DEFAULT 0,
  dayActivePlayers int(11) UNSIGNED DEFAULT 0,
  challengeTimes int(11) UNSIGNED DEFAULT 0,
  totalKillNum int(11) UNSIGNED DEFAULT 0,
  maxKillNum int(11) UNSIGNED DEFAULT 0,
  getExpNum int(11) UNSIGNED DEFAULT 0,
  resetTimes int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 死亡轮盘统计
 */
DROP TABLE IF EXISTS t_death_wheel;
CREATE TABLE t_death_wheel(
  datetime bigint(11) UNSIGNED NOT NULL,
  challengePlayers int(11) UNSIGNED DEFAULT 0,
  dayActivePlayers int(11) UNSIGNED DEFAULT 0,
  hardLevelWinRate text,
  getChipNum text,
  resetTimes int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 车轮战统计
 */
DROP TABLE IF EXISTS t_berg_wheel;
CREATE TABLE t_berg_wheel(
  datetime bigint(11) UNSIGNED NOT NULL,
  challengePlayers int(11) UNSIGNED DEFAULT 0,
  dayActivePlayers int(11) UNSIGNED DEFAULT 0,
  totalWinTimes int(11) UNSIGNED DEFAULT 0,
  maxBattle int(11) UNSIGNED DEFAULT 0,
  getBergNum text,
  resetTimes int(11) UNSIGNED DEFAULT 0,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;


/**
 * 付费成功率
 */
DROP TABLE IF EXISTS t_pay_success_rate;
CREATE TABLE t_pay_success_rate(
  datetime bigint(11) UNSIGNED NOT NULL,
  paySuccessRate text,
  PRIMARY KEY(datetime)
)ENGINE = INNODB DEFAULT CHARSET = utf8;






