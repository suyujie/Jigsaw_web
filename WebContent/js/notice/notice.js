
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$('.form_date').datetimepicker({
    language:  'en',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

function reflushNotice() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/reflushNotice',
		success : function(data) {
			alert(data.nodeMsg);
			alert(data.storageMsg);
		}
	});

}