<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 充值申请成功</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/recharge.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/layout.js" type="text/javascript"></script>

</head>
<body   style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
<%@ include file="../public/acc_left.jsp"%>
	<div class="content">
    <div class="gerenxinxi tixianyinhangka">
        <h3>
           <span>充值申请成功</span>
         </h3>
     </div>
     <div class="con successCon">
      	<i class="icon"></i>
		<h3>转账申请提交成功</h3>
		<!-- <p>518理财节火热进行中</p> -->
		<div class="clearfix">
			<a href="myAccount/list">返回个人中心</a>
			<a href="_project/goProjectList">去看看项目</a>
		</div>
    </div>
</div>

	
<div class="clear"></div>
</div>
<%@ include file="../public/foot.jsp"%>
</body>
</html>