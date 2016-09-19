<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 欢迎您</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/login2.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/register.css" rel="stylesheet" type="text/css">

<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/register.js" type="text/javascript"></script>
</head>

<body style="background:url(wj-static/images/logo_03.png)">
<%@include file="../public/header.jsp" %>
<div class="mainbody">
	<div class="logo">
		<a href="${basePath}">
			<img src="wj-static/images/logo.png" />
		</a>
	</div>
	<div class="content-bg-banner">
		<div class="content-main">
			<div class="layer">
				<div class="content-menu">
				<ul>
					<li>登录</li>
					<li>注册</li>
				</ul>
			</div>
			<div class="clear"></div>
			<input  type="hidden" name="callback" id="callback" value="${pd.callback}">
			<input  type="hidden" name="INVITE_ME"  value="${pd.INVITE_ME}">
			<div class="content-form">
				<%-- <input  type="hidden" name="callback" id="callback" value="${pd.callback}"> --%>
				<ul class="login-form">
					<li><span>用户名</span>
						<input type="text" id="loginname" placeholder="用户名/手机号" value="" />
					</li>
					<li><span>密码</span>
						<input type="password" name="password" id="password" placeholder="请输入您的密码" />
					</li>
					<li class="login-tips" style="display: block;position:absolute;top:85px;text-align: center;width:100%">
						<em class="err" style="color: red;text-align: center"></em>
					</li>
					<li>
						<input type="button" name="submit" id="doLogin" value="登&nbsp;&nbsp;&nbsp;录" onclick="severCheck();"/>
					</li>
					<li>
						<a href="login_selectZfPwd" style="position: absolute;right: 4px;bottom: -73px;font-size:15px;">忘记密码?</a>
  					</li>
				</ul>
				<!-- <div class="clear"></div> -->
				<ul class="regist-form">
					<form id="regForm" method="post" action="register/save" onsubmit="return false;">
	        			<input type="hidden" id="INVITE_ME" name="INVITE_ME" value="${pd.INVITE_ME }">
	            		<input type="hidden" id="tn" name="tn" value="${pd.tn }">
	                	<!-- <li class="reg-form-list clearfix">
	                		<span class="title">用户名</span>
	                		<input type="text" id="reg_username" maxlength="16" placeholder="以字母开头4位及以上的用户名">
	                		<span class="err-area"><em class="err-tips"></em></span>
	                		
	                	</li> -->
	                	<li class="reg-form-list clearfix">
	                		<span class="title">手机号</span>
	                		<input type="text" id="reg_mobile" placeholder="请输入手机号码">
	                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
	                	</li>
	                	<li class="reg-form-list clearfix">
	                		<span class="title">密码</span>
	                		<input type="password" id="reg_password" placeholder="请输入8位或以上的密码"/>
	                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
	                	</li>
	                	<!-- <li class="reg-form-list clearfix">
	                		<span class="title">确认密码</span>
	                		<input type="password" id="reg_passwordRepeat" placeholder="请输入8位或以上的密码">
	                		<span class="err-area"><em class="err-tips"></em></span>
	                	</li> -->
	                	
	                	<li class="reg-form-list clearfix">
	                		<span class="title" style="position: absolute;left: 20px;top: 92px;">验证码</span>
	                		<input type="text" style="width:30%;position: absolute;left: 80px;" id="imgCode" placeholder="验证码">
	                		<!-- <input type="submit" value="发送验证码" style="width:50%; float:right; text-indent:0; background:#49a5e6; height:42px; color:#fff; border:0;"> -->
	                		<img alt="点击刷新" src="" id="codeImg" style="position: absolute;top: 90px;right: 80px;">
	                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
	                	</li>
	                	<li class="reg-form-list clearfix">
	                		<span class="title" style="position: absolute;left: 20px;top: 135px;">手机验证</span>
	                		<input type="text" style="width:30%;position: absolute;left: 80px;top:125px;" id="phoneVerfiyCode" placeholder="验证码">
	                		<!-- <input type="submit" value="发送验证码" style="width:50%; float:right; text-indent:0; background:#49a5e6; height:42px; color:#fff; border:0;"> -->
	                		<a class="send-sms">
									<span class="send-text">发送验证码</span>
									<span class="countdown-text"><span class="countdown">60</span>秒之后重发</span>
							</a>
	                		<!-- <span class="err-area"><em class="err-tips"></em></span> -->
	                	</li>
	                    <li style="position: absolute;bottom: -120px;">
		                    <label>
		                    	<input type="checkbox" id="agreement">我已阅读万金先生的
		                    	<a href="zfarticle/toNotice?id=47" target="_blank" >《服务协议》</a>
		                    	及
		                    	<a href="zfarticle/toNotice?id=46" target="_blank" >《隐私条款》</a>
		                    </label>
	                    </li>
	                    <li>
                    		<input type="submit" id="subbtn" class="btn-reg" value="立即注册" style="top:210px;"/>
                    	</li>
                
            </form>
				</ul>
				<!-- <div class="clear"></div> -->
			</div>
		</div>
		</div>
	</div>
	<script src="wj-static/js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		jQuery(".content-main").slide({titCell:".content-menu ul li",mainCell:".content-form",trigger:"click"<c:if test="${reg=='reg'}">,defaultIndex:1</c:if>});
		$(function(){
			<c:if test="${reg=='reg'}">$('.layer').height('310');</c:if>
			$('.content-menu').find('li').eq(0).on('click',function(){
				$('.layer').height('230');
			});
			$('.content-menu').find('li').eq(1).on('click',function(){
				$('.layer').height('310');
			});
		}); 
	</script>
	
	<div class="clear"></div>
	<ul class="content-desc clearfix">
		<li>
			<dl>
				<dt>安全才是王道</dt>
				<dd>风险备用金提供全年安全保障</dd>
				<dd>风险备用金1亿元</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>有钱才能任性</dt>
				<dd>会理财，好先生，最高18%年化收益</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt>有心才有服务</dt>
				<dd>7X12小时贴心客服</dd>
				<dd>9:00am-9:00pm</dd>
			</dl>
		</li>
	</ul>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<script type="text/javascript">

	$(document).keyup(function(e){
		if(e.keyCode== '13'){
			$('#doLogin').click();
		}
	});
	
	function tips(position,element,message){
		$(element).tips({
			side : position,
			msg : message,
			bg : '#FD9720',
			time : 3
		});
	}

