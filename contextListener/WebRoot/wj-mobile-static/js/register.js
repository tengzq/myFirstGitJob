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
			sendPhoneBtn: $('#send-sms'),
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
	setting.elements.sendPhoneBtn.on('click', function(e) {
		//console.log('sms点击事件触发');
		/*setting.elements.sendPhoneBtn.hide();
		setting.elements.sending.show();*/
		domChange.canSendSms(false);
		e.preventDefault();
		var $this = $(this);
		/*if($this.hasClass(setting.styles.waiting)){
			//console.log('kkkk');
			domChange.canSendSms(true);
			return;
		}*/
		if(!ck.ck_phone(setting.elements.phone.val())){
			//console.log('手机号不合法');
			domChange.canSendSms(true);
			return;
		}
		sendPhoneVerfiyCode();
	});
	
	
	function  sendPhoneVerfiyCode(){ 
		if($('#imgVerfiyCode').val() == null || $('#imgVerfiyCode').val() == ''){
			tips($('#imgVerfiyCode'),"请输入验证码");
			setting.elements.sendPhoneBtn.one('click', function(e) {
				////console.log('sms点击事件触发');
				sendPhoneVerfiyCode();
			});
			domChange.canSendSms(true);
			return;
		}
		//console.log('发送验证码');
		var phone = $.trim(setting.elements.phone.val());
		//Passport.register_send_mobile_code(phone).then(function(d){
		//Passport.register_send_mobile_code(phone,'1').then(function(d){
			//countdown.start(60000, true);
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
					//console.log('发送成功');
					setting.elements.sendPhoneBtn.addClass(setting.styles.waiting);
					clearVaild(setting.elements.phoneVerfiyCode);
					interv=setInterval(setTimeCountDown,1000);
				}else if(r.msg == 'img'){
					count = 60;
					tips($('#imgVerfiyCode'),'图片验证码输入有误');
					domChange.canSendSms(true);
					setting.elements.sendPhoneBtn.one('click', function(e) {
						////console.log('sms点击事件触发');
						sendPhoneVerfiyCode();
					});
					
				}else{
					tips(setting.elements.sendPhoneBtnText,'网络出现问题，请稍后再试');
					setting.elements.sendPhoneBtnText.show();
					setting.elements.sendCountdownText.hide();
				}
			},
			error : function(){
				//console.log('http请求失败');
				tips(setting.elements.sendPhoneBtnText,'网络出现问题，请稍后再试');
				setting.elements.sendPhoneBtnText.show();
				setting.elements.sendCountdownText.hide();
			}
		});
		/*}).fail(function(err){
			handleResult(false,setting.elements.phoneVerfiyCode,err.msg|| setting.messages.netError );
		});*/
	}
	var interv;
	var count = 60;
	function setTimeCountDown(){
		if(count==0){
			/*setting.elements.sendPhoneBtn.removeClass(setting.styles.waiting);
			setting.elements.sendPhoneBtn.removeClass('.btn-watting');
			setting.elements.sendPhoneBtn.show();
			setting.elements.sending.hide();*/
			clearInterval(interv);
			count=60
			//settings.elements.sending.val('正在注册');
			domChange.canSendSms(true);
		}else{
			count--;
			setting.elements.sending.val(count+'秒后重发');
		}
		/*setTimeout(function(){
			//console.log('setTimeout');
			setTimeCountDown()
		},1000);*/
	}
	
	setting.elements.submit.on('click', function(e) {
		e.preventDefault();
		if ($(this).hasClass(setting.styles.loading)) {
			return false;
		}
		if ($.inArray('passwordRepeat',setting.custom.check)===-1) {
			if (!ck.ck_username()||!ck.ck_password()||!ck.ck_phone()||!ck.ck_phoneVerfiyCode()) {
				return false;
			}
		}else{
			if (!ck.ck_username()||!ck.ck_password()||!ck.ck_phone()||!ck.ck_phoneVerfiyCode()) {
				return false;
			}
		}
		/*if(!ck_agreement() && !confirm(setting.messages.agreementAlert)){
			handleResult(false,setting.elements.feedback,setting.messages.agreement);
			return false;
		}*/
		$(setting.elements.submit).text(setting.messages.loading);
		$.post("mobile/doReg",{INVITE_ME:$("#INVITE_ME").val(),USERNAME:$.trim(setting.elements.username.val()),PASSWORD:setting.elements.password.val(),TEL:$.trim(setting.elements.phone.val()),CAPTCHA:$.trim(setting.elements.phoneVerfiyCode.val())},function(data){
			//console.log('前台输入的验证码为：'+setting.elements.phoneVerfiyCode.val());
			if(data.msg=='success'){
				if(confirm("注册成功")){
					window.location.href="mobile/main"
				};
			}else if(data.msg=='namefail'){
				handleResult(false,setting.elements.username,setting.messages.nameUnavailable);
			}else if(data.msg=='captcha'){
				//console.log('验证码错误');
				$('.send-sms').siblings('.err-area').find('.err-tips').text(setting.messages.phoneVerfiyCodeError);
				handleResult(false,setting.elements.phoneVerfiyCode,setting.messages.phoneVerfiyCodeError);
			}else if(data,msg=='captchaDead'){
				$('.send-sms').siblings('.err-area').find('.err-tips').text('验证码失效，请重新获取！');
			}
		},"json");
		
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
				//handleResult(false,$name,setting.messages.nameBegin);
				tips($name,setting.messages.nameBegin);
				//console.log(setting.messages.nameBegin);
				return false;
			} else {
				//handleResult(false,$name,setting.messages.nameLength);
				tips($name,setting.messages.nameLength);
				//console.log(setting.messages.nameLength);
				return false;
			}
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
				handleResult(false,$phone,setting.messages.phoneFormat);
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
			if(/^\d{4}$/.test(phone)){
				handleResult(true,$phoneVerfiyCode);
				return true;
			}	else {
				handleResult(false,$phoneVerfiyCode,setting.messages.phoneVerfiyCodeFormat);
				return false;
			}
		}
	};
	
	var domChange = {
		canSendSms : function(type){
			if(type == true){
				setting.elements.sendPhoneBtn.removeClass(setting.styles.waiting);
				setting.elements.sendPhoneBtn.removeClass('.btn-watting');
				setting.elements.sendPhoneBtn.show();
				setting.elements.sending.hide();
				setting.elements.sending.val('正在发送');
			}else{
				setting.elements.sendPhoneBtn.addClass(setting.styles.waiting);
				setting.elements.sendPhoneBtn.addClass('.btn-watting');
				setting.elements.sendPhoneBtn.hide();
				setting.elements.sending.show();
			}
		},
	};



	/*function ck_agreement(){
		var $agreement = setting.elements.agreement;
		var agree = $agreement.prop('checked');
		if(!agree){
			return false;
		}else{
			return true;
		}
	}*/
	function handleResult(result,element,message){
		if (result) {
			$(element).next(setting.styles.errorTips).find("em").hide();
		}else{
			$(element).show();
			tips(element,message);
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
	function reg(name, password, phone, encrypt_code){
		Passport.register_with_mobile(name, password, phone, encrypt_code).done(function(d) {
			regSuccess();
		}).fail(function(err){
			handleResult(false,setting.elements.feedback,err.msg || setting.messages.netError,1);
			resetSubmintBtn();
		});
	}

	function regSuccess(){
		handleResult(true,setting.elements.feedback,'',1);
		location.href = setting.custom.regCallBackUrl;
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
	
	$('.concerned-close').on('click',function(){
		$('.concerned-mask').css('display','none');
		window.location.href="mobile/main"
	})
	
	function tips(element,message){
		$(element).tips({
			side : 1,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}

});

	/*if (flag) {
		if (result) {
			$(element).hide();
		}else{
			$(element).show().addClass(setting.styles.error);
			$(element).find(setting.styles.errorTips).find('em').text(message);
		}
	}else{
		//clearVaild(element);
		if (result) {
			getParentElement(element).addClass(setting.styles.ok);
		}else{
			getErrorElement(element).text(message);
			getParentElement(element).addClass(setting.styles.error);
		}
	}*/
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



