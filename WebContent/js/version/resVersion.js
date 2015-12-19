jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag', parent.document).val();
});

window.onload = searchInStorage;

//搜索云存储
function searchInStorage() {
	$(":checkbox[name='res']").each(function(){
		var checkboxObj = $(this);
		var fileName = checkboxObj.val();
		
		$.ajax({
			type : 'get',
			dataType : 'text',
			url : '/robot_web/version/search_in_storage?fileName='+fileName,
			success : function(data) {
				checkboxObj.parent().parent().parent().parent().children().last().text(data);
			}
		});
	});
}

function load(url) {
	$("#ajax").load(url);
}

//更新到云存储
function update2Storage() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/res_update_to_storage',
		success : function(data) {
			alert(data.storageMsg);
		}
	});
}

//通知逻辑服务器
function reflushVersion() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/reflushRes',
		success : function(data) {
			alert(data.nodeMsg);
		}
	});
}

//打包
function pack() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/pack?fileType=res',
		success : function(data) {
			alert(data.packMsg);
		}
	});
}

//下载勾选的文件
function downloadCheckedFiles() {
	var chk_value =false;    
	$(":checkbox[name='res']").each(function(){
		if($(this).is(':checked')){
			chk_value = true;
		}
	});
	
	if(chk_value==false){
		alert('你还没有选择任何内容！');
		return false;
	}
}

function checkAll(){
	var all = document.getElementById('all');
	
	if(all.checked){
		$(":checkbox[name='res']").each(function(){
			$(this).prop('checked',true);
			$(this).parent().attr("class","checked");
		});
	}else{
		$(":checkbox[name='res']").each(function(){
			$(this).removeAttr("checked");
			$(this).parent().attr('class','');
		});
	}
}