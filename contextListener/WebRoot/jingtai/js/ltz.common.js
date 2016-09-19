var Countdown = (function(){
	function Countdown(step){
		this.step = step || 1000;
		this.t  = 0;
	}
	Countdown.STATUS = {
		STOP    : 0,
		RUNNING : 1
	}
	Countdown.format = function(Timestamp){
		var d = Math.floor(Timestamp/86400000),
			h = Math.floor(Timestamp%86400000/3600000),
			m = Math.floor(Timestamp%3600000/60000),
			s = Math.floor(Timestamp%60000/1000),
			hh = h<10? '0'+h :h,
			mm = m<10? '0'+m :m,
			ss = s<10? '0'+s :s;
		return {
			d : d,
			h : h,
			m : m,
			s : s,
			hh: hh,
			mm: mm,
			ss: ss
		}
	}
	$.extend(Countdown.prototype, {
		start : function(time, force, cb){
			if(typeof force === 'function'){
				cb = force;
				force = false;
			}
			if(this.status === Countdown.STATUS.RUNNING){
				if(force){
					return this.restart(time, cb);
				}
				return;
			}
			this.status = Countdown.STATUS.RUNNING;
			var startTime = new Date;
			var self = this;
			this.t = setInterval(function(){
				var leftTime = Math.max(0, time - (new Date - startTime));
				if(leftTime <= 0){
					self.stop();
					$(self).trigger('countdownFinished');
				} else {
					$(self).trigger('countdownProcess', leftTime);
					cb && cb(0, leftTime);
				}
			}, self.step-50);
			return this;
		},
		stop : function(){
			clearInterval(this.t);
			this.status = Countdown.STATUS.STOP;
			return this;
		},
		restart : function(time, cb){
			this.stop();
			return this.start(time, cb);
		},
		getStatus : function(){
			return this.status;
		}
	});

	return Countdown;
})();

$.Utils = {
	Countdown : Countdown,
	/*要格式化的数字, 要保留的小数位数, 指定小数点显示的字符, 指定千位分隔符显示的字符*/
	numberFormat : function (number, decimals, dec_point, thousands_sep) {
		number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
		var n = !isFinite(+number) ? 0 : +number,
			prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
			sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
			dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
			s = '',
			toFixedFix = function (n, prec) {
				var k = Math.pow(10, prec);
				return '' + Math.round(n * k) / k;
			};
		s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
		if (s[0].length > 3) {
			s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
		}
		if ((s[1] || '').length < prec) {
			s[1] = s[1] || '';
			s[1] += new Array(prec - s[1].length + 1).join('0');
		}
		return s.join(dec);
	},
	repayPlan : (function(type){
		var RepayPlans = {
			debx : function(amount, rate, sTime, eTime){
				var r = rate / 100 / 12;
				var sTimeObj = new Date(sTime),
					eTimeObj = new Date(eTime),
					y        = eTimeObj.getFullYear() - sTimeObj.getFullYear(),
					n        = y * 12 + eTimeObj.getMonth() - sTimeObj.getMonth();
				var pre_month_repay = amount * (r * Math.pow(1 + r, n) / (Math.pow(1 + r, n) - 1));
				return pre_month_repay * n - amount;
			},
			ayfx : function(amount, rate, sTime, eTime){
				var days = (eTime - sTime)/86400000;
				return amount * (rate / 365 / 100) * days;
			}
		};
		var f = function(){return 0}
		switch(type){
			case '0' :
				f = RepayPlans.debx;
				break;
			case '1' :
				f = RepayPlans.ayfx;
				break;
		}
		return f;
	}),
	tmpl : function(s, o, f){
		var patternExpr = /\{([^\{\}]*)\}/g,
		s = s.replace(patternExpr, function(s,a){
			if(!a) return '';
			try{
				var r = eval("with(o){"+s+"}");
				return typeof(r) != 'undefined' ? (f?f(r):r) : '';
			}catch(ex){return s;}
		});
		return s;
	},
	replaceData: function(str, obj) {
    return str.replace(/\$\{([\w\.?]+)\}/g, function(s, k) {
      var keys = k.split('.'), l = keys.length;
      var key = keys[0];
      if (l > 1) {
        var o = obj;
        for (var i = 0; i < l; i++) {
          if (key in o) {
            o = o[key];
            key = keys[i + 1];
          } else return s;
        }
        return o;
      }
      return key in obj ? obj[key] : s;
    });
  },
  fixNumInput: function(v, decimals) {
  	decimals = decimals ? decimals : 2;
  	var dots_num = v.match(/\./g);
		if (v.indexOf('.') < 0 || decimals == 0) {
			return v.replace(/[^\d]/g, '');
		} else if (dots_num.length == 1) {
			return v.replace(/[^\d\.]/g, '').substr(0, v.indexOf('.') + decimals + 1);
		} else {
			var i = v.substr(0, v.indexOf('.')),
				d = v.substring(v.indexOf('.'), v.length).replace(/[^\d]/g, '').substr(0, decimals);
			return (d ? i + '.' + d : i);
		}
  },
	two_step_login : function(dwjuc_url, jump){
		if(!jump){
			jump = '/';
		}
		location.href = jump;
		// two_step_login 暂不使用

		/*
		var sso_url = CONFIG.SSO_URI;
		if(sso_url.indexOf('?') == -1){
			sso_url += '?jump=' + escape(jump);
		}else{
			sso_url += '&jump=' + escape(jump);
		}
		if(dwjuc_url.indexOf('?') == -1){
			dwjuc_url += '?jump=' + escape(sso_url);
		}else{
			dwjuc_url += '&jump=' + escape(sso_url);
		}

		// IE8及以下window location跳转获取不到referer
		var a = document.createElement("a");
		a.style.display = "none";
		document.body.insertBefore(a, document.body.firstChild);
		a.setAttribute("href", dwjuc_url);
		try{
			a.click();
		}catch(e){
			window.location = dwjuc_url;
		}
		*/
	},
	jump2sso : (function(){
		/*IE8及以下window location跳转获取不到referer*/
		var a = document.createElement("a"),
			url = window.CONFIG && CONFIG.SSO_URI || '/dwjsso';
		a.style.display = "none";
		hookJump = a.click;
		return function(jump){
			if(hookJump){
				document.body.insertBefore(a, document.body.firstChild);
				if(/^https?:/.test(jump)){
					url = jump;
				} else {
					url += jump ? '?jump=' + jump : '';
				}
				a.setAttribute("href", url);
				try{
					a.click();
				}catch(e){
					window.location = url;
				}
			} else {
				window.location = url;
			}
		}
	})(),
	queryUrl: function(url, key) {
		url = url.replace(/^[^?=]*\?/ig, '').split('#')[0];
		var json = {};
		url.replace(/(^|&)([^&=]+)=([^&]*)/g, function (a, b, key , value){
			try {
				key = decodeURIComponent(key);
			} catch(e) {}
			try {
				value = decodeURIComponent(value);
			} catch(e) {}
			if (!(key in json)) {
				json[key] = /\[\]$/.test(key) ? [value] : value;
			}
			else if (json[key] instanceof Array) {
				json[key].push(value);
			}
			else {
				json[key] = [json[key], value];
			}
		});
		return key ? json[key] : json;
	},
	bankNoCheck: function(str) {
		var sum = 0;
		var a = $.map(str.split('').reverse(), function(v, i) {
			if (i % 2) {
				var num = String(v*2).split('');
				sum += num.length > 1 ? parseInt(num[0], 10) + parseInt(num[1], 10) : parseInt(num[0], 10);
			} else {
				sum += parseInt(v, 10);
			}
		});
		return !(sum % 10);
	},
	encodeURIJson: function(json){
		var s = [];
		for( var p in json ){
			if(json[p]==null) continue;
			if(json[p] instanceof Array)
			{
				for (var i=0;i<json[p].length;i++) s.push( encodeURIComponent(p) + '=' + encodeURIComponent(json[p][i]));
			}
			else
				s.push( encodeURIComponent(p) + '=' + encodeURIComponent(json[p]));
		}
		return s.join('&');
	},
	buildPromotionUri : function(code, url){
		var a = document.createElement('a');
		url = url || window.location.href;
		a.href = url;
		a.search = $.Utils.encodeURIJson($.extend($.Utils.queryUrl(url), {pcode:code}));
		return a.href;
	}
};

