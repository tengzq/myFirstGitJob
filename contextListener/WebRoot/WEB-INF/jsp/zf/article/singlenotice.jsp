<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>融巢资本--首页</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/notice-info.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
		
        <div class="main">
			<div class="mainbody">
				<div class="listconnav">
					<a href="<%=basePath %>">融巢资本</a>
					>
					<a href="<%=basePath %>zfarticle/notice">新闻公告</a>
					>
					<b>${toResult.TITLE}</b>
				</div>
	             <div class="lc1">
	             	
	             </div>
	             <div class="clear"></div>
        	</div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
		<script type="text/javascript">
			$(function(){
				$(".lc1").html("").load("${toResult.FILE_PATH}");
			});
		</script>
	</body>
</html>
