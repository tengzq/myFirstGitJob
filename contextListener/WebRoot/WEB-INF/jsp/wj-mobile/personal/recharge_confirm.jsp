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
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link href="wj-mobile-static/css/recharge.css" rel="stylesheet" type="text/css">

<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody buy-confirm">
	<div style="display: none;">
		<ul class="project-info">
			<li>充值金额： <span>${amount}元</span></li>
			<li>银行卡号： <span>${bankCard}</span></li>
			<li>持卡人姓名： <span>${idHolder}</span></li>
			<li>持卡人身份证： <span>${idCard}</span></li>
		</ul>
		<p style="text-align: center;color: red;font-size: 14px;margin-top: 45px;">*充值银行卡必须为平台绑定银行卡*</p>
		<h3>确认</h3>
		<form action="${tradeParams.url}" method="post" id="baofooform">
			<input type="hidden" name="version" value="${tradeParams.version}"/><br>
    		<input type="hidden" name="input_charset" value="${tradeParams.inputCharset}"/><br>
    		<input type="hidden" name="language" value="${tradeParams.language}"/><br>
    		<input type="hidden" name="terminal_id" value="${tradeParams.terminalId}"/><br>
    		<input type="hidden" name="txn_type" value="${tradeParams.txnType}"/><br>
    		<input type="hidden" name="txn_sub_type" value="${tradeParams.txnSubType}"/><br>
    		<input type="hidden" name="member_id" value="${tradeParams.memberId}"/><br>
    		<input type="hidden" name="data_type" value="${tradeParams.dataType}"/><br>
    		<input type="hidden" name="data_content" value="${dataContent}"/><br>
    		<input type="hidden" name="back_url" value="${tradeParams.backUrl}"/><br>
		</form>
		
		
		<form name="kqPay" action="${kqParams.rechargeUrl}" method="post">
				<input type="hidden" name="inputCharset" value="${kqParams.inputCharset}" />
				<input type="hidden" name="pageUrl" value="${kqParams.pageUrl}" />
				<input type="hidden" name="bgUrl" value="${kqParams.bgUrl}" />
				<input type="hidden" name="version" value="${kqParams.version}" />
				<input type="hidden" name="mobileGateway" value="${kqParams.mobileGateway}" />			
				<input type="hidden" name="language" value="${kqParams.language}" />
				<input type="hidden" name="signType" value="${kqParams.signType}" />
				<input type="hidden" name="signMsg" value="${kqParams.signMsg}" />
				<input type="hidden" name="merchantAcctId" value="${kqParams.merchantAcctId}" />
				<input type="hidden" name="payerName" value="${kqParams.payerName}" />
				<input type="hidden" name="payerContactType" value="${kqParams.payerContactType}" />
				<input type="hidden" name="payerContact" value="${kqParams.payerContact}" />
				<input type="hidden" name="payerIdType" value="${kqParams.payerIdType}" />
				<input type="hidden" name="payerId" value="${kqParams.payerId}" />	
				<input type="hidden" name="orderId" value="${kqParams.orderId}" />
				<input type="hidden" name="orderAmount" value="${kqParams.orderAmount}" />
				<input type="hidden" name="orderTime" value="${kqParams.orderTime}" />
				<input type="hidden" name="productName" value="${kqParams.productName}" />
				<input type="hidden" name="productNum" value="${kqParams.productNum}" />
				<input type="hidden" name="productId" value="${kqParams.productId}" />
				<input type="hidden" name="productDesc" value="${kqParams.productDesc}" />
				<input type="hidden" name="ext1" value="${kqParams.ext1}" />
				<input type="hidden" name="ext2" value="${kqParams.ext2}" />
				<input type="hidden" name="payType" value="${kqParams.payType}" />
				<input type="hidden" name="bankId" value="${kqParams.bankId}" />
				<input type="hidden" name="redoFlag" value="${kqParams.redoFlag}" />
				<input type="hidden" name="pid" value="${kqParams.pid}" />
				
			</form>
	</div>
	<div style="text-align: center;font-size: 15px;">
		正在跳转至第三方平台...
	</div>
</div>
<%@include file="../common/foot.jsp" %>
<div class="h80"></div>
<script type="text/javascript">
	$('.buy-confirm h3').on('click',function(){
		$('#baofooform').submit();
	});
	window.onload = function(){
		document.forms[1].submit();
	}
</script>
</body>
</html>
