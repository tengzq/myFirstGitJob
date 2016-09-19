<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>万金先生 - 会理财，好先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
		<link href="wj-mobile-static/ui2/css/welcome.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/follow.css" />
		
	<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="wj-mobile-static/ui2/js/register-welcome.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript">
	var url='<%=basePath%>mobile/share?INVITE_ME=${pd.INVITE_ME }';
		var path=location.href.split('#')[0];
	$.ajax({
		url:'mobile/personal/weixinShare',
		type:'post',
		data:{PATH:path},
		async:false,
		dataType:'json',
		success:function(data){
			wx.config({
			debug : false,
			appId : data.appId,
			timestamp : data.timestamp,
			nonceStr : data.nonceStr,
			signature : data.signature,
			jsApiList : [ 'checkJsApi', 'onMenuShareTimeline',
					'onMenuShareAppMessage', 'onMenuShareQQ', 'onMenuShareWeibo',
					'hideMenuItems', 'showMenuItems', 'hideAllNonBaseMenuItem',
					'showAllNonBaseMenuItem', 'translateVoice', 'startRecord',
					'stopRecord', 'onRecordEnd', 'playVoice', 'pauseVoice',
					'stopVoice', 'uploadVoice', 'downloadVoice', 'chooseImage',
					'previewImage', 'uploadImage', 'downloadImage',
					'getNetworkType', 'openLocation', 'getLocation',
					'hideOptionMenu', 'showOptionMenu', 'closeWindow',
					'scanQRCode', 'chooseWXPay', 'openProductSpecificView',
					'addCard', 'chooseCard', 'openCard' ]
				
		});
		}
	});//alert(location.href.split('#')[0]);
		wx.ready(function () {
		    wx.onMenuShareTimeline({
		      title: '万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。',
		      link: url,
		      imgUrl: 'http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png',
		      trigger: function (res) {
		        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		        //alert('用户点击分享到朋友圈');
		      },
		      success: function (res) {
		        
		      },
		      cancel: function (res) {
		        
		      },
		      fail: function (res) {
		        alert("分享失败!");
		      }
		    });
		    wx.onMenuShareAppMessage({
    			title: '万金先生 - 会理财，好先生', // 分享标题
			    desc: '国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。', // 分享描述
			    link: url, // 分享链接
			    imgUrl: 'http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png', // 分享图标
			    success: function () { 
			        // 用户确认分享后执行的回调函数
			    },
			    cancel: function () { 
			        // 用户取消分享后执行的回调函数
			    }
		    });
		
		});
		
		$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=9");
		val_array.push("WEB_OR_MOBILE=2");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
	</script>	
	</head>
	<body>
		<header>
	        <img src="wj-mobile-static/ui2/images/welcome-1.png" alt="welcome">
	    </header>
	    <div class="bd">
	        <div class="form">
	            <input type="tel" name="" id="mobile" placeholder="请输入手机号">
	            <p class="err-area">请输入手机号</p>
	            <input type="password" name="password" id="password" placeholder="请输入密码">
	            <p class="err-area">请输入密码</p>
	            <input type="text" name="" id="imgVerfiyCode" class="ver" placeholder="图片验证码">
	            <img src="" alt="图片验证码" class="codeImg" id="imgVerfiyCode">
	            <div class="clear"></div>
	            <p class="err-area">请输入图片验证码</p>
	            <input type="text" name="" id="phoneVerfiyCode" class="ver" placeholder="短信验证码">
	            <a href="javascript:void(0)" class="phone-code-btn">获取验证码</a>
	            <div class="clear"></div>
	            <p class="err-area">请输入短信验证码</p>
	            <input type="button" value="注册获得1000元现金券" id="subBtn">
	            <p class="err-area">网络异常</p>
	        </div>
	        <div class="intro">
	            <ul>
	                <li>
	                    <img src="wj-mobile-static/ui2/images/w_03.png" alt="安全">
	                    <span>安全</span>
	                    <img src="wj-mobile-static/ui2/images/w_05.png" alt="/">
	                    <div>
	                        <p>集团公司承诺保兑</p>
	                        <p>第三方资金托管</p>
	                        <p>风险备用金模式</p>
	                    </div>
	                </li>
	                <li>
	                    <img src="wj-mobile-static/ui2/images/w_10.png" alt="收益">
	                    <span>收益</span>
	                    <img src="wj-mobile-static/ui2/images/w_05.png" alt="/">
	                    <div>
	                        <p>最高13%年化收益</p>
	                        <p>5倍余额宝</p>
	                        <p>50倍银行活期</p>
	                    </div>
	                </li>
	                <li>
	                    <img src="wj-mobile-static/ui2/images/w_13.png" alt="项目">
	                    <span>项目</span>
	                    <img src="wj-mobile-static/ui2/images/w_05.png" alt="/">
	                    <div>
	                        <p>1-6月世界五百强企业票据</p>
	                        <p>100元起投低门槛</p>
	                        <p>提现T+0到帐</p>
	                    </div>
	                </li>
	            </ul>
	        </div>
	    </div>
	</body>
</html>
