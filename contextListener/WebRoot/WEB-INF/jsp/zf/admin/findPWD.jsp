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
<base href="<%=basePath%>">
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
<style>
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
.login1 .con ol li p em.a1{ background-image:url(<%=basePath%>wj-static/rc/images/b1.jpg)}
.login1 .con ol li p em.a2{ background-image:url(<%=basePath%>wj-static/rc/images/b2.jpg)}
.login1 .con ol li p em.a3{ background-image:url(<%=basePath%>wj-static/rc/images/b3.jpg)}
.login1 .con ol li>b { cursor:pointer;background:url(<%=basePath%>wj-static/rc/images/login_16.jpg); width:24px; height:22px; float:right; margin-top:10px;}
.login1 .con ol li>em.err-area{
	font-size: 12px;
	padding-left:5px;
	color:red;
	display: none;
}
</style>
	<input type="hidden" id="basePath" value="<%=basePath%>" />
	<div class="main">
		<br>
		<br>
		<div class="login1" style="height: 500px;">
			<div class="form">
				<div class="form">
					<div class="styletitle1">
			    	<h3>修改密码</h3>
			    </div>
					<div class="fr con" style="padding-right: 327px;">
						<div class="fr">
							<!--   <input name="Fruit" type="radio" value="1" /><a href="javascript:void()" id="22">企业登陆</a><input name="Fruit" type="radio" value="2" /><a href="javascript:void()" id="22">用户登陆</a> -->

							<!--  <a href="#">注册</a> -->
						</div>
						</h3>
						<ol>
							<li>
								<p>
									<em class="a1"></em> <input type="password" name="password" id="password" placeholder="密码">
								</p> <em class="err-area">密码</em>
							</li>
							<li>
								<p>
									<em class="a1"></em> <input type="password"  id="checkPassword" placeholder="重复密码">
								</p> <em class="err-area">重复密码</em>
							</li>
							<br><br>
								<button class="yellowbutton" onclick="changePassword();">确定</button></li>
						</ol>
					</div>
				<script type="text/javascript">
					function changePassword() {
						var password = $("#password").val();
						var checkPassword = $("#checkPassword").val();
						if (password.length < 6) {
							alert("至少六位");
							return false;
						}
						if (password != checkPassword) {
							alert("两次输入密码不一致");
							return false;
						}
							$.ajax({
							   type: "POST",
							   url: "register/changePassword",
							   data: "password=" + password,
							   success: function(msg) {
								   if (msg.result == "error") {
									   alert("修改密码失败");
								   }  else if (msg.result == "success") {
								   		alert("修改密码成功");
								   		window.setTimeout("location.href='<%=basePath%>login_toZfLogin'",1000);
								   }
							   }
						});
					}
				</script>
			</div>
		</div>
		</div>
		</div>
<%@include file="../public/foot_v2.jsp"%>


