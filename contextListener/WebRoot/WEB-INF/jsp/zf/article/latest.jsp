
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
<title>融巢资本--最新动态</title>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>static/css/style.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/article-common2.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body style="background:#f9f9f9">
	<%@include file="../public/header_v2.jsp"%>
	<div class="main">
		<div class="mainbody">
			<%@include file="../public/article_nav.jsp"%>
			<div class="right" style="margin-left: 20px;">
				<div class="zxdt">
					<div class="maintit">
						<span><b>最新动态</b></span>
					</div>
					<div class="con">
						<c:forEach items="${lis }" var="vars" varStatus="it">
							<dl>
								<dt>
									<a href="<%=basePath%>information/pressRelease?ARTICLE_ID=${vars.ARTICLE_ID }" target="_blank"><img src="<%=basePath%>${vars.MARK_PATH }"></a>
								</dt>
								<dd>
									<a href="<%=basePath%>information/pressRelease?ARTICLE_ID=${vars.ARTICLE_ID }" style="color: #666;" target="_blank"><h3>${vars.TITLE }</h3></a>
									<h4 class="js_len">${vars.ARTICLE_DESC }</h3>
									<span>${vars.CREATE_DATE }</span>
								</dd>
							</dl>
						</c:forEach> 
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script>
	var maxLen = 150;
	for (var i = 0; i < $(".js_len").length; i++) {
		if($(".js_len").eq(i).html().length > maxLen) {
			$(".js_len").eq(i).html($(".js_len").eq(i).html().substring(0,maxLen)+"...");
		}
	}
	</script>
	<%@include file="../public/foot_v2.jsp"%>
</body>
</html>
