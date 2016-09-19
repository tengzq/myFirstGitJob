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
		<title>万金生活</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
		
		<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="wj-static/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="wj-static/css/onepage-scroll.css" />
		<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css"/>
		<link rel="stylesheet" type="text/css" href="wj-static/css/enjoy-life.css"/>
		
		<script src="wj-static/js/jquery-1.9.1.min.js"></script>
		<script src="wj-static/js/layout.js"></script>
	</head>

	<body>

		<div id="page">
			<section class="page1">
				<%@include file="../public/top.jsp" %>
				<div class="enjoy to-enjoy"></div>
				<ul class="proj">
					<li class="profit">
						<div class="project-profit" data-rate="${(onlyStar.TOTAL_RAISE_AMOUNT-onlyStar.SURPLUS_RAISE_AMOUNT)/onlyStar.TOTAL_RAISE_AMOUNT}">
							<div class="platform_rate_tips"></div>
							<span title="额外补息" class="platform_rate"><sub>+</sub>${onlyStar.BOSS_INTEREST_RATE }%</span>
							<c:set var="base" value="${onlyStar.BASE_INTEREST_RATE }"></c:set>
							<div class="rate-info" <c:if test="${fn:substringBefore(base,'.') < 10}">style="left:35%"</c:if>>
								<div class="strong-rate">${fn:substringBefore(base,'.') }</div>
								<div class="sub clearfix">
									<sub>%</sub>
									<span>年化</span>
								</div>
							</div>
							<canvas width="160px" height="160px"></canvas>
						</div>
					</li>
					<li>
						<dl>
							<dt>年计划<sub>适合闲置资金,长期投资，赚钱高收益</sub></dt>
							<dd>单笔<span>${onlyStar.LOWEST_AMOUNT}</span>起&nbsp;&nbsp;&nbsp;预期年化收益 <span>${onlyStar.BASE_INTEREST_RATE + onlyStar.BOSS_INTEREST_RATE}%</span> &nbsp;&nbsp;&nbsp;剩余金额${onlyStar.SURPLUS_RAISE_AMOUNT}元</dd>
						</dl>
					</li>
					<li class="touzi-btn">
						<a href="_project/goDetails.do?ID=${onlyStar.PROJECT_ID}" target="blank" <c:if test="${onlyStar.SURPLUS_RAISE_AMOUNT <= 0}">class="sold-out"</c:if>>万金生活</a>
					</li>
				</ul>
			</section>
			<section class="page2">
				<div class="animate-info">
					<img class="img" alt="一次说走就走的旅行，决定因素不仅仅是心情，更是能力" src="wj-static/images/life-02.png">
				</div>
				<ul class="proj">
					<li class="profit">
						<div class="project-profit" data-rate="${(recommend[0].TOTAL_RAISE_AMOUNT-recommend[0].SURPLUS_RAISE_AMOUNT)/recommend[0].TOTAL_RAISE_AMOUNT}">
							<div class="platform_rate_tips"></div>
							<span title="额外补息" class="platform_rate"><sub>+</sub>${recommend[0].BOSS_INTEREST_RATE }%</span>
							<c:set var="base1" value="${recommend[0].BASE_INTEREST_RATE }"></c:set>
							<div class="rate-info" <c:if test="${fn:substringBefore(base1,'.') < 10}">style="left:35%"</c:if>>
								<div class="strong-rate">${fn:substringBefore(base1,'.') }</div>
								<div class="sub clearfix">
									<sub>%</sub>
									<span>年化</span>
								</div>
							</div>
							<canvas width="160px" height="160px"></canvas>
						</div>
					</li>
					<li>
						<dl>
							<dt>月计划<sub>轻松赚钱，一次投资，省心省事</sub></dt>
							<dd>单笔<span>${recommend[0].LOWEST_AMOUNT}</span>起&nbsp;&nbsp;&nbsp;预期年化收益<span>${recommend[0].BASE_INTEREST_RATE + recommend[0].BOSS_INTEREST_RATE}%</span>&nbsp;&nbsp;&nbsp;剩余金额${recommend[0].SURPLUS_RAISE_AMOUNT}元</dd>
						</dl>
					</li>
					<li class="touzi-btn">
						<a href="_project/goDetails.do?ID=${recommend[0].ID}" <c:if test="${recommend[0].SURPLUS_RAISE_AMOUNT <= 0}">class="sold-out"</c:if> target="_blank">万金生活</a>
					</li>
				</ul>
			</section>
			<section class="page3">
				<div class="animate-info">
					<img class="img" alt="有时候给自己买个潮物，并不需要自己掏钱" src="wj-static/images/life-03.png">
				</div>
				<ul class="proj">
					<li class="profit">
						<div class="project-profit" data-rate="${(recommend[1].TOTAL_RAISE_AMOUNT-recommend[1].SURPLUS_RAISE_AMOUNT)/recommend[1].TOTAL_RAISE_AMOUNT}">
							<div class="platform_rate_tips"></div>
							<span title="额外补息" class="platform_rate"><sub>+</sub>${recommend[1].BOSS_INTEREST_RATE }%</span>
							<c:set var="base2" value="${recommend[1].BASE_INTEREST_RATE }"></c:set>
							<div class="rate-info" <c:if test="${fn:substringBefore(base2,'.') < 10}">style="left:35%"</c:if>>
								<div class="strong-rate">${fn:substringBefore(base2,'.') }</div>
								<div class="sub clearfix">
									<sub>%</sub>
									<span>年化</span>
								</div>
							</div>
							<canvas width="160px" height="160px"></canvas>
						</div>
					</li>
					<li>
						<dl>
							<dt>月计划<sub>轻松赚钱，一次投资，省心省事</sub></dt>
							<dd>单笔<span>${recommend[1].LOWEST_AMOUNT}</span>起&nbsp;&nbsp;&nbsp;预期年化收益<span>${recommend[1].BASE_INTEREST_RATE + recommend[1].BOSS_INTEREST_RATE}%</span>&nbsp;&nbsp;&nbsp;剩余金额${recommend[1].SURPLUS_RAISE_AMOUNT}元</dd>
						</dl>
					</li>
					<li class="touzi-btn">
						<a href="_project/goDetails.do?ID=${recommend[1].ID}" <c:if test="${recommend[1].SURPLUS_RAISE_AMOUNT <= 0}">class="sold-out"</c:if> target="_blank">万金生活</a>
					</li>
				</ul>
			</section>
			<section class="page4">
				<div class="animate-info">
					<img class="img" alt="闲置资金是可耻的，短期理财，让我的资金每天都在增长" src="wj-static/images/life-04.png">
				</div>
				<ul class="proj">
					<li class="profit">
						<div class="project-profit" data-rate="${(recommend[2].TOTAL_RAISE_AMOUNT-recommend[2].SURPLUS_RAISE_AMOUNT)/recommend[2].TOTAL_RAISE_AMOUNT}">
							<div class="platform_rate_tips"></div>
							<span title="额外补息" class="platform_rate"><sub>+</sub>${recommend[2].BOSS_INTEREST_RATE }%</span>
							<c:set var="base3" value="${recommend[2].BASE_INTEREST_RATE }"></c:set>
							<div class="rate-info" <c:if test="${fn:substringBefore(base3,'.') < 10}">style="left:35%"</c:if>>
								<div class="strong-rate">${fn:substringBefore(base3,'.') }</div>
								<div class="sub clearfix">
									<sub>%</sub>
									<span>年化</span>
								</div>
							</div>
							<canvas width="160px" height="160px"></canvas>
						</div>
					</li>
					<li>
						<dl>
							<dt>月计划<sub>轻松赚钱，一次投资，省心省事</sub></dt>
							<dd>单笔<span>${recommend[2].LOWEST_AMOUNT}</span>起&nbsp;&nbsp;&nbsp;预期年化收益<span>${recommend[2].BASE_INTEREST_RATE + recommend[2].BOSS_INTEREST_RATE}%</span>&nbsp;&nbsp;&nbsp;剩余金额${recommend[2].SURPLUS_RAISE_AMOUNT}元</dd>
						</dl>
					</li>
					<li class="touzi-btn">
						<a href="_project/goDetails.do?ID=${recommend[2].ID}" <c:if test="${recommend[2].SURPLUS_RAISE_AMOUNT <= 0}">class="sold-out"</c:if> target="_blank">万金生活</a>
					</li>
				</ul>
			</section>
			<section class="page5">
				<div class="animate-info info1">
					<img class="img" alt="有钱一起转" src="wj-static/images/life-05-01.png">
				</div>
				<div class="animate-info info2">
					<img class="img" alt="邀请收大奖" src="wj-static/images/life-05-02.png">
				</div>
				<div class="animate-info info3">
					<a href="myAccount/userinvite" target="_blank">
						<img class="img" alt="开启万金生活" src="wj-static/images/life-05-03.png">
					</a>
				</div>
			</section>
		</div>

		
		<script src="wj-static/js/jquery.onepage-scroll.min.js"></script>
		<script>
			$(function(){
				var	progress = $('.project-profit');
				circle(progress.eq(0),'#299ad2',10);
				
				$('#page').onepage_scroll({
					loop:'false',
					afterMove: function(index){
						setAnimation(index);
					}
				});
				function setAnimation(index){
					if(index!=5){
						circle(progress.eq(index-1),'#299ad2',10);
					}
					$('.page'+index).siblings().find('.animate-info').removeClass('animated');
					$('.page'+index+' .animate-info').addClass('animated');
				}
			})
			function circle (element,color,lineWidth) {
				
					var canvas = $(element).find('canvas').eq(0)[0],
							rate = $(element).data('rate'),
							context = canvas.getContext('2d'),
							percentage = 0,
							per = 0,
							x = 80,
							y = x,
							r = 70,
							s = 1.5 * Math.PI;
			
					if(rate < 0.1){
						percentage =  0.12;
					}else{
						percentage = rate;
					}
			
					function update(){
						per += 0.015;
						context.clearRect(0,0,canvas.width,canvas.height);
						context.beginPath();
						context.strokeStyle = color;
						context.lineWidth = lineWidth;
						context.arc(x, y, r, s, ((per * 360.0) * (Math.PI / 180))+s, false);
						context.stroke();
						if (per < percentage) {
							requestAnimationFrame(update);
						}
					}
					requestAnimationFrame(update);
			
			}
			
			$(document).ready(function(){
				$('.onepage-pagination a').each(function(){
					$(this).attr('href','javascript:void(0)');
				});
				
				// 填充需要记录的数据
				var val_array = new Array();
				var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
				val_array.push("TYPE=1");
				val_array.push("VIEW_ID=2");
				val_array.push("WEB_OR_MOBILE=1");
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
