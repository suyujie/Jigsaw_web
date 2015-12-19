<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/SecurityTag.tld" prefix="ss" %>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tt:i18n name="gameTitle"/></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGIN STYLES -->
<link href="/robot_web/metronic/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/jqvmap/jqvmap/jqvmap.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGIN STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/pages/tasks.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
</head>

<!-- BEGIN BODY -->
<body class="page-header-fixed page-footer-fixed page-sidebar-fixed">
	<!-- BEGIN HEADER -->
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<!-- BEGIN TOP NAVIGATION BAR -->
		<div class="header-inner">
			<!-- BEGIN LOGO -->
			<img src="/robot_web/images/logo.png" alt="logo" width="50px" height="50px"/>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<img src="/robot_web/metronic/img/menu-toggler.png" alt="" />
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			
			<span class="tag topic"><tt:i18n name="gameTitle"/></span>
			<span class="tag"><tt:i18n name="currentTime"/>：<label id="systemDate"></label></span>
			<input type="hidden" id="languageTag" value="${result.languageTag }"/>
			
			<!-- BEGIN TOP NAVIGATION MENU -->
			<ul class="nav navbar-nav pull-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true" title="返回首页" onClick='go("/robot_web/welcome")'>
						<i class="icon-home"></i>
						<ul></ul>
					</a>
	            </li>
				<li class="dropdown user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
						<span class="username"><font color="yellow">${result.username }</font></span> 
						<i class="icon-angle-down"></i>
					</a>
					<ul class="dropdown-menu">
                  		<li><a href="#" onclick='go("/robot_web/user/edit_password")'><i class="icon-key"></i><tt:i18n name="changePassword"/></a></li>
						<li><a href="/robot_web/logout"><i class="icon-key"></i><tt:i18n name="logout"/></a></li>
					</ul>
				</li>
			</ul>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END TOP NAVIGATION BAR -->
	</div>
	<!-- END HEADER -->
	
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				
				<ss:display roles="1">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i><span class="title"><tt:i18n name="systemManagement"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/user/list")'><tt:i18n name="userManagement"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu"  href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="versionManagement"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/version/xml_versions")'><tt:i18n name="xmlVersion"/></a></li>
						<li><a href="#" onClick='go("/robot_web/version/res_versions")'><tt:i18n name="resourceVersion"/></a></li>
						<li><a href="#" onClick='go("/robot_web/version/game_version")'><tt:i18n name="gameVersion"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2">
				<li class="">
					<a class="first-level-menu"  href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="noticeManagement"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/notice/notice_list")'><tt:i18n name="noticeManagement"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2">
				<li class="">
					<a class="first-level-menu"  href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="rechargePackageManagement"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/recharge_package/recharge_package_list")'><tt:i18n name="rechargePackageManagement"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu"  href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="playerManagement"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/player/player")'><tt:i18n name="playerInfo"/></a></li>
						<ss:display roles="1">
							<li><a href="#" onClick='go("/robot_web/blacklist/blacklist")'><tt:i18n name="blacklist"/></a></li>
						</ss:display>
						<li><a href="#" onClick='go("/robot_web/feedback/feedbacks")'><tt:i18n name="playerFeedback"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="playerStatistics"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/statistics/player_num")'><tt:i18n name="playerNum"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_loss")'><tt:i18n name="playerLoss"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_retain")'><tt:i18n name="playerRetain"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_register")'><tt:i18n name="playerRegister"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_login")'><tt:i18n name="playerLogin"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_online")'><tt:i18n name="playerOnline"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/lost_72h_players")'><tt:i18n name="lost72hPlayers"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/device_range_rate")'><tt:i18n name="deviceRangeRate"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/channel_range_rate")'><tt:i18n name="channelRangeRate"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="playerPayStatistics"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/statistics/player_pay")'><tt:i18n name="playerPay"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_pay_rank")'><tt:i18n name="playerPayRank"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_pay_success_rate")'><tt:i18n name="playerPaySuccessRate"/></a></li>
						<!-- 
						
						<li><a href="#" onClick='go("/robot_web/statistics/new_player_avg_pay")'><tt:i18n name="newPlayerAveragePay"/></a></li>
						
						 -->
						<li><a href="#" onClick='go("/robot_web/log/today_pay_logs")'><tt:i18n name="todayPayLogs"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="cashGoldStatistics"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/statistics/player_gold_get")'><tt:i18n name="playerGoldGet"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_gold_cost")'><tt:i18n name="playerGoldCost"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_cash_get")'><tt:i18n name="playerCashGet"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/player_cash_cost")'><tt:i18n name="playerCashCost"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="combatStatistics"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/statistics/pve_pass_rate")'><tt:i18n name="pvePassRate"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/pve_pass_time")'><tt:i18n name="pvePassTime"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/pvp_attack_win_rate")'><tt:i18n name="pvpAttackWinRate"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/pvp_get_egg_rate")'><tt:i18n name="pvpGetEggRate"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/daily_job_complete_rate")'><tt:i18n name="dailyJobCompleteRate"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/level_upgrade_time")'><tt:i18n name="levelUpgradeTime"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/suit_quality_percentage")'><tt:i18n name="suitQualityPercentage"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/weapon_usage_rate")'><tt:i18n name="weaponUsageRate"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="instanceZones"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/statistics/treasure_island_cash")'><tt:i18n name="treasureIslandCash"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/treasure_island_exp")'><tt:i18n name="treasureIslandExp"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/death_wheel")'><tt:i18n name="deathWheel"/></a></li>
						<li><a href="#" onClick='go("/robot_web/statistics/berg_wheel")'><tt:i18n name="bergWheel"/></a></li>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
				<li class="">
					<a class="first-level-menu"  href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="logInfo"/></span> <span class="arrow "></span></a>
					<ul class="sub-menu">
						<li><a href="#" onClick='go("/robot_web/log/pay_log")'><tt:i18n name="payLog"/></a></li>
						<li><a href="#" onClick='go("/robot_web/log/gold_log")'><tt:i18n name="goldLog"/></a></li>
						<li><a href="#" onClick='go("/robot_web/log/cash_log")'><tt:i18n name="cashLog"/></a></li>
						<ss:display roles="1">
							<li><a href="#" onClick='go("/robot_web/log/system_log")'><tt:i18n name="systemLog"/></a></li>
						</ss:display>
					</ul>
				</li>
				</ss:display>
				
				<ss:display roles="1,2,3">
					<li class="">
						<a class="first-level-menu" href="javascript:;"> <i class="icon-paper-clip"></i> <span class="title"><tt:i18n name="nodeInfo"/></span><span class="arrow "></span></a>
						<ul class="sub-menu">
							<c:forEach items="${result.nodes}" var="node">
								<li>
									<a href="#" onClick='go("/robot_web/node/node_info?tag=${node.tag}")'>${node.tag}-${node.url}</a>
								</li>
							</c:forEach>
							<li>
								<a href="#" onClick='go("/robot_web/node/nodes_run_status")'>运行状态</a>
							</li>
						</ul>
					</li>
				</ss:display>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->
		<div class="page-content">

			<Iframe id="main_iframe" src="/robot_web/welcome" width="100%" scrolling="no" frameborder="0"></iframe>

		</div>
		<!-- END PAGE -->

	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="footer">
		<div class="footer-inner"></div>
		<div class="footer-tools">
			<span class="go-top"> <i class="icon-angle-up"></i>
			</span>
		</div>
	</div>

	<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
	<script src="/robot_web/metronic/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script src="/robot_web/metronic/plugins/flot/jquery.flot.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/flot/jquery.flot.resize.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
	<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->
	<script src="/robot_web/metronic/plugins/fullcalendar/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/metronic/scripts/app.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/scripts/index.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/scripts/tasks.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/js/index.js" type="text/javascript"></script>

</body>
<!-- END BODY -->
</html>