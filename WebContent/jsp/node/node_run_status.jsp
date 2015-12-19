<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/SecurityTag.tld" prefix="ss" %>
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

<body style="overflow-x: hidden; background-color: #FFF !important;">

	<input type="hidden" id="nodeTag" value="${result.node.tag }" />

	<div class="portlet box blue ">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-reorder"></i>节点运行状态
			</div>
			<div class="actions">
				<ss:display roles="1">
					<a class=" btn default green" href="/robot_web/node/nodes_run" data-target="#ajax" data-toggle="modal">全部开启 </a>
					<a class=" btn default green" href="/robot_web/node/nodes_stop" data-target="#ajax" data-toggle="modal">全部关闭</a>
				</ss:display>
			</div>
		</div>
		<div class="portlet-body">

			<!-- 运行状态 -->

			<table
				class="table table-striped table-bordered table-hover table-full-width"
				id="sample_1">
				<thead>
					<tr>
						<th>主机</th>
						<th>运行状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="node" items="${result.nodes}">
						<tr>
							<td>${node.nodeTag}</td>
							<td><c:if test="${node.run}">运行中</c:if> <c:if
									test="${!node.run}">已停止</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>

	</div>

</body>

</html>