
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$(":checkbox").change(function(){
	if($(this).is(":checked")){
		$(this).parent().parent().parent().next().removeAttr("readonly");
		$(this).parent().parent().parent().next().attr("required", "required");
	}else{
		$(this).parent().parent().parent().next().attr("readonly", "readonly");
		$(this).parent().parent().parent().next().removeAttr("required");
		$(this).parent().parent().parent().next().attr("value", "");
	}
});

var allowed = false;
$("#id").change(function(){
	var reg = /^\w{5,}$/;
	var id = $.trim($(this).val());
	var span = $(this).parent().next().children();
	allowed = false;
	
	if(id==""){
		span.html("ID is required");
		return;
	}
	if(!reg.test(id)){
		span.html("ID必须由不少于5位的字母数字或下划线的组成");
		return;
	}
	
	$.ajax({
		type : 'get',
		dataType : 'text',
		url : '/robot_web/recharge_package/check?id='+id,
		success : function(data) {
			var responseText = $.trim(data);
			span.html(responseText);
			if(responseText == "OK"){
				allowed = true;
			}
		}
	});
});

$(":submit").click(function(){
	if(allowed){
		return true;
	}else{
		return false;
	}
});