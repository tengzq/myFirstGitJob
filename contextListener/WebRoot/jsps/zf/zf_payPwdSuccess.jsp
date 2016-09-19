<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>注册</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财">
<meta name="description" content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script async="" src="jingtai/js/analytics.js"></script><script type="text/javascript" async="" src="jingtai/js/trace.js"></script><script src="jingtai/js/hm.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script src="jingtai/js/register.js"></script>
<!-- <script type="text/javascript" src="jingtai/js/passport.js"></script>
<script src="jingtai/js/register.common.js"></script> -->
<link rel="stylesheet" type="text/css" href="jingtai/css/passport.css">
<img src="jingtai/css/v.do" height="1" width="1">


</head>
<script type="text/javascript" src="jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>

<link rel="stylesheet" type="text/css" href="jingtai/css/passport.css">
<img src="jingtai/v.do" height="1" width="1"><script type="text/javascript" src="jingtai/js/zz.js"></script></head>
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
									<a href="" rel="nofollow">欢迎,${pd.USERNAME }</a>
					<a href="out" rel="nofollow">[退出]</a>
								<a href="" rel="nofollow">手机App</a>
				<a href="">帮助中心</a>
			</p>
		</div>
	</div>
</div>			<div class="header-clean clearfix">
				<div class="logo">
					<a href="register/addRealName">
						<img src="jingtai/img/logo_clean.png">
					</a>
					
				</div>
			</div>
		</div>

		<div id="bd">
			<div class="main">
				<style type="text/css">
	.register-success-layout{
		width: 600px;
		height: 320px;
		margin: 0 auto; 
	}
	.register-success-layout .icon{
		background: url(https://s1.lantouzi.com/img/201502/success_icon_new.png) top left no-repeat;
		width: 90px;
		height: 90px;
		display: block;
		margin: 15px auto;
	}
	.register-success-layout h3{
		display: block;
		text-align: center;
		color: #93C234;
		font-size: 24px;
		margin: 0 auto;
	}
	.register-success-layout p{
		display: block;
		margin: 10px auto;
		text-align: center;
		font-size: 16px;
		color: #999;
	}
	.register-success-layout p strong{
		font-size: 22px;
		color: #F63;
	}
	.register-success-layout div{
		width: 330px;
		height: 50px;
		margin: 0 auto;
	}
	.register-success-layout div a{
		display: block;
		float: left;
		width: 120px;
		height: 40px;
		line-height: 40px;
		color: #FFF;
		background: #F63;
		margin: 0 20px;
		text-align: center;
		font-size: 16px;
	}
</style>
<div class="register-success-layout">
	<i class="icon"></i>
	<h3>实名开通托管账户成功</h3>
	<p>518理财节火热进行中</p>
	<div class="clearfix">
		<a href="">立即参加活动</a>
		<a href="">看看其他项目</a>
	</div>
</div>

			</div>
		</div>
		
		
<%@ include file="../public/foot.jsp"%>

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

</script>


	</div>

<iframe src="jingtai/cm.htm" scrolling="no" width="1" height="1" style="display: none;"></iframe></body></html>