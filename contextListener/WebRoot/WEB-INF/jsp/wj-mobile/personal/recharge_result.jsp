<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>购买结果</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
    
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/layout.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/index.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/recharge_result.css" />
	
	<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="wj-mobile-static/js/recharge-confirm.js"></script>
  </head>
  
  <body>
  	<%@include file="../common/head.jsp" %>
  	<div style="height:30px;"></div>
  	<input type="hidden" id="orderId" value="${orderId}"/>
  	<div class="callback-title" <c:if test="${order == 'fail'}">style="display:none"</c:if>>
		<h3>充值结果正在确认中...</h3>
		<p class="countdown" id="countdown">10</p>
	</div>
  	
	<div class="resultbody" <c:if test="${order == 'success'}">style="display:none"</c:if>>
  		<div class="bodyicon">
  			<img alt="success" <c:if test="${order == 'success'}">src="wj-mobile-static/images/project_buy_success.png"</c:if><c:if test="${order == 'fail'}">src="wj-mobile-static/images/project_buy_fail.png"</c:if>>
  			
  		</div>	
  		<div class="content">
  			<p><c:if test="${order == 'fail'}">充值成功</c:if></p>
  			<p>
  				<a href="mobile/personal/info">
  					<input class="personal" type="button" value="返回个人中心"/>
  				</a>
  			</p>
  			<p>
  				<a href="mobile/project/list">
  					<input class="projects" type="button" value="去看看项目"/>
  				</a>
  			</p>
  		</div>
  	</div>
    <%@include file="../common/foot.jsp" %>
  </body>
</html>
