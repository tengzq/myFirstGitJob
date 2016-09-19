<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!--[if lt IE 7 ]><html class="ie6" lang="zh-cn"><![endif]-->
<!--[if IE 7 ]><html class="ie7" lang="zh-cn"><![endif]-->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html><!--<![endif]--><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"><link href="jingtai/css/dialog_style.css" rel="stylesheet">
<meta charset="utf-8">
<base href='<%=basePath %>'>
<title>账房先生_专为账房投资理财打造的平台</title>
<meta name="keywords" content="账房先生,账房投资">
<meta name="description" content="账房先生是国内领先的互联网金融平台，专注于应收账款保理业务，账房投资理财就上账房先生网">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script src="jingtai/js/hm.js"></script><script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432182363000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>
<script type="text/javascript" src="jingtai/js/jquery-1.js"></script>
<script type="text/javascript" src="jingtai/js/ltz.js"></script>
<script src="jingtai/js/PagerView.js"></script>
<script type="text/javascript">
    $(function(){
    	$.ajax({
    		type:'POST',
    		data: {},
    		url:'<%=basePath %>zfReport/singleReport',
    		dataType:'json',
    		success:function(data){
    			alert(data.ReportList[0].total_invest);
    			alert(data.ReportList[0].total_earn);
    			
    			$("#invest").text(total_invest);
    			$("#earn").text(total_earn);
    		},
    	});
    	
    	
    });
    
    

</script>
<img src="jingtai/images/v.jpg" width="1" height="1"><script src="jingtai/js/zz.js" type="text/javascript"></script></head>
<body>
	<div id="doc">
		<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
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
			<div style="display: none;" class="account_info" id="weibo_account_info">
				欢迎关注账房先生官方微博<br>
				<a href="http://weibo.com/lantouzicom" target="_blank" title="账房先生官方微博" rel="nofollow">@账房先生</a>
			</div>
			<div style="display: none;" class="account_info" id="weixin_account_info">
				扫一扫关注账房先生微信
				<img src="jingtai/img/qrcode.png" title="微信号:lantouzicom" width="150px" height="150px">
				<p>微信号：lantouzicom</p>
			</div>
		</div>
		<div class="alignright">
			<p class="top-nav clearfix">
			<c:choose>
					<c:when test="${sessionScope.sessionZfUser.USERNAME!=null}">
					   <a href="https://lantouzi.com/user" rel="nofollow">欢迎您，${sessionScope.sessionZfUser.USERNAME}</a>
					   <a href="https://lantouzi.com/logout" rel="nofollow">[退出]</a>
					</c:when>
					<c:otherwise>
					   <a href="login_toZfLogin" rel="nofollow">登录</a>
				       <a href="<%=basePath %>register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
					</c:otherwise>
				</c:choose>
				<a href="https://lantouzi.com/mobile/download" rel="nofollow">手机App</a>
				<a href="https://lantouzi.com/about/help">帮助中心</a>
			</p>
		</div>
	</div>
</div>	<div class="header clearfix">
		<div class="logo" style="position: relative;">
			<a href="https://lantouzi.com/" class="logoLink" title="账房先生"><span>账房先生</span></a>
			<!--Spring Festival Start-->
<!-- 			<a href="https://lantouzi.com/zt/festival" target="_blank" style="display:block;position: absolute;right: 0;top: 0;width:170px;height:65px;z-index:100"></a>
			<div style="display:block;position: absolute;right: 0;top: 0;outline: none;background:#fff;">
				<object type="application/x-shockwave-flash" name="flashad" data="https://s1.lantouzi.com/img/201502/slogan_new_year.swf" width="170" height="65" style="background:#fff;">
				<param name="quality" value="autohigh"><param name="wmode"></object>
			</div> -->
			<!--Spring Festival End-->

		</div>
		<div class="nav">
			<ul class="clearfix">
				<li class="on">
					<a href="https://lantouzi.com/">首页</a>
				</li>
				<li>
					<a href="https://lantouzi.com/lingqianjihua" style="position:relative;">零钱计划<i class="beta">Beta</i></a>
				</li>
								<li>
					<a href="<%=basePath%>_project/goProjectList">项目列表</a>
				</li>
				<li>
					<a href="<%=basePath%>jsps/guarantee/company_profile.jsp">安全保障</a>
				</li>
								
				<li class="my-account">
									<a href="<%=basePath%>myAccount/list" rel="nofollow">我的账户</a>

								</li>
				
			</ul>
		</div>
	</div>
