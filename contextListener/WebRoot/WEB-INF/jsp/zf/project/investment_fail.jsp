<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

	<%@include file="../public/header_v2.jsp" %>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/buy-result.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
        <div class="main">
        	<div class="bfff">
            	<div class="tzcg">
                    <p>${msg}</p>
                    <div class="btn">
                    	<a href="<%=basePath%>_project/goInvestmentRecord"><button>查看投资记录</button></a>
                    	<a href="<%=basePath%>_project/goProjectList"><button>继续看看项目</button></a>
                    </div>
                </div>
            </div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
