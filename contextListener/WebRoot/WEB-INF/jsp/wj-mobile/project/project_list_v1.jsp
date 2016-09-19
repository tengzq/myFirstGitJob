<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生 - 我要理财</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/project.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/dropload.css" />
<link href="wj-mobile-static/css/follow.css" rel="stylesheet" type="text/css">
<!-- <link href="wj-mobile-static/css/index.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>

<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="wj-mobile-static/js/dropload.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/project.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/follow.js" type="text/javascript"></script>
</head>

<body>
<%@include file="../common/head.jsp" %>
<input type="hidden" id="INVITE_CODE">
	<div class="droplist">
		<%-- <c:choose>
			<c:when test="${not empty projectList}">
				<c:forEach items="${projectList}" var="project">
					<section class="item">
						<div class="item-title">
							<a href="mobile/project/detail?ID=${project.ID}">${project.PROJECT_NAME}</a>
						</div>
						<div class="item-lilv clearfix">
							<dl>
								<dt>${project.BASE_INTEREST_RATE}<sub>%</sub></dt>
								<c:if test="${project.BOSS_INTEREST_RATE  ne '0.00'}">
									<dd><sub>+</sub>${project.BOSS_INTEREST_RATE}%</dd>
								</c:if>
								
							</dl>
							<a href="mobile/project/detail?ID=${project.ID}">马上投资</a>
						</div>
						<div class="item-sengyu">
							<ul class="clearfix">
								<li class="deadline">项目期限：${project.DEADLINE}天</li>
								<li class="money">剩余金额：${project.SURPLUS_RAISE_AMOUNT/10000}万元</li>
							</ul>
						</div>
					</section>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<section class="item">
					<div class="item-title"></div>
					<div class="item-lilv clearfix" style="text-align: center;font-size: 16px;">
						网络异常，请尝试刷新！
					</div>
					<div class="item-sengyu"></div>
				</section>
			</c:otherwise>
		</c:choose> --%>
	</div>
	<div id="waiting" class="waiting" style="height: 0;"><img src="wj-mobile-static/images/waiting.gif"/></div>
	<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
	<div class="concerned-mask">
		<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
		<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
		<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
	</div>
<!-- <div class="footer">
</div> -->
<!-- <script src="wj-mobile-static/js/zepto.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=1");
	val_array.push("WEB_OR_MOBILE=2");
	val_array.push("RANDOM_CODE="+randomCode);
	$.ajax({
	   type: "post",
	   url: "<%=basePath%>register/viewlog",
	   data: val_array.join('&'),
	   success: function(data){}
	 });
});

</script>
</body>
</html>
