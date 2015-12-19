<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/I18ntag.tld" prefix="tt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body class="" style="overflow-x:hidden;background-color:#FFF !important;">

	<div class="modal-dialog modal-wide">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title"><tt:i18n name="bergBag"/></h4>
			</div>
			<div class="modal-body">
				<div class="row-fluid">
					<div class="page-container" style="margin: 0px">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet-body form">
									<form class="form-horizontal" action="" method="" style="margin:0 0 0 0">
										<div class="form-body">
											<c:forEach items="${result.bergBag}" var="berg" varStatus="status">
												<label class="control-label col-md-2">${berg.key}：</label>
												<label class="control-label col-md-1">${berg.value}</label>
												<label class="control-label col-md-1"></label>
											</c:forEach>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	
</body>
<!-- END BODY -->
</html>