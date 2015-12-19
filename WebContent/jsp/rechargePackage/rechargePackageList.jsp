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
							<div class="caption"><tt:i18n name="rechargePackageList"/></div>
							<div class="actions">
								<a class=" btn default green" onclick="reflushRechargePackage()"><tt:i18n name="reflushRechargePackage"/></a>
								<a class="btn default green" href="/robot_web/recharge_package/add">Add New <i class="icon-plus"></i></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="priority"/></th>
										<th><tt:i18n name="id"/></th>
										<th><tt:i18n name="name"/></th>
										<th><tt:i18n name="item"/></th>
										<th><tt:i18n name="price"/></th>
										<th><tt:i18n name="status"/></th>
										<th><tt:i18n name="operation"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="rechargePackage" varStatus="status">
										<tr>
											<td>${rechargePackage.priority}</td>
											<td>${rechargePackage.id}</td>
											<td>${rechargePackage.names}</td>
											<td>${rechargePackage.items}</td>
											<td>${rechargePackage.prices}</td>
											<td>
												<c:choose>
													<c:when test="${rechargePackage.enable==0}">
														<tt:i18n name="disable"/>
													</c:when>
													<c:otherwise>
														<tt:i18n name="enable"/>
													</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${rechargePackage.enable==0}">
														<a href="/robot_web/recharge_package/enable?id=${rechargePackage.id}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="enable"/></a>
														<a href="/robot_web/recharge_package/edit?id=${rechargePackage.id}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="edit"/></a>
														<a href="/robot_web/recharge_package/delete?id=${rechargePackage.id}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="delete"/></a>
													</c:when>
													<c:otherwise>
														<a href="/robot_web/recharge_package/disable?id=${rechargePackage.id}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="disable"/></a>
													</c:otherwise>
												</c:choose>
												<a href="/robot_web/recharge_package/view?id=${rechargePackage.id}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="view"/></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/recharge_package/recharge_package_list?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/recharge_package/recharge_package_list?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
	<script src="/robot_web/js/rechargePackage/rechargePackageList.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>