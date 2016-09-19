<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>理财产品|理财项目|投资项目 - 懒投资</title>
<meta name="keywords" content="理财产品,理财项目,投资项目">
<meta name="description" content="懒投资专为懒人量身准备理财产品、理财项目和投资项目；懒人找理财产品、理财项目、投资项目就上懒投资网">
<link rel="stylesheet" type="text/css" href="../../jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="../../jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script async="" src="../../jingtai/js/analytics.js"></script><script type="text/javascript" async="" src="../../jingtai/js/trace.js"></script><script src="../../jingtai/js/hm.js"></script><script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432021183000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>
<script type="text/javascript" src="../../jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../../jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="../../jingtai/js/seed.min.js"></script>
<script type="text/javascript">
seed.config({
    baseUrl : CONFIG.BASE_URI + '/js/components/',
    alias : {
       jquery : CONFIG.BASE_URI + '/js/'+'jquery-1.11.1.min'
   } 
});
var _hmt = _hmt || [];
</script><script src="../../jingtai/js/PagerView.js"></script>
<img src="../../jingtai/v.do" height="1" width="1"><script type="text/javascript" src="../../jingtai/js/zz.js"></script></head>
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
			<div class="account_info" id="weibo_account_info">
				欢迎关注懒投资官方微博<br>
				<a href="http://weibo.com/lantouzicom" target="_blank" title="懒投资官方微博" rel="nofollow">@懒投资</a>
			</div>
			<div class="account_info" id="weixin_account_info">
				扫一扫关注懒投资微信
				<img src="../../jingtai/js/qrcode.png" width="150px" height="150px" title="微信号:lantouzicom">
				<p>微信号：lantouzicom</p>
			</div>
		</div>
		<div class="alignright">
			<p class="top-nav clearfix">
									<a href="https://lantouzi.com/user" rel="nofollow">欢迎，xyf200948350210</a>
					<a href="https://lantouzi.com/logout" rel="nofollow">[退出]</a>
								<a href="https://lantouzi.com/mobile/download" rel="nofollow">手机App</a>
				<a href="https://lantouzi.com/about/help">帮助中心</a>
			</p>
		</div>
	</div>
</div>	<div class="header clearfix">
		<div class="logo" style="position: relative;">
			<a href="https://lantouzi.com/" class="logoLink" title="懒投资"><span>懒投资</span></a>
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
				<li>
					<a href="<%=basePath%>index2.jsp">首页</a>
				</li>
				<li>
					<a href="https://lantouzi.com/lingqianjihua" style="position:relative;">零钱计划<i class="beta">Beta</i></a>
				</li>
								<li class="on">
					<a href="<%=basePath%>jsps/project/project_list.jsp">项目列表</a>
				</li>
				<li>
					<a href="<%=basePath%>jsps/guarantee/company_profile.jsp">安全保障</a>
				</li>
								
				<li class="my-account">
									<a href="<%=basePath%>jsps/user/view_log.jsp" rel="nofollow">我的账户</a>
								</li>
				
			</ul>
		</div>
	</div>
</div>
		<div id="bd">
			<link rel="stylesheet" type="text/css" href="../../jingtai/js/index.css">
