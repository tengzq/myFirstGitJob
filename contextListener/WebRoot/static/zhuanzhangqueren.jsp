<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>用户个人完善信息</title>
		<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>/newspage/ui2/css/gestyle.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="<%=basePath%>wj-static/js/jquery.tips.js" type="text/javascript"></script>
	<script type="text/javascript">
	function hh(id){
		  return document.getElementById(id);
		}
	$(function(){
		hh("div2").style.display='none'
		hh("div3").style.display='none'
		hh("div4").style.display='none'
		/* $("#btu1").click(function(){
			$("#li1").removeClass("active");
			$("#li2").addClass("active");
			hh("div1").style.display='none'
			hh("div2").style.display='block'
			
		}) */
		$("#btu2").click(function(){
			$("#li2").removeClass("active");
			$("#li3").addClass("active");
			hh("div2").style.display='none'
			hh("div3").style.display='block'
		})
		$("#btu3").click(function(){
			window.location.href = "../pluginsyPay/toBindBankCard";
		})
	})
	
	$(function(){
		$("c").click(function(){
		window.location.href="pluginsyPay/gobusinessReister";
		})
	})
	</script>
	<style type="text/css">
.fyv{ float:right;
color: black!important;
margin-right: 14%;
cursor:pointer;
}	

</style>
	</head>
	<body style="background:#f9f9f9">
		<header>
			<ul class="main">
			<li class="fyv"><c id="c1">企业注册</c></li>
			<li class="fr"><i class="fa fa-mobile-phone"></i><a href=""> 手机版</a></li>
			<li class="fr"><i class="fa fa-weixin"></i><a href=""> 官方微信</a></li>
			<li class="fr"><i class="fa fa-qq"></i><a href=""> 官方QQ</a></li>
			<li class="fr"><i class="fa fa-question-circle"></i><a href=""> 帮助中心</a></li>
			</ul>
		</header>
		<div class="mainmenu">
        	<div class=" main">
            <nav class="clearfix">
                <a href="#"><img src="<%=basePath%>wj-static/img/1.jpg"/></a>
                <ul class="navlist">
                    <li><a href="#">首页</a></li>
                    <li><a href="../_project/goProjectList">理财产品</a></li>
                   
                    <li><a href="#">新手指引</a></li>
                    <li><a href="#">我的账户</a></li>
                    <li><a href="#">立即登录</a></li>
                </ul>
            </nav>
            </div>
        </div>
		
		转账确认成功
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
