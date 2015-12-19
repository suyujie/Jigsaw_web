window.onload = function(){
	defaultHeight=document.documentElement.offsetHeight;
};

jQuery(document).ready(function() {
	App.init(); // initlayout and core plugins
	setInterval("setIframeHeight()",100);
});

function setIframeHeight(){
	var iframeObj = document.getElementById("main_iframe");
	
	var newHeight=(iframeObj.Document?iframeObj.Document.body.scrollHeight:iframeObj.contentDocument.body.offsetHeight)+30;
	iframeObj.height = defaultHeight>newHeight?defaultHeight:newHeight;
}

function go(url) {
	document.getElementById("main_iframe").src = url;
}

function date(){
	var date=new Date();
	var hh = date.getHours();
	var mm = date.getMinutes();
	var ss = date.getSeconds();
	if(hh < 10){
		hh = "0" + hh;
	}
	if(mm < 10){
		mm = "0" + mm;
	}
	if(ss < 10){
		ss = "0" + ss;
	}
	var result=date.getFullYear() + "-" + (date.getMonth()+1) + "-" + date.getDate() + " " + hh + ":" + mm + ":" + ss;
	document.getElementById("systemDate").innerHTML=result;
}

setInterval("date()", 1000);