</div>
		<div id="bd">
			<link rel="stylesheet" type="text/css" href="jingtai/css/style.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/slider.css">
<div class="banner">
	<div jssor-slider="true" id="slider1_container" style="width: 1349px; height: 342.068px;">
		
	  
	  
	  
	<div style="position: absolute; top: 0px; left: 0px; width: 1400px; height: 355px; transform-origin: 0px 0px 0px; transform: scale(0.963571);"><div style="width: 1400px; height: 355px; display: block; position: relative; top: 0px; left: 0px; overflow: visible;" class=""><div u="slides" style="cursor: move; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 1400px; height: 355px; z-index: 0;"><div style="position: absolute; z-index: 0; pointer-events: none; left: 0px; top: 0px; display: none;"></div></div><div u="slides" style="cursor: move; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 1400px; height: 355px; z-index: 0;"><div style="width: 1400px; height: 355px; top: 0px; left: 0px; position: absolute; background-color: rgb(0, 0, 0); opacity: 0;"></div>
	    	    						<div style="width: 1400px; height: 355px; top: 0px; left: 1400px; position: absolute; overflow: hidden;"><a style="background:url('https://s1.lantouzi.com/img/201505/518/518banner.jpg') center top no-repeat #ee4a4a;" href="https://lantouzi.com/zt/licaijie" target="_blank"></a><div style="width: 1400px; height: 355px; top: 0px; left: 0px; z-index: 1000; display: none;"></div></div>
									<div style="width: 1400px; height: 355px; top: 0px; left: -1400px; position: absolute; overflow: hidden;"><a style="background:url('https://s1.lantouzi.com/img/201505/518/douniu_wap_banner_new.jpg') center top no-repeat #f1712d;" href="https://lantouzi.com/douniuxingdong" target="_blank"></a><div style="width: 1400px; height: 355px; top: 0px; left: 0px; z-index: 1000; display: none;"></div></div>
									<div style="width: 1400px; height: 355px; top: 0px; left: -1400px; position: absolute; overflow: hidden;"><a style="background:url('https://s1.lantouzi.com/img/lingqian/lingqian9dian.jpg') center top no-repeat #f5de73;" href="https://lantouzi.com/lingqianjihua" target="_blank"></a><div style="width: 1400px; height: 355px; top: 0px; left: 0px; z-index: 1000; display: none;"></div></div>
									<div style="width: 1400px; height: 355px; top: 0px; left: -1400px; position: absolute; overflow: hidden;"><a style="background:url('https://s1.lantouzi.com/img/201505/518/518lingjiang.jpg') center top no-repeat #ee4a4a;" href="https://lantouzi.com/zt/licaijie/prize" target="_blank"></a><div style="width: 1400px; height: 355px; top: 0px; left: 0px; z-index: 1000; display: none;"></div></div>
									<div style="width: 1400px; height: 355px; top: 0px; left: 0px; position: absolute; overflow: hidden;"><a style="background:url('https://s1.lantouzi.com/img/201505/alun_new/alun_banner_new.jpg') center top no-repeat #da8600;" href="https://lantouzi.com/post/63" target="_blank"></a><div style="width: 1400px; height: 355px; top: 0px; left: 0px; z-index: 1000; display: none;"></div></div>
					        </div><div u="navigator" class="jssorb21" style="bottom: 16px; right: 6px; width: 88px; height: 12px; left: 656px;">
	  	
	  <div class="" style="position: absolute; left: 0px; top: 0px;" u="prototype"></div><div class="" style="position: absolute; left: 19px; top: 0px;" u="prototype"></div><div class="" style="position: absolute; left: 38px; top: 0px;" u="prototype"></div><div class="" style="position: absolute; left: 57px; top: 0px;" u="prototype"></div><div class="av" style="position: absolute; left: 76px; top: 0px;" u="prototype"></div></div><span u="arrowleft" class="jssora21l" style="top: 0px; left: 8px;">
	  </span><span u="arrowright" class="jssora21r" style="top: 0px; right: 8px;">
	  </span></div></div></div>
				<c:choose>
					<c:when test="${sessionScope.sessionZfUser.USERNAME!=null}">
						<div class="user-panel">
							<div class="logined">
								<h3>欢迎使用账房先生</h3>
								<span class="welcome"></span>
								<div>
									<ul class="amount-info">
										<li><span>可用余额：</span><em><span>${sessionScope.sessionZfUser.BALANCE}</span></em>
											元</li>
										<li><span>我的投资券：</span><a
											href="https://lantouzi.com/user/coupon?type=1" title="我的投资卷">${sessionScope.sessionZfUser.TICKET}</a></li>
									</ul>
									<a href="" class="btn btn-1 btn-mgn">管理我的账户</a>
								</div>
								<div class="ft">
									<a href="myAccount/recharge" class="recharge tongji"
										data-category="首页-充值" data-label="index">充值</a> <a
										href="myAccount/draw_cash" class="withdrawal tongji"
										data-category="首页-提现" data-label="index">提现</a> <b
										class="red-dot"></b>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="user-panel">
							<div class="notlogin">
								<h3>
									<strong>35</strong>倍<br>活期存款收益
								</h3>
								<span class="welcome"></span> <a class="reg"
									href="register/goAdd" title="注册领红包" rel="nofollow"><span></span>注册领红包</a>
								<p>
									已有账户?<a href="<%=basePath%>login_toZfLogin" title="立即登录"
										rel="nofollow">立即登录</a>
								</p>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
