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
							<div class="caption"><tt:i18n name="goldLog"/></div>
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/log/gold_log" method="post" style="margin:0 0 0 0">
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
													<option value=""></option>
													<option value="0"><tt:i18n name="GoldType.managerGive"/></option>
													<option value="1"><tt:i18n name="GoldType.buy"/></option>
													<option value="2"><tt:i18n name="GoldType.missionGet"/></option>
													<option value="3"><tt:i18n name="GoldType.taskGet"/></option>
													<option value="4"><tt:i18n name="GoldType.dailyJobGet"/></option>
													<option value="5"><tt:i18n name="GoldType.tutorialGet"/></option>
													<option value="6"><tt:i18n name="GoldType.noticeGive"/></option>
													<option value="7"><tt:i18n name="GoldType.pointGive"/></option>
													<option value="8"><tt:i18n name="GoldType.initGive"/></option>
													<option value="9"><tt:i18n name="GoldType.handbookReward"/></option>
													<option value="10"><tt:i18n name="GoldType.compensate"/></option>
													<option value="11"><tt:i18n name="GoldType.monthCard"/></option>
													<option value="12"><tt:i18n name="GoldType.firstBuyDouble"/></option>
													<option value="-1"><tt:i18n name="GoldType.paintCost"/></option>
													<option value="-2"><tt:i18n name="GoldType.repairRobot"/></option>
													<option value="-3"><tt:i18n name="GoldType.cancelRentOrderCost"/></option>
													<option value="-4"><tt:i18n name="GoldType.getEggPartCost"/></option>
													<option value="-5"><tt:i18n name="GoldType.lottery"/></option>
													<option value="-6"><tt:i18n name="GoldType.reflushRentOrder"/></option>
													<option value="-7"><tt:i18n name="GoldType.robotPartUpCost"/></option>
													<option value="-8"><tt:i18n name="GoldType.robotPartUpWithGoldCost"/></option>
													<option value="-9"><tt:i18n name="GoldType.buyBlackItem"/></option>
													<option value="-10"><tt:i18n name="GoldType.resetDeathWheel"/></option>
													<option value="-11"><tt:i18n name="GoldType.bergUpgrade"/></option>
													<option value="-12"><tt:i18n name="GoldType.resetBergWheel"/></option>
													<option value="-13"><tt:i18n name="GoldType.reliveBergWheel"/></option>
													<option value="-14"><tt:i18n name="GoldType.resetTreasureIsland"/></option>
													<option value="-15"><tt:i18n name="GoldType.robotPartEvolutionCost"/></option>
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
										<th><tt:i18n name="beforeGold"/></th>
										<th><tt:i18n name="changeGold"/></th>
										<th><tt:i18n name="afterGold"/></th>
										<th><tt:i18n name="changeType"/></th>
										<th><tt:i18n name="t"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="log" varStatus="status">
										<tr>
											<td>${log.playerId}</td>
											<td>${log.beforeGold}</td>
											<td>${log.changeGold}</td>
											<td>${log.afterGold}</td>
											<td>
												<c:if test="${log.changeType==0}"><tt:i18n name="GoldType.managerGive"/></c:if>
												<c:if test="${log.changeType==1}"><tt:i18n name="GoldType.buy"/></c:if>
												<c:if test="${log.changeType==2}"><tt:i18n name="GoldType.missionGet"/></c:if>
												<c:if test="${log.changeType==3}"><tt:i18n name="GoldType.taskGet"/></c:if>
												<c:if test="${log.changeType==4}"><tt:i18n name="GoldType.dailyJobGet"/></c:if>
												<c:if test="${log.changeType==5}"><tt:i18n name="GoldType.tutorialGet"/></c:if>
												<c:if test="${log.changeType==6}"><tt:i18n name="GoldType.noticeGive"/></c:if>
												<c:if test="${log.changeType==7}"><tt:i18n name="GoldType.pointGive"/></c:if>
												<c:if test="${log.changeType==8}"><tt:i18n name="GoldType.initGive"/></c:if>
												<c:if test="${log.changeType==9}"><tt:i18n name="GoldType.handbookReward"/></c:if>
												<c:if test="${log.changeType==10}"><tt:i18n name="GoldType.compensate"/></c:if>
												<c:if test="${log.changeType==11}"><tt:i18n name="GoldType.monthCard"/></c:if>
												<c:if test="${log.changeType==12}"><tt:i18n name="GoldType.firstBuyDouble"/></c:if>
												<c:if test="${log.changeType==-1}"><tt:i18n name="GoldType.paintCost"/></c:if>
												<c:if test="${log.changeType==-2}"><tt:i18n name="GoldType.repairRobot"/></c:if>
												<c:if test="${log.changeType==-3}"><tt:i18n name="GoldType.cancelRentOrderCost"/></c:if>
												<c:if test="${log.changeType==-4}"><tt:i18n name="GoldType.getEggPartCost"/></c:if>
												<c:if test="${log.changeType==-5}"><tt:i18n name="GoldType.lottery"/></c:if>
												<c:if test="${log.changeType==-6}"><tt:i18n name="GoldType.reflushRentOrder"/></c:if>
												<c:if test="${log.changeType==-7}"><tt:i18n name="GoldType.robotPartUpCost"/></c:if>
												<c:if test="${log.changeType==-8}"><tt:i18n name="GoldType.robotPartUpWithGoldCost"/></c:if>
												<c:if test="${log.changeType==-9}"><tt:i18n name="GoldType.buyBlackItem"/></c:if>
												<c:if test="${log.changeType==-10}"><tt:i18n name="GoldType.resetDeathWheel"/></c:if>
												<c:if test="${log.changeType==-11}"><tt:i18n name="GoldType.bergUpgrade"/></c:if>
												<c:if test="${log.changeType==-12}"><tt:i18n name="GoldType.resetBergWheel"/></c:if>
												<c:if test="${log.changeType==-13}"><tt:i18n name="GoldType.reliveBergWheel"/></c:if>
												<c:if test="${log.changeType==-14}"><tt:i18n name="GoldType.resetTreasureIsland"/></c:if>
												<c:if test="${log.changeType==-15}"><tt:i18n name="GoldType.robotPartEvolutionCost"/></c:if>
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
												<a id="previous" href="/robot_web/log/gold_log?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&changeType=${result.changeType}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/log/gold_log?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&time=${result.time}&changeType=${result.changeType}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
	
	<script type="text/javascript" src="/robot_web/metronic/plugins/select2/select2.min.js"></script>
	<script type="text/javascript" src="/robot_web/metronic/plugins/data-tables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="/robot_web/metronic/plugins/data-tables/DT_bootstrap.js"></script>
	
	<script src="/robot_web/metronic/scripts/app.js"></script>
	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/js/log/goldLog.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>