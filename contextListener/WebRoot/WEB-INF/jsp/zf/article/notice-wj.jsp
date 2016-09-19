<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 新闻公告</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/article.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
		document.onload = list(1,10);
	});
//列表

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
				listHtml+='<ul class="news-list"><li>';
				listHtml+='<a href="zfarticle/toNotice?id='+nrt[item].ARTICLE_ID+'">'+nrt[item].TITLE+'</a>';
				listHtml+='<span class="right-ext">'+nrt[item].CREATE_DATE+'</span>';
				listHtml+='</li></ul>';
			}   
	    	$('.pg-guide-content').html(listHtml);
			//nextPage(${page.currentPage});
	    	if(data.page.totalPage>1){
				$("#paginate").show();
			}else{
				$("#paginate").hide();
			}
	    	$("#paginate").paginate({
			    count: data.page.totalPage,
			    start: data.page.currentPage,
			    display: data.page.showCount,
			    border: true,
			    onChange: function(page) {
			    	list(page,10);
			    }
			});
		},
		error : function(e) {
			console.log(e);
			$("#msg").text("网络出现问题！");
		}
	});
}
</script>
</head>

<body style=" background:url(wj-static/images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
  <div class="pg-container-content">
      <div class="pg-guide-title">
            <h1 class="h3">新闻公告</h1>
            
          </div>
          <div class="clear"></div>
  <div id="pg-guide-one" class="pg-guide-sercurity">
    <div class="container_12 mt10">
      <div class="grid_12"> 
        <div class="pg-guide-content">
          
        </div>
        <div id="paginate"></div>
      </div>
    </div>
  </div>

 </div>
</div>

<%@ include file="../public/foot.jsp"%>

</body></html>