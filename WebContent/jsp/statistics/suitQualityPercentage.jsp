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
							<div class="caption"><tt:i18n name="suitQualityPercentageStatistics"/></div>
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
									<form id="form1" action="/robot_web/statistics/suit_quality_percentage" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-2">
												<a class="btn green" href="/robot_web/statistics/suit_quality_percentage?type=1"><tt:i18n name="searchRobotQualitySuitPercentage"/></a>
											</div>
											<div class="col-md-2">
												<a class="btn green" href="/robot_web/statistics/suit_quality_percentage?type=2"><tt:i18n name="searchRobotShapeSuitPercentage"/></a>
											</div>
											<div class="col-md-2">
												<a class="btn green" href="/robot_web/statistics/suit_quality_percentage?type=3"><tt:i18n name="searchRobot3QualitySuitPercentage"/></a>
											</div>
											<div class="col-md-2">
												<a class="btn green" href="/robot_web/statistics/suit_quality_percentage?type=4"><tt:i18n name="searchRobot3ShapeSuitPercentage"/></a>
											</div>
											<div class="col-md-2">
												<a class="btn green" href="/robot_web/statistics/suit_quality_percentage?type=5"><tt:i18n name="searchPartQualityPercentage"/></a>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<c:choose>
											<c:when test="${result.type==5 }">
												<th><tt:i18n name="qualityName"/></th>
											</c:when>
											<c:otherwise>
												<th><tt:i18n name="suitName"/></th>
											</c:otherwise>
										</c:choose>
										<th><tt:i18n name="num"/></th>
										<c:choose>
											<c:when test="${result.type==5 }">
												<th><tt:i18n name="totalPartNum"/></th>
											</c:when>
											<c:otherwise>
												<th><tt:i18n name="totalRobotNum"/></th>
											</c:otherwise>
										</c:choose>
										<th><tt:i18n name="percentage"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.suitQualityPercentages}" var="sqp" varStatus="status">
										<tr>
											<td>${sqp.name}</td>
											<td>${sqp.num}</td>
											<td>${result.totalNum }</td>
											<td><fmt:formatNumber value="${sqp.percentage}" type="percent" pattern="#0.00%"/></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<c:if test="${fn:length(result.suitQualityPercentages)>0}">
									<button id="export" value="/robot_web/export_xls?fileTag=14&type=${result.type }"><tt:i18n name="export"/></button>
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
	<script src="/robot_web/js/statistics/suitQualityPercentage.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>