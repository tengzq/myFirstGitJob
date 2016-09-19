/**
 * Created by Jeffery Wang.
 * Create Time: 2015-06-16 19:52
 * Author Link: http://blog.wangjunfeng.com
 */
var nativeShare = function (elementNode, config) {
    if (!document.getElementById(elementNode)) {
        return false;
    }

    var qApiSrc = {
        lower: "http://3gimg.qq.com/html5/js/qb.js",
        higher: "http://jsapi.qq.com/get?api=app.share"
    };
    var bLevel = {
        qq: {forbid: 0, lower: 1, higher: 2},
        uc: {forbid: 0, allow: 1}
    };
    //获取浏览器信息
    var browser = {
        versions: function ()
        {
            var u = navigator.userAgent, app = navigator.appVersion;
            return {//移动终端浏览器版本信息 
                trident: u.indexOf('Trident') > -1, //IE内核
                presto: u.indexOf('Presto') > -1, //opera内核
                webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
                gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
                mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
                android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
                iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
                iPad: u.indexOf('iPad') > -1, //是否iPad
                webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
            };
        }(),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    };
    var UA = navigator.appVersion;
    var isqqBrowser = (UA.split("MQQBrowser/").length > 1) ? bLevel.qq.higher : bLevel.qq.forbid;
    var isucBrowser = (UA.split("UCBrowser/").length > 1) ? bLevel.uc.allow : bLevel.uc.forbid;
    var version = {
        uc: "",
        qq: ""
    };
    var isWeixin = false;

    config = config || {};
    this.elementNode = elementNode;
    this.url = config.url || document.location.href || '';
    this.title = config.title || document.title || '';
    this.desc = config.desc || document.title || '';
    this.img = config.img || document.getElementsByTagName('img').length > 0 && document.getElementsByTagName('img')[0].src || '';
    this.img_title = config.img_title || document.title || '';
    this.from = config.from || window.location.host || '';
    //alert(this.img);
    if(browser.versions.ios || browser.versions.iPhone || browser.versions.iPad){
    	this.ucAppList = {
	        sinaWeibo: ['kSinaWeibo', 11, '新浪微博'],
	        weixin: ['kWeixin', 1, '微信好友'],
	        weixinFriend: ['kWeixinFriend', '8', '微信朋友圈'],
	        QQ: ['kQQ', '4', 'QQ好友'],
	        QZone: ['kQZone', '3', 'QQ空间']
	    };
    }else{// if(browser.versions.android)
    	this.ucAppList = {
	        sinaWeibo: ['SinaWeibo', 11, '新浪微博'],
	        weixin: ['WechatFriends ', 1, '微信好友'],
	        weixinFriend: ['WechatTimeline ', '8', '微信朋友圈'],
	        QQ: ['kQQ', '4', 'QQ好友'],
	        QZone: ['kQZone', '3', 'QQ空间']
	    };
    }
    

    this.share = function (to_app) {
        var title = this.title, url = this.url, desc = this.desc, img = this.img, img_title = this.img_title, from = this.from;
        if (isucBrowser) {
            to_app = to_app == '' ? '' : this.ucAppList[to_app][0];
            if (typeof(ucweb) != "undefined") {
                ucweb.startRequest("shell.page_share", [title, desc, url, to_app, "", "@" + from, ""])
            } else {
                if (typeof(ucbrowser) != "undefined") {
                    ucbrowser.web_share(title,desc, url, to_app, "", '', 'j_ishare_pic')
                } else {
                }
            }
        } else {
            if (isqqBrowser && !isWeixin) {
                to_app = to_app == '' ? '' : this.ucAppList[to_app][1];
                var ah = {
                    url: url,
                    title: title,
                    description: desc,
                    img_url: img,
                    img_title: img_title,
                    to_app: to_app,//微信好友1,腾讯微博2,QQ空间3,QQ好友4,生成二维码7,微信朋友圈8,啾啾分享9,复制网址10,分享到微博11,创意分享13
                    cus_txt: "请输入此时此刻想要分享的内容"
                };
                ah = to_app == '' ? '' : ah;
                if (typeof(browser) != "undefined") {
                    if (typeof(browser.app) != "undefined" && isqqBrowser == bLevel.qq.higher) {
                        browser.app.share(ah)
                    }
                } else {
                    if (typeof(window.qb) != "undefined" && isqqBrowser == bLevel.qq.lower) {
                        window.qb.share(ah)
                    } else {
                    }
                }
            } else {
            }
        }
    };

	//注册分享按钮
//  this.html = function() {
//      var position = document.getElementById(this.elementNode);
//      var html = '<div class="label">分享到</div>'+
//          '<div class="list clearfix">'+
//          '<span data-app="sinaWeibo" class="nativeShare weibo"><i></i>新浪微博</span>'+
//          '<span data-app="weixin" class="nativeShare weixin"><i></i>微信好友</span>'+
//          '<span data-app="weixinFriend" class="nativeShare weixin_timeline"><i></i>微信朋友圈</span>'+
//          '<span data-app="QQ" class="nativeShare qq"><i></i>QQ好友</span>'+
//          '<span data-app="QZone" class="nativeShare qzone"><i></i>QQ空间</span>'+
//          '<span data-app="" class="nativeShare more"><i></i>更多</span>'+
//          '</div>';
//      position.innerHTML = html;
//  };

    this.isloadqqApi = function () {
        if (isqqBrowser) {
            var b = (version.qq < 5.4) ? qApiSrc.lower : qApiSrc.higher;
            var d = document.createElement("script");
            var a = document.getElementsByTagName("body")[0];
            d.setAttribute("src", b);
            a.appendChild(d)
        }
    };

    this.getPlantform = function () {
        ua = navigator.userAgent;
        if ((ua.indexOf("iPhone") > -1 || ua.indexOf("iPod") > -1)) {
            return "iPhone"
        }
        return "Android"
    };

    this.is_weixin = function () {
        var a = UA.toLowerCase();
        if (a.match(/MicroMessenger/i) == "micromessenger") {
            return true
        } else {
            return false
        }
    };

    this.getVersion = function (c) {
        var a = c.split("."), b = parseFloat(a[0] + "." + a[1]);
        return b
    };

    this.init = function () {
        platform_os = this.getPlantform();
        version.qq = isqqBrowser ? this.getVersion(UA.split("MQQBrowser/")[1]) : 0;
        version.uc = isucBrowser ? this.getVersion(UA.split("UCBrowser/")[1]) : 0;
        isWeixin = this.is_weixin();
        if ((isqqBrowser && version.qq < 5.4 && platform_os == "iPhone") || (isqqBrowser && version.qq < 5.3 && platform_os == "Android")) {
            isqqBrowser = bLevel.qq.forbid
        } else {
            if (isqqBrowser && version.qq < 5.4 && platform_os == "Android") {
                isqqBrowser = bLevel.qq.lower
            } else {
                if (isucBrowser && ((version.uc < 10.2 && platform_os == "iPhone") || (version.uc < 9.7 && platform_os == "Android"))) {
                    isucBrowser = bLevel.uc.forbid
                }
            }
        }
        this.isloadqqApi();
        if (isqqBrowser || isucBrowser) {
        	console.log("支持");
            //this.html();
        } else {
        	console.log("不支持");
        	$('#nativeShare').remove();
        	$(".shareArea .clear").before('<a class="jiathis_button_weixin fenxiang_weixin"></a>');
            //document.write('您的手机暂不支持微信分享');
        }
    };

    this.init();

    var share = this;
    var items = document.getElementsByClassName('nativeShare');
    for (var i=0;i<items.length;i++) {
        items[i].onclick = function(){
            share.share(this.getAttribute('data-app'));
        }
    }

    return this;
};
