<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@include file="../public/header_v2.jsp"%>
</div>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/login.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>wj-static/rc/js/login.js"
	type="text/javascript" charset="utf-8"></script>
<link href="wj-static/css/selectPwd.css" rel="stylesheet"
	type="text/css">

<style type="text/css">
.login1{ overflow:hidden}
.login1 .img { width:560px; height:320px;}
.login1 .img img{width:560px; height:320px;}
.login1 .con { padding:10px; padding-right:50px; width:335px;}
.login1 .con h3{ line-height:2; font-size:16px; color:#666;}
.login1 .con h3 .fr{ color:#c8963a;}
.login1 .con h3 .fr a { color:#c8963a}
.login1 .con ol li{ padding:5px 0;}
.login1 .con ol li p { border:1px solid #ddd; height:42px; border-radius:10px; overflow:hidden; position:relative; padding-left:40px;}
.login1 .con ol li p em { display:inline-block; height:26px; width:26px; background:url(../images/b1.jpg); position:absolute; top:8px; left:10px;}
.login1 .con ol li p input { width:100%; height:100%; border:0;}
.login1 .con ol li p em.a1{ background-image:url(../images/b1.jpg)}
.login1 .con ol li p em.a2{ background-image:url(../images/b2.jpg)}
.login1 .con ol li p em.a3{ background-image:url(../images/b3.jpg)}
.login1 .con ol li>b { cursor:pointer;background:url(../images/login_16.jpg); width:24px; height:22px; float:right; margin-top:10px;}
.login1 .con ol li>em.err-area{
	font-size: 12px;
	padding-left:5px;
	color:red;
	display: none;
}
.login1 .con ol li>em.server-err{
	font-size: 13px;
	padding-left:5px;
	margin-bottom:3px;
	color:red;
	display: none;
}
	</style>
	<input type="hidden" id="basePath" value="<%=basePath%>" />
	<div class="main">
		<br>
		<br>
		<div class="login1" style="height: 400px;">
			<div class="form">
				<h2>修改用户名</h2>
					<div class="fr con" style="padding-right: 327px;">
						<div class="fr">
							<!--   <input name="Fruit" type="radio" value="1" /><a href="javascript:void()" id="22">企业登陆</a><input name="Fruit" type="radio" value="2" /><a href="javascript:void()" id="22">用户登陆</a> -->

							<!--  <a href="#">注册</a> -->
						</div>
						</h3>
						<ol>
						<button class="yellowbutton" style="width: 112px;height: 22px;position: relative;left: 341px;top: 39px;" onclick="checkUsername();">检查是否可用</button>
							<li>
								<p>
									<em class="a1"></em> <input type="text" name="username" id="username" placeholder="用户名">
									
								</p> <em class="err-area">用户名</em>
								<em class="server-err" id="username_ok" style="display: none; color: green;">用户名可用</em>
								<em class="server-err" id="username_not_ok" style="display: none;">用户名不可用</em>
							</li>
							<br>
							
							<button class="yellowbutton" onclick="changePassword();">确定</button></li>
						</ol>
					</div>
				<script type="text/javascript">
				function setNoneToRemands() {
					$("#username_ok").attr("style", "display: none; color: green;");
					$("#username_not_ok").attr("style", "display: none;");
				}
				function checkUsername () {
						var username = $("#username").val();
						console.log(username);
						if (username.length < 6) {
							alert("用户名名至少六位");
							setNoneToRemands();
							return false;
						}
						if (username.length > 15) {
							alert("用户名最多15位");
							setNoneToRemands();
							return false;
						}
						//var check1 = /^[a-zA-z]{6,15}/;  || check1.test(username)
						
						var check = /^[a-zA-Z]\w{3,15}$/ig;
						if (check.test(username)) {
							$.ajax({
							   type: "POST",
							   url: "textTel",
							   data: "USERNAME=" + username + "&withoutMe=1",
							   success: function(msg) {
								   if (msg.result == "error") {
									  	$("#username_not_ok").attr("style", "display: inline-block;");
									  	$("#username_ok").attr("style", "display: none; color: green;");
									  	return false;
								   }  else if (msg.result == "success") {
								  		$("#username_not_ok").attr("style", "display: none;");
								   		$("#username_ok").attr("style", "display: inline-block; color: green;");
								   }
							   }
							});
						} else {
							alert("至少包含一个字母且不能有特殊符号");
							setNoneToRemands();
							return false;
						}
					
				}
					function changePassword() {
						if (checkUsername() == false) {
							return false;
						}
						var username = $("#username").val();
						$.ajax({
							   type: "POST",
							   url: "setUsername",
							   data: "USERNAME=" + username,
							   success: function(msg) {
								   if (msg.msg == "error") {
								   		setNoneToRemands();
									   	alert("修改用户名失败");
								   }  else if (msg.msg == "success") {
								   		alert("修改用户名成功");
								   		 setTimeout('window.location=\'<%=basePath%>register/dyc1\'',3000);
								   }
							   }
						});
					}
				</script>
</div></div></div>
<%@include file="../public/foot_v2.jsp"%>


