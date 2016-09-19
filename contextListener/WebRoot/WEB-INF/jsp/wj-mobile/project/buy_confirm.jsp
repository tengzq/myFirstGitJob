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
<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/ui2/css/common.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/ui2/css/buy_confirm.css" rel="stylesheet" type="text/css">

<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
</head>

<body>
<%@include file="../common/head_v2.jsp" %>
<div class="suretd">
	<div class="doc">
		<p>项目名称： <span>${buyInfo.PROJECT_NAME}</span></p>
		<p>基础利率： <span>${buyInfo.baseRate}%</span></p>
		<p>老板贴息： <span>${buyInfo.bossRate}%</span></p>
		<p>邀请利率： <span>${buyInfo.invitationRate}%</span></p>
		<p>还款方式： <span>${buyInfo.REPAYMENT_MODE_DES}</span></p>
		<p>项目金额： <span><fmt:formatNumber type="number" value="${buyInfo.TOTAL_RAISE_AMOUNT/10000}" pattern="0.00" maxFractionDigits="2"/>万</span></p>
		<p>项目期限： <span>${buyInfo.deadline}天</span></p>
	</div>
	<div class="jine">
		<p>投资金额： <span id="ssp1"><fmt:formatNumber type="number" value="${buyInfo.amount}" pattern="0.00" maxFractionDigits="2"/>元</span></p>
		<p>预计收益： <span id="ssp2"><fmt:formatNumber type="number" value="${buyInfo.preIncome}" pattern="0.00" maxFractionDigits="2"/>元</span></p>
	</div>
</div>
<form action="mobile/project/doBuy" method="post">
	<input type="hidden" name="ID" value="${buyInfo.ID}">
	<input type="hidden" name="PROJECT_NAME" value="${buyInfo.PROJECT_NAME}">
	<input type="hidden" name="user_id" id="user_id" value="${buyInfo.user_id }">
	<input type="hidden" name="coupon_type" id="coupon_type" value="${buyInfo.coupon_type }">
	<input type="hidden" name="TICKET_AMOUNT" id="TICKET_AMOUNT" value="${buyInfo.TICKET_AMOUNT }">
	<input type="hidden" name="inviteRate" id="inviteRate" value="${buyInfo.inviteRate }"/>
	<input type="hidden" name="amount" id="amount" value="${buyInfo.amount }"/>
	<input type="hidden" name="invation_code" id="invation_code" value="${buyInfo.invation_code }"/>
	<input type="hidden" name="exchange_rate" id="exchange_rate" value="${buyInfo.exchange_rate }"/>
	<input type="hidden" name="coupon_id" id="coupon_id" value="${buyInfo.coupon_id }"/>
	<input type="hidden" name="TICKET_AMOUNT" id="TICKET_AMOUNT" value="${buyInfo.TICKET_AMOUNT}"/>
</form>
<div class="sure">
	<p id="psure" class="pat2"><a href="javascript:void(0);">确认</a></p>
</div>
<%@include file="../common/main_nav.jsp" %>
<%@include file="../common/foot_v2.jsp" %>
<script type="text/javascript">
	$('.sure a').one('click',function(){
		$('form')[0].submit();
	});
	
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=${buyInfo.ID}");
		val_array.push("SUB_PAGE=4");
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
