<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
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
							<div class="caption"><tt:i18n name="playerNumStatistics"/></div>
							<div class="actions">
								<div class="btn-group">
									<table>
										<tr>
											<td>
												<button class="btn green" onclick="chart('${result.pnArray}');"><tt:i18n name="lineChart"/></button>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/statistics/player_num" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-8">
												<tt:i18n name="selectQueryType"/>
												<select name="type">
													<c:choose>
														<c:when test="${result.type=='cup'}">
															<option value="level"><tt:i18n name="queryByLevel"/></option>
															<option value="cup" selected><tt:i18n name="queryByCup"/></option>
														</c:when>
														<c:otherwise>
															<option value="level" selected><tt:i18n name="queryByLevel"/></option>
															<option value="cup"><tt:i18n name="queryByCup"/></option>
														</c:otherwise>
													</c:choose>
												</select>
											</div>
											<div class="col-md-2">
												<button type="submit" class="btn green"><tt:i18n name="search"/></button>
											</div>
										</div>
									</form>
			                    </div>
			                    <div class="row">
									<label class="col-md-3"><tt:i18n name="totalPlayerNum"/>： <font color="red">${result.totalPlayerNum}</font></label>
								</div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<c:if test="${fn:length(result.keys)>0}">
									<c:forEach var="i" begin="0" end="${fn:length(result.keys)-1}" step="20">
										<tr>
											<c:choose>
												<c:when test="${result.type=='level'}">
													<th><tt:i18n name="level"/></th>
												</c:when>
												<c:when test="${result.type=='cup' }">
													<th><tt:i18n name="cup"/></th>
												</c:when>
												<c:otherwise>
													<th><tt:i18n name="level"/></th>
												</c:otherwise>
											</c:choose>
											<c:forEach var="j" begin="${i}" end="${i+19}" step="1">
												<c:if test="${j<fn:length(result.keys)}">
													<th>${result.keys[j]}</th>
												</c:if>
											</c:forEach>
										</tr>
										<tr>
											<th><tt:i18n name="playerNum"/></th>
											<c:forEach var="j" begin="${i}" end="${i+19}" step="1">
												<c:if test="${j<fn:length(result.keys)}">
													<td>${result.values[j]}</td>
												</c:if>
											</c:forEach>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							<div>
								<c:if test="${fn:length(result.values)>0}">
									<button id="export" value="/robot_web/export_xls?fileTag=7&type=${result.type}"><tt:i18n name="export"/></button>
								</c:if>
							</div>
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
	<script src="/robot_web/js/statistics/playerNum.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>