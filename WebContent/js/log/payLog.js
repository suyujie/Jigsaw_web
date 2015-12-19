
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$(window).load(function(){
//	var selectedCoinType = $("#selectedCoinType").val();
//	$("#coinType option").each(function(){
//		var val = $(this).val();
//		if(val==selectedCoinType){
//			$(this).prop('selected',true);
//		}
//	});
	
	var selectedCoinType = $("#selectedPayChannel").val();
	$("#payChannel option").each(function(){
		var val = $(this).val();
		if(val==selectedCoinType){
			$(this).prop('selected',true);
		}
	});
	
	var selectedStatus = $("#selectedStatus").val();
	$("#status option").each(function(){
		var val = $(this).val();
		if(val==selectedStatus){
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
//	var coinType = $('#coinType').val();
	var channel = $('#payChannel').val();
	var status = $('#status').val();
	
	if(playerId=='' && time=='' && channel=='' && status==''){
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