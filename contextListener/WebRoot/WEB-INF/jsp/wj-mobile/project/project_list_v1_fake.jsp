<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<title>万金先生 - 我要理财</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />

<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-mobile-static/css/follow.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="wj-mobile-static/ui2/css/reset.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/plist.css"/>
<link rel="stylesheet" href="wj-mobile-static/ui2/css/common.css"/>
<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="wj-mobile-static/js/dropload.js" type="text/javascript"></script>
<script src="wj-mobile-static/ui2/js/project.js" type="text/javascript"></script>
<script src="wj-mobile-static/js/follow.js" type="text/javascript"></script>
</head>

<body>
<div class="row1">
  <div class="td">
    
  </div>
  <div class="clearfix" style="clear:both"></div>
  <div id="waiting" class="waiting" style="height: 0;text-align: center;"><img src="wj-mobile-static/images/waiting.gif"/></div>
  <!-- <div style="height: 1px;display: block;margin-top:90px; "></div> -->
  <%@include file="../common/main_nav.jsp" %>
</div>
	<div id="proExample" style="display: none">
		<div class="tb">
	    	<div class="caption">
		        <h4>万金商承</h4>
		        <p>6月期10102</p>
		        <div class="bili">
		        	<span id="zi_1">12</span><span id="zi_2">%</span>
		        </div>
		        <p>项目期限: 183天<p>
	        	<p>剩余金额: 60万元<p>
		        <p><a href="#" class="btn-buy" role="button">马上投资</a></p>
	      </div>
	    </div>
	</div>
	
	<a href="javascript:void(0);" class="concerned-btn"><img src="wj-mobile-static/images/concerned.png"/></a>
	<div class="concerned-mask">
		<a href="javascript:void(0);" class="concerned-close"><i class="fa fa-times"></i></a>
		<img src="wj-mobile-static/images/index1_31.png" class="concerned-QRCode"/>
		<p class="msg">长按二维码点击“识别图中的二维码”即可关注</p>
	</div>
<!-- <div class="footer">
</div> -->
<!-- <script src="wj-mobile-static/js/zepto.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=1");
	val_array.push("WEB_OR_MOBILE=2");
	val_array.push("RANDOM_CODE="+randomCode);
	$.ajax({
	   type: "post",
	   url: "<%=basePath%>register/viewlog",
	   data: val_array.join('&'),
	   success: function(data){}
	 });
});

</script>
</body>
</html>
