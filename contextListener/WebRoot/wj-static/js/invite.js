$(function(){
	
	var setting = {
			elements : {
				inviteSubmitBtn : $('.bth'),
				entryCode : $('#entry-code'),
				shareBtn : $('.bthtow'),
				shareUrl : $('#share-url')
			},
			message : {
				urlShare : '已经成功复制到剪切板,如浏览器版本过低,请手动复制',
			}
	}	
	
	setting.elements.entryCode.on('blur',function(){
		ck.ck_entry();
	});
	
	setting.elements.inviteSubmitBtn.on('click',function(e){
		if(!ck.ck_entryNotNull() || !ck.ck_entry()){
			return;
		}
		$.ajax({
			type : 'post',
			url : 'myAccount/setInviteMe',
			data : {INVITE_ME:setting.elements.entryCode.val()},
			dayaType : 'json',
			success : function(r){
				if(r.msg=='success'){
					
					$('.bth').focus();
					tips($('.bth'),'设置成功！');
					//console.log("成功");
					setTimeout(function(){
						location.reload();
					},'1000');
				}else if(r.msg=='fail'){
					setting.elements.entryCode.focus();
					tips(setting.elements.entryCode,'输入的邀请码不存在！');
					//console.log("邀请码不存在");
				}else if(r.msg=='self'){
					setting.elements.entryCode.focus();
					tips(setting.elements.entryCode,'不能设置为自己');
				}else if(r.msg=='next'){
					setting.elements.entryCode.focus();
					tips(setting.elements.entryCode,'不能设置为自己的下级');
				}else{
					
					tips(setting.elements.inviteSubmitBtn,'网络异常，请稍后再试');
					//console.log("程序异常");
				}
			},
			error : function(){
				tips(setting.elements.inviteSubmitBtn,'网络异常，请稍后再试');
				//console.log("网络异常");
			}
		});
	});
	
	
	var ck = {
		ck_entry : function(){
			if(setting.elements.entryCode.val()=='88888'){
				tips(setting.elements.entryCode,'不能输入万能邀请码！');
				return false;
			}else if(setting.elements.entryCode.val().substr('0','1')=='V' || setting.elements.entryCode.val().substr('0','1')=='v'){
				tips(setting.elements.entryCode,'不能输入VIP邀请码！');
				return false;
			}
			return true;
		},
		
		ck_entryNotNull : function(){
			//console.log('entryCode:',setting.elements.entryCode.val());
			if(setting.elements.entryCode.val()=='' || setting.elements.entryCode.val()==undefined){
				tips(setting.elements.entryCode,'请输入邀请码！');
				return false;
			}
			return true;
		}
	}
	
	/* 点击复制分享 */
	setting.elements.shareBtn.zclip({
		path : 'wj-static/js/ZeroClipboard.swf',
		copy : setting.elements.shareUrl.text(),
		afterCopy : function(){
			tips(setting.elements.shareBtn,setting.message.urlShare);
		}
	});
	
	/*  提示标签  */
	function tips(element,message){
		//console.log(element,message)
		$(element).tips({
			side : 1,
			msg : message,
			bg : '#007bce',
			time : 2
		});
		
	}
	
	
			
	
});
function getInviteEarnings(curPage,showCount,username){
	//console.log(username);
	$.ajax({
		type : 'post',
		url : 'myAccount/earnings',
		data : {currentPage:curPage,showCount:showCount,FROM_USER:username},
		dataType : 'json',
		success : function(r){
			//console.log(r);
			if(r.msg=='success'){
				//console.log(r.eList);
				var htmls='';
				$.each(r.eList, function(key, val) {
					if(val.PROJECT_NAME && val.RATE && val.EARNINGS_AMOUNT && val.CREATE_DATE){
					var html='';
					html+='<tr>';
					html+='<td>'+val.PROJECT_NAME+'</td>';
					html+='<td>'+val.RATE+'</td>';
					html+='<td>'+val.EARNINGS_AMOUNT+'</td>';
					html+='<td>'+val.CREATE_DATE+'</td>';
					html+='</tr>';
					htmls+=html;
					}
				});
				$("#earnings-body").html(htmls);
				if(r.eList.size>10){
					$("#paginate").paginate({
					    count: r.page.totalPage,
					    start: r.page.currentPage,
					    display: r.page.showCount,
					    border: true,
					    onChange: function(page) {
					    	getInviteEarnings(page,10,username);
					    }
					});
				}
				
			}
		}
	});
}






