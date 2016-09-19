<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<title>账房先生</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
	<script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
	
	<style type="text/css">
	    .dashedbox{
	          padding: 5px 15px;
	          border-top: 1px solid #909090;
	          /* border-bottom: 1px dashed #909090; */
	          background-color: #fff;
	    }    
	</style>

</head>

<body>
<%@include file="head.jsp" %>
<div class="mainbody record">
	<div class="listor">
		<ul style="margin-top:0px;">
	    	<li style="border:0">
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>实名认证身份认证无法通过</dt>
	                <dd>
	                    <div class="dashedbox">
	                        您是否之前在公安身份系统中有变更过身份信息，如若没有，请致电客服4008-337-520。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>充值成功，但是余额没有增加</dt>
	                <dd>
	                    <div class="dashedbox">
	                        在充值过程中会遇到各种问题可能导致充值数据未同步。此时请您稍后片刻进行刷新页面，查看是否充值已到账。如果刷新未能解决问题，请您致电客服4008-337-520。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>网上无法充值怎么回事？</dt>
	                <dd>
	                    <div class="dashedbox">
	                        因为受银行系统兼容性的限制，某些银行的充值只能在 Windows 操作系统上进行，建议使用特定版本的IE浏览器（一般是IE6以上、IE10以下）尝试一下。同时，请留意银行网上银行页面的提示，如确定充值数额是否超过银行卡的转账额度限制等。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>提现有哪些注意事项</dt>
	                <dd>
	                    <div class="dashedbox">
	                        1）提现每笔/2元手续费。<br> 
	                        2）提现需要绑定提现银行卡，并确保您填写的银行账号的开户人姓名和您在开启托管账户时填写的真实姓名一致，否则无法成功提现。注意：绑定银行卡验证需要时间较长，大行T+1完成（不受节假日影响）；小行大于T+1完成（受节假日影响）；提现操作大行T+1完成（受节假日影响）；小行大于T+1完成（受节假日影响）。
	                        附12家大行名单：工商银行、农业银行、中国银行、建设银行、交通银行、招商银行、平安银行、光大银行、中信银行、北京银行、民生银行、兴业银行 <br> 
	                        3）当日充值金额，当日不可提现。 <br> 
	                        4）当日申请提现，次日到账。 <br> 
	                        5）最小提现金额为100元。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>可以用信用卡进行充值吗？</dt>
	                <dd>
	                    <div class="dashedbox">
	                       不可使用信用卡进行充值
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>投资利息从什么时候开始计算？</dt>
	                <dd>
	                    <div class="dashedbox">
	                        万金计划：从投标次日开始计息，次日项目未满，由平台贴息。<br>
	                        零钱计划：当日计息。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>借款企业未按时还款怎么处理？</dt>
	                <dd>
	                    <div class="dashedbox">
	                        我们的项目均是由担保方100% 本息担保的，如果借款企业无法还款，会有担保方代偿本金和利息，保障投资人的利益。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>投资的本金与利息如何回款？</dt>
	                <dd>
	                    <div class="dashedbox">
	                        投资人无须任何操作。借款人只要在规定的时间内还款，账款就会自动打入您的托管平台账号，这时您也可以进行提现操作。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>投资后是否可以撤回</dt>
	                <dd>
	                    <div class="dashedbox">
	                        投资成功后，无法撤回投资。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>投资券是如何使用的？</dt>
	                <dd>
	                    <div class="dashedbox">
	                     投资券分为加息券、现金券、抵扣券，具体使用规则详见官网介绍。另外投资券不能叠加使用，每次投资只能使用一张优惠券。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	        <li>
	            <dl>
	                <dt><i class="fa fa-chevron-down fr"></i><b class="fr"></b>项目期限是如何计算的？</dt>
	                <dd>
	                    <div class="dashedbox">
	                        在首页及项目标题中的以月为单位的项目期限是万金先生为了方便用户更加直观地判断项目期限，而通过项目的实际存续天数除以每月30天得来的近似值。投资真实的计息时间仍将以项目详情里的存续天数为准。
	                    </div>
	                </dd>
	            </dl>
	        </li>
	    </ul>
    </div>
</div>
<%@include file="foot.jsp" %>
<!-- <div class="h80"></div> -->
<script type="text/javascript">
	
    /* var color = new Array('#fff', '#ff0', '#f00', '#000', '#00f', '#0ff');  
	if(window.DeviceMotionEvent) {  
	    var speed = 50;  
	    var x = y = z = lastX = lastY = lastZ = 0;  
	    window.addEventListener('devicemotion', function(){  
	        var acceleration =event.accelerationIncludingGravity;  
	        x = acceleration.x;  
	        y = acceleration.y;  
	        if(Math.abs(x-lastX) > speed || Math.abs(y-lastY) > speed) {  
	            document.body.style.backgroundColor = color[Math.round(Math.random()*10)%6]; 
	            alert('shake shake'); 
	        }  
	        lastX = x;  
	        lastY = y;  
	    }, false);  
	}  */
</script>
</body>
</html>
