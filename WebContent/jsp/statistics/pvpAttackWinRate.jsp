<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
							<div class="caption"><tt:i18n name="pvpAttackWinRateStatistics"/></div>
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
									<form id="form1" action="/robot_web/statistics/pvp_attack_win_rate" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-4">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="date"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="dateTime" name="dateTime" class="form-control" type="text" value="${result.pvpAttackWinRate.dateTime}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<div class="col-md-offset-4 col-md-2">
												<button type="submit"  class="btn green"><tt:i18n name="search"/></button>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="level"/></th>
										<c:forEach items="${result.pvpAttackWinRate.pvpLevelAttacks}" var="pla" varStatus="status">
											<th>${pla.levelRange}</th>
										</c:forEach>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th><tt:i18n name="attackTimes"/></th>
										<c:forEach items="${result.pvpAttackWinRate.pvpLevelAttacks}" var="pla" varStatus="status">
											<td>${pla.attackTimes}</td>
										</c:forEach>
									</tr>
									<tr>
										<th><tt:i18n name="attackWinTimes"/></th>
										<c:forEach items="${result.pvpAttackWinRate.pvpLevelAttacks}" var="pla" varStatus="status">
											<td>${pla.attackWinTimes}</td>
										</c:forEach>
									</tr>
									<tr>
										<th><tt:i18n name="levelWinRate"/></th>
										<c:forEach items="${result.pvpAttackWinRate.pvpLevelAttacks}" var="pla" varStatus="status">
											<td><fmt:formatNumber value="${pla.winRate}" type="percent" pattern="#0.00%"/></td>
										</c:forEach>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<th><tt:i18n name="averageWinCostTime"/></th>
										<c:forEach items="${result.pvpAttackWinRate.pvpLevelAttacks}" var="pla" varStatus="status">
											<td>${pla.averageWinCostTime}</td>
										</c:forEach>
									</tr>
									<tr>
										<th><tt:i18n name="averageWinRate"/></th>
										<c:if test="${result.pvpAttackWinRate!=null}">
											<td colspan="${fn:length(result.pvpAttackWinRate.pvpLevelAttacks)}"><fmt:formatNumber value="${result.pvpAttackWinRate.totalWinRate}" type="percent" pattern="#0.00%"/></td>
										</c:if>
									</tr>
								</tfoot>
							</table>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="dayRegisterPlayerNum"/></th>
										<th><tt:i18n name="newPlayerFirstPvpCount"/></th>
										<th><tt:i18n name="newPlayerFirstPvpWinCount"/></th>
										<th><tt:i18n name="newPlayerFirstPvpWinRate"/></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${result.pvpAttackWinRate.newPlayerNum }</td>
										<td>${result.pvpAttackWinRate.newPlayerFirstPvpCount }</td>
										<td>${result.pvpAttackWinRate.newPlayerFirstPvpWinCount }</td>
										<td><fmt:formatNumber value="${result.pvpAttackWinRate.newPlayerFirstPvpWinRate}" type="percent" pattern="#0.00%"/></td>
									</tr>
								</tbody>
							</table>
							<div>
								<c:if test="${result.pvpAttackWinRate!=null}">
									<button id="export" value="/robot_web/export_xls?fileTag=9&dateTime=${result.pvpAttackWinRate.dateTime}"><tt:i18n name="export"/></button>
								</c:if>
							</div>
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
	<script src="/robot_web/js/statistics/pvpAttackWinRate.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>