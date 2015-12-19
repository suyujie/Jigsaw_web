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
<link rel="stylesheet" href="/robot_web/metronic/plugins/bootstrap-fileupload/bootstrap-fileupload.css" />
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
							<div class="caption"><tt:i18n name="addRechargePackage"/></div>
							<div class="actions"></div>
						</div>
						<div class="portlet-body form">
							<form id="form1" class="form-horizontal" action="/robot_web/recharge_package/add" method="post" enctype="MULTIPART/FORM-DATA">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="id"/></label>
										<div class="col-md-5">
											<input id="id" name="id" type="text" placeholder="必须由不少于5位的字母数字或下划线的组成" class="form-control" required />
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="name"/></label>
										<div class="col-md-5 checkbox-list">
											<c:forEach items="${result.langTypes}" var="langType" varStatus="status">
												<div class="row">
													<label class="col-md-3">
														<input type="checkbox" name="name" value="${langType.key}" />${langType.key}
													</label>
													<input class="col-md-5" type="text" name="${langType.key}_name" readonly />
												</div>
											</c:forEach>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label  class="col-md-3 control-label"><tt:i18n name="item"/></label>
										<div class="col-md-5 checkbox-list">
											<c:forEach items="${result.itemTypes}" var="itemType" varStatus="status">
												<div class="row">
													<label class="col-md-3">
														<input type="checkbox" name="item" value="${itemType.key}" />${itemType.key}
													</label>
													<input class="col-md-5" type="text" name="${itemType.key}" readonly />
												</div>
											</c:forEach>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label  class="col-md-3 control-label"><tt:i18n name="price"/></label>
										<div class="col-md-5 checkbox-list">
											<c:forEach items="${result.coinTypes}" var="coinType" varStatus="status">
												<div class="row">
													<label class="col-md-3">
														<input type="checkbox" name="price" value="${coinType.key}" />${coinType.key}
													</label>
													<input class="col-md-5" type="text" name="${coinType.key}" readonly />
												</div>
											</c:forEach>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label  class="col-md-3 control-label"><tt:i18n name="description"/></label>
										<div class="col-md-5 checkbox-list">
											<c:forEach items="${result.langTypes}" var="langType" varStatus="status">
												<div class="row">
													<label class="col-md-3">
														<input type="checkbox" name="description" value="${langType.key}" />${langType.key}
													</label>
													<input class="col-md-5" type="text" name="${langType.key}_description" readonly />
												</div>
											</c:forEach>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="picture"/></label>
										<div class="col-md-5">
											<div id="uploadDiv" class="fileupload fileupload-new" data-provides="fileupload">
												<div class="input-group">
													<span class="input-group-btn">
														<span class="uneditable-input">
															<i class="icon-file fileupload-exists"></i>
															<span class="fileupload-preview"></span>
														</span>
													</span>
													<span class="btn green btn-file">
														<span class="fileupload-new"><i class="icon-paper-clip"></i> Select file</span>
														<span class="fileupload-exists"><i class="icon-undo"></i> Change</span>
														<input id="picUrl" type="file" name="picUrl" size="30" required/>
													</span>
													<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="priority"/></label>
										<div class="col-md-5">
											<input id="priority" name="priority" type="text" class="form-control" required />
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
								</div>
								<div class="form-actions fluid">
									<div class="col-md-offset-3 col-md-3">
										<button type="submit" class="button glow button-flat-primary"><tt:i18n name="add"/></button>
									</div>
									<div class="col-md-3">
										<a class="button glow button-flat-primary" href="/robot_web/recharge_package/recharge_package_list"><tt:i18n name="return"/></a>
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
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="/robot_web/metronic/scripts/app.js"></script>
	<script src="/robot_web/metronic/scripts/table-advanced.js"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript" charset="UTF-8"></script>
	<script src="/robot_web/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="UTF-8"></script>
	<script type="text/javascript" src="/robot_web/metronic/plugins/bootstrap-fileupload/bootstrap-fileupload.js"></script>
	<script src="/robot_web/js/rechargePackage/addRechargePackage.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>