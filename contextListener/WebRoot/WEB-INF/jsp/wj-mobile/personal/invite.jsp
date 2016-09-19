<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
		<title>邀请好友</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		
		
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/invite.css" />
		<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
		<style type="text/css">
			.share_bg{position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; -webkit-animation: opacityIn 1s ease 0.2s both; animation-duration: 1s; animation-timing-function: ease; animation-delay: 0.2s; animation-iteration-count: initial; animation-direction: initial; animation-fill-mode: both; -webkit-animation-play-state: initial; animation-play-state: initial; animation-name: opacityIn; z-index: 9998; background: rgba(0, 0, 0, 0.6);}
			.jtico_tsina {background-image:url("wj-mobile-static/images/share_weibo.png") !important;background-size: 85% !important;}
			.jtico_qzone {background-image:url("wj-mobile-static/images/share_qzone.jpg") !important;background-size: 85% !important;background-position:0 0 !important;}
		</style>
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
		<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
		<script type="text/javascript" src="wj-mobile-static/ui2/js/share.js"></script>
		<script type="text/javascript" src="wj-mobile-static/ui2/js/invite.js"></script>
		
		<style type="text/css">
	    
	</style>
	</head>

	<body>
<div class="header">
	<img src="wj-mobile-static/ui2/images/page5_02.png">
</div>
<div class="page5 main">
    <div class="p51">
    	<form>
        	<div class="input">
            	<span>谁邀请的我：</span>
                
                <c:choose>
					<c:when test="${InviteMe.USERNAME==null ||InviteMe.USERNAME == ''}">
						<p>
		                	<input type="text" id="entry-code" class="entry-code" >
		                    <input type="button" value="确定" class="bth">
		                </p>
		                <h6 class="warning">请输入上级邀请码，绑定后不可修改</h6>
					</c:when>
					<c:otherwise>
						<em>${InviteMe.USERNAME}</em>
					</c:otherwise>
				</c:choose>
            </div>
        	<div class="input">
            	<span>我的邀请码：</span>
                <em>${pd.INVITE_CODE}</em>
            </div>
        </form>
    </div>
    <div class="p52">
    	<img src="wj-mobile-static/ui2/images/page5_07.png" class="fr">
    	<h3>好友使用您的邀请码投资时享受0.5%加息</h3>
        <p>一级好友每投资10000元您得到80元返现</p>
        <p>二级好友每投资10000元您得到50元返现</p>
        <p>三级好友每投资10000元您得到20元返现</p>
    </div>
    <div class="p53">
    	<dl>
        	<dt>
            	<em class="fr">${juniorInfo.level1Count}人,累计返现${juniorInfo.level1Amount}元</em>
                一级好友
            </dt>
            <dd>
            	 <table>
                 	<tr>
                    	<th>好友</th>
                    	<th>累计投资额</th>
                    	<th>返现金额</th>
                    </tr>
                 	<c:choose>
           				<c:when test="${not empty juniorInfo.earningsList}">
           					<c:forEach items="${juniorInfo.earningsList}" var="jun" varStatus="vs">
             				<c:if test="${jun.LEVEL=='1'}">
             					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
             						<td>${jun.USERNAME}</td>
             						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
             						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
             					</tr>
             				</c:if>
             			</c:forEach>
           				</c:when>
           				
           			</c:choose>
                    <c:if test="${juniorInfo.level1Count == 0}">
       					<tr style="border:none">
       						<td colspan="3">目前没有好友，快去邀请吧！</td>
       					</tr>
       				</c:if>
                 </table>
            </dd>
        </dl>
    	<dl>
        	<dt>
            	<em class="fr">${juniorInfo.level2Count}人,累计返现${juniorInfo.level2Amount}元</em>
                二级好友
            </dt>
            <dd>
            	 <table>
                 	<tr>
                    	<th>好友</th>
                    	<th>累计投资额</th>
                    	<th>返现金额</th>
                    </tr>
                 	<c:choose>
           				<c:when test="${not empty juniorInfo.earningsList}">
           					<c:forEach items="${juniorInfo.earningsList}" var="jun" varStatus="vs">
             				<c:if test="${jun.LEVEL=='2'}">
             					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
             						<td>${jun.USERNAME}</td>
             						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
             						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
             					</tr>
             				</c:if>
             			</c:forEach>
           				</c:when>
           			</c:choose>
           			<c:if test="${juniorInfo.level2Count == 0}">
          					<tr style="border:0">
          						<td colspan="3">目前没有好友，快去邀请吧！</td>
          					</tr>
          				</c:if>
                 </table>
            </dd>
        </dl>
    	<dl>
        	<dt>
            	<em class="fr">${juniorInfo.level3Count}人,累计返现${juniorInfo.level3Amount}元</em>
            		  三级好友
            </dt>
            <dd>
            	 <table>
                 	<tr>
                    	<th>好友</th>
                    	<th>累计投资额</th>
                    	<th>返现金额</th>
                    </tr>
                    <c:choose>
           				<c:when test="${not empty juniorInfo.earningsList}">
           					<c:forEach items="${juniorInfo.earningsList}" var="jun" varStatus="vs">
             				<c:if test="${jun.LEVEL=='3'}">
             					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
             						<td>${jun.USERNAME}</td>
             						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
             						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
             					</tr>
             				</c:if>
             			</c:forEach>
           				</c:when>
           			</c:choose>
           			<c:if test="${juniorInfo.level3Count == 0}">
          					<tr style="border:0">
          						<td colspan="3">目前没有好友，快去邀请吧！</td>
          					</tr>
          				</c:if>
                 </table>
            </dd>
        </dl>
    </div>
