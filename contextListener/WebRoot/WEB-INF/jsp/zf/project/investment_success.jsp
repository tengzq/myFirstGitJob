<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>融巢资本--投资成功</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/buy-result.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
		
        <div class="main">
        	<div class="bfff">
            	<div class="tzcg">
                	<img src="<%=basePath%>wj-static/rc/images/gmcg_03.jpg">
                    <h2>投资成功</h2>
                    <p>您的投资已经开始产生收益啦！</p>
                    <div class="btn">
                    	<a href="<%=basePath%>_project/goInvestmentRecord"><button>查看投资记录</button></a>
                    	<a href="<%=basePath%>_project/goProjectList"><button>继续看看项目</button></a>
                    </div>
                </div>
            </div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
	</body>
</html>
