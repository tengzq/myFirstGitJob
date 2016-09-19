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
		<title>融巢资本--风控管理</title>
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
                    	<span><b>风控管理</b></span>
                    </div>
                    <div class="con">
                    	<div class="box">
                    		<h3>1、业务模式清晰：专注于供应链投融资</h3>
                            <img src="<%=basePath%>wj-static/rc/images/aaaa_03.jpg">
                            <ol>
                            	<li><span>实名认证：</span>个人借款进行身份证、手机、工作证等所需资料的认证；企业借款还须提供公司营业执照，组织机构代码，开户许可证等资质证明；</li>
                  
                            保理公司担保：保理公司交易对手多为上市企业的供应链上游，违约率低；
                            </ol>
                        </div>
                    	<div class="box">
                    		<h3>2、风控制度保障：完善的风控流程</h3>
                            <img src="<%=basePath%>wj-static/rc/images/aaa_03.jpg">
                            <p>（1） 遵守行业回购评判标准确定战略合作机构
</p>
                            <p>（2） 严格核查保理公司资质承保推荐优质项目</p>
                            <p>（3） 审核项目资料真实性进行初次审核</p>
                            <p>（4） 初审达标项目达标后风控决策会层层复核</p>
                            <p>（5） 风控决策会最终审核确保投资安全</p>
                            <p>（6） 由风控部门统一进行投后管理直至回款</p>
                        </div>
                    	<div class="box">
                    		<h3>3、细致详尽的背景调研：严格的贷前审查</h3>
                            <p>合作保障机构第一重审核，融巢宝平台风险控制部门第二重审核。
保障机构首先对保理公司进行资料审核及背景调查。审核包括近三个月内的银行对账单、征信报告、审计报告（企业提供）等必备材料。
融巢宝平台会对保理资料进行再次审核，并通过网络、电话进行详实、仔细的调查。在资料审核完成后，根据调查情况出具风险报告，由风控部门负责人进行审核确认后，最终决定审核结果。
</p>
                        </div>
                    	<div class="box">
                    		<h3>4、以终为始：完善的贷后管理</h3>
                            <p>平融巢宝平台及第三方合作保障机构对保理公司及质押物情况进行定期追踪检查。若发现保理公司未按规定用途使用款项，将采取相关措施制止，情况严重者，平台将停止对其融资。</p>
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