$.extend($.fn, {
	showValid : function(status, msg){
		this.removeClass('ok err');
		if(typeof status === 'undefined'){
			this.text('');
		} else {
			this.addClass(status ? 'ok' : 'err').text(msg || '');
		}
	},
	trimVal : function(){
		return $.trim(this.val());
	}
});

var cookie = {
    getRaw: function(e) {
        var t = new RegExp("(^| )" + e + "=([^;]*)(;|$)"),
            n = t.exec(document.cookie);
        return n ? n[2] || null : null
    },
    get: function(e) {
        var t = cookie.getRaw(e);
        return "string" == typeof t ? (t = decodeURIComponent(t), t) : null
    },
    setRaw: function(e, t, n) {
        n = n || {};
        var r = n.expires;
        "number" == typeof n.expires && (r = new Date, r.setTime(r.getTime() + n.expires)), document.cookie = e + "=" + t + (n.path ? "; path=" + n.path : "") + (r ? "; expires=" + r.toGMTString() : "") + (n.domain ? "; domain=" + n.domain : "") + (n.secure ? "; secure" : "")
    },
    set: function(e, t, n) {
        cookie.setRaw(e, encodeURIComponent(t), n)
    },
    remove: function(e, t) {
        t = t || {}, t.expires = new Date(0), cookie.setRaw(e, "", t)
    }
}

$.extend($, {
	browser : {
	    ie : false,
	    chrome : false,
	    firefox : false,
	    safari : false,
	    opera : false
	},
	cookie : cookie
});
var rUA = [ /ms(ie)\s(\d+\.\d)/,    // IE
    /(chrome)\/(\d+\.\d+)/,    // chrome
    /(firefox)\/(\d+\.\d+)/,   // firefox 
    /version\/(\d+\.\d+)(?:\.\d)?\s(safari)/,    // safari
    /(opera)(?:.*version)\/([\d.]+)/ ];    // opera
var uaMatch = (function(){
    var ua = navigator.userAgent.toLowerCase(),
        len = rUA.length,
        i = 0,
        matches;
        
    for( ; i < len; i++ ){
        if( (matches = ua.match(rUA[i])) ){
            break;
        }
    }
    
    if( !matches ){
        matches = [];
    }
    
    return {
        browser : matches[1] || '',
        version : matches[2] || 0
    };
})();
if( uaMatch.browser ){
    if( uaMatch.version === 'safari' ){
        uaMatch.version = uaMatch.browser;
        uaMatch.browser = 'safari';
    }

    $.browser[ uaMatch.browser ] = true;
    $.browser.version = uaMatch.version;
}