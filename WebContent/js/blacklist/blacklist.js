jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	allowed = false;
});

function load(url){
	$("#ajax").load(url);
}

$('input[name="playerId"]').change(function(){
	allowed = false;
	var playerId = $.trim($(this).val());
	var span = $(this).next();
	
	if(playerId == ""){
		span.html("playerId is required!");
		return false;
	}
	
	//创建XMLHttpRequest对象
	var xmlHttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlHttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	//配置XMLHttpRequest对象
	xmlHttp.open("get", "/robot_web/blacklist/check?playerId=" + playerId + "&t=" + Math.random(),true);
	
	//设置回调函数
	xmlHttp.onreadystatechange = function () {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var responseText = $.trim(xmlHttp.responseText);
			if(responseText == "OK"){
				allowed = true;
			}else{
				allowed = false;
			}
			span.html(responseText);
		}
	};
	
	//发送请求
	xmlHttp.send();
});


$('button[type="submit"]').click(function(){
	if(!allowed){
		$('input[name="playerId"]').focus();
		return false;
	}
	return true;
});

function reflushBlacklist() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/reflushBlacklist',
		success : function(data) {
			alert(data.nodeMsg);
		}
	});
}

