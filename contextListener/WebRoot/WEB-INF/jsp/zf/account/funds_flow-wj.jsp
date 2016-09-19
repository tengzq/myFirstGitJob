<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href='<%=basePath%>'>
<title>万金先生 - 资金流水</title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/page-view.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/fundsflow.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="plugins/jpaginate/css/style.css" />
<script src="wj-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
<script type="text/javascript"src="plugins/jpaginate/jquery.paginate.js"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	document.onload = list(1,10,'');
});

//列表
function list(curPage,showCount,type){
	var vala='${sessionScope.sessionZfUser.USER_ID}';

	$.ajax({
		type: "POST",
		url: '<%=basePath%>fundsflow/allList?TYPE=' + type+ '&currentPage=' + curPage + '&showCount='+ showCount + '&USER_ID=' + vala,
				dataType : 'json',
				cache : false,
				success : function(data) {
					var TT=data.TYPE;
					if(TT){
					$('.tlist').children().eq(parseInt(TT)+1).addClass('hover').siblings().removeClass('hover');
					}else{
						$('.tlist').children().eq(0).addClass('hover').siblings().removeClass('hover');
					}
					var singlefundsList = data.singlefundsList;
					console.log(singlefundsList.length, singlefundsList);
					var listHtml = '';
					for ( var item in singlefundsList) {
						var val = singlefundsList;
						listHtml += '<tr>';
						listHtml += '<td>'+ (val[item].TYPE == "0" ? "充值": (val[item].TYPE == "1" ? "投资": (val[item].TYPE == "2" ? "提现": (val[item].TYPE == "3" ? "收益": (val[item].TYPE == "4" ?"回收本金":"银行卡转账")))))+ '</td>';
						listHtml += '<td>' + val[item].TRADE_TIME+ '</td>';
						listHtml += '<td>' + val[item].AMOUNT + '</td>';
						listHtml += '<td>' + val[item].BALANCE + '</td>';
						listHtml += '<td>' + val[item].REMARK + '</td>';
						listHtml += '</tr>';
					}
					$('#forlist').find('tbody').html(listHtml);
					//nextPage(${page.currentPage});
					if (data.page.totalPage > 1) {
						$("#paginate").show();
					} else {
						$("#paginate").hide();
					}
					$("#paginate").paginate({
						count : data.page.totalPage,
						start : data.page.currentPage,
						display : data.page.showCount,
						border : true,
						onChange : function(page) {
							list(page, 10, type);
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
<body style=" background:url(images/logo_03.png)">
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
	<%@ include file="../public/acc_left.jsp"%>
    <div class="content">
    	<div class="gerenxinxi zijinliushui">
        	<h3>
            	<span>资金流水</span>
            </h3>
            <div class="nav" style="cursor:pointer;">
            	<ul class="tlist">
                	<li class="hover"><a onclick="list(1,10,'')">全部</a></li>
                	<li><a onclick="list(1,10,0)">充值</a></li>
                	<li><a onclick="list(1,10,1)">投资</a></li>
                	<li><a onclick="list(1,10,2)">提现</a></li>
                	<li><a onclick="list(1,10,3)">收益</a></li>
                	<li><a onclick="list(1,10,4)">回收本金</a></li>
                    <div class="clear"></div>
                </ul>
            </div>
            <div class="con">
            	<table id="forlist">
            	<thead>
                	<tr>
                    	<th width="50px">类型</th>
                    	<th width="120px">交易时间</th>
                    	<th width="80px">交易金额</th>
                    	<th width="80px">账户余额</th>
                    	<th>备注</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <!-- 
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资付款</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资订单id:867，订单：40978</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资付款</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资订单id:867，订单：40978</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资付款</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资订单id:867，订单：40978</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资付款</td>
                    </tr>
                    <tr>
                    	<td>投资</td>
                    	<td>2015-02-23 15：11：01</td>
                    	<td>-100.00</td>
                    	<td>0.83</td>
                    	<td>投资订单id:867，订单：40978</td>
                    </tr>
                     -->
                </table>
                <div id="paginate"></div>
                <div class="Bnav"></div>
            </div>
            
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
