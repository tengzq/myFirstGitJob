<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 user-scalable=false">
	
	<title>万金理财，全民加息</title>
	<base href="<%=basePath%>"/>
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/campaign.css" rel="stylesheet" type="text/css">
	<script src="wj-mobile-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/campaign.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/shake.js" type="text/javascript"></script>
</head>

<body>
<div class="index">
	<div class="i1">
    	<img src="wj-mobile-static/images/index2.png">
    </div>
    <div class="i2">
    	<img src="wj-mobile-static/images/logo.png" class="rock">
    </div>
    <div class="i3">
    	<a href="javascript:void(0)" style="border: none">呦~呦~我说加息，你说要！</a>
    	<a href="javascript:void(0)" style="border: none">加息！要~加息！要~</a>
    	<audio style="display: none" id="shake-audio" src="<%=basePath%>wj-mobile-static/audio/shake.mp3" preload="auto" data-src="<%=basePath%>wj-mobile-static/audio/shake.mp3"></audio>
    </div>
</div>

<%@include file="share.jsp" %>
</body>
</html>

