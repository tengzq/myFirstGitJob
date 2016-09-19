<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>融巢资本</title>
<link href="<%=basePath%>wj-static/rc/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>wj-static/rc/css/layout.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>wj-static/rc/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="<%=basePath%>wj-static/rc/js/layout.js" type="text/javascript"></script>
</head>
<body>
<div class="header">
	<div class="top">
    	<div class="main">
            <div class="logo fl"><img src="<%=basePath%>wj-static/rc/images/index_02.jpg"></div>
            <div class="menu fl">
                <a href="<%=basePath%>" class="hover">首页</a>
                <a href="<%=basePath%>_project/goProjectList" class="goProjectList goDetails goInvestment goBuy">理财产品</a>
                <a href="<%=basePath%>information/about/guide" class="guide">新手指引</a>
                <a href="<%=basePath%>myAccount/list" class="list realName goInvestmentRecord payment qiyexinxi fundsList toTransfer">我的账户</a>
            </div> 
            <div class="nav fr">
            		<c:choose>
						<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
							<c:choose>
									<c:when test="${sessionScope.sessionZfBuUser.username == null||sessionScope.sessionZfBuUser.username ==''}">
									<a href="<%=basePath%>pluginsyPay/gobusinessReister">企业注册</a>
									</c:when>
									<c:otherwise>
									<a>企业已登陆</a>
									</c:otherwise>
							</c:choose>	
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
				</c:choose>	
            
                <c:choose>
						<c:when test="${sessionScope.sessionZfBuUser.username == null || sessionScope.sessionZfBuUser.username ==''}">
							<c:choose>
								<c:when test="${sessionScope.sessionZfUser.USERNAME == null || sessionScope.sessionZfUser.USERNAME ==''}">
									<a href="<%=basePath%>login_toZfLogin">登录</a>
								</c:when>
								<c:otherwise>
									<a href="<%=basePath%>register/out">登出</a>
								</c:otherwise>
							</c:choose>	
						</c:when>
						<c:otherwise>
									<a href="<%=basePath%>register/out">登出</a>
						</c:otherwise>
				</c:choose>	
                <a href="#"><img src="<%=basePath%>wj-static/rc/images/index_04.jpg"></a>
                <a href="#"><img src="<%=basePath%>wj-static/rc/images/index_06.jpg"></a>
                <a href="#"><img src="<%=basePath%>wj-static/rc/images/index_08.jpg"></a>
            </div>
        </div>
    </div>
<script>
	(function(){
		var url = top.location.href;
		var urls = url.split('/');
		var thisTab = urls[urls.length-1].split('?')[0];
		console.log(thisTab);
		$('.main .menu.fl').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
		
	})();
</script>