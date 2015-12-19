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
							<div class="caption"><tt:i18n name="cashLog"/></div>
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/log/cash_log" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-1">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n name="playerId"/></label>
												<input class="col-md-7" id="playerId" name="playerId" value="${result.playerId }" size="20" type="text" pattern="(\d{1,})" />
											</div>
											<div class="col-md-3">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="time"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="time" name="time" class="form-control" type="text" value="${result.time}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<div class="col-md-3">
												<input type="hidden" id="selectedChangeType" value="${result.changeType}" />
												<label class="col-md-3 control-label"><tt:i18n name="changeType"/></label>
												<select id="changeType" name="changeType" class="col-md-7">
													<option value="" selected></option>
													<option value="0"><tt:i18n name="CashType.managerGive"/></option>
													<option value="1"><tt:i18n name="CashType.pointGet"/></option>
													<option value="2"><tt:i18n name="CashType.rentRobotGet"/></option>
													<option value="3"><tt:i18n name="CashType.tutorialGet"/></option>
													<option value="4"><tt:i18n name="CashType.pvpGet"/></option>
													<option value="5"><tt:i18n name="CashType.sellPart"/></option>
													<option value="6"><tt:i18n name="CashType.initGive"/></option>
													<option value="7"><tt:i18n name="CashType.missionGain"/></option>
													<option value="8"><tt:i18n name="CashType.buyBlackItem"/></option>
													<option value="9"><tt:i18n name="CashType.treasureIslandGet"/></option>
													<option value="11"><tt:i18n name="CashType.compensate"/></option>
													<option value="-1"><tt:i18n name="CashType.hireRobotCost"/></option>
													<option value="-2"><tt:i18n name="CashType.robotPartUpCost"/></option>
													<option value="-3"><tt:i18n name="CashType.pvpLose"/></option>
													<option value="-4"><tt:i18n name="CashType.lottery"/></option>
													<option value="-5"><tt:i18n name="CashType.pvpUse"/></option>
													<option value="-6"><tt:i18n name="CashType.partRarityUpgrade"/></option>
													<option value="-7"><tt:i18n name="CashType.bergUpgrade"/></option>
													<option value="-8"><tt:i18n name="CashType.robotPartEvolution"/></option>
												</select>
											</div>
											<div class="col-md-2">
												<button id="select" type="submit" class="btn green"><tt:i18n name="search"/></button>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="playerId"/></th>
										<th><tt:i18n name="beforeCash"/></th>
										<th><tt:i18n name="changeCash"/></th>
										<th><tt:i18n name="afterCash"/></th>
										<th><tt:i18n name="changeType"/></th>
										<th><tt:i18n name="t"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="log" varStatus="status">
										<tr>
											<td>${log.playerId}</td>
											<td>${log.beforeCash}</td>
											<td>${log.changeCash}</td>
											<td>${log.afterCash}</td>
											<td>
												<c:if test="${log.changeType==0}"><tt:i18n name="CashType.managerGive"/></c:if>
												<c:if test="${log.changeType==1}"><tt:i18n name="CashType.pointGet"/></c:if>
												<c:if test="${log.changeType==2}"><tt:i18n name="CashType.rentRobotGet"/></c:if>
												<c:if test="${log.changeType==3}"><tt:i18n name="CashType.tutorialGet"/></c:if>
												<c:if test="${log.changeType==4}"><tt:i18n name="CashType.pvpGet"/></c:if>
												<c:if test="${log.changeType==5}"><tt:i18n name="CashType.sellPart"/></c:if>
												<c:if test="${log.changeType==6}"><tt:i18n name="CashType.initGive"/></c:if>
												<c:if test="${log.changeType==7}"><tt:i18n name="CashType.missionGain"/></c:if>
												<c:if test="${log.changeType==8}"><tt:i18n name="CashType.buyBlackItem"/></c:if>
												<c:if test="${log.changeType==9}"><tt:i18n name="CashType.treasureIslandGet"/></c:if>
												<c:if test="${log.changeType==11}"><tt:i18n name="CashType.compensate"/></c:if>
												<c:if test="${log.changeType==-1}"><tt:i18n name="CashType.hireRobotCost"/></c:if>
												<c:if test="${log.changeType==-2}"><tt:i18n name="CashType.robotPartUpCost"/></c:if>
												<c:if test="${log.changeType==-3}"><tt:i18n name="CashType.pvpLose"/></c:if>
												<c:if test="${log.changeType==-4}"><tt:i18n name="CashType.lottery"/></c:if>
												<c:if test="${log.changeType==-5}"><tt:i18n name="CashType.pvpUse"/></c:if>
												<c:if test="${log.changeType==-6}"><tt:i18n name="CashType.partRarityUpgrade"/></c:if>
												<c:if test="${log.changeType==-7}"><tt:i18n name="CashType.bergUpgrade"/></c:if>
												<c:if test="${log.changeType==-8}"><tt:i18n name="CashType.robotPartEvolution"/></c:if>
											</td>
											<td>${log.t}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<c:if test="${result.paging.records > 0}">
									<tr>
										<td>
											<c:if test="${result.paging.page > 1}">
												<a id="previous" href="/robot_web/log/cash_log?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&changeType=${result.changeType}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/log/cash_log?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&changeType=${result.changeType}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/js/log/cashLog.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>