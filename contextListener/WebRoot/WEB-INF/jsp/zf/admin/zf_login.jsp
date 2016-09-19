<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>融巢资本</title>
<link href="<%=basePath%>wj-static/rc/css/reset.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>wj-static/rc/css/layout.css" rel="stylesheet"
	type="text/css">
<script src="<%=basePath%>wj-static/rc/js/jquery-1.8.2.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>wj-static/rc/js/layout.js"
	type="text/javascript"></script>
</head>
<style>
.server-err {
	display: none;
	color: #FF6347;
	font-size: 15px;
	position: relative;
	top: -5px;
}

.sendSMSButton {
	color: #fff;
	background: url(<%=basePath%>wj-static/rc/images/login_36.jpg);
	height: 43px;
	border: 0;
	border-radius: 5px;
	width: 100%;
	font-size: 18px;
}
</style>
<body>
	<div class="login">

		<div class="header">
			<div class="top">
				<div class="main">
					<div class="logo fl">
						<img src="<%=basePath%>wj-static/rc/images/index_02.jpg">
					</div>
					<div class="menu fl">
						<a href="<%=basePath%>">首页</a> <a
							href="<%=basePath%>_project/goProjectList">理财产品</a> <a
							href="<%=basePath%>information/about/guide">新手指引</a> <a
							href="<%=basePath%>myAccount/list">我的账户</a>
					</div>
					<div class="nav fr">
						<c:choose>
							<c:when
								test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
								<c:choose>
									<c:when
										test="${sessionScope.sessionZfBuUser.username == null||sessionScope.sessionZfBuUser.username ==''}">
										<a href="<%=basePath%>pluginsyPay/gobusinessReister">企业注册</a>
									</c:when>
									<c:otherwise>
										<a>企业已登陆</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when
								test="${sessionScope.sessionZfBuUser.username == null || sessionScope.sessionZfBuUser.username ==''}">
								<c:choose>
									<c:when
										test="${sessionScope.sessionZfUser.USERNAME == null || sessionScope.sessionZfUser.USERNAME ==''}">
										<a href="<%=basePath%>login_toZfLogin">登录</a>
									</c:when>
									<c:otherwise>
										<a href="<%=basePath%>register/out">登出</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="<%=basePath%>register/out">登出</a>
							</c:otherwise>
						</c:choose>
						<a href="#"><img
							src="<%=basePath%>wj-static/rc/images/index_04.jpg"></a> <a
							href="#"><img
							src="<%=basePath%>wj-static/rc/images/index_06.jpg"></a> <a
							href="#"><img
							src="<%=basePath%>wj-static/rc/images/index_08.jpg"></a>
					</div>
				</div>
			</div>

		</div>
		<div class="main">
			<div class="window">
				<!--<h3><img src="images/login_03.jpg"></h3>-->
				<!--<h4><label><em class="hover"></em>企业登陆</label><label><em></em>员工登陆</label></h4>-->
				<ol class="tabs clearfix">
					<li id="qiye" onclick="qiye();">企业登陆</li>
					<li id="yuangong" onclick="yuangong();" class="on">员工登陆</li>
				</ol>
				 <ul>
	            	<li>
	                	<p>
	                        <em></em>
	                        <input id="loginname" type="text" placeholder="用户名/手机">
	                    </p>
	                </li>
	            	<li>
	                	<p>
	                        <em style="background-image:url(<%=basePath%>wj-static/rc/images/login_17.jpg)"></em>
	                        <input id="password" type="password" placeholder="输入密码">
	                    </p>
	                </li>
	            	<li>
	                	<p class="fl">
	                        <em style="background-image:url(<%=basePath%>wj-static/rc/images/login_23.jpg)"></em>
	                        <input type="text" name="captcha" id="ver" placeholder="验证码">
	                    </p>
	                    <input type="image" class="refreshImg" id="codeImg" style="height: 40px;"><a href="#"><img src="<%=basePath%>wj-static/rc/images/login_26.jpg" class="refreshImg"></a>
	                </li>
	                 <li id="checkCodeFrame" style="display: none;">
						<p class="fl">
	                        <em style="background-image:url(<%=basePath%>wj-static/rc/images/login_23.jpg)"></em>
	                        <input type="text" id="checkCode" name="checkCode" placeholder="手机验证码">
	                    </p>
	                   
	                </li>
	                <button id="checkCodeButton" class="sendSMSButton" onclick="sendSMS('login');" style="width: 118px;margin-top: 7px;display: none;margin-top: 8px;"></button>
	            </ul>
            
				<h5><em class="server-err">错误错误</em>
					<!-- <label class="fl"><em></em>记住我</label> --> <a href="<%=basePath%>login_selectZfPwd">忘记密码</a>
				</h5>
				
				<div class="btn">
					<button class="yellowbutton" id="doLogin">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
				</div>
				<!-- <h6>
					没有账号？<a href="#">立即注册</a>
				</h6> -->
			</div>
		</div>
		
		 <input type="hidden" id="basePath2" value="<%=basePath%>">
   		 <script src="<%=basePath%>wj-static/rc/js/login.js" type="text/javascript" charset="utf-8"></script>
		    <script>
		    var a="2";
		    function genTimestamp() {
				var time = new Date();
				return time.getTime();
			}
		    function changeCode() {
				$("#codeImg").attr("src", "<%=basePath%>code.do?t=" + genTimestamp());
			}
		    function qiye() {
		    	$("#yuangong").removeClass("on");
		    	$("#qiye").addClass("on");
		    	a="1";
		    }
		    function yuangong() {
		    	$("#qiye").removeClass("on");
		    	$("#yuangong").addClass("on");
		    	a="2";
		    }
		    </script>
		<div class="footer4" style="bottom: 50px;">京ICP备15033688号
			北京灜通投资管理有限公司 版权所有</div>
	</div>
</body>
</html>