</div>
<div class="starpart">
	<div class="content">
				<div class="notice clearfix">
			<h2>最新公告</h2>
			<a style="display: none;" href="https://lantouzi.com/post/212" target="_blank" title="2015年5月19日项目回款完毕公告" class="notice-title">2015年5月19日项目回款完毕公告</a>
							<a href="https://lantouzi.com/post/211" target="_blank" title="2015年5月18日项目回款完毕公告" class="notice-title" style="display: block;">2015年5月18日项目回款完毕公告</a>
							<a href="https://lantouzi.com/post/209" target="_blank" title="518理财节领奖专场  优惠券使用说明" class="notice-title" style="display: none;">518理财节领奖专场  优惠券使用说明</a>
						<a href="https://lantouzi.com/post" target="_blank" title="更多公告" class="notice-more">更多</a>
		</div>
				<!--Spring Festival Start-->
		<div style="width:980px;height:90px;position:relative">
			<div style="position:absolute;bottom:-6px;width:980px;height:60px;background:url('https://s1.lantouzi.com/img/201502/festival/index_notice_b.png') no-repeat;text-align:center;font-size:14px;color:#dd5561;line-height:60px;">为保证资产优质，小懒正在努力审核。每日 <strong style="font-size:20px">10:00、14:00、20:00</strong> 发标，其余时间随机上标。</div>
		</div>
		<!--Spring Festival End-->
						<div class="star-project">
 			<div class="star-title">
				<img src="jingtai/img/homepage_king.png" width="70px" height="70px">
				<h2>5·18特供</h2>
				<p>加息项目<br>
