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
		<title>投资券</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/fundsflow.css" />
		<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
		
		<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
	</head>

	<body>
		<%@include file="../common/head.jsp" %>
		<!-- <div id="slideBox">
			<div class="menu">
				<ul>
					<li class="on">满减券</li>
					<li>加息券</li>
				</ul>
			</div>
		</div> -->
		<!-- <section>
			<ul>
				<li>
					<dl>
						<dt>10000-50投资券</dt>
						<dd>满10000元减50元</dd>
					</dl>
				</li>
				<li class="amount">50 <sub>￥</sub></li>
			</ul>
			<div class="info">
				<span>有效期：2015-06-18 至 2015-07-18</span>
				<i class="fa fa-angle-down"></i>
			</div>
			<div class="info-detail">使用规则：注册即送10000-50投资卷。</div>
		</section> -->
		<div class="mainbody">
			<div id="slideBox">
				<div class="menu" id="slideBox">
					<ul>
						<li class="on" data-type=''>全部</li>
						<li data-type='0'>充值</li>
						<li data-type='1'>投资</li>
						<li data-type='2'>提现</li>
						<li data-type='3'>收益</li>
						<li data-type='4' style="width:25%">回收本金</li>
					</ul>
				</div>
			
				<div class="tables">
					<div>
						<table class="flowtb">
							<thead>
								<tr>
									<th>交易时间</th>
									<th>交易金额</th>
									<th>账户余额</th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
					<!-- <div><table class="flowtb"></table></div>
					<div><table class="flowtb"></table></div>
					<div><table class="flowtb"></table></div>
					<div><table class="flowtb"></table></div>
					<div><table class="flowtb"></table></div> -->
				</div>
			</div>
		</div>
		<script type="text/javascript">
			/* TouchSlide({
					slideCell : "#slideBox",
					titCell : ".menu li",
					mainCell : ".tables",
					titOnClassName : "on",
				}); */
		$(function(){
			$('.menu li').each(function(){
				console.log($(this).index());
				$(this).on('click',function(){
					var type = $(this).attr('data-type');
					list(1,20,type,$(this));
				});
			});
			
			list(1,20,'',$('.menu li:first-child'));
		});
		
		
			//列表
		function list(curPage,showCount,type,ele){
			var userid='${sessionScope.sessionZfUser.USER_ID}';
			var $ele = ele;
			$ele.siblings().removeClass('on');
			$ele.addClass('on');
			$.ajax({
				type: "POST",
				url: 'mobile/personal/allList?TYPE=' + type+ '&currentPage=' + curPage + '&showCount='+ showCount + '&USER_ID=' + userid,
						dataType : 'json',
						cache : false,
						success : function(data) {
							/* var TT=data.TYPE;
							if(TT){
							$('.tlist').children().eq(parseInt(TT)+1).addClass('hover').siblings().removeClass('hover');
							}else{
								$('.tlist').children().eq(0).addClass('hover').siblings().removeClass('hover');
							} */
							var singlefundsList = data.singlefundsList;
							console.log(singlefundsList.length, singlefundsList);
							var listHtml = '';
							for ( var item in singlefundsList) {
								var val = singlefundsList;
								listHtml += '<tr>';
								listHtml += '<td>' + val[item].TRADE_TIME+ '</td>';
								var amount = val[item].AMOUNT;
								if(val[item].TYPE=='1' || val[item].TYPE=='2'){
									amount = '-' + val[item].AMOUNT;
								}
								listHtml += '<td>' + amount + '</td>';
								listHtml += '<td>' + val[item].BALANCE + '</td>';
								
								listHtml += '</tr>';
							}
							$('.flowtb').find('tbody').html(listHtml);
							//nextPage(${page.currentPage});
							/* if (data.page.totalPage > 1) {
								$("#paginate").show();
							} else {
								$("#paginate").hide();
							} */
							/* $("#paginate").paginate({
								count : data.page.totalPage,
								start : data.page.currentPage,
								display : data.page.showCount,
								border : true,
								onChange : function(page) {
									list(page, 10, type);
								}
							}); */
						},
						error : function(e) {
							console.log(e);
							//$("#msg").text("网络出现问题！");
						}
					});
				}
		</script>
	</body>

</html>
