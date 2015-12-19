<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
<link href="/robot_web/bootstrap/buttons/css/buttons.css" rel="stylesheet" media="screen" />

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/style-responsive.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet" type="text/css" />

<title><tt:i18n name="changePassword"/></title>
</head>
<body class="" style="overflow-x:hidden;background-color:#FFF !important;">

	<div class="portlet box blue ">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-reorder"></i><tt:i18n name="changePassword"/>
			</div>
		</div>
		<div class="portlet-body form">
			<form id="form1" class="form-horizontal" action="/robot_web/user/edit_password" method="post">
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label"><tt:i18n name="username"/></label>
						<div class="col-md-6">
							<input name="username" type="text" class="form-control" value="${result.user.username}" readonly/>
							<label class="form-tip" ></label>
						</div>
						<div class="col-md-3 control-span">
							<span></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"><tt:i18n name="oldPassword"/></label>
						<div class="col-md-6">
							<input name="password" type="hidden" value="${result.user.password }" />
							<input name="oldpassword" type="password" class="form-control" size="20" maxlength="16" AUTOCOMPLETE="OFF" required />
							<label class="form-tip" ></label>
						</div>
						<div class="col-md-3 control-span">
							<span>*</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"><tt:i18n name="newPassword"/></label>
						<div class="col-md-6">
							<input name="newpassword"  type="password" class="form-control" size="20" maxlength="16" AUTOCOMPLETE="OFF" required pattern="\w{1,16}"/>
							<label class="form-tip"><tt:i18n name="passwordTip"/></label>
						</div>
						<div class="col-md-3 control-span">
							<span>*</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label"><tt:i18n name="confirmPassword"/></label>
						<div class="col-md-6">
							<input name="repassword"  type="password" class="form-control" size="20" maxlength="16" AUTOCOMPLETE="OFF" required pattern="\w{1,16}"/>
							<label class="form-tip"><tt:i18n name="confimPasswordTip"/></label>
						</div>
						<div class="col-md-3 control-span">
							<span>*</span>
						</div>
					</div>
				</div>

				<div class="form-actions fluid">
					<div class="col-md-offset-3 col-md-6">
						<input name="id" type="hidden" size="20" maxlength="200" value="${result.user.id}"/>
						<button type="submit" class="button glow button-flat-primary" ><tt:i18n name="submit"/></button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/robot_web/bootstrap/dist/js/bootstrap.js" language="javascript" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/js/security/editPassword.js" type="text/javascript"></script>
	
</body>
</html>