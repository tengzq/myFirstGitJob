<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>确认</title>
    
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
	<meta name="apple-mobile-web-app-capable" content="yes"/>
	<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<form action="${tradeParams.url}" method="post">
    		充值金额<input type="text" value="${amount}"/><br>
    		1、version:<input type="text" name="version" value="${tradeParams.version}"/><br>
    		2、input_charset:<input type="text" name="input_charset" value="${tradeParams.inputCharset}"/><br>
    		3、language:<input type="text" name="language" value="${tradeParams.language}"/><br>
    		4、terminal_id:<input type="text" name="terminal_id" value="${tradeParams.terminalId}"/><br>
    		5、txn_type:<input type="text" name="txn_type" value="${tradeParams.txnType}"/><br>
    		6、txn_sub_type:<input type="text" name="txn_sub_type" value="${tradeParams.txnSubType}"/><br>
    		7、member_id:<input type="text" name="member_id" value="${tradeParams.memberId}"/><br>
    		8、data_type:<input type="text" name="data_type" value="${tradeParams.dataType}"/><br>
    		9、data_content:<input type="text" name="data_content" value="${dataContent}"/><br>
    		10、back_url:<input type="text" name="back_url" value="${tradeParams.backUrl}"/><br>
    		<input type="submit" value="充值"/>
    	</form>
  </body>
</html>
