<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@include file="../public/header_v2.jsp"%>
</div>
<div class="content main">
	<div class="tzcg1">
		<img src="<%=basePath%>wj-static/rc/images/${img }">
		
		<h2>${msg }</h2>
		<div class="btn">
			<c:if test="${type == 'touzi'}">
				<a href="<%=basePath%>_project/goInvestmentRecord"><button>查看投资记录</button></a>
				<a href="<%=basePath%>_project/goProjectList?type=0"><button>继续看看项目</button></a>
			</c:if>
			<c:if test="${type == 'huankuan'}">
				<a href="<%=basePath%>myAccount/payment"><button>查看项目记录</button></a>
			</c:if>
		</div>
	</div>
</div>
<%@include file="../public/foot_v2.jsp"%>