<div class="content clearfix" style="margin-top:0">
	<div class="main alignleft">
		<div class="projects">
			<div class="hd">
				<h2 class="tit1">项目列表</h2>
			</div>
			<div class="bd l-project-list">
			<div class="l-project-item -lproject-item-status-2">
			<h3>
				<a href="https://lantouzi.com/project/994" title="懒人计划保理2月期994">懒人计划保理2月期994</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">7.50%</strong>
											<span title="额外补息" class="platform_rate">+1.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>60天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>23.44万元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="<%=basePath%>jsps/project/project_item.jsp" class="btn btn-buy">
											马上投资
										</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-2">
			<h3>
				<a href="https://lantouzi.com/project/1048" title="懒人计划保理3月期1048">懒人计划保理3月期1048</a> 
									<a class="hd-patch douniu" href="https://lantouzi.com/douniuxingdong" target="_blank">最高20%</a>
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">8.00%</strong>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>90天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>25.11万元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1048" class="btn btn-buy">
											马上投资
										</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-2">
			<h3>
				<a href="https://lantouzi.com/project/1004" title="懒人计划6月期1004">懒人计划6月期1004</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">10.00%</strong>
											<span title="额外补息" class="platform_rate">+1.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>185天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>62.80万元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1004" class="btn btn-buy">
											马上投资
										</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-2">
			<h3>
				<a href="https://lantouzi.com/project/1052" title="懒人计划9月期1052">懒人计划9月期1052</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+1.80%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>272天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>40.20万元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1052" class="btn btn-buy">
											马上投资
										</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1045" title="懒人计划保理3月期1045">懒人计划保理3月期1045</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">8.00%</strong>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>90天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1045" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/995" title="懒人计划保理2月期995">懒人计划保理2月期995</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">7.50%</strong>
											<span title="额外补息" class="platform_rate">+1.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>60天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/995" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1053" title="懒人计划9月期1053">懒人计划9月期1053</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+1.80%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>274天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1053" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/887" title="懒人计划9月期887">懒人计划9月期887</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+1.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>270天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/887" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1044" title="懒人计划9月期1044">懒人计划9月期1044</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+2.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>274天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1044" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1024" title="懒人计划保理3月期1024">懒人计划保理3月期1024</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">8.00%</strong>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>91天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1024" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1036" title="懒人计划9月期1036">懒人计划9月期1036</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+2.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>274天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1036" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1028" title="懒人计划9月期1028">懒人计划9月期1028</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+2.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>274天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1028" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1025" title="懒人计划保理3月期1025">懒人计划保理3月期1025</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">8.00%</strong>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>91天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1025" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
			<div class="l-project-item -lproject-item-status-4">
			<h3>
				<a href="https://lantouzi.com/project/1037" title="懒人计划9月期1037">懒人计划9月期1037</a> 
							</h3>
			<div class="l-project-detail clearfix">
				<p class="l-project-rate alignleft">
					年化收益<strong class="highlight">11.00%</strong>
											<span title="额外补息" class="platform_rate">+2.00%</span>
									</p>
				<p class="l-project-days alignleft">项目期限<strong>274天</strong></p>
				<p class="l-project-amout alignleft">剩余金额<strong>0元</strong></p>
			</div>
			<div class="buy-btn">
									<a href="https://lantouzi.com/project/1037" class="btn btn-buy btn-forbidden" style="cursor:pointer">卖光了</a>
							</div>			
		</div>
	</div>			<div id="pager"><div class="PagerView">
