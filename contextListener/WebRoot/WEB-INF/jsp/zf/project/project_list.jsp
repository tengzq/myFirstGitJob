<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../public/header_v2.jsp"%>
</div>
<script src="<%=basePath%>wj-static/rc/js/project-list.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=basePath%>wj-static/css/kkpager_rongchao.css" rel="stylesheet" type="text/css">
<div class="content main">
    <div class="styletitle1">
    	<h3>理财产品</h3>
        <h6><span>适合闲置资金，长期投资，赚钱高收益</span></h6>
    </div>
   <%-- <div class="search">
    	<div class="box">
        	
        	 <form action="goProjectList" method="post">
        		<input type="text" id="project_name" name="PROJECT_NAME" value="${pd.PROJECT_NAME }">
        		<input type="image" src="<%=basePath%>wj-static/rc/images/lccp_03.jpg">
        	</form>
        </div>
    </div> --%>
    <div class="mainmenu2">
    	<ul>
        	<li class="0 hover"><a href="goProjectList?type=0">全部</a></li>
        	<li class="1"><a href="goProjectList?type=1">募集中</a></li>
        	<li class="2"><a href="goProjectList?type=2">还款中</a></li>
        	<li class="3"><a href="goProjectList?type=3">已结束</a></li>
        </ul>
    </div>
    <div id="container" class="index2" style="background:#fff;">
        <div class="clear"></div>
    </div>
    <div id="pro-template" style="display: none;">
	    <div class="box">
	        	<h3 @link@>@pName@</h3>
	            <h4><b>@totalRate@%</b><i>年化收益率</i></h4>
	            <ol>
	            	<li><b>项目期限（天）</b><i>@deadline@</i></li>
	            	<li><b>借款金额（元）</b><i>@totalAmount@</i></li>
	            	<li><b>项目进度（%）</b><em class="fr">@progress@%</em></li>
	            </ol>
	            <div class="line">
	            	<h5><span style="width:@progress@%"><i></i></span></h5>
	            </div>
	            <div class="btn1">
	            	<a href="goDetails?ID=@pid@"><button style="@style@">@Chinese@</button></a>
	            </div>
        </div>
    </div>
   <div id="kkpager" style="">
    
</div>
</div>
<script src="<%=basePath%>wj-static/js/kkpager.js" type="text/javascript"></script>
<script type="text/javascript">
		$(document).ready(function(){
			//访问记录
			var val_array = new Array();
			var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
			val_array.push("TYPE=1");
			val_array.push("VIEW_ID=1");
			val_array.push("WEB_OR_MOBILE=1");
			val_array.push("RANDOM_CODE="+randomCode);
			$.ajax({
			   type: "post",
			   url: "<%=basePath%>register/viewlog",
			   data: val_array.join('&'),
			   success: function(data){}
			 });
		});
		
		/*function setSelect(thisTab) {
			$('.con div.tzjl nav ul').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
			type = thisTab;
			getProjects(0,10,type);
		}*/
	  	(function(){
		//设置当前选中的导航标题
		var url = top.location.href;
		var urls = url.split('/');
		var thisTab = urls[urls.length-1].split('=')[1];
		$('.mainmenu2 ul').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
		type = thisTab;
		})();
		
		/*
			$(function() {
			if ('${pd.PROJECT_STATE}' != '') {
				$('.tzjl nav ul li').eq(${pd.PROJECT_STATE}).addClass('hover').siblings().removeClass('hover');
			}
			
			kkpager.generPageHtml({
				pno : ${page.currentPage} || 1,
				//总页码
				total : ${page.totalPage} || 1,
				//总数据条数
				totalRecords : ${page.totalResult} || 0,
				mode : 'click',//默认值是link，可选link或者click
				click : function(n){
					// do something
					window.location.href = "<%=basePath%>_project/goProjectList?PROJECT_STATE=${pd.PROJECT_STATE}&currentPage="+n+"&showCount=10";
				}
				
			});
		});
		*/
</script>
<%@include file="../public/foot_v2.jsp"%>