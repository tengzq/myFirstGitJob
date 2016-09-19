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
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
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
		<%@ include file="../public/top.jsp"%>

		<div id="bd">
<style type="text/css">
	#ft{
		margin-top: 0;
	}
	.main-right h3 {font-size:20px; color:#333;margin-top:-40px;}
	.main-right p {color:#333;}
	.main-right a {display:inline-block;margin-top:5px;}
</style>
<!--错误增加class callback-error-->
<div class="callback-section callback-error">
	<div class="callback-main clearfix">
		<div class="main-left">
			<div class="callback-title">
				<h3>
				该身份证号已经被注册!				</h3>
				<p>很遗憾，您可以重新尝试或继续其他操作！</p>
			</div>
			<div class="callback-action clearfix">
				<a href="" class="callback-btn c-btn-dark">返回首页</a>
			</div>
		</div>
		<div class="main-right">
							<p>遇到问题不用怕，询问客服拨电话:</p>
				<p>400-807-8000（工作日 9:00-22:00）</p>
					</div>
	</div>
	<div class="callback-banner">
		<a href="" target="_blank"><img src="jingtai/img/error_banner.png"/></a>
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