</div>
<div class="main">
	<div class="p54">
    	<h3>分享链接，邀请好友注册，得返现！</h3>
        <div class="shareArea jiathis_style_32x32">
        	<a class="fenxiang_weixin nativeShare weixin_timeline" id="nativeShare" data-app="weixinFriend"><img alt="" src="wj-mobile-static/images/share_weixin.png" width="30px;"></a>
			<a class="jiathis_button_tsina"></a>
			<a class="jiathis_button_qzone"></a>
			<div class="clear"></div>
        </div>
    </div>
    <div class="share_bg j_share_bg" style="display: none">
		<p class="share_icon" style="clear:both; padding:10px; text-align:right;height:100%;background-position: right top; -webkit-animation:rotateUp 1s .8s ease both;z-index:9999;">
			<img alt="" src="wj-mobile-static/images/102181.png">
		</p>
	</div>
	<img src="http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png" alt="万金理财" data-src="http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png" id="j_ishare_pic" style="display: none"/>
    <%@include file="../common/main_nav.jsp" %>
</div>

<footer>
</footer>
<script type="text/javascript" >

var url='<%=basePath%>mobile/share?INVITE_ME=${pd.INVITE_CODE }';

var ua = window.navigator.userAgent.toLowerCase(); 
if(ua.match(/MicroMessenger/i) == 'micromessenger'){
	$('.fenxiang_weixin').on('click',function(){
		$('.share_bg').css('display','block');
	});
	$('.share_bg').on('click',function(){
		$('.share_bg').css('display','none');
	});

}else{
	var config = {
		url: url,
		title: '万金先生 - 会理财，好先生 国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。',
		img: 'http://m.wanjinxiansheng.com/wj-mobile-static/images/logo_03.png',
		img_title: '万金理财',
		from: '万金理财'
	};
	var share_obj = new nativeShare('nativeShare', config);

}  

var jiathis_config={
	url:"<%=basePath%>mobile/share?INVITE_ME=${pd.INVITE_CODE }",
	summary:"国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华、北大。",
	title:"万金先生 - 会理财，好先生。#万金先生#",
	shortUrl:false,
	hideMore:false
}


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
        //alert('已分享');
      },
      cancel: function (res) {
        //alert('已取消');
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
<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
</body>
</html>
