<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<base href="<%=basePath%>">

<title>跳转中......</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/recharge.css">


</head>
<body>
	<div style="width: 100%;height: 100%;text-align: center;font-size: 16px;padding-top: 20px;">
		跳转中...
		<form name="kqPay" action="${rechargeParams.rechargeUrl}" method="post">
				<input type="hidden" name="inputCharset" value="${rechargeParams.inputCharset}" />
				<input type="hidden" name="pageUrl" value="${rechargeParams.pageUrl}" />
				<input type="hidden" name="bgUrl" value="${rechargeParams.bgUrl}" />
				<input type="hidden" name="version" value="${rechargeParams.version}" />
				<input type="hidden" name="language" value="${rechargeParams.language}" />
				<input type="hidden" name="signType" value="${rechargeParams.signType}" />
				<input type="hidden" name="signMsg" value="${rechargeParams.signMsg}" />
				<input type="hidden" name="merchantAcctId" value="${rechargeParams.merchantAcctId}" />
				<input type="hidden" name="payerIdType" value="${rechargeParams.payerIdType}" />
				<input type="hidden" name="payerId" value="${rechargeParams.payerId}" />
				<input type="hidden" name="payerName" value="${rechargeParams.payerName}" />
				<input type="hidden" name="payerContactType" value="${rechargeParams.payerContactType}" />
				<input type="hidden" name="payerContact" value="${rechargeParams.payerContact}" />
				<input type="hidden" name="orderId" value="${rechargeParams.orderId}" />
				<input type="hidden" name="orderAmount" value="${rechargeParams.orderAmount}" />
				<input type="hidden" name="orderTime" value="${rechargeParams.orderTime}" />
				<input type="hidden" name="productName" value="${rechargeParams.productName}" />
				<input type="hidden" name="productNum" value="${rechargeParams.productNum}" />
				<input type="hidden" name="productId" value="${rechargeParams.productId}" />
				<input type="hidden" name="productDesc" value="${rechargeParams.productDesc}" />
				<input type="hidden" name="ext1" value="${rechargeParams.ext1}" />
				<input type="hidden" name="ext2" value="${rechargeParams.ext2}" />
				<input type="hidden" name="payType" value="${rechargeParams.payType}" />
				<input type="hidden" name="bankId" value="${rechargeParams.bankId}" />
				<%-- <input type="hidden" name="cardNum" value="${rechargeParams.cardNum}" /> --%>
				<input type="hidden" name="redoFlag" value="${rechargeParams.redoFlag}" />
				<input type="hidden" name="pid" value="${rechargeParams.pid}" />
			</form>
	</div>
	<script type="text/javascript">
		window.onload = function(){
			document.forms[0].submit();
		}
	</script>
</body>
</html>