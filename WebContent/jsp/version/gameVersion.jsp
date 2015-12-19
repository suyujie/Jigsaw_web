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
<link href="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
<link href="/robot_web/bootstrap/buttons/css/buttons.css" rel="stylesheet" media="screen" />
<link href="/robot_web/metronic/plugins/select2/select2_metro.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/data-tables/DT_bootstrap.css" rel="stylesheet" />
<link href="/robot_web/metronic/plugins/bootstrap-fileupload/bootstrap-fileupload.css" rel="stylesheet" />
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
			<!-- 更新游戏版本 -->
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box blue">
			      		<div class="portlet-title">
			            	<div class="caption"><tt:i18n name="latestGameVersion"/></div>
			            	<div class="actions">
			            		<ss:display roles="1,2">
			            			<a class=" btn default green" onclick="reflushVersion()">刷新服务器,通知逻辑节点更新版本</a>
			            		</ss:display>
			            	</div>
			        	</div>
				        <div class="portlet-body">
							<form id="form1" action="/robot_web/version/edit_game_version" method="post" style="margin:0 0 0 0">
								<div class="row">
									<div class="col-md-4">
										<label class="" style="margin-top:6px;font-weight:bold;"><tt:i18n name="gameVersion"/></label>
										<input id="gameVersion" name="gameVersion" type="text" value="${result.gameVersion}" defaultvalue="${result.gameVersion}" maxlength="50" size="20" readonly required>
									</div>
									<div class="col-md-4">
										<label class="" style="margin-top:6px;font-weight:bold;"><tt:i18n name="newVersionUrl"/></label>
										<input id="newVersionUrl" name="newVersionUrl" type="text" value="${result.newVersionUrl}" defaultvalue="${result.newVersionUrl}" maxlength="50" size="20" readonly required>
									</div>
									<div class="col-md-4">
										<ss:display roles="1,2">
											<input id="btn1" type="button" class="btn green" value="<tt:i18n name='edit'/>">
											<input id="btn2" type="hidden" class="btn green" value="<tt:i18n name='submit'/>">
											<input id="btn3" type="hidden" class="btn green" value="<tt:i18n name='cancel'/>">
										</ss:display>
									</div>
								</div>
							</form>
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
	<script type="text/javascript" src="/robot_web/metronic/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/metronic/scripts/app.js"></script>
   	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>     
	<script src="/robot_web/js/version/gameVersion.js" type="text/javascript"></script>
	
</body>
<!-- END BODY -->
</html>