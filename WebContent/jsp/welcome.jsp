<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
<link href="/robot_web/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/robot_web/metronic/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/robot_web/metronic/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
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

<body class="" style="overflow-x: hidden">
<div class="row-fluid">
	<div class="page-container" style="margin: 0px">
		<div class="row">
			<div class="col-md-12">
				<!-- BEGIN INLINE NOTIFICATIONS PORTLET-->
			    <div class="portlet box blue">
			       <div class="portlet-title">
			          <div class="caption"><i class="icon-cogs"></i><tt:i18n name="infoBar"/></div>
			          <div class="tools"></div>
			       </div>
			       <div class="portlet-body">
			          <div class="alert alert-block alert-info fade in">
			          	<button type="button" class="close" data-dismiss="alert"></button>
			            <h4 class="alert-heading">仓库使用率</h4>
			            <p>
			            	机器人仓库使用率：
			            	${result.wareHouseUtilization }
			            	
			            	<!-- <fmt:formatNumber value="0" type="percent" pattern="#0.00%"/> -->
			            </p>
			          </div>
			       </div>
			    </div>
			    <!-- END INLINE NOTIFICATIONS PORTLET-->
    		</div>
    	</div>
    </div>
</div>

<script src="/robot_web/bootstrap/dist/js/bootstrap.js" language="javascript" type="text/javascript" charset="UTF-8"></script>

</body>
</html>