限量抢购</p>
			</div>
			<div class="star-earnings">
				<p>
					<strong>11.00</strong>%
											<span title="额外补息">+1.60%</span>
									</p>
				<p>年化收益率</p>
									<a class="hd-patch e518" href="https://lantouzi.com/zt/licaijie" target="_blank">518加息</a>
							</div>
			<div class="star-info">
				<p>
					<em>项目期限</em>
																		<strong>9</strong>个月
															</p>
				<p>
					<em>剩余金额</em>
					705,400元
				</p>
			</div>
												<a href="https://lantouzi.com/project/1055" title="账房计划9月期1055" class="button tongji" data-category="明星-马上投资" data-label="index">马上投资</a>
										<span class="bottom_line"></span>
		</div>
			</div>
</div>
<div class="mainpart">
	<div class="content">
		<h2>更多产品</h2>
		<ul class="clearfix">
														<li>
												<div class="project">
							<h3>短期灵活</h3>
							<a href="https://lantouzi.com/project/992" title="账房计划保理2月期992">
								<div class="project-profit" data-rate="0.6841">
																			<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>1.00%</span>
																											<p><strong>7</strong><span>.50%</span><br>年化收益率</p>
									<canvas width="210px" height="210px"></canvas>
																	</div>
							</a>
							<div class="project-info">
								<strong>
																			2个月
																	</strong>
								<p>剩余金额：315,900元</p>
																											<a href="https://lantouzi.com/project/992" title="马上投资" class="button tongji" data-category="短期灵活-马上投资" data-label="index">马上投资</a>
																								</div>
						</div>
					</li>
					
												<li>
												<div class="project">
							<h3>中期稳健</h3>
							<a href="https://lantouzi.com/project/1039" title="账房计划3月期1039">
								<div class="project-profit" data-rate="0.596">
																			<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>2.00%</span>
																											<p><strong>8</strong><span>.00%</span><br>年化收益率</p>
									<canvas width="210px" height="210px"></canvas>
																	</div>
							</a>
							<div class="project-info">
								<strong>
																			3个月
																	</strong>
								<p>剩余金额：404,000元</p>
																											<a href="https://lantouzi.com/project/1039" title="马上投资" class="button tongji" data-category="中期稳健-马上投资" data-label="index">马上投资</a>
																								</div>
						</div>
					</li>
					
												<li>
												<div class="project">
							<h3>长期猛赚</h3>
							<a href="https://lantouzi.com/project/1030" title="账房计划6月期1030">
								<div class="project-profit" data-rate="0.1572">
																			<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>1.00%</span>
																											<p><strong>10</strong><span>.00%</span><br>年化收益率</p>
									<canvas width="210px" height="210px"></canvas>
																	</div>
							</a>
							<div class="project-info">
								<strong>
																			6个月
																	</strong>
								<p>剩余金额：1,685,600元</p>
																											<a href="https://lantouzi.com/project/1030" title="马上投资" class="button tongji" data-category="长期猛赚-马上投资" data-label="index">马上投资</a>
																								</div>
						</div>
					</li>
					
					
		</ul>
	</div>
</div>
<div class="advantagepart">
	<div class="content clearfix">
		<h2>账房计划优势</h2>
		<img src="jingtai/img/homepage_advantage.png" title="账房计划优势" width="980px" height="355px">
		<div class="ranking">
			<div class="ranking-title">
				<h3>投资风云榜</h3>	
			</div>
			<div class="tuhao clearfix">
				<table class="first">
									<tbody><tr>
						<td style="text-align: center;" width="15%">1</td>
						<td width="55%">q***o</td>
						<td width="30%">￥5,487,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">2</td>
						<td width="55%">y***n</td>
						<td width="30%">￥5,047,700.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">3</td>
						<td width="55%">j***1</td>
						<td width="30%">￥3,356,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">4</td>
						<td width="55%">y***2</td>
						<td width="30%">￥3,272,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">5</td>
						<td width="55%">b***t</td>
						<td width="30%">￥2,987,600.00</td>
					</tr>
								</tbody></table>
				<table>
									<tbody><tr>
						<td width="15%">6</td>
						<td width="55%">x***y</td>
						<td width="30%">￥2,479,400.00</td>
					</tr>
									<tr>
						<td width="15%">7</td>
						<td width="55%">y***e</td>
						<td width="30%">￥2,467,000.00</td>
					</tr>
									<tr>
						<td width="15%">8</td>
						<td width="55%">y***u</td>
						<td width="30%">￥2,459,000.00</td>
					</tr>
									<tr>
						<td width="15%">9</td>
						<td width="55%">L***u</td>
						<td width="30%">￥2,437,700.00</td>
					</tr>
									<tr>
						<td width="15%">10</td>
						<td width="55%">l***g</td>
						<td width="30%">￥2,431,300.00</td>
					</tr>
								</tbody></table>
			</div>
			<span class="bottom_line"></span>
		</div>
		<div class="broadcast">
			<h3>账房播报</h3>
			<div class="lr-total">
				<h4><span>账房累计投资</span></h4>
				<p id="invest">30,055,779.<span>00</span><em>元</em></p>
			</div>
			<div class="lr-total">
				<h4><span style="margin-left:-56px">为账房赚取</span></h4>
				<p id="earn">30,055,779.<span>57</span><em>元</em></p>
			</div>
			<span class="bottom_line"></span>
		</div>
	</div>
