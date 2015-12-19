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
							<div class="caption"><tt:i18n name="playerPayStatistics"/></div>
							<div class="actions">
								<div class="btn-group">
									<table>
										<tr>
											<td>
												<button class="btn green" onclick="chart('${result.ppArray}');"><tt:i18n name="lineChart"/></button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/statistics/player_pay" method="post" style="margin:0 0 0 0">
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
										<th colspan="5"><tt:i18n name="dayPay"/></th>
										<th colspan="4"><tt:i18n name="weekPay"/></th>
										<th colspan="4"><tt:i18n name="monthPay"/></th>
										<th colspan="6"><tt:i18n name="total"/></th>
									</tr>
									<tr>
										<th><tt:i18n name="loginPlayerNum"/></th>
										<th><tt:i18n name="payPlayerNum"/></th>
										<th><tt:i18n name="amount"/></th>
										<th><tt:i18n name="payRate"/></th>
										<th><tt:i18n name="todayArpu"/></th>
										<th><tt:i18n name="loginPlayerNum"/></th>
										<th><tt:i18n name="payPlayerNum"/></th>
										<th><tt:i18n name="amount"/></th>
										<th><tt:i18n name="payRate"/></th>
										<th><tt:i18n name="loginPlayerNum"/></th>
										<th><tt:i18n name="payPlayerNum"/></th>
										<th><tt:i18n name="amount"/></th>
										<th><tt:i18n name="payRate"/></th>
										<th><tt:i18n name="totalPlayerNum"/></th>
										<th><tt:i18n name="totalPayNum"/></th>
										<th><tt:i18n name="totalAmount"/></th>
										<th><tt:i18n name="arpu"/></th>
										<th><tt:i18n name="arppu"/></th>
										<th><tt:i18n name="totalPayRate"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="playerPay" varStatus="status">
										<tr>
											<td>${playerPay.dateTime}</td>
											<td>${playerPay.todayLoginNum}</td>
											<td>${playerPay.todayPayNum}</td>
											<td>${playerPay.todayAmount/100}</td>
											<td><fmt:formatNumber value="${playerPay.todayPayRate}" type="percent" pattern="#0.00%"/></td>
											<td>${playerPay.todayArpu/100}</td>
											<td>${playerPay.thisWeekLoginNum}</td>
											<td>${playerPay.thisWeekPayNum}</td>
											<td>${playerPay.thisWeekAmount/100}</td>
											<td><fmt:formatNumber value="${playerPay.thisWeekPayRate}" type="percent" pattern="#0.00%"/></td>
											<td>${playerPay.thisMonthLoginNum}</td>
											<td>${playerPay.thisMonthPayNum}</td>
											<td>${playerPay.thisMonthAmount/100}</td>
											<td><fmt:formatNumber value="${playerPay.thisMonthPayRate}" type="percent" pattern="#0.00%"/></td>
											<td>${playerPay.totalPlayerNum}</td>
											<td>${playerPay.totalPayNum}</td>
											<td>${playerPay.totalAmount/100}</td>
											<td>${playerPay.arpu/100}</td>
											<td>${playerPay.arppu/100}</td>
											<td><fmt:formatNumber value="${playerPay.totalPayRate}" type="percent" pattern="#0.00%"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/statistics/player_pay?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/statistics/player_pay?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
											<button id="export" value="/robot_web/export_xls?fileTag=3&begin=${result.paging.begin}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="export"/></button>
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
	<script src="/robot_web/js/statistics/playerPay.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>