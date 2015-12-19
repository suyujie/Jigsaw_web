
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$(window).load(function(){
	var selectedChangeType = $("#selectedChangeType").val();
	
	$("#changeType option").each(function(){
		var val = $(this).val();
		if(val==selectedChangeType){
			$(this).prop('selected',true);
		}
	});
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

$(':submit#select').click(function(){
	var playerId = $.trim($('#playerId').val());
	var time = $('#time').val();
	var changeType = $('#changeType').val();
	
	if(playerId=='' && time=='' && changeType==''){
		if(languageTag == 'en-US'){
			alert('Please fill out the retrieval condition!');
		}else{
			alert('请填写检索条件！');
		}
		
		return false;
	}else{
		return true;
	}
});