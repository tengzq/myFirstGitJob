
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
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		/* $(function(){
			var a="${lis}";
			
			if(typeof(a) == "string"){
				alert(a);
			}
		/* 	alert(isArray(a)); */
			/* var y="#div";
			var x;
			for(var c=1;c<=a.length;c++){
				;
				x=1+""+y;
				c1=parseInt(c);
				$(x).
			} */


		/* function isArray(o) {
		    return Object.prototype.toString.call(o) === ‘[object Array]‘;
		}
 */

		
		</script>
	</head>
	<body style="background:#f9f9f9">
		<%@include file="../public/header_v2.jsp" %>
		
        <div class="main">
			<div class="mainbody">
			
				<div class="pg-guide-title" style="margin: auto;text-align: center;" >
			 		更多媒体报道
			 	</div>
        	 	<!-- <div  class="clearfix123" style="margin: auto;-moz-user-select: none;align-content: center;text-align: center;color: #f5db9e;font-size: 22px;"></div> -->
			<c:forEach items="${lis }" var="vars" varStatus="it">
		<%-- 	<input type="text" value="${it.count }"> </input> border-bottom : 1px solid #6699cc;--%>
			<div class="clearfix" id="table1" style=" margin-top: 8px;">
				
				<%-- <div style="float: left;width: 50%;">
					<img src="<%=basePath%>${vars.MARK_PATH }" alt="" />
				</div> --%>
				
				<div style="float: left;width: 22%;">
					<%-- <img src="<%=basePath%>wj-static/rc/images/7.png" alt="" style="padding: inherit;"/> --%>
					<img src="<%=basePath%>${vars.MARK_PATH }" style="max-width:220px;max-height:146px;" alt="" />
				</div>
			<h3 style="margin-top: 24px;margin-bottom: 17px;font-size: 20px;color:#000000;margin-left:336px;">${vars.TITLE }</h3>
			<p style="font-size: 14px;line-height: 20px;color: #000000;word-wrap:break-word; word-break:normal;margin-left:238px;">&nbsp;&nbsp;&nbsp;&nbsp;${vars.ARTICLE_DESC}</p>
				<div style="width: 71%; margin-left: 26%; text-align: left;height: 148px;" id="div${it.count }">
			<%-- 	${vars.read } --%>
			<%-- <%@include file="${vars.FILE_PATH }" %> --%></div>
			<%-- 	<div><p>${vars.KEYWORDS }</p></div> --%>
			<%-- 	<div><p>${vars.KEYWORDS }</p></div> --%>
			</div>
			</c:forEach> 
	             <div class="clear"></div>
        	</div>
		</div>
		<%@include file="../public/foot_v2.jsp" %>
		<%-- <script type="text/javascript" src="<%=basePath%>wj-static/js/kkpager.js"></script>
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
		</script> --%>
	</body>
</html>
