<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
			<script src="<%=basePath%>wj-static/js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<title>融巢资本--完善信息</title>
		<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/css/style.css"/>
<script src="<%=basePath%>wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="<%=basePath%>wj-static/js/jquery.ocupload-1.1.2.js" type="text/javascript"></script>
	<script type="text/javascript">
	/* $(function(){
		$("#la").click(function(){
			$("form").submit();
		})
	}) */
		function fun(){
		$("form").submit();
		
	}
			$(function(){
				abc();
					 
			});
		  function abc() {  
              $("#tu").upload({  
                  action: '',  
                  name: 'upload',  
                  onSelect: function (self, element) {  
                  },  
                  onSubmit: function (self, element) {  
                  },  
                  onComplete: function (data, self, element) {  
                          alert(data);  
                  }  
              });  
          }
		  ;  
	
	</script>
		<style type="text/css">
	a.dadad:link {color: blue;}
	a.dadad:visited {color: red}
	a.dadad:hover {color: yellow;}
</style>
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

        <div class="mobile-register EVPI">
        	<article>
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
						<li>注册</span></li>
						<li>注册成功</span></li>
						<li><span class="yanSe">完善信息</span></li>
					</ul> 
				</div>
				<div class="centerz">
					<ul class="ul">
						<li>
							<img src="<%=basePath%>/wj-static/images/yhk_03.jpg"/>
							尊敬的顾客您好，融巢资本为维护各顾客在平台的交易安全及您的公司信息。请您务必完善以下信息。
						</li>
						<li>
							如不完善以下信息您将不能在融巢资本平台进行任何买卖交易活动，如需帮助请拨打客服热线:********
						</li>
					</ul>
				</div>
				<div class="wanShan">
				<form action="businessReister3" method="post">
					<h1>完善公司信息</h1>
					<aside>
						<ul>
					<!-- 		<li>
								<h2>*企业名称</h2>
			<input type="text"  name="name" placeholder="请输入公司名称" value=""/>
							</li> -->
							<li>
								<h2>*法定代表人</h2>
			<input type="text"  name="legal" placeholder="请输入法定代表人" />
							</li>
							<li>
								<h2>*法定身份证</h2>
								<input type="text"  name="legalIdNo" placeholder="请输入法定身份证" />
							</li>
							<!-- <li>
								<h2>*营业执照号</h2>
								<input type="text"  name="businessLicenese" placeholder="请输入营业执照号" />
							</li> -->
							<li>
								<h2>*企业联系人</h2>
								<input type="text"  name="contact" placeholder="请输入营业执照号" />
							</li>
							<li>
								<h2>*企业联系人手机号</h2>
			<input type="text"  name="contactPhone" placeholder="请输入营业执照号" />
							</li>
							<li>
								<h2>手机</h2>
								<input type="text"  name="phone" placeholder="请输入办公电话" />
							</li>
							<li>
								<h2>邮箱</h2>
								<input type="text"  name="email" placeholder="请输入办公传真" />
							</li>
							<li>
								<h2>企业类型</h2>
								
<!-- 								             <label for="man">
	<input type="radio" value="0" name="memberClassType" id="man"/>
	担保公司
	</label> -->
	<label >
	<input type="radio" value="1" name="memberClassType" id="man2"/>
	放款公司
	</label>
	<label>
	<input type="radio" value="2" name="memberClassType" id="man3"/>
	收款公司
	</label>

							</li>
						</ul>
					</aside>
				</div>
				<div class="wanShan">
					<h1>完善开票信息</h1>
					<aside>
						<ul>
							<li>
								<h2>*开户银行核准号</h2>
		<input type="text"  name="bankLicense" placeholder="请输入开户银行核准号" />
							</li>
							<li>
								<h2>*组织机构代码</h2>
		<input type="text"  name="orgNo" placeholder="请输入组织机构代码" />
							</li>
							<li>
								<h2>*税务登记号</h2>
				<input type="text"  name="taxNo" placeholder="请输入税务登记号" />
							</li>
							
							<!-- <li>
								<h2>*公司银行账户</h2>
								<input type="text"  name="name" placeholder="请输入公司银行账户" />
							</li> -->
						<!-- 	<li>
								<h2>*纳税人识别号</h2>
								<input type="text"  name="name" placeholder="请输入纳税人识别号" />
							</li> -->
						<!-- 	<li>
								<h2>*公司电话</h2>
								<input type="text"  name="name" placeholder="请输入公司办公电话" />
							</li> -->
						</ul>
					</aside>
				</div>
				</form>
				<!--  <div class="wanShan">
					<h1>完善联系人信息</h1>
					<aside> <ul>
								<li>
									<h2>*真实姓名</h2>
									<input type="text"  name="name" placeholder="请输入真实姓名" />
								</li>
								<li>
									<h2>QQ</h2>
									<input type="text"  name="name" placeholder="请输入QQ" />
								</li>
								<li>
									<h2>*手机号码</h2>
									<input type="text"  name="name" placeholder="请输入手机号码" />
								</li>
							</ul>
					</aside>
				</div>  -->
			 <div class="wanShan qiYe">
					<h1>完善企业资料</h1>
					<aside>
						<div class="topz">
							<p style="font-size: 22px">
								<img src="<%=basePath%>/wj-static/images/yhk_03.jpg"/>
							尊敬的顾客，融巢为维护各顾客在平台的安全及您的公司信息。请您务必点击上传以下信息。
							</p>
						</div>
						<div class="centerz">
							<div class="one tow">
								<img src="<%=basePath%>/wj-static/images/tupian.jpg" />
								<div class="zi123">
									<a id="tu" class="dadad" style="cursor: pointer;" title="点击上传">营业执照</a>
								</div>
							</div>
							<div class="one tow">
							<img src="<%=basePath%>/wj-static/images/tupian.jpg" />
								<div class="zi123">
									<a class="dadad"  style="cursor: pointer;" title="点击上传">税务登记证</a>
								</div>
							</div>
							<div class="one tow">
								<img src="<%=basePath%>/wj-static/images/tupian.jpg" />
								<div class="zi123">
									<a class="dadad"  style="cursor: pointer;" title="点击上传">法人身份证</a>
								</div>
							</div>
						</div> 
						<div class="bottomz">
							<p>
								<input type="checkbox" name="" class="dan" value="" />
								<span>阅读并约定遵守《融巢用户协议》</span>
							</p> 
							<section>
								<input type="button" name="" class="bthh" value="下次再说" />
								<input type="button" name="" class="bthh  bthha" value="提交" onclick="fun()"/>
								<input type="button" name="" class="bthh bon" value="暂存" />
							</section>
						</div>
					</aside>
				</div> 
				
			</article>
        </div>

	<%-- 	<div class="bottom">
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
		</footer> --%>
		<%@include file="../public/foot_v2.jsp" %>
	</body>

</html>
