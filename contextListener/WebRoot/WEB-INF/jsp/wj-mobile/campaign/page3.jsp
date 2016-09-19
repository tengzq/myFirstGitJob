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
<div class="index">
	<div class="i1">
    	<img src="wj-mobile-static/images/index3.png" style="padding:20px 0">
    </div>
    <div class="i4">
    	<a href="mobile/campaign?p=5"><img src="wj-mobile-static/images/555.png"></a>
    </div>
    <div class="i3">
    	<a href="mobile/campaign?p=5" class="fz18">点击关注</a>
        <br/>
    	<!-- <a href="mobile/campaign?p=4">活动介绍</a> -->
    </div>
    <audio style="display: none" id="coin-audio" preload="auto" src="<%=basePath%>wj-mobile-static/audio/coin.aac" data-src="<%=basePath%>wj-mobile-static/audio/coin.aac"></audio>
    <audio style="display: none" id="beng-audio" preload="auto" src="<%=basePath%>wj-mobile-static/audio/beng.mp3" data-src="<%=basePath%>wj-mobile-static/audio/beng.mp3"></audio>
</div>

<script type="text/javascript">
	/* var animationImg = document.querySelectorAll('.i4 img')[0];
	animationImg.addEventListener("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",function(){
		alert('123');
	},false)
	if(animationImg.addEventListener){
		console.log('123')
	} */
	$(function(){
		
	})
	var audio2 = document.getElementById('beng-audio');
	var audio = document.getElementById('coin-audio');
	audio2.play();
	setTimeout(function(){
		//console.log('coin acc');
		audio2.pause();
		audio.play();
	},2800)
</script>
<%@include file="share.jsp" %>
</body>
</html>

