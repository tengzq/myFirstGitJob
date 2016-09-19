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
<!-- <link href="wj-mobile-static/css/reset_invite.css" rel="stylesheet" type="text/css"> -->
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/ui2/css/common.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/ui2/css/invitation.css" rel="stylesheet" type="text/css">


<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/follow.js" type="text/javascript"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<!-- <script src="wj-mobile-static/js/layout.js" type="text/javascript"></script> -->


</head>

<body style="background:#eeefef">
<header>
</header>
<div class="content">
	<div class="p21">
    	<a href="javascript:void(0)"><img src="wj-mobile-static/ui2/images/page2_01.png"></a>
    </div>
    <div class="p22">
    	<div class="p22tit">
        	<img src="wj-mobile-static/ui2/images/page2_04.png">
        </div>
        <div class="con">
        	<h3>最多年化1.5%xN</h3>
            <dl>
            	<dt><img src="wj-mobile-static/ui2/images/page2_08.png"></dt>
                <dd>
                	好友投资<br/>金额的0.8%
                </dd>
            </dl>
            <dl>
            	<dt><img src="wj-mobile-static/ui2/images/page2_10.png"></dt>
                <dd>
                	好友投资<br/>金额的0.5%
                </dd>
            </dl>
            <dl>
            	<dt><img src="wj-mobile-static/ui2/images/page2_12.png"></dt>
                <dd>
                	好友投资<br/>金额的0.2%
                </dd>
            </dl>
            <div class="clear"></div>
        </div>
    </div>
    <div class="p23">
    	<h3><img src="wj-mobile-static/ui2/images/page2_18.png" class="fl">好友通过您分享的页面注册会自动生成上下级</h3>
    	<h3><img src="wj-mobile-static/ui2/images/page2_18-07.png" class="fl">好友使用您的邀请码投资时享受0.5%加息</h3>
        <div class="txt">
        	<img src="wj-mobile-static/ui2/images/page2_23.png" class="fr">
        	<p>一级好友每投资10000元您得到80元返现</p>
        	<p>二级好友每投资10000元您得到50元返现</p>
        	<p>三级好友每投资10000元您得到20元返现</p>
            
        </div>
    </div>
    <div class="p24">
    	<div class="p22tit">
        	<img src="wj-mobile-static/ui2/images/page2_27.png">
        </div>
        <div class="con">
        	<div class="yuan">
            	您的累计<br/>投资金额
            </div>
            <div class="font">
            	+
            </div>
            <div class="yuan">
            	所有好友的<br/>累计投资额
            </div>
            <div class="font">
            	=
            </div>
        </div>
    </div>
    <div class="p25">
    	<dl>
        	<dt><img src="wj-mobile-static/ui2/images/page2_35.png"></dt>
            <dd>超过60W<br/>送两枚1G金钞</dd>
        </dl>
    	<dl>
        	<dt><img src="wj-mobile-static/ui2/images/jt3.png"></dt>
            <dd>超过80W<br/>送5G金条</dd>
        </dl>
    	<dl>
        	<dt><img src="wj-mobile-static/ui2/images/jt6.png"></dt>
            <dd>超过100W<br/>送10G金条</dd>
        </dl>
    </div>
    <div class="p14">
    	<a href="mobile/personal/invite"><button>申请参与</button></a>
    </div>
</div>
<footer>
</footer>
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

