<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>绑定银行卡</title>
	<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
	<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	
	<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
	<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
	<link rel="stylesheet" href="wj-mobile-static/ui2/css/bindcard.css"/>
	
	<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="wj-mobile-static/js/jquery.tips.js"></script>
	<!-- <script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script> -->
	<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/bindcard.js" type="text/javascript"></script>
</head>

<body>
<div class="top2">绑定银行卡</div>
	<div class="bangding ddd">
		<p>
			<span class="icon-span b">
				<i class="fa fa-user fab"></i>
			</span>
			<c:set value="${pd.REAL_NAME}" var="RN"></c:set>
			<input type="text" value="持卡人姓名：*${fn:substring(RN,1,fn:length(RN))}" placeholder="请输入持卡人姓名" readonly="readonly"/>
        	<input type="hidden" id="userName" name="REAL_NAME" value="${pd.REAL_NAME }" readonly="readonly">
        	<input type="hidden" id="identityNo" name="IDENTITY" placeholder="身份证号" value="${pd.IDENTITY }" readonly="readonly">
		</p>
		<p>
			<span class="icon-span">
				<i class="fa fa-bank fab"></i>
			</span>
			<select name="BANK_CARD_NAME" id="bankCode" onchange="bank();">
				<option value="">选择银行</option>
                <option value="3001">招商银行</option>
                <option value="3026">中国银行</option>
                <option value="3002">中国工商银行</option>
                <option value="3003">中国建设银行</option>
                <option value="3005">中国农业银行</option>
                <option value="3020">交通银行</option>
                <option value="3004">上海浦东发展银行</option>
                <option value="3006">中国民生银行</option>
                <option value="3009">兴业银行</option>
                <option value="3039">中信银行</option>
                <option value="3022">中国光大银行</option>
                <option value="3038">中国邮政储蓄所</option>
                <option value="3035">平安银行</option>
                <option value="3036">广发银行</option> 
			</select>
			<!-- <i class="fa-angle-down fd"></i> -->
		</p>
		<p>
			<span class="icon-span c">
				<i class="fa fa-lock fab"></i>
			</span>
			<input type="tel" id="cardNo" name="BANK_CARD" value="" placeholder="请输入银行卡号"/>
		</p>
		<p>
			<span class="icon-span b">
				<i class="fa fa-chain fab"></i>
			</span>
			<select id="region">
				<option>开户省份</option>
			</select>
			<!-- <i class="fa-angle-down fd"></i> -->
		</p>
		<p>
			<span class="icon-span b">
				<i class="fa fa-chain fab"></i>
			</span>
			<select id="city">
				<option>开户城市</option>
			</select>
			<!-- <i class="fa-angle-down fd"></i> -->
		</p>
		<p id="tj"><a href="javascript:void(0)" id="acceptBtn">提交</a></p>
	</div>
	<%@include file="../common/main_nav.jsp" %>
	<%@include file="../common/foot_v2.jsp" %>
</body>
</html>
