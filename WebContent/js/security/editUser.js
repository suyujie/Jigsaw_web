$(document).ready(function(){
	oldRoleChecked();
});

function oldRoleChecked(){
	var roles = document.getElementsByName("role");
	var oldRoles = $("#oldRoles").val().split(",");
	
	for(var i=0;i<oldRoles.length;i++){
		for(var j=0;j<roles.length;j++){
			if(oldRoles[i]==$(roles[j]).val()){
				roles[j].checked = true;
			}
		}
	}
}