<span>|&lt;</span><span>&lt;&lt;</span><span class="on">1</span><a href="javascript://2"><span>2</span></a><a href="javascript://3"><span>3</span></a><a href="javascript://4"><span>4</span></a><a href="javascript://5"><span>5</span></a><a href="javascript://6"><span>6</span></a><a href="javascript://7"><span>7</span></a><a href="javascript://8"><span>8</span></a><a href="javascript://9"><span>9</span></a><a href="javascript://2"><span>&gt;&gt;</span></a><a href="javascript://99"><span>&gt;|</span></a><p>一共99页, 982条记录</p></div><!-- /.pagerView -->
</div>
		</div>
	</div>

	<div class="aside alignright">
		<div class="side-mod">
					<div class="hd">
				<h3 class="tit2">最新公告</h3>
			</div>
			<div class="bd">
				<ul class="news-list">
									<li>
						<a href="https://lantouzi.com/post/212" title="2015年5月19日项目回款完毕公告">2015年5月19日项目回款完毕公告</a>
						<span class="right-ext">05-19</span>
					</li>
									<li>
						<a href="https://lantouzi.com/post/211" title="2015年5月18日项目回款完毕公告">2015年5月18日项目回款完毕公告</a>
						<span class="right-ext">05-18</span>
					</li>
									<li>
						<a href="https://lantouzi.com/post/209" title="518理财节领奖专场  优惠券使用说明">518理财节领奖专场  优惠券使用说明</a>
						<span class="right-ext">05-18</span>
					</li>
									<li>
						<a href="https://lantouzi.com/post/207" title="2015年5月15日项目回款完毕公告">2015年5月15日项目回款完毕公告</a>
						<span class="right-ext">05-15</span>
					</li>
									<li>
						<a href="https://lantouzi.com/post/206" title="2015年5月14日项目回款完毕公告">2015年5月14日项目回款完毕公告</a>
						<span class="right-ext">05-14</span>
					</li>
									<li>
						<a href="https://lantouzi.com/post/205" title="2015年5月13日项目回款完毕公告">2015年5月13日项目回款完毕公告</a>
						<span class="right-ext">05-13</span>
					</li>
								</ul>
			</div>
				</div>
		<!-- banner star -->
								<div style="margin-top:30px">
				<a href="https://lantouzi.com/zt/licaijie" target="_blank"><img src="../../jingtai/js/320x160.jpg" alt=""></a>
			</div>
									<a style="position:fixed;width:100px;height:144px;bottom:350px;right:20px;background:url(&#39;https://s1.lantouzi.com/img/201505/518/518maodian.png&#39;) center top no-repeat;cursor:pointer;" href="https://lantouzi.com/zt/licaijie" target="_blank"></a>
							<!-- banner end -->
		<div class="side-mod">
			<div class="hd">
				<h3 class="tit2">投资风云榜</h3>
			</div>
			<div class="bd bang">
				<marquee direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" style="height:200px;">
					<ul class="rank-list">
											<li class="clearfix">
							<span class="rank-num"><em>1</em></span>
							<span class="rank-user">y***n</span>
							<span class="rank-money">￥5,047,700.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>2</em></span>
							<span class="rank-user">q***o</span>
							<span class="rank-money">￥4,987,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>3</em></span>
							<span class="rank-user">j***1</span>
							<span class="rank-money">￥3,356,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>4</em></span>
							<span class="rank-user">y***2</span>
							<span class="rank-money">￥3,272,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>5</em></span>
							<span class="rank-user">b***t</span>
							<span class="rank-money">￥2,987,600.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>6</em></span>
							<span class="rank-user">y***e</span>
							<span class="rank-money">￥2,467,000.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>7</em></span>
							<span class="rank-user">y***u</span>
							<span class="rank-money">￥2,439,000.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>8</em></span>
							<span class="rank-user">L***u</span>
							<span class="rank-money">￥2,437,700.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>9</em></span>
							<span class="rank-user">l***g</span>
							<span class="rank-money">￥2,431,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>10</em></span>
							<span class="rank-user">h***9</span>
							<span class="rank-money">￥2,407,900.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>11</em></span>
							<span class="rank-user">q***r</span>
							<span class="rank-money">￥2,402,500.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>12</em></span>
							<span class="rank-user">t***2</span>
							<span class="rank-money">￥2,379,900.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>13</em></span>
							<span class="rank-user">j***q</span>
							<span class="rank-money">￥2,376,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>14</em></span>
							<span class="rank-user">i***s</span>
							<span class="rank-money">￥2,257,100.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>15</em></span>
							<span class="rank-user">m***a</span>
							<span class="rank-money">￥2,194,000.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>16</em></span>
							<span class="rank-user">r***1</span>
							<span class="rank-money">￥2,136,300.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>17</em></span>
							<span class="rank-user">x***y</span>
							<span class="rank-money">￥2,129,400.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>18</em></span>
							<span class="rank-user">z***o</span>
							<span class="rank-money">￥2,005,500.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>19</em></span>
							<span class="rank-user">l***i</span>
							<span class="rank-money">￥2,000,000.00</span>
						</li>
											<li class="clearfix">
							<span class="rank-num"><em>20</em></span>
							<span class="rank-user">f***4</span>
							<span class="rank-money">￥1,968,500.00</span>
						</li>
										</ul>
				</marquee>
			</div>
		</div>
	</div>
</div>
<script>
var UNAME = 'xyf200948350210';
var hdList = [{
		holder:'.l-project-list',
		num: 1
	}, {
		holder:'.side-mod .bang',
		num: 2
	}];
$(function(){
	var pager = new PagerView('pager');
	pager.index = 0;
	pager.size = 10;
	pager.itemCount = 982;
	pager.onclick = function(index){
		var size = pager.size;
		var page = pager.index;
		var ps = {page: page, size: size};
		var url = "https:\/\/lantouzi.com\/project\/index" + '?' + $.param(ps);
		location.href = url;
	}
	pager.render();
});
</script>
		</div>
		<div id="ft">
	<div class="clearfix ft-links">
		<div class="alignleft ft-links-item about">
			<h3>关于懒投资</h3>
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
			<img src="../../jingtai/js/qrcode.png" width="120px" height="120px" title="微信号:lantouzicom">
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
			<p><a href="https://lantouzi.com/project?ua=pc" style="color:#999;padding:0px 5px;" rel="nofollow">PC版</a>
			<a href="https://lantouzi.com/project?ua=mobile" style="color:#999;padding:0px 5px;text-decoration:underline" rel="nofollow">手机版</a></p>
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


<iframe src="../../jingtai/cm.htm" scrolling="no" width="1" height="1" style="display: none;"></iframe></body></html>