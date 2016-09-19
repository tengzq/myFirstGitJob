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
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/index.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/follow.css" />
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
		<div id="slideBox">
			<div class="menu">
				<ul>
					<li class="active">体验户</li>
					<li>月账户</li>
					<li>季账户</li>
					<li>年账户</li>
				</ul>
			</div>
			<div class="4pro">
				<c:forEach items="${recommend}" var="pro">
					<div class="proj">
						<section>
							<div class="project-profit" data-rate="${(pro.TOTAL_RAISE_AMOUNT-pro.SURPLUS_RAISE_AMOUNT)/pro.TOTAL_RAISE_AMOUNT}">
								<div class="platform_rate_tips"></div>
								<span title="额外补息" class="platform_rate"><sub>+</sub>${pro.BOSS_INTEREST_RATE}%</span>
								<section>
									<div class="strong-rate"><c:set var="baseRate" value="${pro.BASE_INTEREST_RATE }"></c:set><%-- <c:if test="${fn:substringAfter(baseRate,'.') ==0}"> --%><fmt:formatNumber value="${pro.BASE_INTEREST_RATE }" pattern="0"/><%-- </c:if><c:if test="${fn:substringAfter(baseRate,'.') >0}">${pro.BASE_INTEREST_RATE }</c:if> --%></div>
									<div class="sub clearfix">
										<sub>%</sub>
										<span>年化</span>
									</div>
								</section>
								<canvas width="210px" height="210px"></canvas>
								<div class="goto-detail"><a href="mobile/project/detail?ID=${pro.ID}" style="z-index:999;">查看详情</a></div>
							</div>
							<%-- <c:if test="${pro.IS_USE_INVITATION==true}"> --%>
							<a href="javascript:void(0);">
								<div class="sec_txi">
									<img src="wj-mobile-static/images/add-icon.png" alt="">
									<p>享受邀请码机制</p>
								</div>
							</a>
						<%-- </c:if> --%>
							<p class="qx">限期<span>
								<c:set var="day" value="${pro.DEADLINE/30}"></c:set>
			                	<c:if test="${fn:substringAfter(day,'.') >0}">
			                		${fn:substringBefore(day,'.')}
			                	</c:if>
			                	<c:if test="${fn:substringAfter(day,'.') ==0}">
			                		${fn:substringBefore(day,'.')}
			                	</c:if>
							</span>个月,到期续投或退出</p>
							<p class="goto-list"><a href="mobile/project/list">查看更多项目</a></p>
						</section>
						<div class="shengyu">
							<div class="arrow">
								<em></em><span></span>
			    			</div>
							<img src="https://m.wukonglicai.com/img/tob.png" alt="">
							<p>剩余买入额度（元）</p>
							<span id="nowSale"> ${pro.SURPLUS_RAISE_AMOUNT } </span>
						</div>
						
						<div class="sec_zhu" id="is_jiaru">
							<c:if test="${pro.SURPLUS_RAISE_AMOUNT>0}">
								<a href="mobile/project/detail?ID=${pro.ID}" id="di">立即投资</a>
							</c:if>
							<c:if test="${pro.SURPLUS_RAISE_AMOUNT <= 0}">
								<a href="mobile/project/detail?ID=${pro.ID}" id="di" style="background: #909090;box-shadow:0 0 0 0;">卖光了</a>
							</c:if>
						</div>
					</div>
				</c:forEach>
				<div class="proj">
					<section>
						<div class="project-profit" data-rate="${(onlyStar.TOTAL_RAISE_AMOUNT-onlyStar.SURPLUS_RAISE_AMOUNT)/onlyStar.TOTAL_RAISE_AMOUNT}">
							<div class="platform_rate_tips"></div>
							<span title="额外补息" class="platform_rate"><sub>+</sub>${onlyStar.BOSS_INTEREST_RATE }%</span>
							<section>
								<div class="strong-rate"><c:set var="baseRate" value="${onlyStar.BASE_INTEREST_RATE }"></c:set><%-- <c:if test="${fn:substringAfter(baseRate,'.') ==0}"> --%><fmt:formatNumber value="${onlyStar.BASE_INTEREST_RATE }" pattern="0"/><%-- </c:if><c:if test="${fn:substringAfter(baseRate,'.') >0}">${onlyStar.BASE_INTEREST_RATE }</c:if> --%></div>
								<div class="sub clearfix">
									<sub>%</sub>
									<span>年化</span>
								</div>
							</section>
							<canvas width="210px" height="210px"></canvas>
							<div class="goto-detail"><a href="mobile/project/detail?ID=${onlyStar.ID}" style="z-index:999;">查看详情</a></div>
						</div>
						<%-- <c:if test="${onlyStar.IS_USE_INVITATION==true}"> --%>
							<a href="javascript:void(0);">
								<div class="sec_txi">
									<img src="wj-mobile-static/images/add-icon.png" alt="">
									<p>享受邀请码机制</p>
								</div>
							</a>
						<%-- </c:if> --%>
						<p class="qx">限期<span>
							<c:set var="day" value="${onlyStar.DEADLINE/30}"></c:set>
		                	<c:if test="${fn:substringAfter(day,'.') >0}">
		                		${fn:substringBefore(day,'.')}
		                	</c:if>
		                	<c:if test="${fn:substringAfter(day,'.') ==0}">
		                		${fn:substringBefore(day,'.')}
		                	</c:if>
						</span>个月,到期续投或退出</p>
						<p class="goto-list"><a href="mobile/project/list">查看更多项目</a></p>
					</section>
					<div class="shengyu">
						<div class="arrow">
							<em></em><span></span>
		    			</div>
						<img src="wj-mobile-static/images/tob.png" alt="">
						<p>剩余买入额度（元）</p>
						<span id="nowSale"> ${onlyStar.SURPLUS_RAISE_AMOUNT } </span>
					</div>
					<div class="sec_zhu" id="is_jiaru">
						<c:if test="${onlyStar.SURPLUS_RAISE_AMOUNT>0}">
							<a href="mobile/project/detail?ID=${onlyStar.PROJECT_ID}" id="di">立即投资</a>
						</c:if>
						<c:if test="${onlyStar.SURPLUS_RAISE_AMOUNT <= 0}">
							<a href="mobile/project/detail?ID=${onlyStar.PROJECT_ID}" id="di" style="background: #909090;box-shadow:0 0 0 0;">卖光了</a>
						</c:if>
					</div>
					
				</div>
			</div>
			<script type="text/javascript">
				TouchSlide({
					slideCell : "#slideBox",
					titCell : ".menu li",
					mainCell : ".4pro",
					titOnClassName : "active",
				});
			</script>
		</div>
		<%@include file="../common/footer.jsp" %>
		<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
		<div class="concerned-mask">
			<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
			<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
			<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
		</div>
		
		
		<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript" charset="utf-8"></script>
		<script>
			var progress = $('.project-profit');
			$(function() {
				circle(progress, '#2e9dd0', 10);
				
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
						x = 100,
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