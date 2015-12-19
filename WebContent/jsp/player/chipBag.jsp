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
				<h4 class="modal-title"><tt:i18n name="chipBag"/></h4>
			</div>
			<div class="modal-body">
				<div class="row-fluid">
					<div class="page-container" style="margin: 0px">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet-body form">
									<form class="form-horizontal" action="" method="" style="margin:0 0 0 0">
										<div class="form-body">
											<input id="chipBag" type="hidden" value='${result.chipBag}'/>
											<c:forEach items="${result.chipTypes}" var="chipType" varStatus="status">
												<label class="control-label col-md-2">${chipType.value}：</label>
												<label class="control-label col-md-1" id="${chipType.key}" name="chipNum">0</label>
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
	
	<script type="text/javascript">
	var chipBagJsonStr = $('#chipBag').val();
	var chipBagJson = eval('(' + chipBagJsonStr + ')');
	
	$("label[name='chipNum']").each(function(){
		var label = $(this);
		var id = label.prop("id");
		$.each(chipBagJson,function(key,value) {
			if(id == key){
				label.html(value);
			}
		});
	});
	</script>
</body>
<!-- END BODY -->
</html>