
jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag',parent.document).val();
});

function load(url){
	$("#ajax").load(url);
}

//阻止浏览器默认行为
var preventDefault = function(event){
	var e = event || window.event;
    if (e.preventDefault){
		e.preventDefault();
	}else{
		e.returnValue = false;
	}
};

//$(':submit#select').click(function(event){
//	var playerId = $.trim($('#playerId').val());
//	var nameInPlat = $.trim($('#nameInPlat').val());
//	
//	if(playerId=='' && nameInPlat==''){
//		if(languageTag == 'en-US'){
//			alert('Please fill out the retrieval condition!');
//		}else{
//			alert('请填写检索条件！');
//		}
//		
//		preventDefault(event);
//	}
//});

var allow = false;
function check(playerId){
	$.ajax({
		type : 'get',
		url : '/robot_web/blacklist/check',
		data : {playerId:playerId,t:Math.random()},
		dataType : 'text',
		success : function(data){
			if(data.trim() == "OK"){
				allow = true;
			}else{
				alert(data);
			}
		}
	});
	
	if(allow){
		add(playerId);
	}
}

function add(playerId){
	$.ajax({
		type : 'get',
		url : '/robot_web/blacklist/add',
		data : {playerId:playerId,t:Math.random()},
		dataType : 'text',
		success : function(data){
			allow = false;
			alert(data);
		}
	});
}