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
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/project.css"/>

<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/project_buy.js" type="text/javascript"></script>
</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody invest">
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
		<input type="hidden" id="EXCHANGE_MAX_RATE" value="${exchangeRote.EXCHANGE_MAX_RATE}"/>
		<input type="hidden" id="lowest" value="${project.LOWEST_AMOUNT < 100?'100':project.LOWEST_AMOUNT}"/>
		<input type="hidden" id="canInvitation" value="${project.IS_USE_INVITATION}"/>
		<input type="hidden" id="canTicket" value="${project.IS_USE_TICKET}"/>
		<input type="hidden" id="canExchange" value="${project.IS_USE_EXCHANGE_RATE}"/>
		<input type="hidden" id="userBalance" value="${user.BALANCE}"/>
		
		<div class="invest1">
	    	项目剩余金额（元）：<span>${project.SURPLUS_RAISE_AMOUNT}</span>
	    </div>
	    <div class="invest2">
	    	<div class="box1">
	            <h3><input type="tel" name="amount" id="amount" maxlength="6" placeholder="请输入购买金额"><label>购买金额:</label><b>元</b></h3>
	            <p>起投金额为${project.LOWEST_AMOUNT < 100?'100':project.LOWEST_AMOUNT}元，以100的整数倍进行投资</p>
	        </div>
	        <div class="box2">
	        	<div>
	            	<h4>账户可用余额（元）</h4>
	                <p>${user.BALANCE}</p>
	            </div>
	        	<div>
	            	<h4>预计收益</h4>
	                <p class="red">0.00</p>
	            </div>
	        </div>
	    </div>
	    <div id="tip-tip" style="padding:0 0 3px 10px;display: none">
	    	您已获得<em style="color:red;">0.5%</em>加息
	    </div>
	    <div class="invest3 invite-code">
	    	<!-- 邀请码 -->
	    	<input type="text" name="invation_code" id="invation_code" placeholder="填写邀请码获取加息"/>
	    	<span id="checkInviteCode">获取加息</span>
	    </div>
	   	<c:if test="1==2">
		    <div class="invest3 exchange">
		    	<!-- 换手气 -->
		    	<input type="text" name="exchange_rate" id="exchange_rate" value="0.00%" placeholder="换手机，得加息" readonly="readonly"/>
		    	<span id="getExchange">试试换手气</span>
		    </div>
	    </c:if>
	    <div class="invest3 ticket">
	    	<select name="coupon_id" id="user-ticket">
		    	<c:choose>
		    		<c:when test="${not empty ticketList}">
		    			<option value="" data-price="0" data-enable="">使用投资券</option>
		    			<c:forEach items="${ticketList}" var="ticket">
		    				<option value="${ticket.UT_ID}" data-price="${ticket.DISCOUNT_AMOUNT}" data-enable="${ticket.ENABLE_MIN_AMOUNT}" data-surplus="${ticket.SURPLUS}">${ticket.TICKET_NAME}</option>
		    			</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    			<!-- value:投资券ID,price:优惠券优惠金额 ，enable:允许使用投资券最低金额 -->
		    			<option value="" data-price="" data-enable="">没有投资券可用</option>
		    		</c:otherwise>
		    	</c:choose>
	    	</select>
	    </div>
		<div class="invest4">
	    	实际投资金额（元）：<span>0</span>
	    </div>
	    <!-- <div class="invest5" >
	    	<input type="button" value="马上投资">
	    </div> -->
	    <div class="sec_zhu" id="is_jiaru">
			<a href="javascript:void(0)" id="buybuy">立即投资</a>
		</div>
	  </form>  	    
</div>
<%@include file="../common/foot.jsp" %>
<div class="h80"></div>
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
