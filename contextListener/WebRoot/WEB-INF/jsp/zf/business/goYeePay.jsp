<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>融巢资本</title>
	<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/css/style.css"/>
	<script src="<%=basePath%>wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>wj-static/js/jquery.tips.js" type="text/javascript"></script>
	</head>
	<script type="text/javascript">
	function f(){window.location.href = "businessReister2";}
		$(function (){
			$("#sv").click(function(){
				f();
			});
		});
	 setTimeout('window.location=\'<%=basePath%>pluginsyPay/toBbusinessRegister\'',3000);
	
	</script>
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
	                
	            </ul>
	        </nav>
	    </div>	
		      <div class="main">
        	<div class="bfff">
            	<div class="tzcg">
                	${userSession.name }
                    <p style="padding:76px;">3秒后前往<a href="<%=basePath%>/pluginsyPay/toBbusinessRegister">易宝支付</a>，完成下一步操作。</p>
                    <img src="<%=basePath%>wj-static/images/yibaozhifu_03.jpg" style="padding-bottom:268px;">
                    
                </div>
            </div>
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