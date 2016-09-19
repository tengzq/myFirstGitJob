(function(){
	var passportApi    = window.CONFIG && CONFIG.PASSPORT_API_HOST;
	var encryptTimeout = window.CONFIG && CONFIG.ENCRYPT_TIMEOUT;
	var logoutUrl       = window.CONFIG && (CONFIG.BASE_URI || '') + '/logout';
//	var encrypt = new JSEncrypt();
	var ERROR = {
		OK            : 1,
		GET_KEY_ERROR : -2001,
		API_ERROR     : -2002,
		VERIFY_ERROR  : -1001,
		CAPTCHA_ERROR : -1002
	}

	var getPubkey = (function(){
		var timeout  = encryptTimeout || 120000;
		var lastTime = new Date,
			key,
			code;	
		var ret = function(){
			var defer = new $.Deferred();
			if(!key || new Date - lastTime >= timeout){
				$.ajax(passportApi + 'get_key', {dataType : 'jsonp'}).done(function(d){
					var publicKey = d.data.encrypt.public_key,
						encryptCode = {};
					encryptCode[d.data.encrypt.field_name] = d.data.encrypt.field_value;					
					if(d.code === 1 && publicKey){
						defer.resolve({
							key : publicKey,
							code : encryptCode
						});
						key  = publicKey;
						code = encryptCode;
					} else if(d.code == ERROR.VERIFY_ERROR) {
						alert('您的会话已失效，为了您的帐号安全请退出重新登录！');
						window.location = logoutUrl;
					} else {
						defer.reject({code : ERROR.GET_KEY_ERROR});
					}
				}).fail(function(){
					defer.reject({code : ERROR.GET_KEY_ERROR});
				}).always(function(){
					lastTime = new Date;
				});
			} else {
				defer.resolve({
					key  : key,
					code : code
				});
			}
			return defer.promise();
		}
		ret.reset = function(){
			key = null;
		}
		return ret;
	})();

	var Passport = {
		captchToken : null,
		_getApi : function(action, data, encode){
			var defer = new $.Deferred(),
				tobeEncodeKeys = ['name', 'password', 'old_password', 'new_password', 'mobile','new_name'],
				hasEncode = false,
				encode = (typeof encode === 'undefined') || encode;
			(encode ? getPubkey() : $.when()).then(function(encryptData){
				if(encryptData && encryptData.key && encryptData.code){
					encrypt.setPublicKey(encryptData.key);
					$.extend(data, encryptData.code);
				}
				if(encode){
					for(var l = tobeEncodeKeys.length; l--;){
						key = tobeEncodeKeys[l];
						if(data[key]){
							data[key] = encrypt.encrypt(data[key]);
							hasEncode = true;
						}
					}
				}
				if(Passport.captchToken){
					$.extend(data, Passport.captchToken);
				}
				
				var proxy_actions = [
					'login',
					'register/selectUser',
					'safe/bind_email_send_code',
					'safe/bind_email',
					'safe/bind_mobile_send_code',
					'sms/send',
					'register_send_voice_code',
					'register_check_mobile_code',
					'get_key',
					'register_with_mobile',
					'register_only_with_mobile',
					'safe/bind_mobile',
					'safe/update_password',
					'safe/done_name',
					'reset_password/send_mobile_code',
					'reset_password',
					''
				];
				if($.inArray(action, proxy_actions) != -1){
					var url = action;
					var dataType = 'json';
					var ajax_method = 'POST';
				}else{
					var url = passportApi + action;
					var dataType = 'jsonp';
					var ajax_method = 'GET';
				}
				
				$.ajax(url, {
					type       : ajax_method,
					dataType   : dataType,
					data       : data
				}).done(function(d){
					console.log(d);
					if(d.code === 1){
						defer.resolve(d.data);alert("2"+d.data);
					} else if(d.code == ERROR.VERIFY_ERROR) {
						alert('您的会话已失效，为了您的帐号安全请退出重新登录！');
						window.location = logoutUrl;
					} else {
						defer.reject({
							code : d.code,
							msg  : d.message
						});
					}
				}).fail(function(){
					alert("3"+defer.reject({code : ERROR.API_ERROR}));
				}).always(function(){
					hasEncode && getPubkey.reset();
				});
			}).fail(function(err){alert("===========");
				defer.reject(err);
			});
			return defer.promise();
		},
		login : function(name, password, code){
			return Passport._getApi('login', {
				name        : name,
				password    : password,
				verify_code : code
			});
		},
		register : function(name, password, code){
			return Passport._getApi('register', {
				name        : name,
				password    : password,
				verify_code : code
			});
		},
		register_with_mobile : function(name, password, mobile, encrypt_code) {
			return Passport._getApi('register_with_mobile', {
				name        : name,
				password    : password,
				mobile      : mobile,
				_encrypt_code : encrypt_code
			});
		},
		register_only_with_mobile : function(password, mobile, encrypt_code) {
			return Passport._getApi('register_only_with_mobile', {
				password    : password,
				mobile      : mobile,
				_encrypt_code : encrypt_code
			});
		},
		register_get_key : function() {
			return Passport._getApi('get_key', {
			});
		},
		bindEmailSendCode : function(email){
			return Passport._getApi('safe/bind_email_send_code', {
				email : email
			}, false);
		},
		bindEmail : function(email, token){
			return Passport._getApi('safe/bind_email', {
				token : token,
				email : email
			}, false);
		},
		bindMobileSendCode : function(mobile){
			return Passport._getApi('safe/bind_mobile_send_code', {
				mobile : mobile
			}, false);
		},
		register_send_mobile_code : function(mobile,type){
			return Passport._getApi('sms/send', {
				mobile : mobile,
				type : type
			}, false);
		},
		register_send_voice_code : function(mobile){
			return Passport._getApi('register_send_voice_code', {
				mobile : mobile
			}, false);
		},
		register_check_mobile_code : function(mobile, vcode){
			return Passport._getApi('register_check_mobile_code', {
				mobile : mobile,
				vcode : vcode
			}, false);
		},
		bindMobile : function(mobile, vcode){
			return Passport._getApi('safe/bind_mobile', {
				mobile : mobile,
				vcode  : vcode
			}, false);
		},
		checkName : function(name){
			return Passport._getApi('register/selectUser', {
				name : name
			}, false);
		},
		activate :function(name, password, code){
			return Passport._getApi('safe/activate', {
				name     : name,
				password : password,
				verify_code : code
			});
		},
		updatePassword : function(oldpassword, newpassword, code){
			return Passport._getApi('safe/update_password', {
				old_password : oldpassword,
				new_password : newpassword,
				verify_code  : code
			});
		},
		updateUsername : function(name,encrypt_code){
			return Passport._getApi('safe/done_name', {
				new_name : name,
				_encrypt_code : encrypt_code
			});
		},
		resetPswSendCode : function(name, mobile,code){
			return Passport._getApi('reset_password/send_mobile_code', {
				name   : name,
				mobile : mobile,
				verify_code : code
			}, false);
		},
		resetPsw : function(name, mobile, password, vcode, verify_code){
			return Passport._getApi('reset_password', {
				name        : name,
				mobile      : mobile,
				password    : password,
				vcode       : vcode,
				verify_code : verify_code
			});
		},
		preGetKey : function(){
			getPubkey();
		},
		ERROR : ERROR
	}

	window.Passport = Passport;
})();
