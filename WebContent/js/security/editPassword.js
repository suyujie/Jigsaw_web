
$(document).ready(function(){
	languageTag = $('#languageTag',parent.document).val();
	password=$('input[name="password"]').val();
	$('input[name="oldpassword"]').focus();
	oldpwdChecked = false;
	newpwdChecked = false;
	repwdChecked = false;
});

$('input[name="oldpassword"]').change(function(){
	var oldpassword = $(this).val();
	
	if(oldpassword != password){
		var tip = '原密码输入错误！';
		if(languageTag == 'en-US'){
			tip = 'The original password input error!';
		}
		
		$(this).parent().next().children('span').html(tip);
		$(this).parent().next().children('span').focus();
		oldpwdChecked = false;
		return false;
	}else{
		$(this).parent().next().children('span').html('OK');
		oldpwdChecked = true;
		return true;
	}
});

$('input[name="newpassword"]').change(function(){
	var newpassword = $(this).val();
	
	if(newpassword == password){
		var tip = '新密码不能和原密码相同！';
		if(languageTag == 'en-US'){
			tip = 'The old and the new password cannot be the same!';
		}
		
		$(this).parent().next().children('span').html(tip);
		$(this).parent().next().children('span').focus();
		newpwdChecked = false;
		return false;
	}else{
		$(this).parent().next().children('span').html('*');
		newpwdChecked = true;
		return true;
	}
});

$('input[name="repassword"]').change(function(){
	var newpassword = $('input[name="newpassword"]').val();
	var repassword = $(this).val();
	
	if(repassword != newpassword){
		var tip = '确认密码与新密码不一致！';
		if(languageTag == 'en-US'){
			tip = 'The new password and confirming password disagree!';
		}
		
		$(this).parent().next().children('span').html(tip);
		$(this).parent().next().children('span').focus();
		repwdChecked = false;
		return false;
	}else{
		$(this).parent().next().children('span').html('OK');
		repwdChecked = true;
		return true;
	}
});

$('button:submit').click(function(){
	if(!oldpwdChecked){
		$('input[name="oldpassword"]').focus();
		return false;
	}
	if(!newpwdChecked){
		$('input[name="newpassword"]').focus();
		return false;
	}
	if(!repwdChecked){
		$('input[name="repassword"]').focus();
		return false;
	}
	return true;
});

