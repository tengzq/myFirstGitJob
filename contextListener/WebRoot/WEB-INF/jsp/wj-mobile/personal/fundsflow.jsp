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
	<title>资金流水</title>
	<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
	<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	
	
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/common.css" />
	<link rel="stylesheet" type="text/css" href="wj-mobile-static/ui2/css/flow.css" />
	<link rel="stylesheet" href="wj-mobile-static/css/font-awesome.min.css">
	
	<script type="text/javascript" src="wj-mobile-static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="wj-mobile-static/js/TouchSlide.1.1.js"></script>
</head>

<body style="background:#eeefef">
	<div class="page7 main">
		<div class="p62">
	    	<ul>
	        	<li class="hover" data-type="">
	            	<a href="javascript:void(0)">全部</a>
	            </li>
	        	<li data-type="0">
	            	<a href="javascript:void(0)">充值</a>
	            </li>
	        	<li data-type="1">
	            	<a href="javascript:void(0)">投资</a>
	            </li>
	        	<li data-type="2">
	            	<a href="javascript:void(0)">提现</a>
	            </li>
	        	<li data-type="3">
	            	<a href="javascript:void(0)">收益</a>
	            </li>
	        	<li data-type="4">
	            	<a href="javascript:void(0)">账本回金</a>
	            </li>
	        </ul>
	    </div>
	    <div class="p71">
	    	<ul>
	        	<li><img src="wj-mobile-static/ui2/images/p71-1.png">投资时间</li>
	        	<li><img src="wj-mobile-static/ui2/images/p71-2.png">交易金额</li>
	        	<li><img src="wj-mobile-static/ui2/images/p71-3.png">账户余额</li>
	        </ul>
	    </div>
	    <div class="p72">
	    	<table>
	        	
	        </table>
	    </div>
	</div>
	<div class="main">
		
	<%@include file="../common/main_nav.jsp" %>
	<script type="text/javascript">
	$(function(){
		$('.p62 li').each(function(){
			$(this).on('click',function(){
				var type = $(this).attr('data-type');
				list(1,20,type,$(this));
			});
		});
		list(1,20,'',$('.p62 li:first-child'));
	});
	
	function list(curPage,showCount,type,ele){
		var userid='${sessionScope.sessionZfUser.USER_ID}';
		var $ele = ele;
		$ele.siblings().removeClass('hover');
		$ele.addClass('hover');
		$.ajax({
			type: "POST",
			url: 'mobile/personal/allList?TYPE=' + type+ '&currentPage=' + curPage + '&showCount='+ showCount + '&USER_ID=' + userid,
					dataType : 'json',
					cache : false,
					success : function(data) {
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
							listHtml += '<td>' + parseFloat(amount).toFixed(2) + '</td>';
							listHtml += '<td>' + val[item].BALANCE + '</td>';
							
							listHtml += '</tr>';
						}
						$('.p72 table').html(listHtml);
					},
					error : function(e) {
						try{console.log('network problem')}catch(e){}
						//$("#msg").text("网络出现问题！");
					}
				});
			}
	</script>
</body>

</html>