</div>
<div class="line clearfix">
	<div class="lineOne">
	</div>
	<div class="lineTwo">
	</div>
	<img src="jingtai/img/homepage_line_2.png">
</div>
<div class="thankpart">
	<div class="content">
		<img src="jingtai/images/homepage_thank_v2.jpg" title="我们能给你的不只是财富，更多的是一份感动" width="980px" height="380px">
	</div>
</div>
<div style="position: absolute; top: 750px; right: 10px;" class="home-feedback">
	<!-- <div class="crazymay_nav">
		<p class="crazy_fcb">Apple Watch<br/>Macbook<br/>疯抢中</p>
		<p class="mt5">距活动结束还剩</p>
		<p id="crazy_time">0天0小时0分</p>
		<div class="btn-wrap" id="crazy_btn">
			<a href="https://lantouzi.com/zt/crazymay" class="crazy_btn"><img src="https://s1.lantouzi.com/img/201505/crazymay/crazy_btn_v2.png" alt="马上去抢"></a>
		</div>
	</div> -->
	<a href="tencent://message/?Menu=yes&amp;amp;uin=938028653&amp;amp;Service=58&amp;amp;SigT=A7F6FEA02730C9880E51E5111F97E427F29AF4C2AD630F671244922D37143D7D63C13B645480C03A9B9651F1DA69B3FECAAEF58E34416FDC92B978C9354E6329C4722C6F07588E9D51E426A85C74CDEC6C13DF468A7B727B747A64D3B0EEF9628AC8176CA05DDE7DA22BA88A1ADDC36FE7F8B6D0BE211B5D&amp;amp;SigU=30E5D5233A443AB26EDF921A54DE24E9E3C9DB05A9F02BDE2C95E8522262E122FA17E9DC1B61B8BEE7677F407E9AA0E351B2F44579B3EED38C566D9FE4158BDFC794084DB3AAB151" target="_blank" title="在线客服" rel="nofollow"><i class="ol-service"></i>在线客服</a>
			<a id="homeFeedBack" title="意见反馈" rel="nofollow"><i class="ol-feedback"></i>意见反馈</a>
		<a id="backTop" title="回到顶部" rel="nofollow"><i class="backtop"></i>回到顶部</a>
</div>
<div class="home-alert-temp" style="display:none;width: 100%;height: 100%;position: fixed;top: 0;background-color: rgba(0,0,0,0.6);z-index:9999" id="home-licaijie">
	<div style="width:680px;height:520px;position: absolute;margin-left:auto;margin-right:auto;left:0;right:0;top:0px;bottom:0px;margin-top:auto;margin-bottom:auto;background:url('https://s1.lantouzi.com/img/201505/licaijie/home_licaijie.png')">
		<div style="width:100%;height:100%;position:relative;">
			<a id="close-home" style="position: absolute;width:50px;height:50px;right: 46px;top: 0;cursor: pointer;"></a>
			<a id="goto-licaijie" style="position: absolute;width: 250px;height: 70px;bottom: 139px;left: 300px;cursor: pointer;" href="https://lantouzi.com/zt/licaijie"></a>
		</div>
	</div>
