
jQuery(document).ready(function() {
	App.init();
    TableManaged.init();
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