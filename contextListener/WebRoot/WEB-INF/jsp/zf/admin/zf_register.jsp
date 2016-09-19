<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 注册</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta name="renderer" content="webkit">
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/register.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/register.js" type="text/javascript"></script>

</head>

<body style="background:url(<%=basePath%>wj-static/images/logo_03.png)">

<div class="header">
	<div class="top">
        <div class="main">
            <div class="fl">
                <span>联系电话：400 807 8000</span>
                <b>(工作日8:00-22:00)</b>
                <a href="javascript:void(0)"><i class="fa fa-weibo"></i></a>
                <a href="javascript:void(0)"><i class="fa fa-weixin"></i></a>
            </div>
            <div class="fr">
                <a href="login_toZfLogin" rel="nofollow">登录</a>
				<a href="register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
				<!-- <a href="javascript:void(0)">手机APP</a> -->
                <a href="zfarticle/safety?PROGRAM_ID=pg_bangzhu">帮助中心</a>
            </div>
        </div>
    </div>
    
</div>

<div class="maibody main" >
	<div class="wj-logo">
    	<h1 class="fl"><a href="${basePath}"><img src="wj-static/images/logo2.png" width="395px"></a></h1>
        <div class="fl">欢迎注册</div>
    </div>
    <div class="register">
    	<div class="fl ban">
        	<img src="wj-static/images/login_03.png">
        </div>
        <div class="reg-form fl">
        	<form id="regForm" method="post" action="register/save" onsubmit="return false;">
        		<input type="hidden" id="INVITE_ME" name="INVITE_ME" value="${pd.INVITE_ME }">
            	<ul>
                	<li class="reg-form-list clearfix">
                		<span class="title">用户名</span>
                		<input type="text" id="username" maxlength="16" placeholder="以字母开头4位及以上的用户名">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                		
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">密码</span>
                		<input type="password" id="password" placeholder="请输入8位或以上的密码"/>
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">确认密码</span>
                		<input type="password" id="passwordRepeat" placeholder="请输入8位或以上的密码">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">手机号</span>
                		<input type="text" id="mobile" placeholder="请输入手机号码">
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                	<li class="reg-form-list clearfix">
                		<span class="title">手机验证</span>
                		<input type="text" style="width:40%" id="phoneVerfiyCode">
                		<!-- <input type="submit" value="发送验证码" style="width:50%; float:right; text-indent:0; background:#49a5e6; height:42px; color:#fff; border:0;"> -->
                		<a class="send-sms">
								<span class="send-text">发送验证码</span>
								<span class="countdown-text"><span class="countdown">60</span>秒之后重发</span>
						</a>
                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
                	</li>
                    <li style="width:500px;">
	                    <label>
	                    	<input type="checkbox" id="agreement">我已阅读万金先生的
	                    	<a href="zfarticle/toNotice?id=dcc0424abf8a4020ba5111da77863006" target="_blank">《服务协议》</a>
	                    	及
	                    	<a href="zfarticle/toNotice?id=f78fe45eb1a54a86b3d01043a5c1602c" target="_blank">《隐私条款》</a>
	                    </label>
                    </li>
                    <li>
                    <button id="subbtn" class="btn-reg">立即注册</button></li>
                </ul>
            </form>
        </div>
    </div>
</div>
<%@include file="../public/foot.jsp"%>
</body>
</html>