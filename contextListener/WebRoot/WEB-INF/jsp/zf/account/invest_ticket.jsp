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
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/investticket.css" rel="stylesheet" type="text/css">
<link href="plugins/jpaginate/css/style.css" rel="stylesheet" type="text/css">
<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="plugins/jpaginate/jquery.paginate.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	document.onload = list(1,10);
});

//列表
function list(curPage,showCount){
	
	$.ajax({
		type: "POST",
		url: '<%=basePath%>investrecord/singleinvestTicket?currentPage='+curPage+'&showCount='+showCount,
		dataType:'json',
		cache: false,
		success: function(data){
			var ticketList=data.ticketList;
			var listHtml = '';
			console.log(typeof ticketList,ticketList.length,data.ticketList,data.ticketList.length);
			if(ticketList.length==0 ){
				console.log('没有数据');
				listHtml+='<div class="box" style="text-align:center;">';
				listHtml+='<p style="font-size:16px;margin:20px;">没有获得现金券';
				listHtml+='</p>';
				listHtml+='</div>';
			}else{
				for(var item in ticketList){
					var vala=data.ticketList;
					listHtml+='<div class="box">';
					listHtml+='<div class="fl">';
					listHtml+='<h3>'+(vala[item].TICKET_TYPE=='TZ_TICKET'?'现金券':'加息券')+'</h3>';
					listHtml+='<p><b>'+vala[item].DISCOUNT_AMOUNT+'</b>元</p>';
					listHtml+=(vala[item].UT_IS_ENABLED=="0"?'<h6  style="background:url(wj-static/images/bukeyong.png); width:86px; height:86px; position:absolute; right:0; bottom:0;"></h6>':'<h6></h6>');
					listHtml+='</div>';
					listHtml+='<div class="txt">';
					listHtml+='<h3>'+(vala[item].UT_IS_ENABLED=="1"?'<a href="_project/goProjectList" class="fr">投资使用</a>':"")+vala[item].TICKET_NAME+'</h3>';
					listHtml+='<p>使用规则：'+vala[item].TICKET_DES+'</p>';
					listHtml+='<h4>有效期：'+vala[item].UT_CREATE_DATE+' 至 '+vala[item].UT_ENABLE_DATE+'</h4>';
					listHtml+='</div>';
					listHtml+='</div>';
				}  
			} 
	    	$('.con').html(listHtml);
	    	
			/* 
	    	if(data.page.totalPage>1){
				$("#paginate").show();
			}else{
				$("#paginate").hide();
			}
	    	 */
	    	/* $("#paginate").paginate({
			    count: data.page.totalPage,
			    start: data.page.currentPage,
			    display: data.page.showCount,
			    border: true,
			    onChange: function(page) {
			    	list(page,10);
			    }
			}); */
		},
		error : function(e) {
			console.log(e);
			$("#msg").text("网络出现问题！");
		}
	});
}
</script>

</head>

<body style=" background:url(images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
	<%@ include file="../public/acc_left.jsp"%>
    <div class="content">
    	<div class="gerenxinxi touziquan">
        	<h3>
            	<span>现金券</span>
            </h3>
           <!--  
            <div class="nav">
            	<ul>
                	<li class="hover"><a href="#">满减券</a></li>
                	<li><a href="#">加息券</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
             -->
            <div class="con">
            </div>
            <div id="paginate"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
</body>
</html>
