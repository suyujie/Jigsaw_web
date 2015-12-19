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
							<div class="caption"><tt:i18n name="robotInfo"/></div>
							<div class="actions">
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
		                        <div class="note note-success">
									<form id="form1" action="/robot_web/robot/robot_bag" method="post" style="margin:0 ARM 0 0">
										<div class="row">
											<div class="col-md-1">
												<h4><font color="green"><tt:i18n name="searchCriteria"/></font></h4>
											</div>
											<div class="col-md-3">
												<label class="col-md-3 control-label"><tt:i18n name="playerId"/></label>
												<input class="col-md-7" id="playerId" name="playerId" size="20" type="text" value="${result.playerId }" pattern="(\d+)"/>
											</div>
											<div class="col-md-1">
												<button id="select" type="submit" class="btn green"><tt:i18n name="search"/></button>
											</div>
											<div class="col-md-1">
												<a class="btn" href="/robot_web/player/player?playerId=${result.playerId}"><tt:i18n name="return"/></a>
											</div>
										</div>
									</form>
			                    </div>
		                    </div>
							<table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
								<thead>
									<tr>
										<!-- <th><tt:i18n name="id"/></th> -->
										<th><tt:i18n name="robotType"/></th>
										<th><tt:i18n name="slot"/></th>
										<th><tt:i18n name="score"/></th>
										<th><tt:i18n name="head"/></th>
										<th><tt:i18n name="arm"/></th>
										<th><tt:i18n name="body"/></th>
										<th><tt:i18n name="leg"/></th>
										<th><tt:i18n name="weapon"/></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${result.robots }" var="robot" varStatus="status">
										<tr>
											<!-- <td>${robot.id}</td> -->
											<td>${robot.robotType}</td>
											<td>${robot.slot}</td>
											<td>${robot.score}</td>
											<td>
												<c:choose>
													<c:when test="${robot.parts.HEAD==null}"></c:when>
													<c:otherwise>${robot.parts.HEAD.partQualityType}__${robot.parts.HEAD.partSuitName}__level=${robot.parts.HEAD.level}</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${robot.parts.ARM==null}"></c:when>
													<c:otherwise>${robot.parts.ARM.partQualityType}__${robot.parts.ARM.partSuitName}__level=${robot.parts.ARM.level}</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${robot.parts.BODY==null}"></c:when>
													<c:otherwise>${robot.parts.BODY.partQualityType}__${robot.parts.BODY.partSuitName}__level=${robot.parts.BODY.level}</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${robot.parts.LEG==null}"></c:when>
													<c:otherwise>${robot.parts.LEG.partQualityType}__${robot.parts.LEG.partSuitName}__level=${robot.parts.LEG.level}</c:otherwise>
												</c:choose>
											</td>
											<td>
												<c:choose>
													<c:when test="${robot.parts.WEAPON==null}"></c:when>
													<c:otherwise>${robot.parts.WEAPON.partQualityType}__${robot.parts.WEAPON.partSuitName}__${robot.parts.WEAPON.weaponType}__level=${robot.parts.WEAPON.level}</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
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
	<script src="/robot_web/js/player/robotBag.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>