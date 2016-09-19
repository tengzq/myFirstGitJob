<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html><!--<![endif]--><head>
<title>万金先生 - 自动投标</title>
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<base href="<%=basePath%>">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e"> -->
<meta name="renderer" content="webkit">
<!-- <link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/my.css"> -->
<!-- <script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="jingtai/js/trace.js"></script>
<script src="jingtai/js/hm.js"></script>
<script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432806515000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>

<script async="" src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript" async="" src="./auto_bid2_files/trace.js"></script>
<script src="./auto_bid2_files/hm.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>
<script type="text/javascript">
seed.config({
    baseUrl : CONFIG.BASE_URI + '/js/components/',
    alias : {
       jquery : CONFIG.BASE_URI + '/js/'+'jquery-1.11.1.min'
   } 
});
var _hmt = _hmt || [];
</script>
<link rel="stylesheet" type="text/css" href="./auto_bid2_files/my.css">
<script src="./auto_bid2_files/PagerView.js"></script>
<img src="./auto_bid2_files/v.do" height="1" width="1"></head> -->
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/autobid.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/autobid.js" type="text/javascript"></script>
</head>

<body style=" background:url(wj-static/images/logo_03.png)">
<%@include file="../public/top.jsp" %>
<div class="mainbody main">
	<%@include file="../public/acc_left.jsp" %>
    <div class="content">
    	<div class="gerenxinxi zidongtoubiao">
        	<h3>
            	<span>自动投标</span>
            </h3>
            
            <div class="autobid_panel">
				<div class="auto-bid-info">
					<div class="block bid_money clearfix">
						<h4>投资金额：</h4>
						<span class="h">${abInfo.MIN_MONEY}</span> --- <span class="h">${abInfo.MAX_MONEY}</span> 元
					</div>
					<div class="block bid_keep clearfix">
						<h4>保留金额：</h4>
						<span class="h">${abInfo.RESERVED_AMOUNT}</span> 元
					</div>
					<!-- <div class="block bid_invested clearfix">
							<h4>本金复投：</h4>
							次日				</div> -->
					<div class="block bid_time clearfix">
						<h4>项目期限：</h4>
							<span class="r-b">
								<c:forEach items="${fn:split(abInfo.DEADLINE,',')}" var="month" varStatus="sta">
								<c:if test="${!sta.first}">、</c:if>${month}月期</c:forEach>
						</span>
					</div>
				</div>
				<a id="edit" href="<%=basePath%>autobid/edit"><input type="button" value="修改设置" id="save"></a>
				
				<div class="alert">
					<span>
						<c:choose>
							<c:when test="${!abInfo.EARLY}">自动投标将在次日零点开启</c:when>
							<c:otherwise>自动投标开启中</c:otherwise>
						</c:choose>
					</span>
				</div>
			</div>
            
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@include file="../public/foot.jsp" %>
</body>
</html>


