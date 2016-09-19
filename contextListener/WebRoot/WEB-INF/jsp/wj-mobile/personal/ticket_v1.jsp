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
		<title>投资券</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/ticket.css" />
		<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
		
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
		
		<style type="text/css">
			.no-ticket-tag{
				text-align: center;
			    margin: 50px 15px;
			    padding: 20px 0 10px 0;
			    font-size: 16px;
			    border-radius: 10px;
			    background-color: #fff;
		        box-shadow: 0 5px 0 0 #909090;
			}
			.no-ticket-tag>div{
				margin-bottom: 20px;
			}
			.no-ticket-tag>div:last-child{
				margin-bottom: 5px;
			}
			.no-ticket-tag>div:last-child input{
			    border: 0;
			    background-color: #2e9dd0;
			    color: #fff;
			    height: 35px;
			    width: 110px;
			    margin: 0 5px;
			    border-radius: 5px;
		        font-size: 15px;
			}
			.no-ticket-tag>div:last-child a:last-child input{
				background-color: #ff6264;
			}
		</style>
	</head>
	

	<body>
		<%@include file="../common/head.jsp" %>
		<!-- <div id="slideBox">
			<div class="menu">
				<ul>
					<li class="on">满减券</li>
					<li>加息券</li>
				</ul>
			</div>
		</div> -->
		<!-- <section>
			<ul>
				<li>
					<dl>
						<dt>10000-50投资券</dt>
						<dd>满10000元减50元</dd>
					</dl>
				</li>
				<li class="amount">50 <sub>￥</sub></li>
			</ul>
			<div class="info">
				<span>有效期：2015-06-18 至 2015-07-18</span>
				<i class="fa fa-angle-down"></i>
			</div>
			<div class="info-detail">使用规则：注册即送10000-50投资卷。</div>
		</section> -->
		<div class="content-father">
			<div class="content-child">
				<c:choose>
					<c:when test="${not empty ticketList}">
						<c:forEach items="${ticketList}" var="ticket">
							<section>
								<ul>
									<li>
										<c:set var="enableAmount" value="${ticket.ENABLE_MIN_AMOUNT}"></c:set>
										<c:set var="disAmount" value="${ticket.DISCOUNT_AMOUNT}"></c:set>
										<dl>
											<dt>${ticket.TICKET_NAME}投资券</dt>
											<dd>满${fn:substringBefore(enableAmount,'.')}元减${fn:substringBefore(disAmount,'.')}元</dd>
										</dl>
									</li>
									
									<li class="amount">${fn:substringBefore(disAmount,'.')}<sub>￥</sub></li>
								</ul>
								<div class="info">
									<span>有效期：${ticket.UT_CREATE_DATE} 至${ticket.UT_ENABLE_DATE}</span>
									<i class="fa fa-angle-down"></i>
								</div>
								<div class="info-detail">使用规则：${ticket.TICKET_DES}。</div>
							</section>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="no-ticket-tag">
							<div>
								<p>您暂时没有获得投资券</p>
							</div>
							<div>
								<a href="mobile/main"><input type="button" value="去看看项目"/></a>
								<a href="mobile/personal/info"><input type="button" value="返回个人中心"/></a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="content-child">
				
			</div>
		</div>
		<script type="text/javascript">
			/* TouchSlide({
					slideCell : "#slideBox",
					titCell : ".menu li",
					mainCell : ".content-father",
					titOnClassName : "on",
				}); */
		
		
			var infos = document.getElementsByClassName("info");
			for (var e = 0, len = infos.length; e < len; e++) {
				infos[e].addEventListener("click", function(o) {
					if (/open/.test(o.currentTarget.className)) {
						o.currentTarget.classList.remove("open");
						o.currentTarget.nextElementSibling.style.display = "none";
						var icon = o.currentTarget.getElementsByClassName("fa")[0];
						icon.classList.remove("fa-angle-up");
						icon.classList.add("fa-angle-down");
					} else {
						o.currentTarget.classList.add("open");
						o.currentTarget.nextElementSibling.style.display = "block";
						var icon = o.currentTarget.getElementsByClassName("fa")[0];
						icon.classList.remove("fa-angle-down");
						icon.classList.add("fa-angle-up");
					}
				})
			}
		</script>
	</body>

</html>
