<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<title>提现</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
<link href="wj-mobile-static/ui2/css/reset.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/draw.css"/>

<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-mobile-static/js/sweetalert.min.js"></script>
<script type="text/javascript" src="wj-mobile-static/ui2/js/drawcash.js"></script>
</head>

<body>
	<div class="bangding ddd">
		<p>
			<span>
				<c:set value="${bankCardInfo.BANK_CODE}" var="bankCode"></c:set>
            	<c:set value="${bankCardInfo.BANK_CARD}" var="bankCard"></c:set>
                <img src="https://res.baofoo.com/gw/resource/images/yh/10${fn:substring(bankCode,2,fn:length(bankCode))}.jpg" alt="中国工商银行">尾号 ${fn:substring(bankCard,fn:length(bankCard)-4,fn:length(bankCard))}
			</span>
			<span>
				<a href="javascript:void(0);" id="removeBankCard" class="delete" bid="${bankCardInfo.BANK_CARD_ID}" style="float:right; padding-right:10px;">删除</a>
			</span>
			<!-- <br>
			<span>
				<span>工作日当天</span><span>1-3个工作日</span>
			</span> -->
		</p>
		<span class="warning">
			<c:set value="${sessionScope.sessionZfUser.REAL_NAME}" var="REAL_NAME"></c:set>
			*  银行卡必须为“<span id="userName">*${fn:substring(REAL_NAME,1,fn:length(REAL_NAME))}</span>”的借记卡，否则无法提现
		</span>
		<p>
			<span>
				可提额度（元）：${pd.BALANCE }
			</span>
			<input type="hidden" id="now-amount" value="${pd.BALANCE }">
		</p>
		<p>
			<input type="tel" id="amount" value="" placeholder="提现金额"/>
			<span class="icon-span">
				元
			</span>
		</p>
		<span style="color:red;text-align: center;"><span class="f-e valid-amount-em"> <em></em></span></span>
		<span class="alert">每笔提现要收取<b style="font-weight: bold;color: #E9953F;">2</b>元手续费<br>该手续费为<b style="font-weight: bold;color: #E9953F;">第三方资金托管平台</b>收取</span>
		<p id="tj" class="btn-1"><a href="javascript:void(0)">立即提现</a></p>
	</div>
	<div class="upper ddd">
		<p style="text-align: left;">
			<label style="width: 120px;">预留手机号码：</label> <label id="cashMoiblePhone" style="width: 200px; text-align: left;">150****8011</label>
			<input type="hidden" id="sessionTel" value="${sessionScope.sessionZfUser.TEL}"/>
		</p>
		<p id="imgVerify" style=" text-align: left;">
			<label style="width: 120px;">输入图片验证码：</label> 
			<input type="text" id="ImgVerifyCode" maxlength="6" name="imgVerifyCode" class="identifyingCode verifyInput"/> 
			<img alt="点击刷新" src="" id="imgCode"/>
			<!-- <input type="button" value="获取语音验证码" class="identifyingBtn" id="btnVoiceNum" style="cursor: pointer;"/> -->
		</p>
		<p id="verifyCodePanel" style=" text-align: left;">
			<label style="width: 120px;">输入手机验证码：</label> 
			<input type="text" id="VerifyCode" maxlength="6" name="VerifyCode" class="identifyingCode verifyInput" onkeyup="value=value.replace(/[^\d]/g,'') "/> 
			<input type="button" value="获取验证码" class="identifyingBtn sms-active" id="btnSmsNum" style="cursor: pointer;"/> 
			<!-- <input type="button" value="获取语音验证码" class="identifyingBtn" id="btnVoiceNum" style="cursor: pointer;"/> -->
		</p>
		<div class="clearfix"></div>
		<span class="errorArea">error</span>
		<p class="subm">
			<a href="javascript:void(0)" id="cancelSubmit">取消</a>
			<a href="javascript:void(0)" id="finalSubmit">提交</a>
		</p>
	</div>
	<%@include file="../common/main_nav.jsp" %>
	<%@include file="../common/foot_v2.jsp" %>
<script type="text/javascript">
	
</script>
</body>
</html>
