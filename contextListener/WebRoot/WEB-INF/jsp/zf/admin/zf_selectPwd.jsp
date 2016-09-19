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
</head>
	<input type="hidden" id="basePath" value="<%=basePath%>" />
	<div class="main">
		<div class="login1" style="height: 500px;">
			<div class="form">
				<div class="styletitle1">
		    	<h3>找回密码</h3>
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
									<em class="a1"></em> <input type="text" id="phoneNum" placeholder="手机号">
								</p> <em class="err-area">手机号不能为空</em>
							</li>
							<li>
								<p style="width:150px; float:left; margin-right:10px;">
									<em class="a3"></em> <input type="text" id="ver"
										placeholder="验证码">
								</p> <input type="image" class="refreshImg" id="codeImg"
								src="code.do?t=1454226424740" alt="图片验证码"> <b
								class="refreshImg"></b> <em class="err-area">验证码不能为空</em>
							</li>
							<li>
								<p style="width:150px; float:left; margin-right:10px;">
									<em class="a3"></em> <input type="text" id="checkCode"
										placeholder="手机验证">
								</p> 
								<br>
								<span class="yellowbutton" id="checkCodeButton" onclick="sendSMS('find_pwd');">发送验证码</span>
								 <em class="err-area">验证码不能为空</em>
							</li>
							<li><em class="server-err" style="display: none;">错误错误</em>
							<br><br>
								<button class="yellowbutton" onclick="submit();">确定</button></li>
						</ol>
					</div>
				<script type="text/javascript">
				function submit() {
					
					var checkCode = $("#checkCode").val();
					$.ajax({
						   type: "POST",
						   url: "register/checkSMS",
						   data: "checkCode=" + checkCode,
						   success: function(msg) {
						   console.log(msg);
							   time = 60;
							   if (msg.result == "captcha") {
								   alert("验证错误");
								   time = 0;
							   } else if (msg.result == "error") {
								   alert("手机验证码错误");
							   } else if (msg.result == "tooQuick") {
								   alert("请求次数过于频繁");
							   } else if (msg.result == "success") {
								   window.location.href = "register/goFindPWD";
							   }
						   }
					});
				}
				function genTimestamp() {
					var time = new Date();
					return time.getTime();
				}
				function changeCode() {
						$("#codeImg").attr("src", "<%=basePath%>code.do?t=" + genTimestamp());
				}	
				</script>
			</div>
		</div>
		</div>
<%@include file="../public/foot_v2.jsp"%>


