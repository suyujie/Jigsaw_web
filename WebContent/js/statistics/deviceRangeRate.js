
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$(window).load(function(){
	var selectedDeviceType = $("#selectedDeviceType").val();
	
	$("#deviceType option").each(function(){
		var val = $(this).val();
		if(val==selectedDeviceType){
			$(this).prop('selected',true);
		}
	});
});
