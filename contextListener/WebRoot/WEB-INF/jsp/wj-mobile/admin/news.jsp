<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>${pd.TITLE}</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
	<link rel="stylesheet" href="wj-mobile-static/css/mobilenews.css"/>
	<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
	<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
  </head>
  
  <body>
  	<%@include file="../common/head.jsp" %>
    <div id="content"></div>
  </body>
  <script type="text/javascript">
  	$(function(){
  		$('#content').load('${pd.FILE_PATH}');
  	});
  </script>
</html>
