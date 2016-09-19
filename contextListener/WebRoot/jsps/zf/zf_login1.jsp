<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>欢迎登录</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财">
<meta name="description"
	content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">


<link rel="stylesheet" type="text/css" href="jingtai/css/passport.css">
<script type="text/javascript" src="static/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div id="doc">
		<div id="hd">
			<div class="topbar">
	<div class="topbar-inner clearfix">
		<div class="alignleft tapbar-social">
			<p class="top-contact">
				联系电话&nbsp;&nbsp;400-807-8000&nbsp;
				<span style="color:#999;font-size:12px">（工作日 9:00-22:00）</span>
				<span class="social_contact" id="weibo_account"></span>
				<span class="social_contact" id="weixin_account"></span>
			</p>
			<div class="account_info" id="weibo_account_info">
				欢迎关注账房先生官方微博</br>
				<a href="" target="_blank" title="账房先生官方微博" rel="nofollow">@账房先生</a>
			</div>
			<div class="account_info" id="weixin_account_info">
				扫一扫关注账房先生微信
				<img src="" width="150px" height="150px" title="微信号:lantouzicom" />
				<p>微信号：lantouzicom</p>
			</div>
		</div>
		<div class="alignright">
			<p class="top-nav clearfix">
								<a href="login_toZfLogin" rel="nofollow">登录</a>
				<a href="register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
								<a href="" rel="nofollow">手机App</a>
				<a href="zfarticle/safety?PROGRAM_ID=pg_bangzhu">帮助中心</a>
			</p>
		</div>
	</div>
</div>			<div class="header-clean clearfix">
				<div class="logo">
					<a href="">
						<img src="https://lantouzi.com/imgs/logo_clean.png">
					</a>
					<span>欢迎登录</span>
				</div>
			</div>
		</div>

		<div id="bd">
			<div class="main">
				<div class="page-login clearfix">
					<a href="" target="_blank">
						<div class="alignleft login-picshow" style="background:url('jingtai/img/bg_login.png') center top no-repeat;"></div>
					</a>
					<div class="alignright login-form" id="alignright">
						<form id="login-form" class="form" method="post">
					<input  type="hidden" name="callback" id="callback" value="${pd.callback}">
							<ul>
								<li class="form-field login-form-field"><span class="f-k">用户名</span>
									<span class="f-v"> <input id="loginname" type="text" onfocus="doclick();"
										onblur="jiance();" name="loginname" 
										placeholder="会员名/Email/已验证手机" tabindex="1">
								</span> <span class="f-t" id="msg"></span></li>
								<li class="form-field login-form-field"><span class="f-k">密码</span>
									<span class="f-v"> <input type="password" id="password"
										name="password" tabindex="2">
								</span> <span class="f-e valid-psw-em" style="float:left"> <a
										href="<%=basePath%>login_selectZfPwd" class="forget-psw">忘记密码？</a>
								</span> <span class="f-t"></span></li>
								
							</ul>
							<p class="login-tips" style="display: block;">
								<em class="err"></em>
							</p>
							
							<a onclick="severCheck();" class="flip-link btn btn-info"
								id="to-recover">登录</a>
							<p class="dwj-user-tips">
								<i class="login-safe"></i>数据传输采用128位加密技术，保障您的信息安全
							</p>
							<script type="text/javascript" src="static/js/jquery.tips.js"></script>
							<script type="text/javascript">
								function jiance() {
									$.post("register/checkUserNameByAJAX",{USERNAME:$("#loginname").val()},function(data){
										if(data.msg==false){
											$(".login-tips").css("display","block");
											$(".err").text("用户名不存在");	
										}
									},"json");

								}
								function doclick(){
									$(".err").text("");
								}
								//服务器校验
								function severCheck() {
									if (check()) {
										var loginname = $("#loginname").val();
										var callback = $("#callback").val();
										var password = loginname + ",fh," + $("#password").val();
										setTimeout("$('#to-recover').show()", 1000);
										$.post("register/login_zfLogin",{KEYDATA : password,callback:callback},
											function(data) {
												if (data.result == "success") {
													window.location.href = "register/login_toZfMain";
												}else if (data.result == "usererror") {
													$(".login-tips").css('display','block');
													$(".err").text("用户名或密码错误，今天还可输入"+ (10 - data.temp));
												}else if (data.result == "error") {
													$(".login-tips").css('display','block');
													$(".err").text("用户名已鎖定请联系管理员");
												}else{
													window.location.href =data.result;
												}
												
											}, "json");
									}
								}

								$(document).ready(function() {
									//设定点击间隔
									$("to-recover").click(function() {
										alert("1111");
									});
									changeCode();
									$("#codeImg").bind("click", changeCode);
								});

								$(document).keyup(function(event) {
									if (event.keyCode == 13) {
										$("#to-recover").trigger("click");
									}
								});

								function genTimestamp() {
									var time = new Date();
									return time.getTime();
								}

								function changeCode() {
									$("#codeImg").attr("src",
											"code.do?t=" + genTimestamp());
								}

								//客户端校验
								function check() {
									if ($("#loginname").val() == "") {
										$("#loginname").tips({
											side : 2,
											msg : '用户名/Email/手机号为空！',
											bg : '#AE81FF',
											time : 3
										});

										$("#loginname").focus();
										return false;
									}

									if ($("#password").val() == "") {
										$("#password").tips({
											side : 2,
											msg : '密码不得为空',
											bg : '#AE81FF',
											time : 3
										});

										$("#password").focus();
										return false;
									}

									
									return true;
								}
								function saveCookie() {
									if ($("#saveid").attr("checked")) {
										$.cookie('loginname', $("#loginname")
												.val(), {
											expires : 7
										});
										$.cookie('password', $("#password")
												.val(), {
											expires : 7
										});
									}
								}
								function quxiao() {
									$("#loginname").val('');
									$("#password").val('');
								}

							</script>
						</form>
					</div>
					<div class="reg">
						<a href="register/goAdd">注册送<span
							style="font-size:18px;display:block;color:yellow;">280</span>元
						</a>
					</div>
				</div>

				<script type="text/javascript" src="jingtai/js/captcha.js"></script>
				<script type="text/javascript" src="jingtai/js/jsencrypt.min.js"></script>
				<script type="text/javascript" src="jingtai/js/passport.js"></script>

			</div>
		</div>

		<%@ include file="../public/foot.jsp"%>
	</div>

	
</body>
</html>