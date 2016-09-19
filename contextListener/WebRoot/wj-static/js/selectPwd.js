$(function() {
	var unavailableIds = [];
	var setting = {
		elements:{
			user_id: $('#USER_ID'),
			password: $('#password'),
			passwordRepeat: $('#passwordRepeat'),
			phone: $('#mobile'),
			phoneVerfiyCode: $('#phoneVerfiyCode'),
			sendPhoneBtn: $('.send-sms'),
			sendPhoneBtnText: $('.send-text'),
			sendCountdownText: $('.countdown-text'),
			countdown: $('.countdown'),
			submit: $('#to-recover'),
			main2:$('#main2'),
			main:$('.main').eq(1),
			reSave:$('.reSave'),
			to_reset:$('.to_reset')
		},
		styles:{
			parent: 'li',
			errorTips: '.err-area',
			ok:'ok', 
			error: 'err',
			waiting: 'send-waitting',
			loading: 'loading'
		},
		messages:{
			passwordLength: '请输入8位或以上的密码',
			passwordSpace: '密码不能包含空格',
			passwordRepeat: '两次密码输入不一致',
			phoneFormat: '手机号输入错误',
			phoneUnavailable:'手机号未注册', 
			phoneVerfiyCodeFormat: '短信验证码格式错误',
			phoneVerfiyCodeError: '错误的注册手机验证码',
			phoneVerfiyCodeDisabled:'验证码失效，请重新获取！',
			sendAgain: '重新发送',
			keyError: '获取key失败，请重试！',
			netError: '网络错误，请重试！'
		},
		custom: {
			debug: false,
			check: ['password','passwordRepeat','phone','phoneVerfiyCode'],
			platformCode: 1, //PC:1 WAP:2
			regCallBackUrl: ''
		}
	}
	
	changeCode();
	$("#codeImg").bind("click", changeCode);
	
	function changeCode() {
		$("#codeImg").attr("src", "code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	
	$.each(setting.custom.check, function(index, ele) {
		setting.elements[ele].on('blur',function(e) {
			//console.log(ele);
			ck.methodName(ele);
		});
		setting.elements[ele].on('focus',function(e) {
			var $this = $(this);
			clearVaild($this);
		});
	});
	setting.elements.sendPhoneBtn.one('click', function(e) {
		//console.log('sms点击事件触发');
		e.preventDefault();
		sendSmsEntry();
	});
	
	function sendSmsEntry(){
		if($('#imgVerfiyCode').val() == null || $('#imgVerfiyCode').val() == ''){
			handleResult(false,$('#imgVerfiyCode'),"请输入图片验证码");
			setting.elements.sendPhoneBtn.one('click', function(e) {
				sendSmsEntry();
			});
			return;
		}
		var $this = $(this);
		if($this.hasClass(setting.styles.waiting)){
			return;
		}
		if(!ck.ck_phone(setting.elements.phone.val())){
			setting.elements.sendPhoneBtn.one('click', function(e) {
				sendSmsEntry();
			});
			return;
		}
		sendPhoneVerfiyCode();
	}
	
	
	function  sendPhoneVerfiyCode(){ 
		
		var phone = $.trim(setting.elements.phone.val());
		interv=setInterval(setTimeCountDown,1000);
		setting.elements.sendPhoneBtnText.hide();
		setting.elements.sendCountdownText.show();
		$('.send-sms').addClass('sms-waiting');
		//Passport.register_send_mobile_code(phone).then(function(d){
		//Passport.register_send_mobile_code(phone,'1').then(function(d){
			//countdown.start(60000, true);
		$.ajax({
			type : 'post',
			url : 'sms/send',
			dataType : 'json',
			data : {
				mobile : phone,
				type : '2',
				sec : $('#imgVerfiyCode').val()
			},
			success :function(r){
				if(r.msg==='success'){
					//console.log('发送成功');
					setting.elements.sendPhoneBtn.addClass(setting.styles.waiting);
					/*setting.elements.sendPhoneBtnText.hide();
					setting.elements.sendCountdownText.show();*/
					clearVaild(setting.elements.phoneVerfiyCode);
					//interv=setInterval(setTimeCountDown,1000);
				}else if(r.msg == 'img'){
					handleResult(false,$('#imgVerfiyCode'),"图片验证码输入有误");
					setting.elements.sendPhoneBtn.one('click', function(e) {
						sendSmsEntry();
					});
				}else{
					setting.elements.sendPhoneBtn.one('click', function(e) {
						sendSmsEntry();
					});
					//console.log('成功返回，但发送失败');
					handleResult(false,setting.elements.sendPhoneBtn,setting.messages.keyError);
				}
			},
			error : function(){
				setting.elements.sendPhoneBtn.one('click', function(e) {
					sendSmsEntry();
				});
				//console.log('http请求失败');
				handleResult(false,setting.elements.sendPhoneBtn,setting.messages.netError);
			}
		});
	}
	var interv;
	var count = 60;
	function setTimeCountDown(){
		if($('.countdown').text()==0){
			$('.send-sms').removeClass('sms-waiting');
			setting.elements.sendPhoneBtn.removeClass(setting.styles.waiting);
			setting.elements.sendPhoneBtnText.show();
			setting.elements.sendCountdownText.hide();
			clearInterval(interv);
			count=60
			$('.countdown').text(count);
			setting.elements.sendPhoneBtn.one('click', function(e) {
				sendSmsEntry();
			});
		}else{
			count--;
			$('.countdown').text(count);
		}
		/*setTimeout(function(){
			//console.log('setTimeout');
			setTimeCountDown()
		},1000);*/
	}
	setting.elements.submit.one('click',function (e){
		goEditpsw();
	});
	
	function goEditpsw(){
		if (!ck.ck_phone()||!ck.ck_phoneVerfiyCode()) {
			setting.elements.submit.one('click',function (e){
				goEditpsw();
			});
			return;
		}
		$(setting.elements.submit).addClass(setting.styles.loading);
		$.post("register/phoneCodeTest",{TEL:$.trim(setting.elements.phone.val()),CAPTCHA:$.trim(setting.elements.phoneVerfiyCode.val())},function(data){
			//console.log('前台输入的验证码为：'+setting.elements.phoneVerfiyCode.val());
			 if(data.msg=='captchaDead'){
				//console.log('验证码超时');
				$(setting.elements.submit).removeClass(setting.styles.loading);
				setting.elements.submit.one('click',function (e){
						goEditpsw();
				});
				 swal("失败", "验证码超时", "error");
				}else if(data.msg=='captcha'){
					//console.log('验证码错误');
					$(setting.elements.submit).removeClass(setting.styles.loading);
					setting.elements.submit.one('click',function (e){
						goEditpsw();
					});
					swal("失败", "验证码错误", "error");
				}else if(data.msg==false){
					//console.log('无此用户');
					$(setting.elements.submit).removeClass(setting.styles.loading);
					setting.elements.submit.one('click',function (e){
						goEditpsw();
					});
					swal("失败", "无此用户", "error");
				}else{
					$(setting.elements.main).css('display','none');
					$(setting.elements.main2).css('display','block');
					setting.elements.user_id.val(data.msg.USER_ID);
				}
		},"json");
	}
	
	setting.elements.reSave.one('click', function(e) {
		modifyPsw();
	});
	
	function modifyPsw(){
		if (setting.elements.reSave.hasClass(setting.styles.loading)) {
			return false;
		}
		if ($.inArray('passwordRepeat',setting.custom.check)===-1) {
			if (!ck.ck_password()) {
				setting.elements.reSave.one('click', function(e) {
					modifyPsw();
				});
				return false;
			}
		}else{
			if (!ck.ck_password()||!ck.ck_passwordRepeat()) {
				setting.elements.reSave.one('click', function(e) {
					modifyPsw();
				});
				return false;
			}
		}
		$(setting.elements.reSave).addClass(setting.styles.loading);
		setting.elements.to_reset.css('display','none');
		$.post("register/resetPassWord",{USER_ID:$.trim(setting.elements.user_id.val()),PASSWORD:setting.elements.password.val()},function(data){
			if(data.msg=='success'){
				swal({
					title : "改密成功",
					type : "success",
					showCancelButton : true,
					confirmButtonColor : "#2e9dd0",
					confirmButtonText : "登入",
					cancelButtonText : "首页",
					closeOnConfirm : false,
					closeOnCancel : false
				},
				function(isConfirm) {
					if (isConfirm) {
						window.location.href=getRootPath()+"/login_toZfLogin";
					} else {
						window.location.href="";
					}
				})
					
			}else if(data.msg=='fail'){
				swal("失败", "网络异常，请稍后再试", "error");
				$(setting.elements.reSave).removeClass(setting.styles.loading);
				window.location.href=getRootPath()+"/login_selectZfPwd";
			}else if(data,msg == false){
				swal("失败", "抱歉无此用户", "error");
				$(setting.elements.reSave).removeClass(setting.styles.loading);
				window.location.href=getRootPath()+"/login_selectZfPwd";
			}
		},"json");
	}
	
	var ck ={
		methodName:function(method){
			this['ck_'+method]();
		},
		
		ck_password:function(){
			var $password = setting.elements.password;
			var password2 = setting.elements.passwordRepeat.length===0? setting.elements.passwordRepeat.val():'';
			var password1 = $password.val();
			if(password1.length >= 8){
				if (/\s/g.test(password1)) {
					handleResult(false,$password,setting.messages.passwordSpace);
					return false;
				}else{
					handleResult(true,$password);
					if (password2 && password2.length!==0) {
						this.ck_passwordRepeat();
					}
					return true;
				}
			} else {
				handleResult(false,$password,setting.messages.passwordLength);
				return false;
			}
		},

		ck_passwordRepeat: function(){
			var password1 = setting.elements.password.val();
			var password2 = setting.elements.passwordRepeat.val();
			var $password2 = setting.elements.passwordRepeat;
			if(password2.length!==0 && password2 === password1){
				handleResult(true,$password2);
				return true;
			} else {
				handleResult(false,$password2,setting.messages.passwordRepeat);
				return false;
			}
		},

		ck_phone: function() {
			var boolen;
			var $phone = setting.elements.phone;
			var phone = $.trim($phone.val());
			if(!/^1[358]\d{9}$/.test(phone)){
				handleResult(false,$phone,setting.messages.phoneFormat);
				return false;
			}
			if(/^1[358]\d{9}$/.test(phone))	{
				$.ajax({
					url:'register/textTel',
					type:'post',
					async:false,
					data:{TEL:$.trim(setting.elements.phone.val())},
					dataType:'json',
					success:function(data){
						if(data.msg==false){
							boolen=true;
						}else{
							handleResult(false,$phone,setting.messages.phoneUnavailable);
							boolen=false;
						}
					}
				});
				return boolen;
			}
			
		},
		ck_phoneVerfiyCode : function() {
			var $phoneVerfiyCode = setting.elements.phoneVerfiyCode;
			var phone = $.trim($phoneVerfiyCode.val());
			if(phone==''){
				return false;
			}
			if(/^\d{4}$/.test(phone)){
				handleResult(true,$phoneVerfiyCode);
				return true;
			}	else {
				handleResult(false,$phoneVerfiyCode,setting.messages.phoneVerfiyCodeFormat);
				return false;
			}
		}
	};


	function handleResult(result,element,message){
		if (result) {
			$(element).next(setting.styles.errorTips).find("em").hide();
		}else{
			$(element).show();
			tips(element.parent(),message);
			/*$(element).next(setting.styles.errorTips).find("em").text(message);*/
		}
	}
	function resetSubmintBtn(){
		var btn = setting.elements.submit;
		btn.removeClass(setting.styles.loading).text(setting.messages.reg);
	}
	function clearVaild(element){
		getErrorElement(element).html('&nbsp;');
		getParentElement(element).removeClass(setting.styles.ok+' '+setting.styles.error);
	}
	function getErrorElement (selector){
		return $(selector).siblings(setting.styles.errorTips).find('em');
	}
	function getParentElement(selector){
		return $(selector).parent(setting.styles.parent);
	}
	
	
	function verfiyPhone(data){
		var encrypt_code = data;
		var name = $.trim(setting.elements.username.val());
		var password = $.trim(setting.elements.password.val());
		var phone = $.trim(setting.elements.phone.val());
		var code =  $.trim(setting.elements.phoneVerfiyCode.val());
		Passport.register_check_mobile_code(phone,code).done(function(d){
			reg(name, password, phone, encrypt_code);
		}).fail(function(err){
			handleResult(false,setting.elements.phoneVerfiyCode,err.msg||setting.messages.phoneVerfiyCodeError);
			resetSubmintBtn();
		});
	}


	function  bindCountdown(){
		$(countdown).on('countdownProcess', function(e, d){
			setting.elements.countdown.text(countdownFmt(d).s);
		}).on('countdownFinished', function(){
			setting.elements.sendCountdownText.hide();
			setting.elements.sendPhoneBtnText.show();
			setting.elements.sendPhoneBtn.removeClass(setting.styles.waiting);
		});
	}
	
	function tips(element,message){
		$(element).tips({
			side : 2,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}

});

function bindElement(){
	var self = this;
	
	$.extend(setting,config);
	if (setting.custom.debug) {
		//console.log(setting);
	}

}
function init(){
	//setting.custom.regCallBackUrl = url;
	//bindElement();
	bindCountdown();
}



