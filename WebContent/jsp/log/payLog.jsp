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
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen" />
<link href="/robot_web/bootstrap/buttons/css/buttons.css"
	rel="stylesheet" media="screen" />
<link rel="stylesheet" type="text/css"
	href="/robot_web/metronic/plugins/select2/select2_metro.css" />
<link rel="stylesheet"
	href="/robot_web/metronic/plugins/data-tables/DT_bootstrap.css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/style.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/style-responsive.css"
	rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet"
	type="text/css" />
<link href="/robot_web/metronic/css/themes/light.css" rel="stylesheet"
	type="text/css" id="style_color" />
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet"
	type="text/css" />
</head>

<body class="" style="overflow-x: hidden">

	<!-- BEGIN PAGE TITLE & BREADCRUMB-->

	<div class="row-fluid">
		<div class="page-container" style="margin: 0px">
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<tt:i18n name="payLog" />
							</div>
							<div class="actions"></div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="note note-success">
									<form id="form1" action="/robot_web/log/pay_log" method="post"
										style="margin: 0 0 0 0">
										<div class="row">
											<div class="col-md-1">
												<h4>
													<font color="green"><tt:i18n name="searchCriteria" /></font>
												</h4>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n
														name="playerId" /></label> <input class="col-md-7" id="playerId"
													name="playerId" value="${result.playerId }" size="20"
													type="text" pattern="(\d{1,})" />
											</div>
											<div class="col-md-3">
												<label class="col-md-3" style="margin-top: 6px"><tt:i18n
														name="time" /></label>
												<div class="input-group date form_date col-md-7"
													data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="time" name="time" class="form-control"
														type="text" value="${result.time}" readonly> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-remove"></span></span> <span
														class="input-group-addon"><span
														class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<!-- 
											<div class="col-md-2">
												<input type="hidden" id="selectedCoinType" value="${result.coinType}" />
												<label class="col-md-3 control-label"><tt:i18n name="coinType"/></label>
												<select id="coinType" name="coinType" class="col-md-7">
													<option value=""></option>
													<c:forEach items="${result.coinTypes }" var="coinType" varStatus="status">
														<option value="${coinType}">${coinType}</option>
													</c:forEach>
												</select>
											</div>
											 -->
											<div class="col-md-2">
												<input type="hidden" id="selectedPayChannel"
													value="${result.payChannel}" /> <label
													class="col-md-3 control-label"><tt:i18n
														name="channel" /></label> <select id="payChannel"
													name="payChannel" class="col-md-7">
													<option value=""></option>
													<c:forEach items="${result.payChannelList }"
														var="payChannel" varStatus="status">
														<option value="${payChannel}">${payChannel}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-2">
												<input type="hidden" id="selectedStatus"
													value="${result.status}" /> <label
													class="col-md-3 control-label"><tt:i18n
														name="status" /></label> <select id="status" name="status"
													class="col-md-7">
													<option value=""></option>
													<c:forEach items="${result.payStatusMap }" var="payStatus"
														varStatus="status">
														<option value="${payStatus.key}">${payStatus.value}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-1">
												<button id="select" type="submit" class="btn green">
													<tt:i18n name="search" />
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="playerId" /></th>
										<th><tt:i18n name="payChannel" /></th>
										<th><tt:i18n name="orderId" /></th>
										<th><tt:i18n name="rechargePackageId" /></th>
										<th><tt:i18n name="coinType" /></th>
										<th><tt:i18n name="coin" /></th>
										<th><tt:i18n name="ct" /></th>
										<th><tt:i18n name="st" /></th>
										<th><tt:i18n name="status" /></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="log"
										varStatus="status">
										<tr>
											<td>${log.playerId}</td>
											<td>${log.payChannel}</td>
											<td>${log.orderId}</td>
											<td>${log.rechargePackageId}</td>
											<td>${log.coinType}</td>
											<td>${log.coin/100}</td>
											<td>${log.ct}</td>
											<td>${log.st}</td>
											<td><c:forEach items="${result.payStatusMap }"
													var="payStatus" varStatus="status">
													<c:if test="${log.status==payStatus.key}">${payStatus.value}</c:if>
												</c:forEach></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color: blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td><c:if test="${result.paging.page > 1}">
												<a id="previous"
													href="/robot_web/log/pay_log?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&payChannel=${result.payChannel}&status=${result.status}"><tt:i18n
														name="previousPage" /></a>&nbsp;&nbsp;
											</c:if> <c:if test="${result.paging.page < result.paging.total}">
												<a id="next"
													href="/robot_web/log/pay_log?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&payChannel=${result.payChannel}&status=${result.status}"><tt:i18n
														name="nextPage" /></a>&nbsp;&nbsp;&nbsp;
											</c:if></td>
										<td><tt:i18n name="page" />：${result.paging.page }/${result.paging.total }
										</td>
										<td>&nbsp;&nbsp;&nbsp;</td>
										<td><tt:i18n name="records" />：${result.paging.begin }-${result.paging.end }/${result.paging.records }
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

	<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js"
		type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-migrate-1.2.1.min.js"
		type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="/robot_web/metronic/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script
		src="/robot_web/metronic/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.cookie.min.js"
		type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/uniform/jquery.uniform.min.js"
		type="text/javascript"></script>

	<script type="text/javascript"
		src="/robot_web/metronic/plugins/select2/select2.min.js"></script>
	<script type="text/javascript"
		src="/robot_web/metronic/plugins/data-tables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="/robot_web/metronic/plugins/data-tables/DT_bootstrap.js"></script>

	<script src="/robot_web/metronic/scripts/app.js"></script>
	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>
	<script
		src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"
		type="text/javascript" charset="UTF-8"></script>
	<script
		src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js"
		type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/js/log/payLog.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>