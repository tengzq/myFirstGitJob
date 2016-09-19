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
		<title>融巢资本--首页</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/article-common.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../../public/header_v2.jsp" %>
		
        <div class="main">
		<div class="mainbody">
        	 <%@include file="../../public/article_nav.jsp" %>
             <div class="right">
             	<div class="fkgl">
                	<div class="maintit">
                    	<span><b>新手指引</b></span>
                    </div>
                    <div class="con">
                    	<div class="box">
                    		<h3>1、分分钟了解融巢宝</h3>
                            <p>
                            	融巢宝(www.rongchaobao.com)是专注供应链投融资的专业化互联网金融理财平台，2015年12月1日正式上线，由融巢资本控股有限公司控股，融巢科技有限公司负责运营。
                            </p>
                            <p>
                            	融巢宝平台用户资金由易宝支付(中国行业支付的领军企业)负责第三方托管，项目质押物由中国人保(PICC)提供综合意外险保障，确保用户资金安全。更有实时回购、专业保管机构(北交所福丽特等)、风险准备金等机制全方位本息保障，为您提供银行级的安全理财，让您赚钱更放心。
                            </p>
                            <p>
                            	融巢宝(北京融巢投资有限公司)是中国互联网诚信示范单位、中国电子商务协会“品牌宝信誉档案库”备案成员、中国电子商务协会四星级可信网站、AA级别企业信用评级单位、中国电子认证服务产业联盟认证“互联网金融网站”、Geo Trust安全认证网站、中国互联网电子商务诚信企业。
                            </p>
                        </div>
                    	<div class="box">
                    		<h3>2、融巢宝的优势</h3>
                            <img src="<%=basePath%>wj-static/rc/images/guide_03.png">
                        </div>
                    </div>
                </div>
                
             </div>
             <div class="clear"></div>
        </div>
		</div>
		<%@include file="../../public/foot_v2.jsp" %>
	</body>
</html>
