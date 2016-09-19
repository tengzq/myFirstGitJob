<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<base href="<%=basePath%>">
		<title>融巢资本--首页</title>
        <link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/reset.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/rc/css/notice.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>wj-static/css/kkpager_rongchao.css"/>
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
		
        <div class="main">
			<div class="mainbody">
				<div class="pg-guide-title">
			 		新闻公告
			 	</div>
        	 	
	        	 <div class="container_12">
	        	 	<div class="pg-guide-content">
	        	 		<ul class="news-list">
	        	 			<li style="text-align: center;">暂无数据</li>
	        	 		</ul> 
	        	 		<div class="pager">
	        	 			<div id="kkpager"></div>
	        	 		</div>       	 		
	        	 	</div>        	 	
	        	 </div>
	             <div class="clear"></div>
	             
        	</div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
		<script type="text/javascript" src="<%=basePath%>wj-static/js/kkpager.js"></script>
		<script type="text/javascript">
			list(1,10);
			function list(curPage,showCount){
				$.ajax({
					type: "POST",
					url: '<%=basePath%>zfarticle/noticppList?currentPage='+curPage+'&showCount='+showCount,
					dataType:'json',
					cache: false,
					success: function(data){
						var noticeAllList=data.noticeAllList;
						var listHtml = '';
						for(var item in noticeAllList){
							var nrt=data.noticeAllList;
							listHtml+='<li>';
							listHtml+='<a href="<%=basePath%>zfarticle/toNotice?id='+nrt[item].ARTICLE_ID+'">'+nrt[item].TITLE+'</a>';
							listHtml+='<span class="right-ext">'+nrt[item].CREATE_DATE+'</span>';
							listHtml+='</li>';
						}   
				    	$('.pg-guide-content ul.news-list').html(listHtml);
				    	kkpager.generPageHtml({
							pno : data.page.currentPage || 1,
							//总页码
							total : data.page.totalPage || 1,
							//总数据条数
							totalRecords : data.page.totalResult || 0,
							mode : 'click',//默认值是link，可选link或者click
							click : function(n){
								// do something
								list(n,10);
								//手动选中按钮
								this.selectPage(n);
								return false;
							}
							
						});
					},
					error : function(e) {
						
						$("#msg").text("网络出现问题！");
					}
				});
			}
		</script>
	</body>
</html>
