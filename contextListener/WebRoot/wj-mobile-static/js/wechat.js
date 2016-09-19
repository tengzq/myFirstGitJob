var wechatConfig = {
	debug: false,
	api_list: [
	'onMenuShareTimeline',
	'onMenuShareAppMessage',
	'onMenuShareQQ',
	'onMenuShareWeibo',
	'chooseImage',
	'previewImage',
	'uploadImage',
	'downloadImage',
	'getNetworkType',
	'openLocation',
	'getLocation',
	'hideOptionMenu',
	'showOptionMenu',
	'hideMenuItems',
	'showMenuItems',
	'hideAllNonBaseMenuItem',
	'showAllNonBaseMenuItem',
	'closeWindow',
	'scanQRCode']
};

var wechatShareData = {
	title: window.wxTitle || '懒投资 会理财 好先生',
	desc: window.wxDesc || '成为会员，邀请好友注册，得返现',
	link: window.wxLink || window.location.href ,
	imgUrl: window.wxImg || 'https://s1.lantouzi.com/lan-logo.jpg'
};

var Wechat = function(){
	var self = this;
	Wechat.prototype.share = function() {
		var shareDate = window.wechatCustom || wechatShareData; 
		wx.onMenuShareAppMessage(shareDate);
		wx.onMenuShareTimeline(shareDate);
		wx.onMenuShareAppMessage(shareDate);
		wx.onMenuShareWeibo(shareDate);
	};
};

if (wechatConfig.debug) {
	wx.error(function (res) {
		alert(res.errMsg);
	});
}

wx.ready(function () {
	window.wechat = new Wechat();
	wechat.share();
});