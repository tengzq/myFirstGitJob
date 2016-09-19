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
    <title>转账申请结果</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
    
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/index.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/buy_result.css" />
  </head>
  
  <body>
  	<div style="height:60px;"></div>
  	<div class="resultbody">
  		<div class="bodyicon">
  			<c:if test="${msg=='success'}">
  				<img alt="success" src="wj-mobile-static/images/project_buy_success.png">
  			</c:if>
  			<c:if test="${msg=='fail'}">
  				<img alt="fail" src="wj-mobile-static/images/project_buy_fail.png">
  			</c:if>
  		</div>	
  		<div class="content">
  			<c:if test="${msg=='success'}">
  				<p>转账申请提交成功，请等待审核</p>
  			</c:if>
  			<c:if test="${msg=='fail'}">
  				<p>转账申请提交失败</p>
  			</c:if>
  			<p>
  				<a href="mobile/personal/info">
  					<input class="personal" type="button" value="返回个人中心"/>
  				</a>
  			</p>
  			<p>
  				<a href="mobile/personal/recharge">
  					<input class="projects" type="button" value="继续充值"/>
  				</a>
  			</p>
  		</div>
  	</div>
    <%@include file="../common/footer.jsp" %>
  </body>
</html>
