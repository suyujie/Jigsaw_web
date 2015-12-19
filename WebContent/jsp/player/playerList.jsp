<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/SecurityTag.tld" prefix="ss" %>
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
<link href="/robot_web/bootstrap/buttons/css/buttons.css" rel="stylesheet" media="screen" />
<link href="/robot_web/metronic/plugins/select2/select2_metro.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/data-tables/DT_bootstrap.css" rel="stylesheet" />
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
							<div class="caption"><tt:i18n name="playerInfo"/></div>
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/player/player" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-1">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n name="playerId"/></label>
												<input class="col-md-7" id="playerId" name="playerId" size="20" type="text" value="${result.playerId }" pattern="(\d+)"/>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n name="name"/></label>
												<input class="col-md-7" id="nameInPlat" name="nameInPlat" size="20" type="text" value="${result.nameInPlat }"/>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n name="level"/></label>
												<input class="col-md-2" id="startLevel" name="startLevel" size="3" type="text" value="${result.startLevel }"/>
												<label class="col-md-1 control-label" style="text-align:center;">-</label>
												<input class="col-md-2" id="endLevel" name="endLevel" size="3" type="text" value="${result.endLevel }"/>
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
										<th><tt:i18n name="id"/></th>
										<th><tt:i18n name="nameInPlat"/></th>
										<th><tt:i18n name="gold"/></th>
										<th><tt:i18n name="cash"/></th>
										<th><tt:i18n name="exp"/></th>
										<th><tt:i18n name="level"/></th>
										<th><tt:i18n name="cupNum"/></th>
										<th><tt:i18n name="onLine"/></th>
										<th><tt:i18n name="channel"/></th>
										<!-- <th><tt:i18n name="device"/></th> -->
										<!-- <th><tt:i18n name="operation"/></th> -->
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows }" var="player" varStatus="status">
										<tr>
											<td>${player.id}</td>
											<td>${player.account.nameInPlat}</td>
											<td>${player.gold}</td>
											<td>${player.cash}</td>
											<td>${player.exp}</td>
											<td>${player.level}</td>
											<td>${player.playerStatistics.cupNum}</td>
											<td>
												<c:if test="${player.onLine==1}"><tt:i18n name="onLine"/></c:if>
												<c:if test="${player.onLine==0}"><tt:i18n name="notOnLine"/></c:if>
											</td>
											<!-- <td>${player.account.channel}</td> -->
											<!-- <td>${player.account.device}</td> -->
											<td>
												<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/player/info?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="view"/></a>
												<a class="button button-rounded button-flat-primary button-tiny" href="/robot_web/robot/robot_bag?playerId=${player.id}"><tt:i18n name="robotBag"/></a>
												<a class="button button-rounded button-flat-primary button-tiny" href="/robot_web/part/part_bag?playerId=${player.id}"><tt:i18n name="partBag"/></a>
												<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/chip/chip_bag?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="chipBag"/></a>
												<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/exp/exp_bag?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="expBag"/></a>
												<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/berg/berg_bag?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="bergBag"/></a>
												<ss:display roles="1">
													<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/player/compensate_gold?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="compensateGold"/></a>
													<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/player/compensate_cash?playerId=${player.id}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="compensateCash"/></a>
													<button id="addBlacklist" type="button" class="button button-rounded button-flat-primary button-tiny" onclick="check(${player.id})"><tt:i18n name="addBlacklist"/></button>
													<a class="button button-rounded button-flat-primary button-tiny" href="/robot_web/player/delete_cache?playerId=${player.id}"><tt:i18n name="deleteCache"/></a>
													<a class="button button-rounded button-flat-primary button-tiny" href="/robot_web/player/delete?playerId=${player.id}"><tt:i18n name="deleteAll"/></a>
												</ss:display>
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
												<a id="previous" href="/robot_web/player/player?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&nameInPlat=${result.nameInPlat}&startLevel=${result.startLevel}&endLevel=${result.endLevel}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
											</c:if>
											<c:if test="${result.paging.page < result.paging.total}">
												<a id="next" href="/robot_web/player/player?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}&playerId=${result.playerId}&nameInPlat=${result.nameInPlat}&startLevel=${result.startLevel}&endLevel=${result.endLevel}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
	
	<div class="modal fade" id="ajax" tabindex="-1" role="basic" aria-hidden="true">
       <img src="/robot_web/metronic/img/ajax-modal-loading.gif" alt="" class="loading">
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
	<script src="/robot_web/js/player/playerList.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>