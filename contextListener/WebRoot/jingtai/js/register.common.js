function Register (config) {
	var self = this;
	var setting = {
		elements:{
			form: $('#regForm'),
			username: $('#username'),
			password: $('#password'),
			passwordRepeat: $('#passwordRepeat'),
			phone: $('#phone'),
			phoneVerfiyCode: $('#phoneVerfiyCode'),
			sendPhoneBtn: $('.send-sms'),
			sendPhoneBtnText: $('.send-text'),
			sendCountdownText: $('.countdown-text'),
			countdown: $('.countdown'),
			agreement: $('#agreement'),
			submit: $('.btn-reg'),
			feedback: $('.feedback-err')
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
			phoneVerfiyCodeFormat: '短信验证码格式错误',
			phoneVerfiyCodeError: '错误的注册手机验证码',
			sendAgain: '重新发送',
			loading: '正在注册',
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
	};
	$.extend(setting,config);
	if (setting.custom.debug) {
		console.log(setting);
	}

	var unavailableIds = [];
	//var countdown = new Countdown();
	//var countdownFmt = Countdown.format;
	var lock = false;

	var getErrorElement = function (selector){
		return $(selector).siblings(setting.styles.errorTips).find('em');
	};

	var getParentElement = function (selector){
		return $(selector).parent(setting.styles.parent);
	};

	var handleResult = function(result,element,message,flag){
		if (flag) {
			if (result) {
				$(element).hide();
			}else{
				$(element).show().addClass(setting.styles.error);
				$(element).find(setting.styles.errorTips).find('em').text(message);
			}
		}else{
			clearVaild(element);
			if (result) {
				getParentElement(element).addClass(setting.styles.ok);
			}else{
				getErrorElement(element).text(message);
				getParentElement(element).addClass(setting.styles.error);
			}
		}
	};

	var clearVaild = function(element){
		getErrorElement(element).html('&nbsp;');
		getParentElement(element).removeClass(setting.styles.ok+' '+setting.styles.error);
	};

	var getKey = function(){
		Passport.register_get_key().done(function(d) {
			if(d.encrypt) {
				verfiyPhone(d.encrypt.field_value);
			} else {
				handleResult(false,setting.elements.feedback,setting.messages.keyError,1);
				resetSubmintBtn();
			}
		}).fail(function(err) {
			handleResult(false,setting.elements.feedback,err.msg || setting.messages.netError,1);
			resetSubmintBtn();
		});
	};

	var verfiyPhone = function(data){
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
	};

	var reg = function(name, password, phone, encrypt_code){
		Passport.register_with_mobile(name, password, phone, encrypt_code).done(function(d) {
			regSuccess();
		}).fail(function(err){
			handleResult(false,setting.elements.feedback,err.msg || setting.messages.netError,1);
			resetSubmintBtn();
		});
	};

	var regSuccess  = function(){
		handleResult(true,setting.elements.feedback,'',1);
		location.href = setting.custom.regCallBackUrl;
	};

	var bindElement = function(){
		$.each(setting.custom.check, function(index, ele) {
			setting.elements[ele].on('blur',function(e) {
				self['ck_'+ele]();
			});
			setting.elements[ele].on('focus',function(e) {
				var $this = $(this);
				clearVaild($this);
			});
		});
		setting.elements.sendPhoneBtn.on('click', function(e) {
			e.preventDefault();
			var $this = $(this);
			if($this.hasClass(setting.styles.waiting)){
				return;
			}
			if(!self.ck_phone(setting.elements.phone.val())){
				return;
			}
			sendPhoneVerfiyCode(setting.elements.phone.val());
		});
		setting.elements.form.on('submit', function(e) {
			e.preventDefault();
			if ($(this).hasClass(setting.styles.loading)) {
				return false;
			}
			if ($.inArray('passwordRepeat',setting.custom.check)===-1) {
				if (!self.ck_username()||!self.ck_password()||!self.ck_phone()||!self.ck_phoneVerfiyCode()) {
					return false;
				}
			}else{
				alert(self.ck_username());
				alert(self.ck_password());
				alert(self.ck_passwordRepeat());
				alert(self.ck_phone());
				if (!self.ck_username()||!self.ck_password()||!self.ck_passwordRepeat()||!self.ck_phone()/*||!self.ck_phoneVerfiyCode()*/) {
					return false;
				}
			}
			if(!self.ck_agreement() && !confirm(setting.messages.agreementAlert)){
				handleResult(false,setting.elements.feedback,setting.messages.agreement,1);
				return false;
			}
			setting.elements.submit.text(setting.messages.loading).addClass(setting.styles.loading);
			getKey();
		});
		setting.elements.agreement.on('change', function(e) {
			if (this.checked) {
				handleResult(true,setting.elements.feedback,'',1);
			}else{
				handleResult(false,setting.elements.feedback,setting.messages.agreement,1);
			}
		});

	};

	/*var bindCountdown = function(){
		$(countdown).on('countdownProcess', function(e, d){
			setting.elements.countdown.text(countdownFmt(d).s);
		}).on('countdownFinished', function(){
			setting.elements.sendCountdownText.hide();
			setting.elements.sendPhoneBtnText.show();
			setting.elements.sendPhoneBtn.removeClass(setting.styles.waiting);
		});
	};*/

	var sendPhoneVerfiyCode = function(){
		var phone = $.trim(setting.elements.phone.val());
		Passport.register_send_mobile_code(phone).then(function(d){
			countdown.start(60000, true);
			setting.elements.sendPhoneBtn.addClass(setting.styles.waiting);
			setting.elements.sendPhoneBtnText.hide();
			setting.elements.sendCountdownText.show();
			clearVaild(setting.elements.phoneVerfiyCode);
		}).fail(function(err){
			handleResult(false,setting.elements.phoneVerfiyCode,err.msg|| setting.messages.netError );
		});
	};

	var resetSubmintBtn = function(){
		var btn = setting.elements.submit;
		btn.removeClass(setting.styles.loading).text(setting.messages.reg);
	};

	Register.prototype.ck_username = function(){
		var $name = setting.elements.username;
		var name = $.trim($name.val());
		if(/^[a-zA-Z]\w{3,15}$/.test(name)){
			if($.inArray(name, unavailableIds) > -1){
				handleResult(false,$name,setting.messages.nameUnavailable);
				return false;
			}else{
				Passport.checkName(name).then(function(){
					handleResult(true,$name);
				}).fail(function(err){
					unavailableIds.push(name);
					handleResult(false,$name,err.msg || setting.messages.nameUnavailable);
				});
				return true;
			}
		} else if(!/^[a-zA-Z]/.test(name)) {
			handleResult(false,$name,setting.messages.nameBegin);
			return false;
		} else {
			handleResult(false,$name,setting.messages.nameLength);
			return false;
		}
	};

	Register.prototype.ck_password = function(){
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
					self.ck_passwordRepeat();
				}
				return true;
			}
		} else {
			handleResult(false,$password,setting.messages.passwordLength);
			return false;
		}
	};

	Register.prototype.ck_passwordRepeat = function(){
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
	};

	Register.prototype.ck_phone = function() {
		var $phone = setting.elements.phone;
		var phone = $.trim($phone.val());
		if(/^1\d{10}$/.test(phone)){
			handleResult(true,$phone);
			return true;
		}	else {
			handleResult(false,$phone,setting.messages.phoneFormat);
			return false;
		}
	};

	Register.prototype.ck_phoneVerfiyCode = function() {
		var $phoneVerfiyCode = setting.elements.phoneVerfiyCode;
		var phone = $.trim($phoneVerfiyCode.val());
		if(/^\d{6}$/.test(phone)){
			handleResult(true,$phoneVerfiyCode);
			return true;
		}	else {
			handleResult(false,$phoneVerfiyCode,setting.messages.phoneVerfiyCodeFormat);
			return false;
		}
	};

	Register.prototype.ck_agreement = function(){
		var $agreement = setting.elements.agreement;
		var agree = $agreement.prop('checked');
		if(!agree){
			return false;
		}else{
			return true;
		}
	};

	Register.prototype.init = function(url) {
		setting.custom.regCallBackUrl = url;
		bindElement();
		//bindCountdown();
	};


}