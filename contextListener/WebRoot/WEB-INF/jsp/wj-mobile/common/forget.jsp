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
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>忘记密码</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/ui2/css/common.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/layout.css"/>
<link rel="stylesheet" href="wj-mobile-static/css/reg.css"/>
<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<!-- <script src="wj-mobile-static/js/zepto.min.js" type="text/javascript"></script> -->
<script src="wj-mobile-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/layout.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/forget.js" type="text/javascript"></script>

<style type="text/css">
	.smsbtn{
		  width: 48%;
		  float: right;
		  background: #eb6161;
		  height: 37px;
		  border: 0;
		  color: #fff;
		  font-size: 13px;
		  border-radius: 5px;
		  font-family: ltyh;
	}
</style>

</head>

<body style="background:#00a0e9">

<div class="mainbody">
    <div class="reg">
    	<div class="head">
    		<a href="mobile/main">
        		<img src="wj-mobile-static/ui2/images/logo_cn.png">
            </a>
        </div>
        <ol style="margin-bottom: 60%;">
        	<li><p><input type="tel" id="mobile" placeholder="手机号"><i class="fa fa-mobile"></i></p></li>
        	<li>
	        	<p style="width:50%;float:left;">
	        		<input type="text" id="imgVercode" placeholder="图片验证码"><i class="fa fa-key"></i>
	        	</p>
	        	<img alt="点击刷新" src="" id="imgCode" style="margin-left: 5%;margin-top: 3%;"/>
	        	<div class="clear"></div>
        	</li>
        	<li>
	        	<p style="width:50%;float:left;">
	        		<input type="tel" id="vercode" placeholder="验证码"><i class="fa fa-key"></i>
	        	</p>
	        	<input type="button" value="获取验证码" class="smsbtn">
	        	<div class="clear"></div>
        	</li>
            <div class="clear"></div>
            <li style="margin-top: 10px;">
            	<p>
            		<input type="button" id="subbtn" value="确认">
                </p>
            </li>
            
        </ol>
        <%@include file="../common/foot_v2.jsp" %>
    </div>
</div>

</body>
</html>