</div>
<script type="text/tmpl" id="dialog-tmpl">
<div class="dg_wrapper home-feedback-dialog">
	<h3>意见反馈<span class="close-btn" title="关闭">X</span></h3>
	<textarea id="feedback-content" cols="30" rows="10" maxlength="300" autocomplete="off" placeholder="您的意见对我们十分重要，请您不吝指教。"></textarea>
	<a class="btn" id="feedback-submit">递交反馈</a>
	<p class="feedback-success"><i></i>感谢您的反馈！</p>
</div>
</script>
<script src="jingtai/js/jssor.js"></script>		
</div>
		<div id="ft">
	<div class="clearfix ft-links">
		<div class="alignleft ft-links-item about">
			<h3>关于账房先生</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about" rel="nofollow">公司介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/team" rel="nofollow">团队介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/contact" rel="nofollow">联系我们</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/joinus" rel="nofollow">加入我们</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item protocol">
			<h3>保障/协议</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/security" rel="nofollow">安全保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/law" rel="nofollow">法律保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/agreement" rel="nofollow">服务协议</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/privacy" rel="nofollow">隐私声明</a>
				</li>				
			</ul>
		</div>
		<div class="alignleft ft-links-item help">
			<h3>帮助中心</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/help" rel="nofollow">常见问题</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/baoli" rel="nofollow">保理业务介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/qufenqi" rel="nofollow">分期债权介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/repayment_ways" rel="nofollow">还款方式介绍</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item contact">
			<h3>联系我们</h3>
			<ul class="bd">
				<li>
					联系电话：400-807-8000&nbsp;（工作日 9:00-22:00）
				</li>
				<li>
					客服邮箱：<a href="mailto:kefu@lantouzi.com" rel="nofollow">kefu@lantouzi.com</a>
				</li>
				<li>
					公司地址：北京市朝阳区三里屯SOHO  A座1701室
				</li>
				<li>
					我要合作：<a href="mailto:bd@lantouzi.com" rel="nofollow">bd@lantouzi.com</a>
				</li>
			</ul>
		</div>
		<div class="wx_qrcode">
			<img src="jingtai/img/qrcode.png" title="微信号:lantouzicom" width="120px" height="120px">
		</div>
	</div>
	<div class="clearfix ft-bottom">
		<div class="alignleft">
			<div class="safeguard clearfix">
				<a href="http://www.yeepay.com/" class="safe-yeepay" target="_blank" rel="nofollow"></a>
				<a href="http://www.geotrust.com/" class="safe-geotrust" target="_blank" rel="nofollow"></a>
				<a href="http://webscan.360.cn/" class="safe-360" target="_blank" rel="nofollow"></a>
				<a href="https://www.sobug.com/" class="safe-sobug" target="_blank" rel="nofollow"></a>
				<a href="http://sealinfo.trustutn.org/sealinfo/P31000020121218204627106798.html" class="safe-trustutn" target="_blank" rel="nofollow"></a>
				<a href="https://s1.lantouzi.com/img/201412/renzheng.jpg" class="safe-acifi" target="_blank" rel="nofollow"></a>
			</div>
			<div class="links clearfix"></div>
		</div>
		<div class="alignright copyright">
			<p>京ICP备14023229号 京ICP证150240号</p>
			<p>北京大家玩科技有限公司&nbsp;&nbsp;版权所有</p>
			<p><a href="https://lantouzi.com/?ua=pc" style="color:#999;padding:0px 5px;" rel="nofollow">PC版</a>
			<a href="https://lantouzi.com/?ua=mobile" style="color:#999;padding:0px 5px;text-decoration:underline" rel="nofollow">手机版</a></p>
		</div>
	</div>
	</div>

