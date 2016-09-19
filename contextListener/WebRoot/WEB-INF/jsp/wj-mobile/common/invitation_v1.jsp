<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 user-scalable=false">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />

<title>邀请码机制</title>
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/reset_invite.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/invitation.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/follow.css" rel="stylesheet" type="text/css">

<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/follow.js" type="text/javascript"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- <script src="wj-mobile-static/js/layout.js" type="text/javascript"></script> -->

<style type="text/css">
	    .dashedbox{
	        padding: 5px 15px;
	        border-top: 1px dashed #909090;
	        border-bottom: 1px dashed #909090;
	        background-color: #fff;
	    }
	    .record ul>li{
	    	background: #fff;
			font-size: 14px;
			line-height: 30px;
			color: #666;
			margin-bottom: 7px;
			border-radius: 10px;
	    }  
	    .record ul>li dl dt {
	      	text-align: center;
			padding: 0 10px;
			box-shadow: 0 2px 0 0 #ff6264;
		}
		.record ul>li dl dd {
			background: #f7f7f7;
			padding: 3px;
			font-size: 12px;
			display: none;
			}  
	</style>
</head>

<body>
<div class="one_page mainbody">
	<div class="ban" style="position:relative;">
	</a>
		<a href="mobile/personal/invite">
			<div style="width:110px;height:32px;position: absolute;bottom: 9px;left:33%;z-index: 99"></div>
    	</a>
    	<img src="wj-mobile-static/images/one_page_01.png">
    </div>
    <div class="box record">
    	<div class="title">
        	好友投资，<b>提成您享<i></i></b>
        </div>
        <div class="ban">
        	<img src="wj-mobile-static/images/one_page_03.gif">
        </div>
        <section class="iexplain">
					<div class="ititle">
						<img alt="" src="wj-mobile-static/images/invite_icon.png">
						<div class="tright">
							<p>每级输入上级邀请码即可</p>
							<p>我们知道源头是您</p>
						</div>
						
					</div>
					<div class="clear"></div>
					<div class="ibody">
						<ul>
							<li>好友使用您的邀请码投资时享受<span>0.5%</span>加息</li>
							<li>一级好友每投资10000元您得到<span>80</span>元返现</li>
							<li>二级好友每投资10000元您得到<span>50</span>元返现</li>
							<li>三级好友每投资10000元您得到<span>20</span>元返现</li>
							<li>所有返现<span>T+1</span>到帐</li>
						</ul>
					</div>
				</section>
       
    </div>
    <div class="box" style="margin-top: -35px">
    	<div class="title">
        	呼朋唤壕友，<b>提成必须有<i></i></b>
        </div>
        <div class="ban">
        	<img src="wj-mobile-static/images/one_page_05.png">
        </div>
        <div class="dengyu">
        	<p>超过<b>60W</b>，送两枚<b>1G金钞</b></p>
            <p>超过<b>80W</b>，送<b>5G金条</b></p>
            <p>超过<b>100W</b>，送<b>10G金条</b></p>
        </div>
    </div>
    <div class="h65"></div>
    <a href="mobile/personal/invite">
	    <div class="apply">
	    	<h3>申请参与</h3>
	    </div>
    </a>
</div>
<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
<div class="concerned-mask">
	<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
	<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
	<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=3");
		val_array.push("WEB_OR_MOBILE=2");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
	
	var path=location.href.split('#')[0];
	$.ajax({
		url:'mobile/personal/weixinShare',
		type:'post',
		data:{PATH:path},
		async:true,
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
		var url="";
		if('${user.INVITE_CODE }'==''||'${user.INVITE_CODE }'==null){
			url='<%=basePath%>mobile/share';
		}else{
			url='<%=basePath%>mobile/share?INVITE_ME=${user.INVITE_CODE }';
			}
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
	
</script>
</body>
</html>

