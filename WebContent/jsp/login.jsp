<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tt:i18n name="gameTitle"/></title>

<link href="/robot_web/images/logo.png" rel="shortcut icon" type="image/x-icon" /> 
<link href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/plugins/select2/select2_metro.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="/robot_web/metronic/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
<link href="/robot_web/metronic/css/custom.css" rel="stylesheet" type="text/css"/>

</head>
<body class="login">

	<div class="logo">
		<img alt="logo" src="/robot_web/images/logo.png" class="" width="100px" height="100px"><h2><tt:i18n name="gameTitle"/></h2>
	</div>

	<div class="content">
		
		<!-- BEGIN LOGIN FORM -->
		<form class="login-form" action="/robot_web/login" method="post">
			<div class="form-actions pull-right">
				<a href="/robot_web/i18nServlet?localeStr=zh-CN">中文</a>|<a href="/robot_web/i18nServlet?localeStr=en-US">English</a>
			</div>
			<h3 class="form-title"><tt:i18n name="login"/></h3>
			<div class="alert alert-error hide">
				<button class="close" data-dismiss="alert"></button>
				<span>输入用户名和密码</span>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9"><tt:i18n name="username"/></label>
				<div class="input-icon">
					<i class="icon-user"></i>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9"><tt:i18n name="password"/></label>
				<div class="input-icon">
					<i class="icon-lock"></i>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
				</div>
			</div>
			<div class="form-actions">
				<button type="submit" class="btn green pull-right">
				<tt:i18n name="login"/><i class="m-icon-swapright m-icon-white"></i>
				</button>            
			</div>
		</form>
		<!-- END LOGIN FORM -->  

	</div>

	<footer class="footer"> </footer>
	
	<script src="/robot_web/metronic/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript" ></script>
	<script src="/robot_web/metronic/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="/robot_web/metronic/plugins/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/plugins/uniform/jquery.uniform.min.js" type="text/javascript" ></script>
	<script src="/robot_web/metronic/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>	
	<script src="/robot_web/metronic/plugins/select2/select2.min.js"type="text/javascript"></script>     
	<script src="/robot_web/metronic/scripts/app.js" type="text/javascript"></script>
	<script src="/robot_web/metronic/scripts/login-soft.js" type="text/javascript"></script> 
	<script src="/robot_web/js/login.js" type="text/javascript"></script>

</body>
</html>