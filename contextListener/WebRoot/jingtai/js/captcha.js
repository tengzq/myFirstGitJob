(function(){
	var captchaApi = window.CONFIG && CONFIG.CAPTCHA_HOST;

	var Captcha = function(el, conf){
		var $el = $(el),
			tagName = $el.prop('tagName');
		this.conf = $.extend({
			captchaApi : captchaApi,
			id         : 'captcha-' + Captcha.id++,
			className  : 'captcha',
			refreshEl  : '.refresh',
			codeEl     : null,
			cookieOnly : false
		}, conf);
		if(tagName === 'IMG'){
			this.wrap = $(el).parent();
			this.img   = $el;
		} else {
			this.wrap = $el;
			this.img  = $el.find('img.' + this.conf.className);
			this.img  = this.img.length ? this.img : $el.find('img');
		}

		this.init();
	}
	Captcha.id = 0;
	$.extend(Captcha.prototype, {
		genSrc : function(cb, errCb, noRetry){
			var self = this;
			if(this.conf.cookieOnly){
				cb && cb(this.conf.captchaApi + '?' + Math.random());
				return;
			}
			return $.ajax(captchaApi + '/access', {dataType : 'jsonp'}).done(function(d){
				if(d.code !== 1 && !noRetry){
					return self.genSrc(cb, errCb, true);
				}
				self.codeEl.attr('name', d.data.field_name);
				if(window.Passport){
					Passport.captchToken = {};
					Passport.captchToken[d.data.field_name] = d.data.field_value;
				}
				cb(d.data.img_url, d.data.field_value);
			}).fail(function(){
				if(!noRetry){
					return self.genSrc(cb, errCb, true);
				}
			});
		},
		createImg : function(){
			var conf = this.conf;
			var img = $('<img class="' + conf.className + '" id="' + conf.id + '" al="验证码" title="点击图片刷新验证码">');
			return img;
		},
		refresh : function(){
			var self = this;
			this.genSrc(function(src, token){
				self.img.attr('src', src);
				self.codeEl.val(token);
				self.img.css('display', '');
			});
			return this;
		},
		load : function(){
			if(this.loaded){
				return;
			}
			if(this.conf.codeEl){
				this.codeEl = this.conf.codeEl;
			} else {
				this.codeEl = $('<input type="hidden">');
			}
			if(!this.img.length){
				var img = this.createImg();
				this.img = img;
				this.wrap.append(img);
			}
			this.img.css({'cursor' : 'pointer', 'vertical-align' : 'middle', 'display' : 'none'});
			if(!this.img.attr('src')) {
				this.refresh();
			} else {
				this.img.css('display', '');
			}
			var self = this;
			this.img.on('click', function(e){
				e.preventDefault();
				self.refresh();
			});
			var formEl = this.img.parents('form');
			!this.conf.cookieOnly && formEl.prepend(this.codeEl);

			this.loaded = true;
			return this;
		},		
		init : function(){
			var self = this;
			this.loaded = false;
			this.wrap.delegate(this.conf.refreshEl, 'click', function(e){
				e.preventDefault();
				self.refresh();
			});
		}
	});
	$.extend($.fn, {
		captcha : function(conf){
			return new Captcha(this, conf).load();
		}
	});

	window.Captcha  = Captcha;
})();