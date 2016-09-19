$(function(){
	var setting = {
			elements : {
				inviteSubmitBtn : $('.bth'),
				entryCode : $('#entry-code'),
				warning : $('.warning')
			},
			message : {
				urlShare : '已经成功复制到剪切板,如浏览器版本过低,请手动复制',
			}
	}
	
	$('.p53 dl,.p63 dl').click(function(){
		$(this).toggleClass('hover').siblings().removeClass('hover')
	})
	
	setting.elements.entryCode.on('blur',function(){
		ck.ck_entry();
	});
	setting.elements.inviteSubmitBtn.on('click',function(e){
		if(!ck.ck_entryNotNull() || !ck.ck_entry()){
			return;
		}
		$.ajax({
			type : 'post',
			url : 'mobile/personal/setInviteMe',
			data : {INVITE_ME:setting.elements.entryCode.val()},
			dayaType : 'json',
			success : function(r){
				if(r.msg=='success'){
					$('.bth').focus();
					//tips($('.bth'),'设置成功！');
					setting.elements.warning.text('保存成功！');
					console.log("成功");
					setTimeout(function(){
						location.reload();
					},'1000');
				}else if(r.msg=='fail'){
					setting.elements.entryCode.focus();
					//tips(setting.elements.entryCode,'输入的邀请码不存在！');
					setting.elements.warning.text('输入的邀请码不存在！');
					console.log("邀请码不存在");
				}else if(r.msg=='self'){
					setting.elements.entryCode.focus();
					//tips(setting.elements.entryCode,'不能设置为自己');
					setting.elements.warning.text('不能设置为自己');
				}else if(r.msg=='next'){
					setting.elements.entryCode.focus();
					//tips(setting.elements.entryCode,'不能设置为自己的下级');
					setting.elements.warning.text('不能设置为自己的下级');
				}else{
					//tips(setting.elements.inviteSubmitBtn,'网络异常，请稍后再试');
					setting.elements.warning.text('网络异常，请稍后再试');
					console.log("程序异常");
				}
			},
			error : function(){
				//tips(setting.elements.inviteSubmitBtn,'网络异常，请稍后再试');
				setting.elements.warning.text('网络不流畅，请稍后再试');
				console.log("网络异常");
			}
		});
	});
	
	
	var ck = {
		ck_entry : function(){
			if(setting.elements.entryCode.val()=='88888'){
				//tips(setting.elements.entryCode,'不能输入万能邀请码！');
				setting.elements.warning.html('请输入上级邀请码<br>万能邀请码请在投资时使用');
				return false;
			}else if(setting.elements.entryCode.val().substr('0','1')=='V' || setting.elements.entryCode.val().substr('0','1')=='v'){
				//tips(setting.elements.entryCode,'不能输入VIP邀请码！');
				setting.elements.warning.text('不能输入VIP邀请码！');
				return false;
			}
			return true;
		},
		
		ck_entryNotNull : function(){
			
			if(setting.elements.entryCode.val()=='' || setting.elements.entryCode.val()==undefined){
				//tips(setting.elements.entryCode,'请输入邀请码！');
				setting.elements.warning.text('请输入邀请码！');
				return false;
			}
			return true;
		}
	}
	
	
	
	/*  提示标签  */
	/*function tips(element,message){
		//console.log(element,message)
		$(element).tips({
			side : 1,
			msg : message,
			bg : '#007bce',
			time : 2
		});
	}*/
});
