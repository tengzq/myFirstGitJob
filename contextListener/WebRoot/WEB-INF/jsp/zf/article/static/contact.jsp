
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<!-- fuxieyi -->
<title>融巢资本--加入我们</title>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/article-common2.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body style="background:#f9f9f9">
	<%@include file="../../public/header_v2.jsp"%>
	<div class="main">
		<div class="mainbody">
			<%@include file="../../public/article_nav.jsp" %> 
			<div class="right">
				<div class="gsjs">
					<div class="maintit">
						<span><b>联系我们</b></span>
					</div>
				  <div class="con">
                    	<div class="box pl0">
                            <p>地址：北京市东城区东直门外大街48号东方银座写字楼20A </p>
                            <p>客服电话：400-658-1868</p>
                            <p>商务合作：bd@lmf9.com</p>
                            <p>微信：lmf9com</p>
                            <p>微博：lmf9com </p>
                            <p>客服邮箱：kf@lmf9.com</p>
                            <img src="<%=basePath%>wj-static/images/498275398639496716.jpg" style="width:64%; padding:30px 0;">
                        </div>
                    	
                    </div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
