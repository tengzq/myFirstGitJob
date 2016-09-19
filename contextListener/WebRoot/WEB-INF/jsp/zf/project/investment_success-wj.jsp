<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html><!--<![endif]-->
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 购买结果</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<%-- 
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/reset.css">
 --%>
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>jingtai/css/buy.css">
<meta name="renderer" content="webkit">
<script type="text/javascript" src="<%=basePath %>jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/seed.min.js"></script>
<script type="text/javascript" src="<%=basePath %>jingtai/js/jquery-1.7.2.min.js"></script>
<script src="jingtai/js/PagerView.js"></script>
<script type="text/javascript" src="jingtai/js/zz.js"></script>
<style type="text/css">
.exchangeRate{
display: block;
}
	#ft{
		margin-top: 0;
	}
</style>
</head>
<body>
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<!--错误增加class callback-error-->
<div class="callback-section">
	<div class="callback-main clearfix">
		<div class="main-left">
			<div class="callback-title">
				<h3>投资成功</h3>
				<p>您的投资已经开始产生收益啦!</p>
			</div>
			<div class="callback-action clearfix">
				<a href="<%=basePath %>_project/goInvestmentRecord" class="callback-btn c-btn-dark tongji" data-category="查看投资记录" data-label="callback">查看投资记录</a>
				<a href="<%=basePath %>_project/goProjectList" class="callback-btn c-btn-dark tongji" data-category="继续看看项目" data-label="callback">继续看看项目</a>
			</div>
		</div>
		<div class="main-right">
			<p>如此好的项目不值得向朋友推荐吗?</p>
			<a href="register/userinvite?ID=pg_yaoqingjiang" class="tongji" data-category="邀请好友去&gt;&gt;" data-label="callback" title="邀请好友去&gt;&gt;">邀请好友去&gt;&gt;</a>
		</div>
	</div>
	<!-- <div class="callback-banner">
		<a><img src="https://s1.lantouzi.com/img/201502/success_banner.png"/></a>
	</div> -->	
</div>

 </div>
<a style="position:fixed;width:123px;height:135px;bottom:350px;right:20px;background:url(&#39;wj-static/images/maodian.png&#39;) center top /cover no-repeat;cursor:pointer;" href="myAccount/userinvite" target="_blank"></a>		
		<%@ include file="../public/foot.jsp"%>
</body></html>