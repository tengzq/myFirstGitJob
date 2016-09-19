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
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/ticket.css" />
		<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
		
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
		
		<style type="text/css">
			
		</style>
		
	</head>
	

<body>
	<%@include file="../common/head_v2.jsp" %>
	
	<div class="bd">
		<c:choose>
			<c:when test="${not empty ticketList}">
				<c:forEach items="${ticketList}" var="ticket">
					<c:set var="enableAmount" value="${ticket.ENABLE_MIN_AMOUNT}"></c:set>
					<c:set var="disAmount" value="${ticket.DISCOUNT_AMOUNT}"></c:set>
					<div class="ticket">
						<div class="top"></div>
						<div class="squ">
							<div class="hb">
								${fn:substringBefore(disAmount,'.')}￥
								<br>
								<br>
								<br>
							</div>
							<div class="desc">
								<p><img src="wj-mobile-static/ui2/images/lujing.png"></p>		
								<p>${ticket.TICKET_NAME}投资券</p>
								<p>满${fn:substringBefore(enableAmount,'.')}元减${fn:substringBefore(disAmount,'.')}元<i class="fa fa-chevron-circle-down"></i></p>
								<p>有效期：${ticket.UT_CREATE_DATE} 至${ticket.UT_ENABLE_DATE}</p>
							</div>
							<div class="clearfix"></div>
							<div class="content">
								使用规则：${ticket.TICKET_DES}。
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="no-ticket-tag">
					<div>
						<img src="wj-mobile-static/ui2/images/warning.png" width="115"/>
						<p>您暂时没有获得投资券</p>
					</div>
					<div>
						<p><a href="mobile/main"><input type="button" value="去看看项目"/></a></p>
						<p><a href="mobile/personal/info"><input type="button" value="返回个人中心"/></a></p>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
			
		
	</div>
	<%@include file="../common/main_nav.jsp" %>
	<script type="text/javascript">
		$(function(){
			$('.desc i').on('click',function(){
				var _this = $(this);
				var _content = _this.parents('.desc').siblings('.content');
				if(_content.hasClass('open')){
					_content.removeClass('open');
					_this.removeClass('fa-chevron-circle-up').addClass('fa-chevron-circle-down');
				}else{
					_content.addClass('open');
					_this.removeClass('fa-chevron-circle-down').addClass('fa-chevron-circle-up');
				}
			});
		})
	</script>
</body>

</html>
