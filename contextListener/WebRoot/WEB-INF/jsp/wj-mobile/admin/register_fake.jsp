<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>

<html>
<head>
<base href="<%=basePath%>"/>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生 - 欢迎注册</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/follow.css"/>
<link href="wj-mobile-static/ui2/css/reg.css" rel="stylesheet" type="text/css">
<!-- <script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script> -->
<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-mobile-static/js/jquery.tips.js"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
<script type="text/javascript" src="wj-mobile-static/ui2/js/register.js"></script>

</head>

<body style="background:#00a0e9">

<div class="mainbody">
    <div class="reg">
    	<div class="head">
    		<a href="mobile/main">
        		<img src="wj-mobile-static/ui2/images/logo_cn.png">
            </a>
        </div>
        <input type="hidden" name="INVITE_ME" id="INVITE_ME" value="${pd.INVITE_ME}"/>
        <input type="hidden" name="tn" id="tn" value="${pd.tn}"/>
        <ol>
        	<!-- <li><p><input type="text" placeholder="请输入用户名" id="username"><i class="fa fa-user-plus" style="font-size:16px;"></i></p></li> -->
        	<li><p><input type="tel" placeholder="请输入手机号" id="mobile"><i class="fa fa-mobile"></i></p></li>
            <li><p><input type="password" placeholder="请输入密码" id="password"><i class="fa fa-unlock-alt"></i><i class="fa fa-eye"></i></p></li>
        	<!-- <li><p><input type="password" placeholder="确认密码" id="passwordRepeat"><i class="fa fa-unlock-alt"></i><i class="fa fa-eye"></i></p></li> -->
            <li>
            	<p class="fl"><input type="text" placeholder="请输入验证码" id="phoneVerfiyCode"><i class="fa fa-recycle"></i></p>
                <p class="fr"><input type="button" value="获取验证码" id="send-sms"><input type="button" id="sending" value="正在提交" style="background:#909090;display: none"></p>
            </li>
            <div class="clear"></div>
            <h6>我已阅读并同意<a href="newspage/safetylist.html">《服务协议》</a>和<a href="newspage/safetylist.html">《隐私条款》</a></h6>
            <li>
            	<p>
                	<input type="submit" value="同意协议并注册"  id="subBtn">
                </p>
            </li>
            <h5><a href="mobile/login">已有账号？去登陆 >></a></h5>
        </ol>
        <%@include file="../common/foot_v2.jsp" %>
    </div>
</div>
<div class="concerned-mask">
	<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
	<!-- <img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
	<p class="msg">注册成功！</p>
	<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p> -->
</div>
<script type="text/javascript">
$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=6");
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