<script type="text/javascript">
var LINKS = [{
	'name': '网贷之家',
	'url': 'http://www.wangdaizhijia.com/'
},{
	'name': '网贷联盟网',
	'url': 'http://www.wdlm.cn/'
}, {
	'name': '网贷天眼',
	'url': 'http://www.p2peye.com/'
},{
	'name': '融途网',
	'url': 'http://www.erongtu.com/'
},{
	'name': '理财114',
	'url': 'http://www.licai114.com/'
},{
	'name': 'P2P理财',
	'url': 'http://www.dianpifa.com'
}];
$(document).ready(function(e){
	if ($.browser.ie && $.browser.version <= 9.0) {
		var placeHoldersrc = "https://lantouzi.com/js/placeholderIE.js?v=2";
		$('body').append('<script type="text/javascript" src="'+ placeHoldersrc +'"/>');
		var els = [];
		$('input[placeholder]').each(function(idx, el){
			els.push(el);
		});
		placeholderIE({margin:'8px 0px 0px 10px',fontSize:'16px'}, els);
	}

	var $social_contact = $('.social_contact'),
			$account_info = $('.account_info'),
			t;
	$social_contact.on('mouseover',function(event) {
		var $target = $('#' + this.id + '_info');
		clearTimeout();
		$target.show();
		$(this).addClass(this.id+'_hover');
	}).on('mouseout', function(event) {
		var name = this.id;
		t = setTimeout(function(){
			$account_info.hide();
			$('#'+name).removeClass(name+'_hover');
		}, 100);
	});
	$account_info.on('mouseenter', function(event){
		clearTimeout(t);
		var $target = $('#' + this.id);
		$target.show();
	}).on('mouseleave', function(event){
		var name = this.id.split('_info')[0];
		$account_info.hide();
		$('#'+name).removeClass(name+'_hover');
	});
	
	//加载友情链接
	//loadLinks();

	function loadLinks(){
		var qd_url = "https://lantouzi.com/union/hello",
			current_url = location.protocol + '//' + location.hostname + location.pathname; 
		if (current_url== qd_url) {
			return;
		}
		var xhr = $.ajax({
			type:'GET',
			url:'/api/links',
			data:"",
			dataType: "json"
		});
		xhr.done(function(r) {
			var h = '',
					i = 0,
					l = r.data.length;
			if (!l) {
				r.data = LINKS;
				l = r.data.length;
			}
			for ( ; i < l; i++) {
				var item = r.data[i];
				if (h) {
					h += '<span>|</span>';
				}
				h += '<a href="' + item.url + '" target="_blank">' + item.name + '</a>';
			}
			var href = "https://lantouzi.com/links";
			h += '<a href="' + href + '" target="_blank" class="all">查看全部链接</a>';

			h = '友情链接：' + h;
			$('#ft .links').html(h);
		});
	}
});
</script>

<script type="text/javascript">
var _zzsiteid="rnhYv03GpMt";
var _zzid = "rnhYv03GpMs";
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?6dea39ac37df9c6f3e7b096755b73949";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);

	$(document).on('mousedown', '.tongji', function(e){
		var $el = $(this);
		var category = $el.attr('data-category') || $.trim($el.text()),
				action   = $el.attr('data-action') || 'click',
				label    = $el.attr('data-label') || '',
				value    = $el.attr('data-value') || '';
		_hmt.push(['_trackEvent', category, action, label, value]);
	});
	var zz = document.createElement('script');
	zz.type = 'text/javascript';
	zz.async = true;
	zz.src = ('https:' == document.location.protocol ? 'https://ssl.trace.zhiziyun.com' : 'http://static.zhiziyun.com/trace') + '/api/trace.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(zz, s);

})();
</script>
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-60788439-1', 'auto');
	ga('send', 'pageview');
</script>
	</div>


<iframe style="display: none;" scrolling="no" src="jingtai/cm.htm" width="1" height="1"></iframe></body></html>