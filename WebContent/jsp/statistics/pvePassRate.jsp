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
							<div class="caption"><tt:i18n name="pvePassRateStatistics"/></div>
							<div class="actions">
								<div class="btn-group">
									<table>
										<tr>
											<td>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/statistics/pve_pass_rate" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-4">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="beginTime"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="dateTime" name="beginTime" class="form-control" type="text" value="${result.beginTime}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
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
										<th rowspan="2"><tt:i18n name="pointId"/></th>
										<th colspan="6"><tt:i18n name="pointStar1"/></th>
										<th colspan="6"><tt:i18n name="pointStar2"/></th>
										<th colspan="6"><tt:i18n name="pointStar3"/></th>
									</tr>
									<tr>
										<th><tt:i18n name="challengeTimes"/></th>
										<th><tt:i18n name="passTimes"/></th>
										<th><tt:i18n name="passTimeRate"/></th>
										<th><tt:i18n name="challengePlayers"/></th>
										<th><tt:i18n name="passPlayers"/></th>
										<th><tt:i18n name="passPlayerRate"/></th>
										<th><tt:i18n name="challengeTimes"/></th>
										<th><tt:i18n name="passTimes"/></th>
										<th><tt:i18n name="passTimeRate"/></th>
										<th><tt:i18n name="challengePlayers"/></th>
										<th><tt:i18n name="passPlayers"/></th>
										<th><tt:i18n name="passPlayerRate"/></th>
										<th><tt:i18n name="challengeTimes"/></th>
										<th><tt:i18n name="passTimes"/></th>
										<th><tt:i18n name="passTimeRate"/></th>
										<th><tt:i18n name="challengePlayers"/></th>
										<th><tt:i18n name="passPlayers"/></th>
										<th><tt:i18n name="passPlayerRate"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="ppr" varStatus="status">
										<tr>
											<td>${ppr.pointId}</td>
											
											<td>${ppr.star1.challengeTimes}</td>
											<td>${ppr.star1.passTimes}</td>
											<td><fmt:formatNumber value="${ppr.star1.passTimeRate}" type="percent" pattern="#0.00%"/></td>
											<td>${ppr.star1.challengePlayers}</td>
											<td>${ppr.star1.passPlayers}</td>
											<td><fmt:formatNumber value="${ppr.star1.passPlayerRate}" type="percent" pattern="#0.00%"/></td>
											
											<td>${ppr.star2.challengeTimes}</td>
											<td>${ppr.star2.passTimes}</td>
											<td><fmt:formatNumber value="${ppr.star2.passTimeRate}" type="percent" pattern="#0.00%"/></td>
											<td>${ppr.star2.challengePlayers}</td>
											<td>${ppr.star2.passPlayers}</td>
											<td><fmt:formatNumber value="${ppr.star2.passPlayerRate}" type="percent" pattern="#0.00%"/></td>
											
											<td>${ppr.star3.challengeTimes}</td>
											<td>${ppr.star3.passTimes}</td>
											<td><fmt:formatNumber value="${ppr.star3.passTimeRate}" type="percent" pattern="#0.00%"/></td>
											<td>${ppr.star3.challengePlayers}</td>
											<td>${ppr.star3.passPlayers}</td>
											<td><fmt:formatNumber value="${ppr.star3.passPlayerRate}" type="percent" pattern="#0.00%"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/statistics/pve_pass_rate?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/statistics/pve_pass_rate?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
											<button id="export" value="/robot_web/export_xls?fileTag=8&beginTime=${result.beginTime}&endTime=${result.endTime}"><tt:i18n name="export"/></button>
										</td>
									</tr>
								</c:if>
							</table>
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
	<script src="/robot_web/js/statistics/pvePassRate.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>