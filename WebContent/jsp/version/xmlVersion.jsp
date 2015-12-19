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
			<!-- xml文件 -->
			<div class="row">
				<div class="col-md-12">
					<form action="/robot_web/node/download_checked_package?fileType=xml" method="post" >
						<div class="portlet box blue">
				      		<div class="portlet-title">
				            	<div class="caption"><tt:i18n name="latestXMLVersion"/></div>
				            	<div class="actions">
				            		<ss:display roles="1,2">
					            		<a class=" btn default green" onclick="load('/robot_web/version/upload_xml')" title="" data-target="#ajax" data-toggle="modal"><tt:i18n name="upload"/></a>
					            		<a class=" btn default yellow" onclick="update2Storage()" title="上传新文件后执行" >更新到云存储</a>
					            		<a class=" btn default red" onclick="reflushVersion()" title="更新到云存储后执行" >通知逻辑服务器</a>
					            		<a class=" btn default green" onclick="pack()" title="" >打包最新版本</a>
				            		</ss:display>
				            		<a class=" btn default green" href="/robot_web/node/download_version_package?fileType=xml" title="" >下载最新xml包</a>
				            		<button class=" btn default green" onclick="downloadCheckedFiles()" type="submit" >下载选中的文件</button>
				            	</div>
				        	</div>
					        <div class="portlet-body">
					            <table class="table table-striped table-bordered table-hover table-full-width" id="sample_1">
					               	<thead>
					                  	<tr>
					                  		<th width="20px"><input id="all" type="checkbox" onclick="checkAll();"/>全选</th>
					                     	<th><tt:i18n name="lineNumber"/></th>
					                     	<th><tt:i18n name="fileName"/></th>
					                     	<th><tt:i18n name="latestVersionNo"/></th>
					                     	<th>云存储资源</th>
					                  	</tr>
					               	</thead>
					               	<tbody>
					               		<c:forEach items="${result.xmlVersion}" var="item" varStatus="status">
						               		<tr class="odd gradeX">
						               			<td><input name="xml" type="checkbox" value="${item.key}" /></td>
												<td>${status.count}</td>
												<td>${item.key}</td>
						                     	<td>${item.value}</td>
						                     	<td></td>
						                  	</tr>
					                  	</c:forEach>
					               	</tbody>
					            </table>
					        </div>
					    </div>
				    </form>
				</div>
			</div>
			
			<!-- 
			<div class="row">
				<div class="col-md-12">
					<div class="portlet box blue">
			      		<div class="portlet-title">
			            	<div class="caption">刷新服务器,通知逻辑节点更新版本</div>
			            	<div class="actions">
			            		<a class=" btn default green" onclick="reflushVersion()">刷新服务器,通知逻辑节点更新版本</a>
			            	</div>
			        	</div>
				    </div>
				</div>
			</div>
			 -->
			
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
	<script type="text/javascript" src="/robot_web/metronic/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/metronic/scripts/app.js"></script>
   	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>     
	<script src="/robot_web/js/version/xmlVersion.js" type="text/javascript"></script>
	
</body>
<!-- END BODY -->
</html>