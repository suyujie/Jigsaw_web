$(document).ready(function(){
	languageTag = $('#languageTag',parent.document).val();
	usernameChecked = false;
	
	if(languageTag == 'en-US'){
		$("#password").attr('placeholder','Initial password is the same as the username!');
	}
});

$('input[name="username"]').change(function(){
	usernameChecked = false;
	var username = $.trim($(this).val());
	var span = $(this).parent().next();
	
	if(username == ""){
		span.html("username is required!");
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
	xmlHttp.open("get", "/robot_web/user/check_username?username=" + username + "&t=" + Math.random(),true);
	
	//设置回调函数
	xmlHttp.onreadystatechange = function () {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var responseText = $.trim(xmlHttp.responseText);
			if(responseText == "OK"){
				usernameChecked = true;
			}else{
				usernameChecked = false;
				
				if(languageTag == 'en-US'){
					responseText = 'User name already exists!';
				}
			}
			span.html(responseText);
		}
	};
	
	//发送请求
	xmlHttp.send();
});


$('button[type="submit"]').click(function(){
	if(!usernameChecked){
		$('input[name="username"]').focus();
		return false;
	}
	return true;
});