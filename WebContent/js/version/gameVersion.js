jQuery(document).ready(function() {
	App.init();
	TableAdvanced.init();
	languageTag = $('#languageTag', parent.document).val();

	defaultGameVersion = $("#gameVersion").attr("defaultvalue");
	defaultNewVersionUrl = $("#newVersionUrl").attr("defaultvalue");
});

$("#btn1").click(function() {
	$("#btn1").attr("type", "hidden");
	$("#btn2").attr("type", "submit");
	$("#btn3").attr("type", "button");

	$("#gameVersion").removeAttr("readonly");
	$("#newVersionUrl").removeAttr("readonly");
});

$("#btn3").click(function() {
	$("#btn1").attr("type", "button");
	$("#btn2").attr("type", "hidden");
	$("#btn3").attr("type", "hidden");

	$("#gameVersion").val(defaultGameVersion);
	$("#newVersionUrl").val(defaultNewVersionUrl);
	$("#gameVersion").attr("readonly", "readonly");
	$("#newVersionUrl").attr("readonly", "readonly");
});

function reflushVersion() {
	$.ajax({
		type : 'get',
		dataType : 'json',
		url : '/robot_web/node/reflushGameVersion',
		success : function(data) {
			alert(data.nodeMsg);
		}
	});
}
