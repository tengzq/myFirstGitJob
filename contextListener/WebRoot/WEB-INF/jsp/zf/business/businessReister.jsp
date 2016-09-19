<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath%>wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>wj-static/js/jquery.tips.js" type="text/javascript"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<script type="text/javascript">
$(function(){
	$("#la").click(function(){
		$("form").submit();
	})
})

</script>
<html>
	<head>
		<meta charset="utf-8">
		<title>融巢资本--注册</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/newspage/ui2/css/gestyle.css"/>
		<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/css/style.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/css/stylesbsad.css"/>
	</head>
	<body>
		<header>
			<ul class="main">
				<li><i class="fa fa-mobile-phone"></i><a href=""> 手机版</a></li>
				<li><i class="fa fa-weixin"></i><a href=""> 官方微信</a></li>
				<li><i class="fa fa-qq"></i><a href=""> 官方QQ</a></li>
				<li><i class="fa fa-question-circle"></i><a href=""> 帮助中心</a></li>
			</ul>
		</header>
		<div class="mainmenu main">
            <nav class="clearfix">
                <a href="#"><img src="<%=basePath%>wj-static/img/1.jpg"/></a>
                <ul class="navlist">
                    <li><a href="#">首页</a></li>
                    <li><a href="#">理财产品</a></li>
                    <li><a href="#">转让专区</a></li>
                    <li><a href="#">新手指引</a></li>
                    <li><a href="#">我的账户</a></li>
                    <li><a href="#">立即登录</a></li>
                </ul>
            </nav>
        </div>
		<div class="mobile-register">
			<article>
				<!--<div class="top">
					<div class="slide-line">
						<div class="draw-line">
							<div class="draw-yuan"><div class="yuan"><p>1</p></div></div>
							<div class="draw-yuan draw-huiY"><div class="yuan huiYuan"><p>2</p></div></div>
							<div class="draw-yuan draw-huiY"><div class="yuan huiYuan huiYb"><p>3</p></div></div>
						</div>
					</div>
					<ul>
						<li>手机注册</li>
						<li>注册成功</li>
						<li>完善企业信息</li>
					</ul>
				</div>-->
				<div class="top">
					<div class="sideline">
						<div class="stripe">
							<div class="huiYuan">
								<div class="chengYuan">
									<p>1</p>
								</div>
							</div>
							<div class="huiYuan huiYuanai">
								<div class="chengYuan xiaoHuiY">
									<p>2</p>
								</div>
							</div>
							<div class="huiYuan huiYuanai huiYb">
								<div class="chengYuan xiaoHuiY">
									<p>3</p>
								</div>
							</div>
						</div>
					</div>
					<ul>
						<li> <span class="yanSe">注册</span></li>
						<li>注册成功</li>
						<li>完善信息</li>
					</ul>
				</div>
				<div class="center">
				<form action="businessReister1" method="post">
					<ol>
						用户名：
						<li>
							<p><em class="b1"><img src="<%=basePath%>wj-static/images/b1.jpg"/></em>
							<input type="text" name="username" id="telephone-num" value="" title="用户名"/></p>
						</li>
						密码：
						<li>
							<p><em class="b2"><img src="<%=basePath%>wj-static/images/b2.jpg"/></em><input type="text" name="password" id="password" value="" /></p>
						</li>
						确认密码：
						<li>
							<p><em class="b2"><img src="<%=basePath%>wj-static/images/b2.jpg"/></em><input type="text"  id="confirm-password" value="" /></p>
						</li>
						<li>
							<p><em class="b3"><img src="<%=basePath%>wj-static/images/b3.jpg"/></em><input type="text"  id="Verification-code" value="" /></p><span>获取验证码</span>
						</li>
						<li>
							<p><input type="checkbox" name="user-agreement" id="user-agreement" value="" /><span>阅读并约定遵守《融巢资本用户协议》</span></p>
						</li>
						<li id="la">
							立 即 注 册
						</li>
					</ol>
					</form>
				</div>
			</article>
		</div>
		
		<div class="bottom">
			<ul class="botul clearfix main">
				<li>
					<h3>关于融巢资本</h3>
					<p><a href="#">团队介绍</a></p>
					<p><a href="#">联系我们</a></p>
					<p><a href="#">公司介绍</a></p>
					<p><a href="#">加入我们</a></p>
				</li>
				<li>
					<h3>保障协议</h3>
					<p><a href="#">服务协议</a></p>
					<p><a href="#">隐私条款</a></p>
					<p><a href="#">安全保障</a></p>
					<p><a href="#">法律保障</a></p>
				</li>
				<li>
					<h3>帮助中心</h3>
					<p><a href="#">常见问题</a></p>
					<p><a href="#">还款方式</a></p>
					<p><a href="#">安全保障</a></p>
				</li>
				<li class="btright">
					<img src="<%=basePath%>wj-static/img/10.jpg" alt="" />
					<p><i class="fa fa-mobile-phone"></i>&nbsp;下载融巢APP</p>
				</li>
				<li class="btright">
					<img src="<%=basePath%>wj-static/img/11.jpg" alt="" />
					<p><i class="fa fa-weixin"></i>&nbsp;微信订阅号</p>
				</li>
			</ul>
			<div class="imgdiv clearfix">
            	<div class="main">
				<img src="<%=basePath%>wj-static/img/12.png" alt="" />
				<img src="<%=basePath%>wj-static/img/13.png" alt="" />
				<img src="<%=basePath%>wj-static/img/14.png" alt="" />
				<img src="<%=basePath%>wj-static/img/15.png" alt="" />
				<img src="<%=basePath%>wj-static/img/16.png" alt="" />
				<div class="lianxi">
					<p>联系电话:4008-337-520(工作日9:00am-9:00pm)</p>
					<p>客服邮箱:kf@rongchaoziben.com</p>
					<p>公司地址:北京市海淀区中关村牡丹园</p>
				</div>
                </div>
			</div>
		</div>
        
        
        
		<footer>
			<p>京ICP备15033688号 北京灜通投资管理有限公司 版权所有</p>
		</footer>
	</body>
</html>
