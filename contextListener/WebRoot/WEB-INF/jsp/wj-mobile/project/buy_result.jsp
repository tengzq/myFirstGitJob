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
    
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/buy_result.css" />
  </head>
  
  <body>
  	<div class="success">
		<img src="wj-mobile-static/ui2/images/${msg}.png"/>
		<p id="suc1">
			<c:choose>
				<c:when test="${msg == 'success'}">
					购买成功
				</c:when>
				<c:otherwise>
					购买失败
				</c:otherwise>
			</c:choose>
		</p>
		<p id="suc2"><a href="mobile/personal/info">返回个人中心</a></p>
		<p id="suc3"><a href="mobile/main">看看其他项目</a></p>
	</div>
	<%@include file="../common/footer_v2.jsp" %>
  </body>
</html>
