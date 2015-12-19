
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#redo').hide();
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

$('#delPic').click(function(){
	$('#oldPic').hide();
	$('#redo').show();
	$('#oldPicUrl').attr('value','');
});

$('#undoDelPic').click(function(){
	$('#oldPic').show();
	$('#redo').hide();
	var defaultValue = $('#oldPicUrl').attr('defaultvalue');
	$('#oldPicUrl').attr('value',defaultValue);
});