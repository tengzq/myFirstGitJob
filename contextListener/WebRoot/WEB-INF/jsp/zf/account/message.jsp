<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href='<%=basePath%>'>
<title>万金先生</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/sweetalert.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/message.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/kkpager_orange.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script type="text/javascript">

</script>

</head>

<body style=" background:url(images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
	<%@ include file="../public/acc_left.jsp"%>
    <div class="content" >
    	<div class="gerenxinxi touziquan">
        	<h3>
            	<span>站内信</span>
            </h3>
       		<div class="user-page user-msg-page">
			    <div class="user-box-1" >
			        <div class="user-box-title-1 clearfix">
			            <!--  <h2>站内信息</h2> -->
			            <div class="user-box-title-more" style="160px;">
			                <strong style="margin-right:10px;margin-top:15px;height:26px; " class="yidu"><a href="javascript:void(0)" class="yidutips"  title="暂无未读消息">全部标记为已读</a></strong>
			                <strong><a href="javascript:void(0)" class="del-all-read">删除全部已读消息</a></strong>
			            </div>
			        </div>
			        <dl class="classify-selected clearfix" id="tabs" data-status="${status}">
			            <dt>状态</dt>
			            <dd>
			                <ul class="classify-selected-list clearfix">
			                    <li>
			                        <a <c:if test="${status==null || status == ''}">class="selected"</c:if> href="myAccount/message">全部</a>
			                    </li>
			                    <li>
			                        <a <c:if test="${status==0}">class="selected"</c:if> href="myAccount/message?status=0">未读</a>
			                    </li>
			                    <li>
			                        <a <c:if test="${status==1}">class="selected"</c:if> href="myAccount/message?status=1">已读</a>
			                    </li>
			                </ul>
			            </dd>
			        </dl>                 
			        <div class="no-message" style="display: none">
			        	暂无站内信
			        </div>
			        <div class="user-box-con-1 user-hint" style="padding-top:0">
                    	
                       
			        </div>
			        <div id="kkpager"></div>
			    </div>
			</div>
        </div>
    </div>
    <div class="clear"></div>
    <div id="msgExample" style="display: none">
    	<dl class="">
	         <dt>$title$</dt>
	         <dd>
	             <div class="user-hint-time">$time$</div>
	             <div class="user-hint-intro">$desc$</div>
	             <div class="user-hint-con" style="display:none;">
	                 $content$
	             </div>
	             <span class="user-hint-show">展开&nbsp;&nbsp;<strong>∨</strong></span>
	         </dd>
	     </dl>
    </div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
<script src="wj-static/js/sweetalert.min.js" type="text/javascript"></script>
<script src="wj-static/js/kkpager.js" type="text/javascript"></script>
<script src="wj-static/js/message.js" type="text/javascript"></script>
</body>
</html>
