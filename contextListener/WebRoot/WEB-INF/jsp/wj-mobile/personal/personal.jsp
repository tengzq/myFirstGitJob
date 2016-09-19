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
<title>万金先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/personal.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>

<style type="text/css">
	
</style>

</head>

<body>
<div class="top">
	<a href="mobile/signout">
		<span>
			<i class="fa fa-arrow-circle-o-right"></i>
		</span>
	</a>
</div>
<div class="content">
	<div class="p31 bb_shadow">
    	<div class="main">
            <div class="yuan">
                <!-- <img src="wj-mobile-static/ui2/images/yu.png"> -->
                <div class="face">
                	<div class="user lanzi">
                		${pd.USERNAME }
                	</div>
                </div>
            </div>
            <div class="p312">
                <dl class="fl">
                    <dt class="lanzi">
                    	<c:if test="${empty pd.BALANCE }">
							0.00
						</c:if>
						<c:if test="${not empty pd.BALANCE }">
							${pd.BALANCE }
						</c:if>
                    </dt>
                    <dd>可用余额（元）</dd>
                </dl>
                <dl class="fr">
                    <dt class="lanzi">${pd.totalCapital+pd.totalAccrual+pd.FROZEN_AMOUNT+pd.BALANCE+pd.AMOUNTALL}</dt>
                    <dd>总资产（元）</dd>
                </dl>
            </div>
            <div class="p313">
            	<dl>
                	<dt><img src="wj-mobile-static/ui2/images/page3_11.jpg"></dt>
                    <dd>
                    	<h3>
                    		<c:if test="${empty pd.YISHOU }">
								0.00
							</c:if>
							<c:if test="${not empty pd.YISHOU }">
								${pd.YISHOU }	
							</c:if>
                    	</h3>
                        <p>累计收益</p>
                    </dd>
                </dl>
            	<dl>
                	<dt><img src="wj-mobile-static/ui2/images/page3_13.jpg"></dt>
                    <dd>
                    	<h3>
                    		<c:if test="${empty pd.totalCapital }">
								0.00	
							</c:if>
							<c:if test="${not empty pd.totalCapital }">
								${pd.totalCapital }	
							</c:if>
                    	</h3>
                        <p>待收本金</p>
                    </dd>
                </dl>
            	<dl>
                	<dt><img src="wj-mobile-static/ui2/images/page3_15.jpg"></dt>
                    <dd>
                    	<h3>
                    		<c:if test="${empty pd.totalAccrual }">
								0.00
							</c:if>
							<c:if test="${not empty pd.totalAccrual }">
								${pd.totalAccrual }
							</c:if>
                    	</h3>
                        <p>待收利息</p>
                    </dd>
                </dl>
            </div>
        </div>
        
    </div>
    <div class="p32 main bb_shadow">
        <div class="list">
            <ol>
                <li>
                    <a href="mobile/personal/calendar">
                        <img src="wj-mobile-static/ui2/images/page3_21.jpg">
                        <p>回款日历</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/investmentRecord">
                        <img src="wj-mobile-static/ui2/images/page3_23.jpg">
                        <p>投资记录</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/fundsflow">
                        <img src="wj-mobile-static/ui2/images/page3_25.jpg">
                        <p>资金流水</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/recharge">
                        <img src="wj-mobile-static/ui2/images/page3_37.jpg">
                        <p>账户充值</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/drawcash">
                        <img src="wj-mobile-static/ui2/images/page3_32.jpg">
                        <p>余额提现</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/invite">
                        <img src="wj-mobile-static/ui2/images/page3_31.jpg">
                        <p>邀请码机制</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/ticket">
                        <img src="wj-mobile-static/ui2/images/page3_30.jpg">
                        <p>投资券</p>
                    </a>
                </li>
                <li>
                    <a href="mobile/personal/message">
                        <img src="wj-mobile-static/ui2/images/page3_39.jpg">
                        <p><c:if test="${unread=='show'}"><span class="unread-tag"></span>&nbsp;</c:if>站内信</p>
                    </a>
                </li>
            </ol>
        </div>
        <%@include file="../common/main_nav.jsp" %>
    </div>
</div>
<%@include file="../common/foot_v2.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=8");
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
