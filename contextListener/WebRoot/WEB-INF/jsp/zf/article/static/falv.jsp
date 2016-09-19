
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
	href="<%=basePath%>wj-static/rc/css/article-common2sba.css" />
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
						<span><b>法律保障</b></span>
					</div>
					<div class="con">
					<img src="<%=basePath%>wj-static/images/falv_03.jpg" class="fr">
						<%-- <img src="<%=basePath%>wj-static/rc/images/banner_03.jpg"> --%>
					<p>京都律师事务所受聘作为我们的常年法律顾问，为我们提供强大的法律支持。京都成立于1995年，为国内较早设立的合伙制律师事务所之一，目前在北京、上海、深圳、大连设有分支机构，京都拥有300余 名执业律师及专业人员，国内外著名法律学府的教育背景以及金融、知识产权、国际贸易等行业企业、行业协会、大学、国外知名律师事务所和政府部门的工作经历 使得京都律师在各自业务领域能够为客户提供高标准的法律服务，包括刑事诉讼、民商诉讼、企业风险防控、金融、证券、房地产与基础设施、公司、破产重整、知 识产权、能源与环保、信息技术、国际、海商海事等十三个业务领域。
关于融巢宝网站的合法性，请参阅下文：</p>
<p>
一、关于融巢宝网站投资模式的合法性
根据《民法通则》第七十一条财产所有权是指所有人依法对自己的财产享有占有、使用、收益和处分的权利。融巢宝网站提供转让方转让其持有金融财产部分或全部权利的机会，符合现行法律的规定。</p>
<p>二、关于融巢宝网站提供服务的合法性
根据《合同法》第23章关于"居间合同"的规定，特别是第424条规定的"居间合同是居间人向委托人报告订立合同的机会或者提供订立合同的媒介服务，委托人支付报酬的合同"，融巢宝网站为客户提供投资机会的居间服务有着明确的法律基础。</p>
<p>三、关于电子合同的合法性
根据《电子签名法》的规定，民事活动中的合同或者其他文件、单证等文书，当事人可以约定使用电子签名、数据电文，不能因为合同采用电子签名、数据电文就否定其法律效力。同时，《电子签名法》中还规定，可靠的电子签名与手写签名或者盖章具有同等的法律效力，明确肯定了符合条件的电子签名与手写签名或盖章具有同等的效力。</p>
					
						
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
