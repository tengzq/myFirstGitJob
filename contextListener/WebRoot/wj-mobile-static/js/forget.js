$(function(){
	
	changeCode();
	$("#imgCode").bind("click", changeCode);
	
	function changeCode() {
		$("#imgCode").attr("src", "code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	
	
	$('#mobile').on('blur',function(){
		console.log('mobile blur');
		checkMobile();
	});
	
	$('.smsbtn').one('click',function(){
		sendSmsEntry();
	});
	
	$('#subbtn').one('click',function(){
		goEditpsw();
	});
	
	function checkMobile(){
		var boolen;
		var $phone = $('#mobile');
		var phone = $.trim($phone.val());
		if(!/^1[3456789]\d{9}$/.test(phone)){
			tips(1,$phone,'手机号格式有误');
			return false;
		}
		if(/^1[3456789]\d{9}$/.test(phone))	{
			$.ajax({
				url:'register/textTel',
				type:'post',
				async:false,
				data:{TEL:phone},
				dataType:'json',
				success:function(data){
					if(data.msg==false){
						boolen=true;
					}else{
						tips(1,$phone,'手机号格式有误');
						boolen=false;
					}
				}
			});
			return boolen;
		}
	}
	
	function sendSmsEntry(){
		if($('#imgVercode').val() == null || $('#imgVercode').val() == ''){
			tips(1,$('#imgVercode'),'请输入图片验证码');
			$('.smsbtn').one('click',function(){
				sendSmsEntry();
			});
			return;
		}
		//var $this = $(this);
		$('.smsbtn').val('正在发送').css('background','#909090');
		if(!checkMobile()){
			$('.smsbtn').val('获取验证码').css('background','#ff6264');
			$('.smsbtn').one('click',function(){
				sendSmsEntry();
			});
			return;
		}
		sendPhoneVerfiyCode();
	}
	
	function  sendPhoneVerfiyCode(){ 
		
		var phone = $.trim($('#mobile').val());
		$.ajax({
			type : 'post',
			url : 'sms/send',
			dataType : 'json',
			data : {
				mobile : phone,
				type : '2',
				sec : $('#imgVercode').val()
			},
			success :function(r){
				if(r.msg==='success'){
					try{console.log('发送成功');}catch(e){}
					interv=setInterval(setTimeCountDown,1000);
				}else if(r.msg == 'img'){
					tips(1,$('#imgVercode'),'图片验证码输入有误');
				}else{
					$('.smsbtn').val('获取验证码').css('background','#ff6264');
					$('.smsbtn').one('click',function(){
						sendSmsEntry();
					});
					try{console.log('成功返回，但发送失败');}catch(e){}
					
				}
			},
			error : function(){
				$('.smsbtn').val('获取验证码').css('background','#ff6264');
				$('.smsbtn').one('click',function(){
					sendSmsEntry();
				});
				try{console.log('http请求失败')}catch(e){};
				
			}
		});
	}
	
	var interv;
	var count = 60;
	function setTimeCountDown(){
		if($('.smsbtn').val()=='0秒后重新发送'){
			clearInterval(interv);
			count=60
			$('.smsbtn').val('获取验证码').css('background','#ff6264');
			$('.smsbtn').one('click',function(){
				sendSmsEntry();
			});
		}else{
			count--;
			$('.smsbtn').val(count+'秒后重新发送').css('background','#909090');
		}
	}
	
	function goEditpsw(){
		if (!checkMobile()) {
			$('#subbtn').one('click',function(){
				goEditpsw();
			});
			return;
		}
		$('#subbtn').val('正在验证').css('background','#909090');
		$.post("mobile/retrievev",{TEL:$.trim($('#mobile').val()),CAPTCHA:$.trim($('#vercode').val())},function(data){
			
			 if(data.msg=='captchaDead'){
				try{console.log('验证码超时');}catch(e){};
				$('#subbtn').val('提交').css('background','#FDD228');
				$('#subbtn').one('click',function(){
					goEditpsw();
				});
				 swal("失败", "验证码超时", "error");
				}else if(data.msg=='captcha'){
					try{console.log('验证码错误');}catch(e){};
					$('#subbtn').val('提交').css('background','#FDD228');
					$('#subbtn').one('click',function(){
						goEditpsw();
					});
					swal("失败", "验证码错误", "error");
				}else if(data.msg==false){
					try{console.log('无此用户')}catch(e){};
					$('#subbtn').val('提交').css('background','#FDD228');
					$('#subbtn').one('click',function(){
						goEditpsw();
					});
					swal("失败", "无此用户", "error");
				}else{
					location.href = 'mobile/retrieve';
				}
		},"json");
	}
	
	
	function tips(posi,element,message){
		$(element).tips({
			side : posi,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}
	
});