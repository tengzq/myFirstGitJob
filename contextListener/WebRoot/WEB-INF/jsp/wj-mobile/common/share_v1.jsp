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
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/follow.css" />
		<style>
			html,body {margin:0;width: 100%;height: 100%;background: #E7BC61 url(wj-mobile-static/images/share-bg.png) no-repeat center center /100%  auto ;font-family: "微软雅黑",verdana,sans-serif;font-size: 16px;}
			div {text-align: center;position: absolute;bottom: 18%;left: 50%;-webkit-transform: translateX(-50%);-moz-transform: translateX(-50%);-ms-transform: translateX(-50%);-o-transform: translateX(-50%);transform: translateX(-50%);}
			h3 {color: #000;margin: 5px;font-family: inherit;font-weight: bolder;font-size: 24px;}
			a {text-decoration: none;color: #fff;/* background-color: #e74c5a; *//* padding: 0 20px 4px 20px;font-size: 24px; */
				/* -webkit-animation: 'huxi' 1.3s ease-in-out .95s infinite;
				-moz-animation: 'huxi' 1.3s ease-in-out .95s infinite;
				-o-animation: 'huxi' 1.3s ease-in-out .95s infinite;
				animation: 'huxi' 1.3s ease-in-out .95s infinite; */
			}
			section:first-child {color: #5DC3DA;font-family: sans-serif;    font-weight: bolder !important;    }
			section:first-child h1 {font-size: 4em; margin: 0;white-space: nowrap;    }
			section:nth-child(2) {color: #FFF;margin: 15px 0;}
			section:nth-child(2) p {margin: 0;line-height: 30px;}
			section:first-child p {font-size: 26px;margin: 0;font-family: "幼圆";}
			
			@-webkit-keyframes 'huxi' {
				from { background-color:rgba(231, 76, 90,1); }
				50% { background-color:rgba(231, 76, 90,0); }
				to { background-color:rgba(231, 76, 90,1); }
			}
			@-o-keyframes 'huxi' {
				from { background-color:rgba(231, 76, 90,1); }
				50% { background-color:rgba(231, 76, 90,0); }
				to { background-color:rgba(231, 76, 90,1); }
			}
			@-moz-keyframes 'huxi' {
				from { background-color:rgba(231, 76, 90,1); }
				50% { background-color:rgba(231, 76, 90,0); }
				to { background-color:rgba(231, 76, 90,1); }
			}
			@keyframes 'huxi' {
				from { background-color:rgba(231, 76, 90,1); }
				50% { background-color:rgba(231, 76, 90,0); }
				to { background-color:rgba(231, 76, 90,1); }
			} 
		</style>
	<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript" charset="utf-8"></script>
	<!-- <script type="text/javascript" src="wj-mobile-static/js/follow.js"></script> -->
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

	<%-- <body>
		
		<div>
			<h3>我要</h3>
			<a href="mobile/register?INVITE_ME=${INVITE_ME}">万金生活</a>
		</div>
		
	</body> --%>
	<body>

		<div>
			<!-- <section>
				<h1>13-22%</h1>
				<p>年化收益</p>
			</section>
			<section>
				<p>来自500强企业的优质资产</p>
				<p>银行千亿级授信企业</p>
			</section> -->
			<%-- <h3>我要</h3>
			<a href="mobile/register?INVITE_ME=${INVITE_ME}">万金生活</a> --%>
			<a href="mobile/register?INVITE_ME=${INVITE_ME}"><img src="wj-mobile-static/images/click-reg.png" alt="点击注册" style="width:180px;"/></a>
		</div>
		<!-- <a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
		<div class="concerned-mask">
			<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
			<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
			<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
		</div> -->
	</body>
</html>
