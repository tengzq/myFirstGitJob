
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
<title>融巢资本--服务协议</title>
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
			<%--  <%@include file="../../public/article_nav.jsp" %> --%>
			<div class="right">
				<div class="gsjs">
					<div class="maintit">
						<span><b>资金安全</b></span>
					</div>
					<div class="con">
						<%-- <img src="<%=basePath%>wj-static/rc/images/banner_03.jpg"> --%>
						<p>第三方资金托管</p>
						<p>	融巢宝委托第三方支付平台易宝支付进行资金托管。融巢宝不经手投资人资金，资金的流转不会经过融巢宝平台，平台也不会有任何权限去支配资金。资金的流转全部在第三方支付平台实现，以保障资金专用及安全。
						</p>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