function jiance() {
	if($("#loginname").val()==''){
		$(".login-tips").css("display","block");
		$(".err").text("用户名不能为空");
		//tips(2,$('#loginname'),'用户名不能为空')
		return;
	}
	$.post("register/checkUserNameByAJAX",{USERNAME:$("#loginname").val()},function(data){
		if(data.msg==false){
			$(".login-tips").css("display","block");
			$(".err").text("用户名不存在");	
			//tips(2,$('#loginname'),'用户名不存在')
		}
	},"json");

}
function doclick(){
	$(".err").text("");
}
//服务器校验
function severCheck(){
	if (check()) {
		var loginname = $("#loginname").val();
		var callback = $("#callback").val();
		var password = loginname + ",fh," + $("#password").val();
		$.post("register/login_zfLogin",{KEYDATA : password,callback:callback},
			function(data) {
				try{console.log(data);}catch(e){};
				if (data.result == "success") {
					try{console.log('登陆成功');}catch(e){}
					top.location.href = getRootPath();
				}else if (data.result == "usererror") {
					$(".login-tips").css('display','block');
					$(".err").html("用户名或密码错误，还有"+ (5 - data.temp)+"次机会。您可以<a href='"+getRootPath()+"/login_selectZfPwd' target='_blank' style='color: red; text-decoration: underline;'>找回密码</a>");
				}else if (data.result == "error") {
					$(".login-tips").css('display','block');
					$(".err").text("用户名已鎖定请联系管理员");
				}else if (data.result == "fail") {
					$(".login-tips").css('display','block');
					$(".err").text("用户名或密码输入错误");
				}else{
					window.location.href ="<%=basePath%>"+data.result;
				}
				
			}, "json");
	}
}


//客户端校验
function check() {
	if ($("#loginname").val() == "") {
		$(".login-tips").css("display","block");
		$(".err").text("用户名不能为空");
		//tips(2,$('#loginname'),'用户名不能为空')
		return false;
	}

	if ($("#password").val() == "") {
		/* $(".login-tips").css("display","block");
		$(".err").text("密码不能为空"); */

		return false;
	}

	
	return true;
}
$(document).ready(function(){
	var uris = location.href.split('/');
	var viewId = 5;
	if($('.content-menu li.on').index()==1){
		viewId = 6;
	}
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID="+viewId);
	val_array.push("WEB_OR_MOBILE=1");
	val_array.push("RANDOM_CODE="+randomCode);
	$.ajax({
	   type: "post",
	   url: "<%=basePath%>register/viewlog",
	   data: val_array.join('&'),
	   success: function(data){}
	 });
});
</script>
<%@ include file="../public/foot.jsp"%>
</body>
</html>

