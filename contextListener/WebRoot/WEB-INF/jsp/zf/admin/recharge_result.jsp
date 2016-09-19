<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html><!--<![endif]-->
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 充值结果</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/rechargeResult.css">
<%-- 
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/reset.css">
 --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/common.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/buy.css"> --%>
<meta name="renderer" content="webkit">

<script type="text/javascript" src="wj-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-static/js/rechargeResult.js"></script>
<style type="text/css">
.exchangeRate{
display: block;
}
	#ft{
		margin-top: 0;
	}
</style>
</head>
<body>
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<!--错误增加class callback-error-->
<div class="callback-section">
	<input type="hidden" id="orderId" value="${orderId}"/>
	<div class="callback-main clearfix">
		<!-- <div class="main-left">
			
		</div> -->
		<div class="callback-title" <c:if test="${order=='fail' }">style="display:none"</c:if>>
			<h3>充值结果正在确认中...</h3>
			<p class="countdown" id="countdown">10</p>
		</div>
		<div class="response-body" <c:if test="${order=='success' }">style="display:none"</c:if>>
			<div class="recharge-response">
				<p style="font-size: 18px;color:#2e9dd0;"><c:if test="${order=='success' }">充值成功</c:if><c:if test="${order=='fail' }">充值失败</c:if></p>
				<img alt="" <c:if test="${order=='success' }">src="wj-static/images/success_icon.png"</c:if><c:if test="${order=='fail' }">src="wj-static/images/fail_icon.png"</c:if> style="margin:15px">
				
			</div>
			<div class="callback-action clearfix">
				<a href="<%=basePath %>myAccount/list" class="callback-btn c-btn-dark tongji" data-category="查看投资记录" data-label="callback">去个人中心</a>
				<a href="<%=basePath %>_project/goProjectList" class="callback-btn c-btn-dark tongji" data-category="继续看看项目" data-label="callback">继续看看项目</a>
			</div>
		</div>
	</div>
	<!-- <div class="callback-banner">
		<a><img src="https://s1.lantouzi.com/img/201502/success_banner.png"/></a>
	</div> -->	
</div>

 </div>
<a style="position:fixed;width:123px;height:135px;bottom:350px;right:20px;background:url(&#39;wj-static/images/maodian.png&#39;) center top /cover no-repeat;cursor:pointer;" href="myAccount/userinvite" target="_blank"></a>		
		<%@ include file="../public/foot.jsp"%>
</body></html>