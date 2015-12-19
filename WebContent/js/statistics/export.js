
jQuery(document).ready(function() {
	languageTag = $('#languageTag',parent.document).val();
});

$('#export').click(function(){
	var xmlHttp;
	if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
		xmlHttp=new XMLHttpRequest();
	}else{// code for IE6, IE5
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xmlHttp.open("get", $('#export').attr("value"),true);
	xmlHttp.onreadystatechange = function () {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var responseText = $.trim(xmlHttp.responseText);
			if(responseText == 0){
				if(languageTag == 'en-US'){
					alert("Export success!");
				}else{
					alert("文件导出成功！");
				}
			}else{
				if(languageTag == 'en-US'){
					alert("Export failed!");
				}else{
					alert('文件导出失败！');
				}
			}
		}
	};
	xmlHttp.send();
});


