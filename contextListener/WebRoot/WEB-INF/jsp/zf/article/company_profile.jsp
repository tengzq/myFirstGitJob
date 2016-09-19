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
<meta charset="utf-8">
<base href=<%=basePath %>>
<title>万金先生</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/article.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/article.js" type="text/javascript"></script>
</head>
<body style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="article clearfix">
	<div class="fl left-menu">
		<div class="title">万金先生</div>
			<ul>
				<!-- <li>公司介绍</li>
				<li>团队介绍</li>
				<li>联系我们</li>
				<li>加入我们</li> -->
				<c:forEach items="${listArticle }" var="list">
					<c:if test="${list.PROGRAM_ID==4 }">
						<li id="${list.ARTICLE_ID }">${list.TITLE }</li>
					</c:if>
				</c:forEach>
				<li id="latest">最新动态</li>
				<li id="press">媒体报道</li>
			</ul>
			<div class="title">安全保障</div>
			<ul>
				<!-- <li class="hover">安全保障</li>
				<li>法律保障</li> -->
				<c:forEach items="${listArticle }" var="list">
					<c:if test="${list.PROGRAM_ID==5 }">
						<li id="${list.ARTICLE_ID }">${list.TITLE }</li>
					</c:if>
				</c:forEach>
			</ul>
			<div class="title">相关协议</div>
			<ul>
				<!-- <li class="hover">安全保障</li>
				<li>法律保障</li> -->
				<c:forEach items="${listArticle }" var="list">
					<c:if test="${list.PROGRAM_ID=='7' }">
						<li id="${list.ARTICLE_ID }">${list.TITLE }</li>
					</c:if>
				</c:forEach>
			</ul>
			<div class="title">帮助中心</div>
			<ul>
				<!-- <li class="hover">安全保障</li>
				<li>法律保障</li> -->
				<c:forEach items="${listArticle }" var="list">
					<c:if test="${list.PROGRAM_ID==6 }">
						<li id="${list.ARTICLE_ID }">${list.TITLE }</li>
					</c:if>
				</c:forEach>
			</ul>
		</div>		
	<div class="mainbody main fr">
		<div class="pg-container-content">
     		<div class="pg-guide-title" style="display:none">
          	  <h1 class="h3">${pd.TITLE }</h1>
            
    		</div>
	   		<div class="clear"></div>
			<div id="pg-guide-one" class="pg-guide-sercurity">
			</div>
    	</div>
	</div>
</div>


	
		
<script type="text/javascript">
$(function(){
	
	if('${latest}'=='news'){
		$('#latest').click()
		$('#latest').addClass('hover');
	}else if('${flag}' == 'press'){
		$('#press').click();
		$('#press').addClass('hover');
	}else{
		$(".pg-guide-sercurity").html("").load("${pd.FILE_PATH}",function(){
			$('#${pd.ARTICLE_ID}').addClass('hover');
		});
	}
	//$("li:contains('安全保障')").last().addClass('hover');
	/* var uriArray = location.href.split('/');
	//console.log(uriArray);
	if(uriArray[uriArray.length-1].substr(0,6)=='latest'){
		$('#latest').addClass('hover');
	} */
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=7");
		val_array.push("WEB_OR_MOBILE=1");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
	
});

</script>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
</body>
</html>