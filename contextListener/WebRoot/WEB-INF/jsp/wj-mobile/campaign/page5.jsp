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
</head>

<body>
<div class="page2 img100">
	<div class="p6" style="padding-top: 15px">
    	<img src="wj-mobile-static/images/gz_1.png">
    </div>
    <div class="p7" style="margin-top: 55px;">
    	<img src="wj-mobile-static/images/erweima_03.jpg">
    </div>
    <!-- <div class="p7">
    	<img src="wj-mobile-static/images/gtz.png">
    </div> -->
    <div class="p6" style="margin-top: 45px;">
    	<img src="wj-mobile-static/images/tz_1.png">
    </div>
    <!-- <div class="p8">
    	<p><input type="text" value="v158" readonly="readonly"><a href="javascript:void(0)"><button>获取加息</button></a></p>
    </div> -->
</div>

<%@include file="share.jsp" %>
</body>
</html>

