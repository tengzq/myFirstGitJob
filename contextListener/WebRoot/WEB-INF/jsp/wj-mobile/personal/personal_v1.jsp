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
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/personal.css"/>
<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>

<style type="text/css">
	.unread-tag{
	    display: inline-block;
	    background-color: red;
	    width: 6px;
	    height: 6px;
	    margin-bottom: 2px;
	    border-radius: 50%;
	}
</style>

</head>

<body>
<%@include file="../common/head.jsp" %>
<div class="mainbody member">
	<div class="member1">
    	<i class="fa fa-meh-o "></i>您好，<span>${pd.USERNAME }</span><a href="mobile/signout"><i class="fr fa fa-sign-out" style="margin-right: 5px;"></i></a>
    </div>
    <div class="member2">
    	<p><i class="fa fa-money "></i>可用余额（元）：</p>
        <h3>
        	<c:if test="${empty pd.BALANCE }">
				0.00
			</c:if>
			<c:if test="${not empty pd.BALANCE }">
				${pd.BALANCE }
			</c:if>
        </h3>
    </div>
    <div class="member3">
    	<ul>
        	<li>
        		<h3>总资产（元）</h3>
        		<p>${pd.totalCapital+pd.totalAccrual+pd.FROZEN_AMOUNT+pd.BALANCE}</p>
        	</li>
        	<li>
        		<h3>累计收益（元）</h3>
        		<p>
        			<c:if test="${empty pd.YISHOU }">
						0.00
					</c:if>
					<c:if test="${not empty pd.YISHOU }">
						${pd.YISHOU }	
					</c:if>
        		</p>
       		</li>
        	<li>
        		<h3>待收本金（元）</h3>
        		<p>
        			<c:if test="${empty pd.totalCapital }">
						0.00	
					</c:if>
					<c:if test="${not empty pd.totalCapital }">
						${pd.totalCapital }	
					</c:if>
        		</p>
        	</li>
        	<li>
        		<h3>待收利息（元）</h3>
        		<p>
        			<c:if test="${empty pd.totalAccrual }">
						0.00
					</c:if>
					<c:if test="${not empty pd.totalAccrual }">
						${pd.totalAccrual }
					</c:if>
        		</p>
        	</li>
        </ul>
    </div>
    <div class="member4">
    	<ul>
        	<!-- <li><a href="#"><img src="wj-mobile-static/images/member_09.png"><p>零钱计划</p></a></li>
        	<li><a href="#"><img src="wj-mobile-static/images/member_11.png"><p>体验金</p></a></li>
        	<li><a href="#"><img src="wj-mobile-static/images/member_13.png"><p>变现管理</p></a></li> -->
        	<li><a href="mobile/personal/calendar"><i class="fa fa-calendar"></i><p>回款日历</p></a></li>
        	<li><a href="mobile/personal/investmentRecord"><i class="fa fa-file-text"></i><p>投资记录</p></a></li>
        	<li><a href="mobile/personal/fundsflow"><i class="fa fa-list-alt"></i><p>资金流水</p></a></li>
        	<li><a href="mobile/personal/ticket"><i class="fa fa-ticket"></i><p>投资券</p></a></li>
        	<li><a href="mobile/personal/invite"><i class="fa fa-user-plus bluebgc"></i><p>邀请码机制</p></a></li>
        	<li><a href="mobile/personal/drawcash"><i class="fa fa-money bluebgc"></i><p>余额提现</p></a></li>
        	<li><a href="mobile/personal/recharge"><i class="fa fa-usd bluebgc"></i><p>账户充值</p></a></li>
        	<li><a href="mobile/personal/message"><i class="fa fa-envelope-o bluebgc"></i><p><c:if test="${unread=='show'}"><!-- <i class="fa fa-circle" style="color:red;height: 0;width: 0;line-height: 0;font-size: 10px;"></i> --><span class="unread-tag"></span>&nbsp;</c:if>站内信</p></a></li>
        </ul>
    </div>
    <!-- <div class="member5">
    	<a href="mobile/personal/drawcash"><button>提取</button></a>
    	<a href="mobile/personal/recharge"><button>充值</button></a>
    </div> -->
</div>
<%@include file="../common/foot.jsp" %>
<!-- <div class="h80"></div> -->
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
