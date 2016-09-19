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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>万金先生 - 理财</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />

<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/project_buy.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>

<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-mobile-static/ui2/js/project_buy.js" type="text/javascript"></script>
</head>

<body>
<div class="formbd ddd">
	<form action="mobile/project/buyConfirm" method="post">
		<input type="hidden" name="ID" value="${project.ID}">
		<input type="hidden" name="PROJECT_NAME" value="${project.PROJECT_NAME}">
		<input type="hidden" name="user_id" id="user_id" value="${user.USER_ID }">
		<input type="hidden" name="coupon_type" id="coupon_type" value="1">
		<input type="hidden" name="TICKET_AMOUNT" id="TICKET_AMOUNT" value="0">
		<input type="hidden" name="inviteRate" id="inviteRate" value="none"/>
		<input type="hidden" name="invitationRate" id="invitationRate" value="0.00"/>
		<input type="hidden" name="totalRate" id="totalRate" value="${totalRate}"/>
		<input type="hidden" name="baseRate" value="${baseRate}"/>
		<input type="hidden" name="bossRate" value="${bossRate}"/>
		<input type="hidden" name="deadline" id="deadline" value="${project.DEADLINE}"/>
		<input type="hidden" name="TOTAL_RAISE_AMOUNT" id="TOTAL_RAISE_AMOUNT" value="${project.TOTAL_RAISE_AMOUNT}"/>
		<input type="hidden" name="REPAYMENT_MODE_DES" id="REPAYMENT_MODE_DES" value="${project.REPAYMENT_MODE_DES}"/>
		<input type="hidden" name="preIncome" id="preIncome" value="">
		<input type="hidden" name="coupon_id" id="coupon_id" value=""/>
		<input type="hidden" id="EXCHANGE_MAX_RATE" value="${exchangeRote.EXCHANGE_MAX_RATE}"/>
		<input type="hidden" id="lowest" value="${project.LOWEST_AMOUNT < 100?'100':project.LOWEST_AMOUNT}"/>
		<input type="hidden" id="canInvitation" value="${project.IS_USE_INVITATION}"/>
		<input type="hidden" id="canTicket" value="${project.IS_USE_TICKET}"/>
		<input type="hidden" id="canExchange" value="${project.IS_USE_EXCHANGE_RATE}"/>
		<input type="hidden" id="userBalance" value="${user.BALANCE}"/>
		
		<p id="tt1">${project.SURPLUS_RAISE_AMOUNT}</p>
		<p id="tt2">项目剩余金额（元）</p>
		<p id="tt3">购买金额：<span id="sp1"><input type="tel" name="amount" id="amount" placeholder="请输入购买金额" /></span>元</p>
		<p id="tt4">起投金额为<span class="amount lowestInvest">${project.LOWEST_AMOUNT < 100?'100':project.LOWEST_AMOUNT}</span>元，以<span class="amount">100</span>的整数倍进行投资</p>
		<ul class="ule">
			<li><p id="pid1">账户可用余额（元）</p><p id="pid2">${user.BALANCE}</p></li>
			<li><p id="pid1">预计收益</p><p id="pid4">0.00</p></li>
		</ul>
		<p id="tt5"><input type="text" name="invation_code" id="invation_code" placeholder="填写邀请码获取加息"/><span id="sid1">获取加息</span></p>
		<div id="tip-tip">
	    	您已获得<em style="color:red;">0.5%</em>加息
	    </div>
		<div id="tt6">
			<a hidefocus="true">
				<span id="sid2">
					<c:choose>
			    		<c:when test="${not empty ticketList}">
			    			选择投资券
			    		</c:when>
			    		<c:otherwise>
			    			没有投资券可用
			    		</c:otherwise>
				    </c:choose>
				</span>
			</a>
			<span class="point_out"><i class="fa fa-sort-desc"></i></span>
			<ul class="ull" id="ulli" style="display: none;">
			<c:choose>
		    		<c:when test="${not empty ticketList}">
		    			<li>不使用投资券</li>
		    			<c:forEach items="${ticketList}" var="ticket">
		    				<li data-tid="${ticket.UT_ID}" data-price="${ticket.DISCOUNT_AMOUNT}" data-enable="${ticket.ENABLE_MIN_AMOUNT}" data-surplus="${ticket.SURPLUS}">${ticket.TICKET_NAME}-满${ticket.ENABLE_MIN_AMOUNT}使用</li>
		    			</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    			<li>没有投资券可用</li>
		    		</c:otherwise>
		    </c:choose>
		</ul>
		</div>
		
		<p id="tt7">实际使用金额（元）：<span class="realPay">0</span></p>
		<p id="pat" class="tt8"><a href="javascript:void(0)" id="invest-project">马上投资</a></p>
	</form>
</div>
<%@include file="../common/main_nav.jsp" %>
<%@include file="..//common/foot_v2.jsp" %>
<!-- <div class="foot">
	<p>©万金先生 京ICP备15033688号</p>
	<p>手机版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PC版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4008-337-520</p>
</div> -->
<script type="text/javascript">
$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=${project.ID}");
	val_array.push("SUB_PAGE=2");
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
