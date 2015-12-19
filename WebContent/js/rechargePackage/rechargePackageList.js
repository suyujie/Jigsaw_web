
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

function reflushRechargePackage() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/reflushRechargePackage',
		success : function(data) {
			alert(data.nodeMsg);
			alert(data.storageMsg);
		}
	});

}