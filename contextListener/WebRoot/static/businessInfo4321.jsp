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
		hh("div1").style.display='none'
	})
		/* $("#btu1").click(function(){
			$("#li1").removeClass("active");
			$("#li2").addClass("active");
			hh("div1").style.display='none'
			hh("div2").style.display='block'
			
		})
		$("#btu2").click(function(){
			$("#li2").removeClass("active");
			$("#li3").addClass("active");
			hh("div2").style.display='none'
			hh("div3").style.display='block'
		})
		$("#btu3").click(function(){
			/* window.location.href = "../pluginsyPay/toBindBankCard"; */
	/* 		$("form").submit();
		}) */
	//}) 
	
	//$(function(){
		//$("c").click(function(){
		/* window.location.href="pluginsyPay/gobusinessReister"; */
		
		//})
	//})//
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
		<form action="businessRegisterController" method="post">
		<div class="mobile-register personal-EVPI">
			<%-- <article>
				<div class="main-top">
					<h1>填写企业内容</h1>
				</div>
				<div class="steps steps-4">
					<ol class="clearfix">
						<li  id="li1"  class="active">
							<p>填写基本信息<br /><em>1</em></p>
						</li>
						<li id="li2">
							<p>完善企业内容<br /><em>2</em></p>
						</li>
						<li id="li3">
							<p>法人信息<br /><em>3</em></p>
						</li>
						<li id="li4" >
							<p>绑定卡<br /><em>4</em></p>
						</li>
					</ol>
				</div>
				<div class="content" id="div1">
					<section class="section-1 set-user-name">
						<div class="item-person phone-num">
							<span>用户账户：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text" name="username" id="telephone-num" value="" title="用户名" placeholder="请输入登陆账户名"/>
						</div>
						<div class="item-person pic-code">
							<span>图片验证码：</span>
							<input type="text" name="" id="" value="请输入图片中的验证码" />
							<img src="<%=basePath%>wj-static/img/code.png" /><i class="fa fa-refresh">刷新</i>
						</div>
						<div class="item-person phone-code">
							<span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text" name="password" id="" value="" placeholder="请输入登陆密码"/>
							<!-- <span>确认密码：</span>
							<input type="text"  id="confirm-password" value="" /> -->
						</div>
						<div class="item-person phone-code">
							<!-- <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text" name="password" id="" value="" placeholder="请输入登陆密码"/> -->
							<span>确认密码：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  id="confirm-password" value="" placeholder="确认登陆密码"/>
						</div>
						<div class="item-person phone-code">
							<!-- <span>密码：</span>
							<input type="text" name="" id="" value="" /> -->
							<span>企业名称：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  name="name" placeholder="请输入公司名称" value=""/>
						</div>
						<div class="item-person phone-code">
							
							<span>营业执照：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<input type="text"  name="businessLicenese" placeholder="请输入营业执照号" />
						</div>
						<div class="item-person phone-code">
						
							<span>企业联系人：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  name="contact" placeholder="请输入企业联系人" />
						</div>
						<div class="item-person phone-code">
						
							<span>企业联系人手机号：</span>
							<input type="text"  name="contactPhone" placeholder="请输入企业联系人手机" />
						</div>
						<div class="button">
							<a href="javascript:void(0)" id="btu1">下一步</a>
						</div>
					</section>
				</div>
				<div class="content" id="div3">
					<section class="section-1 set-user-name">
					<!-- 	<div class="item-person phone-num">
							<span>手&nbsp;&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号：</span>
							<input type="text" name="" id="" value="请输入您的手机号" />
						</div> -->
						<div class="item-person pic-code">
							<span>图片验证码：</span>
							<input type="text" name="" id="" value="请输入图片中的验证码" />
							<img src="<%=basePath%>wj-static/img/code.png" /><i class="fa fa-refresh">刷新</i>
						</div>
						<div class="item-person phone-code">
							<span>法定代表人：</span>
							<input type="text"  name="legal" placeholder="请输入法定代表人" />
						</div>
						<div class="item-person phone-code">
							<span>法定身份证：</span>
							<input type="text"  name="legalIdNo" placeholder="请输入法定身份证" />
						</div>
						<div class="button">
							<a href="javascript:void(0)" id="btu3">下一步</a>
						</div>
					</section>
				</div>
				<div class="content" id="div4">
					<section class="section-1 set-user-name">
						<!-- <div class="item-person phone-num">
							<span>手&nbsp;&nbsp;&nbsp;机&nbsp;&nbsp;&nbsp;号：</span>
							<input type="text" name="" id="" value="请输入您的手机号" />
						</div> -->
						<div class="item-person pic-code">
							<span>图片验证码：</span>
							<input type="text" name="" id="" value="请输入图片中的验证码" />
							<img src="<%=basePath%>wj-static/img/code.png" /><i class="fa fa-refresh">刷新</i>
						</div>
						<div style="margin-left: auto;margin-right: auto;">
							<!-- <span>绑定卡：</span>
							<input type="text" name="" id="" value="请输入手机验证码" />
							<em>获取验证码</em> -->
							<h1 style="font-size: 30px;text-align: center;width: 40%">完善成功</h1>
						</div>
						<div class="button">
							<a href="../myAccount/list" id="btu3">去个人中心</a>
						</div>
					</section>
				</div>
				<div class="content" id="div2">
					<section class="section-1 set-user-name">
						<!-- <div class="item-person phone-num">
						<span>原始&nbsp;&nbsp;&nbsp;密码：</span>
						<input type="text" name="" id="" value="" />
						</div> -->
						<div class="item-person pic-code">
						<span>图片验证码：</span>
						<input type="text" name="" id="" value="请输入图片中的验证码" />
						<img src="<%=basePath%>wj-static/img/code.png" /><i class="fa fa-refresh">刷新</i>
						</div>
						<div class="item-person phone-code">
							<span>手机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  name="phone" placeholder="请输入一个手机号码" />
						</div>
						<div class="item-person phone-code">
							<span>邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  name="email" placeholder="请输入办公传真" />
						</div>
						<div class="item-person phone-code">
							<span>企业类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							
	<input type="radio" class="businessInfoRadom" value="1" name="memberClassType" id="man2"/>
	放款公司
	
	<!-- <label> -->
	<input type="radio"  class="businessInfoRadom" value="2" name="memberClassType" id="man3"/>
	收款公司
	<!-- </label> -->
						</div>
						<div class="item-person phone-code">
							<span>开户银行核准号</span>
							<input type="text"  name="bankLicense" placeholder="请输入开户银行核准号" />
						</div>
						<div class="item-person phone-code">
							<span>组织机构代码号</span>
					<input type="text"  name="orgNo" placeholder="请输入组织机构代码" />
						</div>
						<div class="item-person phone-code">
							<span>税务登记号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
			<input type="text"  name="taxNo" placeholder="请输入税务登记号" />
						</div>
						<!-- <div class="item-person phone-code">
							<span>手机&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<input type="text"  name="phone" placeholder="请输入一个手机号码" />
						</div> -->
						<div class="button">
							<a href="javascript:void(0)" id="btu2">下一步</a>
						</div>
					</section>
				</div> --%>
				去易宝
			</article>
		</div>
		</form>
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
