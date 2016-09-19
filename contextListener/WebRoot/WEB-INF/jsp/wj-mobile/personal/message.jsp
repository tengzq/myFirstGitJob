<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>站内信</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/message.css" />
		<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
		<link rel="stylesheet" href="wj-mobile-static/css/sweetalert.css">
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
		
		<style type="text/css">
			.no-ticket-tag{
				text-align: center;
			    margin: 30px 15px;
			    padding: 20px 0 10px 0;
			    font-size: 16px;
			    border-radius: 10px;
			    background-color: #fff;
		        box-shadow: 0 5px 0 0 #909090;
			}
			.no-ticket-tag>div{
				margin-bottom: 20px;
			}
			.no-ticket-tag>div:last-child{
				margin-bottom: 5px;
			}
			.no-ticket-tag>div:last-child input{
			    border: 0;
			    background-color: #2e9dd0;
			    color: #fff;
			    height: 35px;
			    width: 110px;
			    margin: 0 5px;
			    border-radius: 5px;
		        font-size: 15px;
			}
			.no-ticket-tag>div:last-child a:last-child input{
				background-color: #ff6264;
			}
		</style>
	</head>
	

	<body>
		<div class="p61">
			<div class="main">
		        <a href="javascript:void(0)" class="del-all-read">删除全部消息</a>|
		        <a href="javascript:void(0)" class="yidutips">全部设为已读</a>
		    </div>
		</div>
		<div class="page6 main">
			<div class="p62" id="tabs" data-status="${status}">
		    	<ul>
		        	<li <c:if test="${status == null || status == ''}">class="hover"</c:if>>
		            	<a href="mobile/personal/message">全部</a>
		            </li>
		        	<li <c:if test="${status == 0}">class="hover"</c:if>>
		            	<a href="mobile/personal/message?status=0">未读</a>
		            </li>
		        	<li <c:if test="${status == 1}">class="hover"</c:if>>
		            	<a href="mobile/personal/message?status=1">已读</a>
		            </li>
		        </ul>
		    </div>
		    <div class="p63">
		    	
		    </div>
		</div>
		<div id="msgExample" style="display: none;">
			<dl>
	        	<dt>
	            	<h3><em class="open-close">展开∨</em>$title$</h3>
	            	<!-- <a href="javascript:void(0)" class="fr"></a> -->
	                <h4>$time$</h4>
	                <h6>$desc$</h6>
	            </dt>
	            <dd>
	            	<p>$content$</p>
	            </dd>
	        </dl>
		</div>
		
		<div id="waiting" class="waiting" style="height: 0;text-align: center;display: none"><img src="wj-mobile-static/images/waiting.gif"/></div>
		<%@include file="../common/main_nav.jsp" %>
		<script type="text/javascript" src="wj-mobile-static/js/sweetalert.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/ui2/js/message.js"></script>
	</body>

</html>
