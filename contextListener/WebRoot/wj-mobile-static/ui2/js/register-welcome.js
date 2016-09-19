$(function() {
	var unavailableIds = [];
	var setting = {
		elements:{
			form: $('#regForm'),
			username: $('#username'),
			password: $('#password'),
			passwordRepeat: $('#passwordRepeat'),
			phone: $('#mobile'),
			phoneVerfiyCode: $('#phoneVerfiyCode'),
			sendPhoneBtn: $('.phone-code-btn'),
			submit: $('#subBtn'),
			sending : $('#sending'),
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
			nameUnavailable: '抱歉，用户名已被占用',
			nameLength: '用户名需为4-16位英文/数字',
			nameBegin: '用户名只能字母开头',
			emailFormat: '邮箱格式错误',
			passwordLength: '请输入8位或以上的密码',
			passwordSpace: '密码不能包含空格',
			passwordRepeat: '两次密码输入不一致',
			phoneFormat: '手机号输入错误',
			phoneUnavailable: '手机号已注册',
			phoneVerfiyCodeFormat: '短信验证码格式错误',
			phoneVerfiyCodeError: '错误的注册手机验证码',
			sendAgain: '重新发送',
			loading: '正在提交',
			reg: '立即注册',
			keyError: '获取key失败，请重试！',
			netError: '网络错误，请重试！',
			agreement: '您需要阅读并同意《服务协议》和《隐私条款》',
			agreementAlert: '您需要阅读并同意《服务协议》和《隐私条款》\n如您已仔细阅读并同意可直接点击确定'
		},
		custom: {
			debug: false,
			check: ['username','password','passwordRepeat','phone','phoneVerfiyCode'],
			platformCode: 1, //PC:1 WAP:2
			regCallBackUrl: ''
		}
	}
	/*var countdown = new Countdown();
	var countdownFmt = Countdown.format;*/
	
	changeCode();
	$(".codeImg").bind("click", changeCode);
	
	function changeCode() {
		$(".codeImg").attr("src", "code.do?t=" + genTimestamp());
	}
	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
	
	$.each(setting.custom.check, function(index, ele) {
		setting.elements[ele].on('blur',function(e) {
			ck.methodName(ele);
		});
		setting.elements[ele].on('focus',function(e) {
			var $this = $(this);
		});
	});
	setting.elements.sendPhoneBtn.one('click', function(e) {
		var $this = $(this);
		if(!ck.ck_phone(setting.elements.phone.val())){
			sendSmsAllow(true);
			return;
		}
		sendPhoneVerfiyCode();
	});
	
	
	function  sendPhoneVerfiyCode(){ 
		sendSmsAllow(false);
		if($('#imgVerfiyCode').val() == null || $('#imgVerfiyCode').val() == ''){
			tips($('#imgVerfiyCode').next().next().next('p'),"请输入验证码");
			sendSmsAllow(true);
			return;
		}
		var phone = $.trim(setting.elements.phone.val());
		$.ajax({
			type : 'post',
			url : 'sms/send',
			dataType : 'json',
			data : {
				mobile : phone,
				type : '1',
				sec : $('#imgVerfiyCode').val()
			},
			success :function(r){
				if(r.msg==='success'){
					interv=setInterval(setTimeCountDown,1000);
				}else if(r.msg == 'img'){
					tips($('#imgVerfiyCode').next().next('p'),'图片验证码输入有误');
					sendSmsAllow(true);
					
				}else{
					tips($('.phone-code-btn').next().next('p'),'网络出现问题，请稍后再试');
					sendSmsAllow(true);
				}
			},
			error : function(){
				tips($('.phone-code-btn').next().next('p'),'网络出现问题，请稍后再试');
				sendSmsAllow(true);
			}
		});
	}
	var interv;
	var count = 60;
	function setTimeCountDown(){
		if(count==0){
			sendSmsAllow(true);
		}else{
			count--;
			$('.phone-code-btn').text(count+'秒后重发');
		}
	}
	
	function sendSmsAllow(isAllow){
		if(isAllow){
			clearInterval(interv);
			count=60
			$('.phone-code-btn').text('获取验证码');
			$('.phone-code-btn').css('background','#f8b62c');
			setting.elements.sendPhoneBtn.one('click', function(e) {
				sendPhoneVerfiyCode();
			});
		}else{
			$('.phone-code-btn').css('background','#909090').text('正在发送');
		}
	}
	
	function submitAllow(isAllow){
		if(isAllow){
			$('#subBtn').css('background','#f8b62c').val('注册获得1000元现金券');
			setting.elements.submit.one('click', function(e) {
				doSubmit();
			});
		}else{
			$('#subBtn').css('background','#909090').val('正在注册');
		}
	}
	
	function doSubmit(){
		submitAllow(false);
		if ($.inArray('passwordRepeat',setting.custom.check)===-1) {
			if (!ck.ck_username()||!ck.ck_password()||!ck.ck_phone()||!ck.ck_phoneVerfiyCode()) {
				submitAllow(true);
				return false;
			}
		}else{
			if (!ck.ck_username()||!ck.ck_password()||!ck.ck_phone()||!ck.ck_phoneVerfiyCode()) {
				submitAllow(true);
				return false;
			}
		}
		$.post("mobile/doReg",{INVITE_ME:$("#INVITE_ME").val(),USERNAME:$.trim(setting.elements.username.val()),PASSWORD:setting.elements.password.val(),TEL:$.trim(setting.elements.phone.val()),CAPTCHA:$.trim(setting.elements.phoneVerfiyCode.val())},function(data){
			//console.log('前台输入的验证码为：'+setting.elements.phoneVerfiyCode.val());
			if(data.msg=='success'){
				if(confirm("注册成功")){
					window.location.href="mobile/main"
				};
			}else if(data.msg=='namefail'){
				submitAllow(true);
				tips(setting.elements.username.next('p'),setting.messages.nameUnavailable);
			}else if(data.msg=='captcha'){
				submitAllow(true);
				tips($('.phone-code-btn').next().next('p'),setting.messages.phoneVerfiyCodeError);
			}else if(data,msg=='captchaDead'){
				submitAllow(true);
				tips($('.phone-code-btn').next().next('p'),'验证码失效，请重新获取！');
			}
		},"json");
	}
	
	setting.elements.submit.one('click', function(e) {
		doSubmit();
	});
	/*setting.elements.agreement.on('change', function(e) {
		if (this.checked) {
			handleResult(true,setting.elements.feedback,'');
		}else{
			handleResult(false,setting.elements.feedback,setting.messages.agreement);
		}
	});*/
	var ck ={
		methodName:function(method){
			this['ck_'+method]();
		},
		ck_username:function(){
			return true;
			var $name = setting.elements.username;
			var name = $.trim($name.val());
			if(/^[a-zA-Z]\w{3,15}$/.test(name)){
				return true;
			} else if(!/^[a-zA-Z]/.test(name)) {
				tips($name.next('p'),setting.messages.nameBegin);
				return false;
			} else {
				tips($name.next('p'),setting.messages.nameLength);
				return false;
			}
		},
		ck_password:function(){
			var $password = setting.elements.password;
			var password2 = setting.elements.passwordRepeat.length===0? setting.elements.passwordRepeat.val():'';
			var password1 = $password.val();
			if(password1.length >= 8){
				if (/\s/g.test(password1)) {
					tips($('#password').next('p'),setting.messages.passwordSpace);
					return false;
				}else{
					$('#password').next('p').css('display','none');
					/*if (password2 && password2.length!==0) {
						this.ck_passwordRepeat();
					}*/
					return true;
				}
			} else {
				tips($('#password').next('p'),setting.messages.passwordLength);
				return false;
			}
		},

		/*ck_passwordRepeat: function(){
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
		},*/

		ck_phone: function() {
			var boolen;
			var $phone = setting.elements.phone;
			var phone = $.trim($phone.val());
			if(!/^1[3578]\d{9}$/.test(phone)){
				tips($phone.next('p'),setting.messages.phoneFormat);
				return false;
			}
			if(/^1[3578]\d{9}$/.test(phone))	{
				$.ajax({
					url:'register/textTel',
					type:'post',
					async:false,
					data:{TEL:$.trim(setting.elements.phone.val())},
					dataType:'json',
					success:function(data){
						if(data.msg==true){
							boolen=data.msg;
						}else{
							tips($('#mobile').next('p'),'该手机号已经注册')
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
			if(/^\d{4}$/.test(phone)){
				$('.phone-code-btn').next().next('p').css('display','none');
				return true;
			}	else {
				tips($('.phone-code-btn').next().next('p'),'验证码格式不正确');
				return false;
			}
		}
	};
	

	function tips(element,message){
		element.css('display','block').text(message);
		setTimeout(function(){
			element.css('display','none');
		},3000);
	}

});





