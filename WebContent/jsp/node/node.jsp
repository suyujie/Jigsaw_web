<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/themes/default.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/bootstrap/buttons/css/buttons.css"
	rel="stylesheet" media="screen" />

</head>

<script type="text/javascript">
var dbTags = ${result.dbTags};
</script>

<body style="overflow-x: hidden; background-color: #FFF !important;">

	<input type="hidden" id="nodeTag" value="${result.node.tag }" />

	<div class="portlet box blue ">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-reorder"></i>${result.node.url} <tt:i18n name="serverHealth" /> <c:if test="${result.run}">运行中</c:if><c:if test="${result.run==false}">停止服务</c:if>
			</div>
		</div>
		<div class="portlet-body">
			<!-- 积压的滑窗数据库任务 -->
			<div class="col-md-12" id="taskQueueRemoveDiv">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>积压任务
						</div>
						<div class="tools">
							<a href='javascript:hide_show($("#taskQueueHideDiv"));'
								class="collapse"></a> <a href="javascript:taskQueueStatus();"
								class="reload"></a> <a
								href='javascript:remove($("#taskQueueRemoveDiv"));' class="remove"></a>
						</div>
					</div>
					<div class="portlet-body" id="taskQueueStatusHideDiv">
						<div id="taskQueueStatus" class="chart"></div>
					</div>
				</div>
			</div>
			<!-- 内存 -->
			<div class="col-md-12" id="memoryRemoveDiv">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>
							<tt:i18n name="memoryUsage" />
						</div>
						<div class="tools">
							<a href='javascript:hide_show($("#memoryHideDiv"));'
								class="collapse"></a> <a href="javascript:memoryStatus();"
								class="reload"></a> <a
								href='javascript:remove($("#memoryRemoveDiv"));' class="remove"></a>
						</div>
					</div>
					<div class="portlet-body" id="memoryHideDiv">
						<div id="memoryStatus" class="chart"></div>
					</div>
				</div>
			</div>
			<!-- 线程 -->
			<div class="col-md-12" id="threadRemoveDiv">
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption">
							<i class="icon-reorder"></i>
							<tt:i18n name="threadState" />
						</div>
						<div class="tools">
							<a href='javascript:hide_show($("#threadHideDiv"));'
								class="collapse"></a> <a href="javascript:threadStatus();"
								class="reload"></a> <a
								href='javascript:remove($("#threadRemoveDiv"));' class="remove"></a>
						</div>
					</div>
					<div class="portlet-body" id="threadHideDiv">
						<div id="threadStatus" class="chart"></div>
					</div>
				</div>
			</div>

			<!-- 数据库 -->
			<c:forEach var="dbTag" items="${result.dbTags}">

				<div class="col-md-12" id="dbRemoveDiv${dbTag}">
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="icon-reorder"></i>
								<tt:i18n name="masterDatabaseConnectionState" />  ${dbTag}
							</div>
							<div class="tools">
								<a href='javascript:hide_show($("#dbHideDiv${dbTag}"));' class="collapse"></a>
								<a href="javascript:dbStatus();" class="reload"></a>
								<a href='javascript:remove($("#dbRemoveDiv${dbTag}"));' class="remove"></a>
							</div>
						</div>
						<div class="portlet-body" id="dbHideDiv${dbTag}">
							<div id="dbStatus${dbTag}" class="chart"></div>
						</div>
					</div>
				</div>

			</c:forEach>




		</div>

	</div>

</body>



<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js"
	type="text/javascript"></script>
<script src="/robot_web/Highcharts-3.0.7-js/highcharts.js"
	type="text/javascript"></script>
<script src="/robot_web/Highcharts-3.0.7-js/modules/exporting.js"
	type="text/javascript"></script>
<script src="/robot_web/js/utils/JHashMap.js" type="text/javascript"></script>
<script src="/robot_web/js/node/node.js" type="text/javascript"></script>

</html>