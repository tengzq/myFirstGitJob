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
                    	<span><b>资金安全</b></span>
                    </div>
                   <div class="con">
                    	<div class="box">
                    		<h3>1、第三方资金托管</h3>
                            <p style="text-align:center; padding:30px 0">
                            	<img src="<%=basePath%>wj-static/images/yibaozhifu_03.jpg">
                            </p>
                            <p>融巢宝委托第三方支付平台易宝支付进行资金托管。融巢宝不经手投资人资金，资金的流转不会经过融巢宝平台，平台也不会有任何权限去支配资金。资金的流转全部在第三方支付平台实现，资金的每一次流动都能被投资者清晰地监控，以保障资金专用及安全。
</p>
                        </div>
                    	<div class="box">
                    		<h3>2、风控制度保障：完善的风控流程</h3>
                            <p style="text-align:center; padding:30px 0">
                            	<img src="<%=basePath%>wj-static/images/zijinanquan_03.jpg">
                            </p>
                            <p>“风险准备金账户”是指融巢宝为所服务的所有投资人的共同利益考虑，以融巢宝名义单独开设并由银行进行资金托管的一个专款专用账户，用于保障投资人本息安全。</p>
                            <p>“风险准备金”来源于鸿蕴控股集团和借款人、合作机构缴纳的服务费。“风险准备金账户”资金将专门用于在一定限额内补偿融巢宝所服务的受保障借款的投资人（债权人）在借款人（债务人）逾期还款超过30日时剩余未还本金或剩余未还本金和逾期当期利息，即当借款人（债务人）逾期还款超过30日时，融巢宝将按照“风险准备金账户资金使用规则”从该账户中提取相应资金用于偿付投资人（债权人）在该笔受保障借款项下剩余未还本金或剩余未还本金和逾期当期利息金额。</p>
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

