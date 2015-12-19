<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
							<div class="caption"><tt:i18n name="deathWheelStatistics"/></div>
							<div class="actions">
								<div class="btn-group">
									<table>
										<tr>
											<td>
												<button class="btn green" onclick="chart('${result.pArray}');"><tt:i18n name="lineChart"/></button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/statistics/death_wheel" method="post" style="margin:0 0 0 0">
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
													<input id="endTime" name="endTime" class="form-control" type="text" value="${result.endTime}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
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
										<th rowspan="3"><tt:i18n name="date"/></th>
										<th rowspan="3"><tt:i18n name="challengePlayers"/></th>
										<th rowspan="3"><tt:i18n name="dayActivePlayers"/></th>
										<th rowspan="3"><tt:i18n name="challengeRate"/></th>
										<th colspan="15"><tt:i18n name="hardLevelWinRate"/></th>
										<th rowspan="3"><tt:i18n name="getChipNum"/></th>
										<th rowspan="3"><tt:i18n name="resetTimes"/></th>
									</tr>
									<tr>
										<th colspan="3">难度0</th>
										<th colspan="3">难度1</th>
										<th colspan="3">难度2</th>
										<th colspan="3">难度3</th>
										<th colspan="3">难度4</th>
									</tr>
									<tr>
										<c:forEach begin="0" end="4" var="i" step="1">
											<th><tt:i18n name="attackTimes"/></th>
											<th><tt:i18n name="attackWinTimes"/></th>
											<th><tt:i18n name="levelWinRate"/></th>
										</c:forEach>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="deathWheel" varStatus="status">
										<tr>
											<td>${deathWheel.dateTime}</td>
											<td>${deathWheel.challengePlayers}</td>
											<td>${deathWheel.dayActivePlayers}</td>
											<td><fmt:formatNumber value="${deathWheel.challengeRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.hardLevelWinRate.hardLevel0.attackTimes}</td>
											<td>${deathWheel.hardLevelWinRate.hardLevel0.attackWinTimes}</td>
											<td><fmt:formatNumber value="${deathWheel.hardLevelWinRate.hardLevel0.levelWinRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.hardLevelWinRate.hardLevel1.attackTimes}</td>
											<td>${deathWheel.hardLevelWinRate.hardLevel1.attackWinTimes}</td>
											<td><fmt:formatNumber value="${deathWheel.hardLevelWinRate.hardLevel1.levelWinRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.hardLevelWinRate.hardLevel2.attackTimes}</td>
											<td>${deathWheel.hardLevelWinRate.hardLevel2.attackWinTimes}</td>
											<td><fmt:formatNumber value="${deathWheel.hardLevelWinRate.hardLevel2.levelWinRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.hardLevelWinRate.hardLevel3.attackTimes}</td>
											<td>${deathWheel.hardLevelWinRate.hardLevel3.attackWinTimes}</td>
											<td><fmt:formatNumber value="${deathWheel.hardLevelWinRate.hardLevel3.levelWinRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.hardLevelWinRate.hardLevel4.attackTimes}</td>
											<td>${deathWheel.hardLevelWinRate.hardLevel4.attackWinTimes}</td>
											<td><fmt:formatNumber value="${deathWheel.hardLevelWinRate.hardLevel4.levelWinRate}" type="percent" pattern="#0.00%"/></td>
											<td>${deathWheel.getChipNum}</td>
											<td>${deathWheel.resetTimes}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/statistics/death_wheel?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/statistics/death_wheel?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
											<!-- <button id="export" value="/robot_web/export_xls?fileTag=16&begin=${result.paging.begin}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="export"/></button> -->
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
	<script src="/robot_web/js/statistics/deathWheel.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>