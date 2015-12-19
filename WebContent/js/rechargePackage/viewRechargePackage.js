
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

$(window).load(function(){
	var namesJsonStr = $('#namesJson').val();
	var namesJson = eval('(' + namesJsonStr + ')');
	$(":checkbox[name='name']").each(function(){
		var checkboxObj = $(this);
		var val = checkboxObj.val();
		$.each(namesJson,function(key,value) {
			if(val == key){
				checkboxObj.prop('checked',true);
				checkboxObj.parent().attr("class","checked");
				checkboxObj.prop('disabled',true);
				checkboxObj.parent().parent().parent().next().attr("value",value);
			}
		});
	});
	
	
	var itemsJsonStr = $('#itemsJson').val();
	var itemsJson = eval('(' + itemsJsonStr + ')');
	$(":checkbox[name='item']").each(function(){
		var checkboxObj = $(this);
		var val = checkboxObj.val();
		$.each(itemsJson,function(key,value) {
			if(val == key){
				checkboxObj.prop('checked',true);
				checkboxObj.parent().attr("class","checked");
				checkboxObj.prop('disabled',true);
				checkboxObj.parent().parent().parent().next().attr("value",value);
			}
		});
	});
	
	
	var pricesJsonStr = $('#pricesJson').val();
	var pricesJson = eval('(' + pricesJsonStr + ')');
	$(":checkbox[name='price']").each(function(){
		var checkboxObj = $(this);
		var val = checkboxObj.val();
		$.each(pricesJson,function(key,value) {
			if(val == key){
				checkboxObj.prop('checked',true);
				checkboxObj.parent().attr("class","checked");
				checkboxObj.prop('disabled',true);
				checkboxObj.parent().parent().parent().next().attr("value",value);
			}
		});
	});
	
	
	var descriptionsJsonStr = $('#descriptionsJson').val();
	var descriptionsJson = eval('(' + descriptionsJsonStr + ')');
	$(":checkbox[name='description']").each(function(){
		var checkboxObj = $(this);
		var val = checkboxObj.val();
		$.each(descriptionsJson,function(key,value) {
			if(val == key){
				checkboxObj.prop('checked',true);
				checkboxObj.parent().attr("class","checked");
				checkboxObj.prop('disabled',true);
				checkboxObj.parent().parent().parent().next().attr("value",value);
			}
		});
	});
});






