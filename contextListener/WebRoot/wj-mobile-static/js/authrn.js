$(function(){
	var ckCnIdCard = (function(){
		var w = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2],
			m = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];
		return function(s){
			if(!/^\d{17}[\d|x]$/i.test(s)){
				return;
			}
			var r = 0;
			for(var i = 0, l = 17; i < l; i++){
				r += parseInt(s[i], 10) * w[i];
			}
			if(s[17].toLowerCase() === m[r%11].toLowerCase()){
				return true;
			}
			return false;
		};
	})();
	
	
	var elements = {
		realname : $('#realname'),
		idno : $('#idno'),
		saveBtn : $('#subbtn'),
		fakeBtn : $('#fakeBtn')
	}
		
	function ckRealName(){
		var name = $.trim(elements.realname.val());
		if (name.length<0 || name.length>30) {
			tips(1,elements.realname,'姓名格式错误');
			return false;
		}else if(/^[\u2E80-\u9FFF]+$/.test(name)){
			return true;
		}else{
			tips(1,elements.realname,'请输入与身份证一致的姓名');
			return false;
		}
	}
	
	/* elements.realname.on('blur', function(){
		ckRealName();
	}); */
	var idresult = false;
	
	function ckIdcardno(){
		if( ckCnIdCard($.trim(elements.idno.val())) ) {
			$.ajax({
				type : 'post',
				url : 'myAccount/checkIdNo',
				data : {
					IDENTITY : elements.idno.val()
				},
				async : false,
				dataType : 'json',
				success : function(r){
					console.log(r.msg);
					if(r.msg=='exsit'){
						swal({   
							title: "身份证已被认证", 
							type : 'error',  
							text: '如有疑问，请致电400电话',   
							confirmButtonText : "知道了"
						},function(isConfirm){
							if(isConfirm){
								idresult = false;	
							}
						});
					}else if(r.msg=='notexsit'){
						idresult = true;
					}else{
						swal({   
							title: "网络出现问题", 
							type : 'error',  
							text: '请稍候尝试',   
							confirmButtonText : "知道了"
						});
						idresult = false;
					}
				}
			});
			
		} else {
			//idcardnoValidEm.showValid(false, '二代身份证号码错误');
			tips(1,elements.idno,'二代身份证号错误');
			idresult = false;
		}
	}
	/* elements.idno.on('blur', function(){
		ckIdcardno();
	}); */
	
	
	elements.saveBtn.one('click', function(e){
		console.log('click');
		doAuth();
	});
	
	function doAuth(){
		elements.saveBtn.hide();
		elements.fakeBtn.show();
		ckIdcardno();
		if(!ckRealName() || !idresult){
			elements.fakeBtn.hide();
			elements.saveBtn.show();
			elements.saveBtn.one('click', function(e){
				doAuth();
			});
			return;
		}
		$.ajax({
			type : 'post',
			url : 'myAccount/submitRealname',
			dataType : 'json',
			data : {
				REAL_NAME : elements.realname.val(),
				IDENTITY : elements.idno.val()
			},
		})
		.done(function(r){
			console.log('提交成功');
			if(r.msg=='success'){
				console.log('success');
				swal({   
					title: "提交成功！",   
					text: "2 秒后自动返回个人中心",   
					timer: 2000,   
					showConfirmButton: false 
				},function(isConfirm){
					console.log('swal callback');
					top.location.href='mobile/personal/info';
				});
			}else if(r.msg=='nolog'){
				top.location.href="mobile/login?callback=mobile/personal/info"
			}else if(r.msg=='fail'){
				elements.saveBtn.one('click', function(e){
					doAuth();
				});
				
				swal({   
					title: '提交失败！',   
					text: '<span style="color:red">网络出现问题，请稍后再试！<span>',   
					html: true ,
					confirmButtonText : "知道了"
				});
				elements.fakeBtn.hide();
				elements.saveBtn.show();
			}
		})
		.fail(function(r){
			console.log(r);
			console.log('提交失败');
			elements.saveBtn.one('click', function(e){
				doAuth();
			});
			
			swal({   
					title: '提交失败！',   
					text: '<span style="color:red">网络出现问题，请稍后再试！<span>',   
					html: true ,
					confirmButtonText : "知道了"
				});
			elements.fakeBtn.hide();
			elements.saveBtn.show();
		});
	}
	
	
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
});