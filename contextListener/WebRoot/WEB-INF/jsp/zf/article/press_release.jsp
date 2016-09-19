<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>融巢资本--${pd.TITLE }</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/article-common.css"/>
		<link rel="stylesheet" type="text/css"href="<%=basePath%>static/css/style.css" />
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
        <div class="main">
		<div class="mainbody">
        	 <%@include file="../public/article_nav.jsp" %>
        	 <div class="right">
             	<div class="gsjs">
                      <div class="maintit">
                          <span><b>最新动态</b></span>
                      </div>
                    <div class="con zxdt" style="padding:50px">
                    	<h2 style="font-size:24px;text-align: center;">${pd.TITLE }</h2>
                    	<img src="<%=basePath%>${pd.MARK_PATH}">
                    	<p style="line-height: 20px;word-wrap:break-word; word-break:normal;">${pd.ARTICLE_DESC}</p>
                    	<br>
                    	<iframe src="<%=basePath%>${pd.FILE_PATH}" style="width: 100%;height: 1500px;" id="iframe01"  scrolling="no" frameborder="0" marginheight="0" marginwidth="0"></iframe>
                    </div>
                </div>
             </div>
        	
          <%--    <div class="right">
             	<div class="fkgl">
                	<div class="maintit">
                    	<span><b>c</b></span>
                    </div>
                   <div class="con">
                    	<div class="box">
                            <p style="text-align:center; padding:30px 0">
                         	<img src="<%=basePath%>${pd.MARK_PATH}" style="max-width:440px;max-height:292px;">
                            </p>
                            <p>${pd.SUB_TITLE }</p>
                        </div>
                    	<div class="box">
                            <p>${pd.ARTICLE_DESC}</p>
                        </div>
                    </div>
                </div>
                
             </div> --%>
             <div class="clear"></div>
        </div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
	</body>
</html>

