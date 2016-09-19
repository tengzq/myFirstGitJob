<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生 - ${pd.PROJECT_NAME}</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />

<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/reset.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/project.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/follow_common.css"/>

<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-mobile-static/js/follow.js"></script>
</head>

<body>
<div class="bd">
	<div class="bd1">
		<p><span id="pt1">${pd.PROJECT_NAME}</span><!-- <span id="pt2">6月期10102</span> --></p>
		<p><span id="pt3">年化收益率</span>
			<span id="zi_1">${pd.BASE_INTEREST_RATE}</span><span id="zi_2">%</span>
			<span id="hui1">+${pd.BOSS_INTEREST_RATE}%</span>
			<span id="hui2">${pd.DEADLINE}天</span>
		</p>
	</div>
</div>
<ul class="ulli">
	<a href="mobile/project/introduce?ID=${pd.ID}&type=1"><li>项目详情<i class="fa fa-angle-right"></i></li></a>
	<a href="mobile/project/introduce?ID=${pd.ID}&type=2"><li>风险控制<i class="fa fa-angle-right"></i></li></a>
	<a href="mobile/project/introduce?ID=${pd.ID}&type=3"><li>还款计划<i class="fa fa-angle-right"></i></li></a>
	<a href="mobile/project/introduce?ID=${pd.ID}&type=4"><li>投资记录<i class="fa fa-angle-right"></i></li></a>
</ul>
<div class="pdi">
	<p id="pat">
		<c:if test="${pd.SURPLUS_RAISE_AMOUNT>0}">
			<a href="mobile/project/buy?ID=${pd.ID}">立即投资</a>
		</c:if>
		<c:if test="${pd.SURPLUS_RAISE_AMOUNT <= 0}">
			<a href="javascript:void(0);" style="background: #909090;">已卖光</a>
		</c:if>
	</p>
</div>
<div style="height: 1px;display: block;  margin-top: 70px;">
	
</div>
<%@include file="../common/main_nav.jsp" %>
<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
<div class="concerned-mask">
	<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
	<img src="wj-mobile-static/images/follow_qr_2.png" class="concerned-QRCode"/>
	<!-- <p class="msg">长按二维码点击“识别图中的二维码”即可关注</p> -->
</div>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
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
	});
	var url='';
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
	var currAmount = parseFloat('${pd.SURPLUS_RAISE_AMOUNT}');
	console.log(currAmount);
	$(function(){
		if(currAmount!=0.00){
			$('.data3').on('click',function(){
				$('form').eq(0).submit();
			});
		}
		
	});

	
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=${pd.ID}");
		val_array.push("SUB_PAGE=1");
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

</body>
</html>
