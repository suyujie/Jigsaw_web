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
							<div class="caption"><tt:i18n name="lost72hPlayersStatistics"/></div>
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
									<form id="form1" action="/robot_web/statistics/lost_72h_players" method="post" style="margin:0 0 0 0">
										<div class="row">
											<div class="col-md-2">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-4">
												<label class="col-md-3" style="margin-top:6px"><tt:i18n name="deadline"/></label>
												<div class="input-group date form_date col-md-7" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
													<input id="dateTime" name="dateTime" class="form-control" type="text" value="${result.dateTime}" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
												</div>
											</div>
											<div class="col-md-offset-4 col-md-1">
												<button type="submit" class="btn green"><tt:i18n name="search"/></button>
											</div>
											<div class="col-md-1">
												<c:if test="${fn:length(result.pointMapList)>0 || fn:length(result.levleMapList)>0}">
													<button id="export" type="button" class="btn" value="/robot_web/export_xls?fileTag=11&dateTime=${result.dateTime}"><tt:i18n name="export"/></button>
												</c:if>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
		                   
		                    <!-- BEGIN PAGE CONTENT-->
							<div class="row">
								<div class="col-md-6 col-sm-12">
									<!-- BEGIN EXAMPLE TABLE PORTLET-->
							      	<div class="portlet box grey">
							      		<div class="portlet-title">
							            	<div class="caption"><i class="icon-user"></i><tt:i18n name="pointLoss"/></div>
							            	<div class="actions"></div>
							        	</div>
								        <div class="portlet-body">
								            <table class="table table-striped table-bordered table-hover" id="sample_2">
								               	<thead>
								                  	<tr>
								                     	<th><tt:i18n name="pointId"/></th>
								                     	<th><tt:i18n name="lostPlayerNum"/></th>
								                  	</tr>
								               	</thead>
								               	<tbody>
								               		<c:forEach items="${result.pointMapList}" var="pointMap">
									               		<tr class="odd gradeX">
															<td>${pointMap.pointId}</td>
									                     	<td>${pointMap.lostNum}</td>
									                  	</tr>
								                  	</c:forEach>
								               	</tbody>
								            </table>
								        </div>
								    </div>
								    <!-- END EXAMPLE TABLE PORTLET-->
							   	</div>
								<div class="col-md-6 col-sm-12">
									<!-- BEGIN EXAMPLE TABLE PORTLET-->
									<div class="portlet box purple">
										<div class="portlet-title">
											<div class="caption"><i class="icon-user"></i><tt:i18n name="levelLoss"/></div>
										   	<div class="actions"></div>
										</div>
										<div class="portlet-body">
								            <table class="table table-striped table-bordered table-hover" id="sample_3">
								               	<thead>
								                  	<tr>
								                     	<th><tt:i18n name="level"/></th>
								                     	<th><tt:i18n name="lostPlayerNum"/></th>
								                  	</tr>
								               	</thead>
								               	<tbody>
								               		<c:forEach items="${result.levelMapList}" var="levelMap">
									               		<tr class="odd gradeX">
															<td>${levelMap.level}</td>
									                     	<td>${levelMap.lostNum}</td>
									                  	</tr>
								                  	</c:forEach>
								               	</tbody>
								            </table>
								        </div>
									</div>
									<!-- END EXAMPLE TABLE PORTLET-->
								</div>
							</div>
							<!-- END PAGE CONTENT-->
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
   	<script src="/robot_web/metronic/scripts/table-managed.js"></script>     
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<!-- chart -->
	<script src="/robot_web/Highcharts-3.0.7-js/highcharts.js" type="text/javascript"></script>
	<script src="/robot_web/Highcharts-3.0.7-js/modules/exporting.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/lost72hPlayers.js" type="text/javascript"></script>
	<script src="/robot_web/js/statistics/export.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>