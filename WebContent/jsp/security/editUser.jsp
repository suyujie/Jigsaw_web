<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="" style="overflow-x:hidden;background-color:#FFF !important;">

	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title"><tt:i18n name="editUser"/></h4>
			</div>
			<div class="modal-body">
				<div class="row-fluid">
					<div class="page-container" style="margin: 0px">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet-body form">
									<form id="form1" class="form-horizontal" action="/robot_web/user/edit" method="post" style="margin:0 0 0 0">
										<div class="form-body">
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="username"/></label>
												<div class="input-icon col-md-8">
													<i class="icon-user"></i>
													<input id="username" name="username" class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="username" value="${result.user.username }" readonly/>
												</div>
												<span class="help-block" style="color:red;">*</span>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="password"/></label>
												<div class="input-icon col-md-8">
													<i class="icon-lock"></i>
													<input id="password" name="password" class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="初始密码与用户名相同" value="${result.user.password }" required/>
												</div>
												<span class="help-block" style="color:red"></span>
											</div>
											<div class="form-group">
												<label class="control-label col-md-2"><tt:i18n name="role"/></label>
												<div class="col-md-8 checkbox-list">
													<input type="hidden" id="oldRoles" value="${result.user.role }" />
													<c:forEach items="${result.roles}" var="role">
														<label>
															<input value="${role.key}" name="role" type="checkbox" />${role.value}
														</label>
													</c:forEach>
												</div>
												<div class="col-md-2">
													<span class="help-block" style="color:red">*</span>
												</div>
											</div>
										</div>
										<div class="modal-footer">
										    <button type="button" class="btn default" data-dismiss="modal"><tt:i18n name="close"/></button>
											<button type="submit" id="register-submit-btn" class="btn green pull-right">
											<tt:i18n name="edit"/><i class="m-icon-swapright m-icon-white"></i>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	
	<script src="/robot_web/js/security/editUser.js" type="text/javascript"></script>
	
</body>
<!-- END BODY -->
</html>