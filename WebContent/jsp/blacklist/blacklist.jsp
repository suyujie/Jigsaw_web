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
							<div class="caption"><tt:i18n name="blacklist"/></div>
							<div class="actions">
								<a class=" btn default red" onclick="reflushBlacklist()">通知服务器增加新黑名单</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/blacklist/add" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-5">
												<label class="col-md-2 control-label"><tt:i18n name="playerId"/></label>
												<input class="col-md-6" id="playerId" name="playerId" size="20" type="text" pattern="(\d{1,})" required/>
												<span class="col-md-4 help-block" style="color:red;">*</span>
											</div>
											<div class="col-md-2">
												<button id="add" type="submit" class="btn green"><tt:i18n name="addBlacklist"/></button>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<th><tt:i18n name="playerId"/></th>
										<th><tt:i18n name="t"/></th>
										<th><tt:i18n name="operation"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.paging.rows}" var="blackPlayer" varStatus="status">
										<tr>
											<td>${blackPlayer.playerId}</td>
											<td>${blackPlayer.t}</td>
											<td>
												<a class="button button-rounded button-flat-primary button-tiny" onclick="load('/robot_web/player/info?playerId=${blackPlayer.playerId}')" data-target="#ajax" data-toggle="modal"><tt:i18n name="view"/></a>
												<a href="/robot_web/blacklist/delete?playerId=${blackPlayer.playerId}" class="button button-rounded button-flat-primary button-tiny"><tt:i18n name="removeBlacklist"/></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<table style="color:blue">
								<tr>
									<td>
										<c:if test="${result.paging.page > 1}">
											<a id="previous" href="/robot_web/user/list?begin=${result.paging.begin-result.paging.rowNum}&rowNum=${result.paging.rowNum}"><tt:i18n name="previousPage"/></a>&nbsp;&nbsp;
										</c:if>
										<c:if test="${result.paging.page < result.paging.total}">
											<a id="next" href="/robot_web/user/list?begin=${result.paging.end+1}&rowNum=${result.paging.rowNum}"><tt:i18n name="nextPage"/></a>&nbsp;&nbsp;&nbsp;
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
	<script src="/robot_web/js/blacklist/blacklist.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>