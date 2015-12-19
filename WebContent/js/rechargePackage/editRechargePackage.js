
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
	$('#redo').hide();
	$('#uploadDiv').hide();
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
				checkboxObj.parent().parent().parent().next().removeAttr("readonly");
				checkboxObj.parent().parent().parent().next().attr("required", "required");
				checkboxObj.parent().parent().parent().next().attr("value",value);
				checkboxObj.parent().parent().parent().next().attr("defaultvalue",value);
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
				checkboxObj.parent().parent().parent().next().removeAttr("readonly");
				checkboxObj.parent().parent().parent().next().attr("required", "required");
				checkboxObj.parent().parent().parent().next().attr("value",value);
				checkboxObj.parent().parent().parent().next().attr("defaultvalue",value);
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
				checkboxObj.parent().parent().parent().next().removeAttr("readonly");
				checkboxObj.parent().parent().parent().next().attr("required", "required");
				checkboxObj.parent().parent().parent().next().attr("value",value);
				checkboxObj.parent().parent().parent().next().attr("defaultvalue",value);
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
				checkboxObj.parent().parent().parent().next().removeAttr("readonly");
				checkboxObj.parent().parent().parent().next().attr("required", "required");
				checkboxObj.parent().parent().parent().next().attr("value",value);
				checkboxObj.parent().parent().parent().next().attr("defaultvalue",value);
			}
		});
	});
});

$(":checkbox").change(function(){
	if($(this).is(":checked")){
		$(this).parent().parent().parent().next().removeAttr("readonly");
		$(this).parent().parent().parent().next().attr("required", "required");
		var defaultValue = $(this).parent().parent().parent().next().attr("defaultvalue");
		$(this).parent().parent().parent().next().attr("value",defaultValue);
	}else{
		$(this).parent().parent().parent().next().attr("readonly", "readonly");
		$(this).parent().parent().parent().next().removeAttr("required");
		$(this).parent().parent().parent().next().attr("value", "");
	}
});

$('#delPic').click(function(){
	$('#oldPic').hide();
	$('#redo').show();
	$('#uploadDiv').show();
	$('#picUrl').attr("required", "required");
	$('#oldPicUrl').attr('value','');
});

$('#undoDelPic').click(function(){
	$('#oldPic').show();
	$('#redo').hide();
	
	var defaultValue = $('#oldPicUrl').attr('defaultvalue');
	$('#oldPicUrl').attr('value',defaultValue);
	$('#uploadDiv').hide();
	$('#picUrl').removeAttr("required");
});







