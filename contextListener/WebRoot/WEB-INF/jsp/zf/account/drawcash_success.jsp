<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>融巢资本--提现成功</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/drawcash-success.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
		
        <div class="main">
            <div class="zhuye">
            	<%@include file="../public/left_nav.jsp" %>
                <div class="right">
                	<div class="title2">
                    	<h2><b>我要提现</b></h2>
                    </div>
                    <div class="con">
                    	<div class="txcg">
                        	<div class="title">
                            	可用余额：<b>${sessionScope.sessionZfUser.BALANCE}</b>元
                            </div>
                            <div class="box">
                            	<img src="<%=basePath%>wj-static/rc/images/gmcg_03.jpg">
                                <h3>恭喜您，已成功提交提现申请！</h3>
                                <table>
                                	<tr>
                                    	<th>提现金额</th>
                                    	<th>到账金额</th>
                                    	<th>提交时间</th>
                                    	<th>预计到账时间</th>
                                    	<th>状态</th>
                                    </tr>
                                    <c:forEach items="${drawcashList}" var="dc">
										<tr>
											<td>¥${dc.amount}</td>
											<td>¥${dc.amount-2}</td>
											<td>${dc.create_date}</td>
											<td>${dc.pre_date} 24点之前</td>
											<td>
												<c:if test="${dc.status==1}">
													待处理
												</c:if>
												<c:if test="${dc.status==2}">
													处理中
												</c:if>
												<c:if test="${dc.status==3}">
													已完成
												</c:if>
												<c:if test="${dc.status==4}">
													失败
												</c:if>
											</td>
										</tr>
									</c:forEach>
									<c:if test="${empty drawcashList}">
										<tr>
											<td colspan="10">尚无提现申请</td>
										</tr>
									</c:if>
                                </table>
                                <div class="btn">
                                	<a href="<%=basePath %>myAccount/list"><button>返回我账户</button></a>
                                	<a href="<%=basePath %>myAccount/draw_cash"><button>继续提现</button></a>
                                </div>
                            </div>
                        </div>
                	</div>
            	</div>
            	<div class="clear"></div>
            </div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
</body> 
</html>
