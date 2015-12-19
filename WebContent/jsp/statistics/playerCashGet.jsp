<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
<link href="/robot_web/bootstrap/buttons/css/buttons.css" rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css" href="/robot_web/metronic/plugins/select2/select2_metro.css" />
<link rel="stylesheet" href="/robot_web/metronic/plugins/data-tables/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/themes/light.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet" type="text/css" />
</head>

<body class="" style="overflow-x:hidden">

	<!-- BEGIN PAGE TITLE & BREADCRUMB-->

	<div class="row-fluid">
		<div class="page-container" style="margin: 0px">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box blue" >
						<div class="portlet-title">
							<div class="caption"><tt:i18n name="playerCashGetStatistics"/></div>
							<div class="actions">
								<div class="btn-group">
									<table>
										<tr>
											<td>
												<button class="btn green" onclick="chart('${result.pcgArray}');"><tt:i18n name="lineChart"/></button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/statistics/player_cash_get" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-4">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="beginTime"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="beginTime" name="beginTime" class="form-control" type="text" value="${result.beginTime}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<div class="col-md-4">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="endTime"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="endTime" name="endTime" class="form-control" type="text" value="${result.endTime }" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<div class="col-md-2">
												<button type="submit"  class="btn green"><tt:i18n name="search"/></button>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th rowspan="2"><tt:i18n name="date"/></th>
										<th colspan="8"><tt:i18n name="dayCashGet"/></th>
									</tr>
									<tr>
										<th><tt:i18n name="CashType.managerGive"/></th>
										<th><tt:i18n name="CashType.pointGet"/></th>
										<th><tt:i18n name="CashType.rentRobotGet"/></th>
										<th><tt:i18n name="CashType.tutorialGet"/></th>
										<th><tt:i18n name="CashType.pvpGet"/></th>
										<th><tt:i18n name="CashType.sellPart"/></th>
										<th><tt:i18n name="CashType.initGive"/></th>
										<th><tt:i18n name="CashType.missionGain"/></th>
										<th><tt:i18n name="CashType.buyBlackItem"/></th>
										<th><tt:i18n name="CashType.treasureIslandGet"/></th>
										<th><tt:i18n name="CashType.compensate"/></th>
										<th><tt:i18n name="getAmount"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="playerCashGet" varStatus="status">
										<tr>
											<td>${playerCashGet.dateTime}</td>
											<td>${playerCashGet.todayManagerGive}</td>
											<td>${playerCashGet.todayPointGet}</td>
											<td>${playerCashGet.todayRentRobotGet}</td>
											<td>${playerCashGet.todayToturialGet}</td>
											<td>${playerCashGet.todayPVPGet}</td>
											<td>${playerCashGet.todaySellPart}</td>
											<td>${playerCashGet.todayInitGive}</td>
											<td>${playerCashGet.todayMissionGain}</td>
											<td>${playerCashGet.todayBuyBlackItem}</td>
											<td>${playerCashGet.todayTreasureIslandGet}</td>
											<td>${playerCashGet.todayCompensate}</td>
											<td>${playerCashGet.todayGetAmount}</td>
										</tr>
									</c:forEach>
									<tr>
										<th><tt:i18n name="total"/></th>
										<td>${result.total.totalManagerGive}</td>
										<td>${result.total.totalPointGet}</td>
										<td>${result.total.totalRentRobotGet}</td>
										<td>${result.total.totalToturialGet}</td>
										<td>${result.total.totalPVPGet}</td>
										<td>${result.total.totalSellPart}</td>
										<td>${result.total.totalInitGive}</td>
										<td>${result.total.totalMissionGain}</td>
										<td>${result.total.totalBuyBlackItem}</td>
										<td>${result.total.totalTreasureIslandGet}</td>
										<td>${result.total.totalCompensate}</td>
										<td>${result.total.totalGetAmount}</td>
									</tr>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/statistics/player_cash_get?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/statistics/player_cash_get?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
											</c:if>
										</td>
										<td>
											<tt:i18n name="page"/>：${result.paging.page }/${result.paging.total }
										</td>
										<td>
											&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<tt:i18n name="records"/>：${result.paging.begin }-${result.paging.end }/${result.paging.records }
										</td>
										<td>
											&nbsp;&nbsp;&nbsp;
										</td>
										<td>
											<button id="export" value="/robot_web/export_xls?fileTag=19&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="export"/></button>
										</td>
									</tr>
								</c:if>
							</table>
							<div id="chart" style="min-width: 300px; min-height: 400px; margin: 0 auto"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script type="text/javascript" src="/robot_web/metronic/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/robot_web/metronic/plugins/data-tables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="/robot_web/metronic/plugins/data-tables/DT_bootstrap.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/metronic/scripts/app.js"></script>
	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<!-- chart -->
	<script src="/robot_web/Highcharts-3.0.7-js/highcharts.js" type="text/javascript"></script>
	<script src="/robot_web/Highcharts-3.0.7-js/modules/exporting.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/playerCashGet.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>