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
							<div class="caption"><tt:i18n name="addNotice"/></div>
							<div class="actions"></div>
						</div>
						<div class="portlet-body form">
							<form id="form1" class="form-horizontal" action="/robot_web/notice/add" method="post" enctype="MULTIPART/FORM-DATA">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="noticeType"/></label>
										<div class="col-md-5 radio-list">
											<label class="radio-inline">
												<input value="3" name="noticeType" type="radio" /><tt:i18n name="sendGoldNotice"/>
											</label>
											<label class="radio-inline">
												<input value="4" name="noticeType" type="radio" /><tt:i18n name="ordinaryNotice"/>
											</label>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="title_en_US"/></label>
										<div class="col-md-5">
											<input id="title_en_US" name="title_en_US" type="text" class="form-control" required>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="title_es_ES"/></label>
										<div class="col-md-5">
											<input id="title_es_ES" name="title_es_ES" type="text" class="form-control" required>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="title_zh_CN"/></label>
										<div class="col-md-5">
											<input id="title_zh_CN" name="title_zh_CN" type="text" class="form-control" required>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="cont_en_US"/></label>
										<div class="col-md-5">
											<textarea id="cont_en_US" name="cont_en_US" class="form-control" rows="3" wrap="soft" required></textarea>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="cont_es_ES"/></label>
										<div class="col-md-5">
											<textarea id="cont_es_ES" name="cont_es_ES" class="form-control" rows="3" wrap="soft" required></textarea>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="cont_zh_CN"/></label>
										<div class="col-md-5">
											<textarea id="cont_zh_CN" name="cont_zh_CN" class="form-control" rows="3" wrap="soft" required></textarea>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="beginTime"/></label>
										<div class="input-group date form_date col-md-5" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
											<input name="beginTime" class="form-control" size="70" type="text" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="endTime"/></label>
										<div class="input-group date form_date col-md-5" data-date-format="yyyy-mm-dd" data-link-field="dtp_input1">
											<input name="endTime" class="form-control" size="70" type="text" readonly> <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span> <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red">*</span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="noticePicture"/></label>
										<div class="col-md-5">
											<div class="fileupload fileupload-new" data-provides="fileupload">
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
														<input id="picUrl" type="file" name="picUrl" size="30" />
													</span>
													<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="icon-trash"></i> Remove</a>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="goldNum"/></label>
										<div class="col-md-5">
											<input id="gold" name="gold" type="text" class="form-control">
										</div>
										<div class="col-md-2">
											<span class="help-block" style="color:red"></span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label"><tt:i18n name="readClose"/></label>
										<div class="col-md-5 radio-list">
											<label class="radio-inline">
												<input value="1" name="readClose" type="radio" /><tt:i18n name="readClose"/>
											</label>
											<label class="radio-inline">
												<input value="0" name="readClose" type="radio" /><tt:i18n name="readNotClose"/>
											</label>
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
										<a class="button glow button-flat-primary" href="/robot_web/notice/notice_list"><tt:i18n name="return"/></a>
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
	<script src="/robot_web/js/notice/notice.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>