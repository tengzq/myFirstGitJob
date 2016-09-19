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
		<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/main.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/follow_common.css" />
		<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/follow.js"></script>
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
	</head>

	<body>
		<header>
</header>
<div class="content" id="slideBox">
	<div class="p1nav">
    	<ul>
      	  	<li class="hover"><a href="javascript:void(0)">体验户</a></li>
      	  	<li><a href="javascript:void(0)">月账户</a></li>
      	  	<li><a href="javascript:void(0)">季账户</a></li>
      	  	<li><a href="javascript:void(0)">年账户</a></li>
        </ul>
    </div>
    <div class="projects">
    <c:forEach items="${recommend}" var="pro">
        <div class="project" data-rate="${(pro.TOTAL_RAISE_AMOUNT-pro.SURPLUS_RAISE_AMOUNT)/pro.TOTAL_RAISE_AMOUNT}">
        	<div class="p12">
		        <div class="window">
		            <div class="p121">
		                <div class="fl">
		                    <c:set var="baseRate" value="${pro.BASE_INTEREST_RATE}"></c:set>
			                ${fn:substringBefore(baseRate,'.')}	
		                </div>
		                <div class="fl">
		                    <h3>%</h3>
		                    <p>年化</p>
		                </div>
		            </div>
		            <div class="p122">
		                +${pro.BOSS_INTEREST_RATE}%
		            </div>
		            
		            <canvas width="200" height="200" style="padding-top:5px;padding-left:5px;"></canvas>
		        </div>
		    </div>
		    <div class="p123">
                <a href="mobile/project/detail?ID=${pro.ID}">查看详情</a>
            </div>
		    <div class="p13">
		        <dl class="fl">
		            <dt class="lanzi">¥${pro.SURPLUS_RAISE_AMOUNT }</dt>
		            <dd><em></em>剩余买入额度（元）</dd>
		        </dl>
		        <dl class="fr">
		            <dt><b>加</b>享受邀请码机制</dt>
		            <dd>限期
		            	<c:set var="day" value="${pro.DEADLINE/30}"></c:set>
	                	<c:if test="${fn:substringAfter(day,'.') >0}">
	                		${fn:substringBefore(day,'.')}
	                	</c:if>
	                	<c:if test="${fn:substringAfter(day,'.') ==0}">
	                		${fn:substringBefore(day,'.')}
	                	</c:if>
		            	个月，到期续投或退出</dd>
		        </dl>
		    </div>
		    <div class="p14">
			    <c:choose>
			    	<c:when test="${pro.SURPLUS_RAISE_AMOUNT <= 0}">
			    		<a href="mobile/project/detail?ID=${pro.ID}"><button style="background:#909090;">已卖光</button></a>
			    	</c:when>
			    	<c:otherwise>
			    		<a href="mobile/project/buy?ID=${pro.ID}"><button>立即投资</button></a>
			    	</c:otherwise>
			    </c:choose>
		    </div>
        </div>  
        </c:forEach> 
        <div class="project" data-rate="${(onlyStar.TOTAL_RAISE_AMOUNT-onlyStar.SURPLUS_RAISE_AMOUNT)/onlyStar.TOTAL_RAISE_AMOUNT}">
        	<div class="p12">
		        <div class="window">
		            <div class="p121">
		                <div class="fl">
		                    <c:set var="baseRateStar" value="${onlyStar.BASE_INTEREST_RATE}"></c:set>
			                ${fn:substringBefore(baseRateStar,'.')}	
		                </div>
		                <div class="fl">
		                    <h3>%</h3>
		                    <p>年化</p>
		                </div>
		            </div>
		            <div class="p122">
		                +${onlyStar.BOSS_INTEREST_RATE}%
		            </div>
		            
		            <canvas width="200" height="200" style="padding-top:5px;padding-left:5px;"></canvas>
		        </div>
		        
		    </div>
		    <div class="p123">
                <a href="mobile/project/detail?ID=${onlyStar.PROJECT_ID}">查看详情</a>
            </div>
		    <div class="p13">
		        <dl class="fl">
		            <dt class="lanzi">¥${onlyStar.SURPLUS_RAISE_AMOUNT }</dt>
		            <dd><em></em>剩余买入额度（元）</dd>
		        </dl>
		        <dl class="fr">
		            <dt><b>加</b>享受邀请码机制</dt>
		            <dd>限期
		            	<c:set var="dayStar" value="${onlyStar.DEADLINE/30}"></c:set>
	                	<c:if test="${fn:substringAfter(dayStar,'.') >0}">
	                		${fn:substringBefore(dayStar,'.')}
	                	</c:if>
	                	<c:if test="${fn:substringAfter(dayStar,'.') ==0}">
	                		${fn:substringBefore(dayStar,'.')}
	                	</c:if>
		            	个月，到期续投或退出</dd>
		        </dl>
		    </div>
		    <div class="p14">
		        <c:choose>
			    	<c:when test="${onlyStar.SURPLUS_RAISE_AMOUNT <= 0}">
			    		<a href="javascript:void(0)"><button style="background:#909090;">已卖光</button></a>
			    	</c:when>
			    	<c:otherwise>
			    		<a href="mobile/project/buy?ID=${onlyStar.PROJECT_ID}"><button>立即投资</button></a>
			    	</c:otherwise>
			    </c:choose>
		    </div>
        </div>     
    </div>
    <div class="p15">
    	<a href="mobile/project/list" class="yellow-fonts">查看更多项目</a>
    </div>
    <!-- <div class="p16">
    	<a href="#">邀请码机制</a>｜
    	<a href="#">安全保障</a>｜
    	<a href="#">常见问题</a>｜
    	<a href="#" class="lanzi">登陆/注册</a>
    </div> -->
    <%@include file="../common/footer_v2.jsp" %>
</div>
<footer>
</footer>
<script type="text/javascript">
	TouchSlide({
		slideCell : "#slideBox",
		titCell : ".p1nav li",
		mainCell : ".projects",
		titOnClassName : "hover",
	});
</script>
<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
<div class="concerned-mask">
	<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
	<img src="wj-mobile-static/images/follow_qr_2.png" class="concerned-QRCode"/>
	<!-- <p class="msg">长按二维码点击“识别图中的二维码”即可关注</p> -->
</div>
		
		
<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript" charset="utf-8"></script>
<script>
	var progress = $('.project');
	$(function() {
		circle(progress, '#2e9dd0', 7);
		
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=0");
		val_array.push("WEB_OR_MOBILE=2");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	})

	function circle(elements, color, lineWidth) {
		$.each(elements, function(index, element) {
			var canvas = $(element).find('canvas').eq(0)[0],
				rate = $(element).data('rate'),
				context = canvas.getContext('2d'),
				percentage = 0,
				per = 0,
				x = 95,
				y = x,
				r = 90,
				s = 1.5 * Math.PI;
			if (rate < 0.1) {
				percentage = 0.12;
			} else {
				percentage = rate;
			}

			function update() {
				per += 0.015;
				context.clearRect(0, 0, canvas.width, canvas.height);
				context.beginPath();
				context.strokeStyle = color;
				context.lineWidth = lineWidth;
				context.arc(x, y, r, s, ((per * 360.0) * (Math.PI / 180)) + s, false);
				context.stroke();
				if (per < percentage) {
					requestAnimationFrame(update);
				}
			}
			requestAnimationFrame(update);
		});
	}
</script>
		
</body>

</html>