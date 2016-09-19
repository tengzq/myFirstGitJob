<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		

	</head>
<body>
	
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<c:set value="${trailList[0]}" var="firstTrail"></c:set>
			<c:if test="${!empty firstTrail && firstTrail.TEL ne null}">
				<tr>
					<th>真实姓名：</th>
					<td>${firstTrail.REAL_NAME}</td>
					<th>手机号：</th>
					<td>${firstTrail.TEL}</td>
				</tr>
			</c:if>
			
			<tr>
				<th>设备</th>
				<th>浏览页面</th>
				<th colspan="2">浏览时间</th>
			</tr>
			<c:forEach items="${trailList}" var="trail">
				<tr>
					<td>
						<c:if test="${trail.WEB_OR_MOBILE=='1'}">
							PC
						</c:if>
						<c:if test="${trail.WEB_OR_MOBILE=='2'}">
							手机
							<c:set value="${trail.USER_AGENT}" var="ua"></c:set>
							<c:choose>
								<c:when test="${fn:contains(ua,'MicroMessenger')}">-微信</c:when>
								<c:otherwise>-浏览器</c:otherwise>
							</c:choose>
						</c:if>
					</td>
					<td>
						<c:if test="${trail.VIEW_ID=='0'}">
							主页
						</c:if>
						<c:if test="${trail.VIEW_ID=='1'}">
							项目列表
						</c:if>
						<c:if test="${trail.VIEW_ID=='2'}">
							万金生活
						</c:if>
						<c:if test="${trail.VIEW_ID=='3'}">
							邀请有奖
						</c:if>
						<c:if test="${trail.VIEW_ID=='4'}">
							借款
						</c:if>
						<c:if test="${trail.VIEW_ID=='5'}">
							登录
						</c:if>
						<c:if test="${trail.VIEW_ID=='6'}">
							注册
						</c:if>
						<c:if test="${trail.VIEW_ID=='7'}">
							安全保障
						</c:if>
						<c:if test="${trail.VIEW_ID=='8'}">
							个人中心
						</c:if>
						<c:if test="${trail.VIEW_ID=='9'}">
							移动端分享页
						</c:if>
						<c:if test="${trail.PROJECT_NAME != null && trail.PROJECT_NAME !=''}">
							${trail.PROJECT_NAME}-${trail.SUB_PAGE=='1'?'详情页':trail.SUB_PAGE=='2'?'购买页':trail.SUB_PAGE=='3'?'项目简介页':'购买确认页'}
						</c:if>
					</td>
					<td colspan="2">${trail.VIEW_DATETIME}</td>
				</tr>
			</c:forEach>
			<tr>
				<td style="text-align: center;" colspan="15">
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">关闭</a>
				</td>
			</tr>
		</table>
		</div>
		
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>