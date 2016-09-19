<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>

</head>
<style>
.title {
	color: white;
	font-size:22px;
	font-family: 微软雅黑;
	position: relative;
	top: 30px;
}
.zi1 {
	color: white;
	font-family: 微软雅黑;
	position: relative;
	top: 56px;
}
.zi2 {
	color: white;
	font-family: 微软雅黑;
	position: relative;
	top: 60px;
	
}
.zi3 {
	text-decorationnone;
	color: balck;
	font-size: 18px;
	font-family: 微软雅黑;
	position: relative;
	top: 60px;
	
}

</style>
<body>

	<div class="container-fluid" id="main-container">
		 <div  
		 
		 id = "a1"
		 class="showButton"
		 onclick="chengView('a1');"
		       style="float:left;
			   width:180px;
			   height:180px;
			   cursor:pointer;
			   background-color:#6699FF">
			   	 <p id="todayCount" class="title" align="center"></p>
			     <p class="zi1" align="center">今日登录用户数量</p>
			     <p class="zi2" align="center">累计登录人数<a style="text-decoration:none; color: black; font-size: 18px;" id="registerCount"></a></p>
			</div>
			<div id="a2"
			class="showButton"
			onclick="chengView('a2');"
			     style="float:left;
			     width:180px;
			     height:180px;
			     position: relative;
				 left: 30px;
				 cursor:pointer;
			     background-color:#6699FF">
			     <p id="newCount" class="title" align="center"></p>
			     <p class="zi1" align="center">今日新增投资人数</p>
			     <p class="zi2" align="center">累计投资人数<a style="text-decoration:none; color: black; font-size: 18px;" id="totalCount"></a></p>
			    
			</div>
			<div
				id="a3"
				class="showButton"
				onclick="chengView('a3');"
			     style="float:left;
			     width:180px;
			     height:180px;
			     position: relative;
				 left: 60px;
				 cursor:pointer;
			     background-color:#6699FF">
			     <p id="todayMoney" align="center" class="title"></p>
			     <p class="zi1" align="center">今日新增投资金额</p>
			     <p class="zi2" align="center">累计投资金额<a style="text-decoration:none; color: black; font-size: 18px;" id="allMoney"></a></p>
			</div>
			<div 
			id="a4"
			class="showButton"
			onclick="chengView('a4');"
			     style="float:left;
			      width:180px;
			     height:180px;
			     position: relative;
				 left: 90px;
				 cursor:pointer;
			     background-color:#6699FF">
			     <p id="allProject" align="center" class="title"></p>
			     <p class="zi1" align="center">理财产品总数</p>
			     <p class="zi2" align="center">已完成产品个数<a style="text-decoration:none; color: black; font-size: 18px;" id="finishProject"></a></p>
			</div>
			<div
			id="a5" 
			onclick="chengView('a5');"
			     style="float:left;
			      width:180px;
			     height:180px;
			     position: relative;
				 left: 120px;
				 cursor:pointer;
			     background-color:#2679b5">
			     <p id="allProject" align="center" class="title">查询</p>
			     <p class="zi1" align="center">即将还款的理财产品</p>
			     <p class="zi2" align="center">筹集即将结束的理财产品<a style="text-decoration:none; color: black; font-size: 18px;" id="finishProject"></a></p>
			</div>
		 </div>

		<div id="page-content" class="clearfix">

			<div class="page-header position-relative">
				<!-- <h1>后台首页</h1> -->
			</div>
			<!--/page-header-->
	     <div id="a5d" class="showView" style="display: block;">
		  
					
			<h1>
				募集时间即将结束的项目 <small><i class="icon-double-angle-right"></i> </small>
			</h1>

			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>项目名称</th>
						<th>年化利率</th>
						<th>投资期限（天）</th>
						<th>创建时间</th>
						<th>募集金额</th>
						<th>募集开始时间</th>
						<th>募集结束时间</th>
						<th>募集进度</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${projectList}" var="var" varStatus="vs">
						<tr>
							<td class='center' style="width: 25px;">${vs.index+1}</td>
							<td>${var.PROJECT_NAME}</td>
							<td class="moneyStyle">${var.BASE_INTEREST_RATE}%</td>
							<td>${var.DEADLINE}</td>
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.CREATE_DATE}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							<td>${var.TOTAL_RAISE_AMOUNT }</td>
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.STIME}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.ETIME}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							</td>
							<td>
							${(var.TOTAL_RAISE_AMOUNT-var.SURPLUS_RAISE_AMOUNT)/var.TOTAL_RAISE_AMOUNT*100}%
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<h1>
				即将还款的项目 <small><i class="icon-double-angle-right"></i> </small>
			</h1>

			<table id="table_report"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>项目名称</th>
						<th>年化利率</th>
						<th>投资期限（天）</th>
						<th>创建时间</th>
						<th>募集金额</th>
						<th>募集开始时间</th>
						<th>募集结束时间</th>
						<th>还款时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${payment}" var="var" varStatus="vs">
						<tr>
							<td class='center' style="width: 25px;">${vs.index+1}</td>
							<td>${var.PROJECT_NAME}</td>
							<td class="moneyStyle">${var.BASE_INTEREST_RATE}%</td>
							<td>${var.DEADLINE}</td>
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.CREATE_DATE}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							<td>${var.TOTAL_RAISE_AMOUNT }</td>
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.STIME}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.ETIME}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							</td>
							<td><fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${var.REPAYMENT_TIME}" var="createDate"></fmt:parseDate> <fmt:formatDate
									value="${createDate}" pattern="yyyy-MM-dd" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<div class="row-fluid">

				<div class="space-6"></div>

















			</div>
		</div>
		<!--/row-->









<div id="a1d" class="showView" style="width: 600px;height:400px;display: none;"></div>
<div id="a2d" class="showView" style="width: 600px;height:400px;display: none;"></div>
<div id="a3d" class="showView" style="width: 600px;height:400px;display: none;"></div>
<div id="a4d" class="showView" style="width: 600px;height:400px;display: none;"></div>
<!-- <div id="main4" style="width: 600px;height:400px;display: none;"></div> -->
	</div>

	<!-- #main-content -->
	</div>
	<!--/.fluid-container#main-container-->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>
	<!-- basic scripts -->
	<script src="static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<!-- page specific plugin scripts -->

	<!--[if lt IE 9]>
		<script type="text/javascript" src="static/js/excanvas.min.js"></script>
		<![endif]-->
	<script type="text/javascript"
		src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript"
		src="static/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="static/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="wj-static/rc/js/echarts.common.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.resize.min.js"></script>
	<!-- ace scripts -->
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<!-- inline scripts related to this page -->


	<script type="text/javascript">
	function test() {
	
	$.ajax({
			type : 'post',
			url : 'personCount',
			dataType : 'text',
			success : function(data) {
			
			var json = eval('(' + data + ')'); 
			var count = 0;
			var date = [];
			var countTimes = [];
			var myChart = echarts.init(document.getElementById('a1d'));
		   for ( var temp in json.personCount) {
				if (json.personCount[temp].COUNT == undefined) {
					continue;
				}
				countTimes[count] = json.personCount[temp].COUNT;
			    date[count++] = json.personCount[temp].LOGIN_TIME;
          }

							option = {
								title : {
									text : '登陆统计'
								},
								tooltip : {
									trigger : 'axis'
								},
								legend : {
									data : [ '登陆统计' ]
								},
								grid : {
									left : '3%',
									right : '4%',
									bottom : '3%',
									containLabel : true
								},
								toolbox : {
									feature : {
										saveAsImage : {}
									}
								},
								xAxis : {
									type : 'category',
									boundaryGap : false,
									data : date
								},
								yAxis : {
									type : 'value'
								},
								series : [ {
									name : '登陆统计',
									type : 'line',
									stack : '总量',
									data : countTimes
								} ]
							};

							myChart.setOption(option);

						},
						error : function(text) {
						}
					});
		}
		test();

		function test1() {

			$.ajax({
				type : 'post',
				url : 'investPerson',
				dataType : 'text',
				success : function(data) {
					
					var json = eval('(' + data + ')');
					var count = 0;
					var date = [];
					var countTimes = [];
					var myChart = echarts
							.init(document.getElementById('a2d'));
					for ( var temp in json.investPerson) {
						if (json.investPerson[temp].COUNT == undefined) {
							continue;
						}
						countTimes[count] = json.investPerson[temp].COUNT;
						date[count++] = json.investPerson[temp].TRADE_TIME;
					}


					option = {
						title : {
							text : '投资人数统计'
						},
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							data : [ '投资人数统计' ]
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						toolbox : {
							feature : {
								saveAsImage : {}
							}
						},
						xAxis : {
							type : 'category',
							boundaryGap : false,
							data : date
						},
						yAxis : {
							type : 'value'
						},
						series : [ {
							name : '投资人数统计',
							type : 'line',
							stack : '总量',
							data : countTimes
						} ]
					};

					myChart.setOption(option);

				},
				error : function(text) {
				}
			});
		}
		test1();

	    function test2() {

			$.ajax({
				type : 'post',
				url : 'addMoney',
				dataType : 'text',
				success : function(data) {
					
					var json = eval('(' + data + ')');
					var count = 0;
					var date = [];
					var countTimes = [];
					var myChart = echarts
							.init(document.getElementById('a3d'));
					for ( var temp in json.addMoney) {
						if (json.addMoney[temp].COUNT == undefined) {
							continue;
						}
						countTimes[count] = json.addMoney[temp].COUNT;
						date[count++] = json.addMoney[temp].TRADE_TIME;
					}

					option = {
						title : {
							text : '投资金额统计'
						},
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							data : [ '投资金额统计' ]
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						toolbox : {
							feature : {
								saveAsImage : {}
							}
						},
						xAxis : {
							type : 'category',
							boundaryGap : false,
							data : date
						},
						yAxis : {
							type : 'value'
						},
						series : [ {
							name : '投资金额统计',
							type : 'line',
							stack : '总量',
							data : countTimes
						} ]
					};

					myChart.setOption(option);

				},
				error : function(text) {
				}
			});
		}
		test2();
         function test3() {

			$.ajax({
				type : 'post',
				url : 'countProject',
				dataType : 'text',
				success : function(data) {

					var json = eval('(' + data + ')');
					console.log(json);
					var count = 0;
					var date = [];
					var countTimes = [];
					var myChart = echarts
							.init(document.getElementById('a4d'));
					for ( var temp in json.countProject) {
						if (json.countProject[temp].COUNT == undefined) {
							continue;
						}
						countTimes[count] = json.countProject[temp].COUNT;
						date[count++] = json.countProject[temp].CREATE_DATE;
					}


					option = {
						title : {
							text : '产品数'
						},
						tooltip : {
							trigger : 'axis'
						},
						legend : {
							data : [ '产品数' ]
						},
						grid : {
							left : '3%',
							right : '4%',
							bottom : '3%',
							containLabel : true
						},
						toolbox : {
							feature : {
								saveAsImage : {}
							}
						},
						xAxis : {
							type : 'category',
							boundaryGap : false,
							data : date
						},
						yAxis : {
							type : 'value'
						},
						series : [ {
							name : '产品数',
							type : 'line',
							stack : '总量',
							data : countTimes
						} ]
					};

					myChart.setOption(option);

				},
				error : function(text) {
				}
			});
		}
		test3();
	  		$(top.hangge());

		$(function() {
			$('.dialogs,.comments').slimScroll({
				height : '300px'
			});

			$('#tasks').sortable();
			$('#tasks').disableSelection();
			$('#tasks input:checkbox').removeAttr('checked').on('click',
					function() {
						if (this.checked)
							$(this).closest('li').addClass('selected');
						else
							$(this).closest('li').removeClass('selected');
					});
			var oldie = $.browser.msie && $.browser.version < 9;
			$('.easy-pie-chart.percentage')
					.each(
							function() {
								var $box = $(this).closest('.infobox');
								var barColor = $(this).data('color')
										|| (!$box.hasClass('infobox-dark') ? $box
												.css('color')
												: 'rgba(255,255,255,0.95)');
								var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)'
										: '#E2E2E2';
								var size = parseInt($(this).data('size')) || 50;
								$(this).easyPieChart({
									barColor : barColor,
									trackColor : trackColor,
									scaleColor : false,
									lineCap : 'butt',
									lineWidth : parseInt(size / 10),
									animate : oldie ? false : 1000,
									size : size
								});
							})
			$('.sparkline').each(
					function() {
						var $box = $(this).closest('.infobox');
						var barColor = !$box.hasClass('infobox-dark') ? $box
								.css('color') : '#FFF';
						$(this).sparkline('html', {
							tagValuesAttribute : 'data-values',
							type : 'bar',
							barColor : barColor,
							chartRangeMin : $(this).data('min') || 0
						});
					});

			var data = [ {
				label : "social networks",
				data : 38.7,
				color : "#68BC31"
			}, {
				label : "search engines",
				data : 24.5,
				color : "#2091CF"
			}, {
				label : "ad campaings",
				data : 8.2,
				color : "#AF4E96"
			}, {
				label : "direct traffic",
				data : 18.6,
				color : "#DA5430"
			}, {
				label : "other",
				data : 10,
				color : "#FEE074"
			} ];
			var placeholder = $('#piechart-placeholder').css({
				'width' : '90%',
				'min-height' : '150px'
			});
			$.plot(placeholder, data, {

				series : {
					pie : {
						show : true,
						tilt : 0.8,
						highlight : {
							opacity : 0.25
						},
						stroke : {
							color : '#fff',
							width : 2
						},
						startAngle : 2

					}
				},
				legend : {
					show : true,
					position : "ne",
					labelBoxBorderColor : null,
					margin : [ -30, 15 ]
				},
				grid : {
					hoverable : true,
					clickable : true
				},
				tooltip : true, //activate tooltip
				tooltipOpts : {
					content : "%s : %y.1",
					shifts : {
						x : -30,
						y : -50
					}
				}

			});

			var $tooltip = $(
					"<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>")
					.appendTo('body');
			placeholder.data('tooltip', $tooltip);
			var previousPoint = null;
			placeholder.on('plothover', function(event, pos, item) {
				if (item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : "
								+ item.series['percent'] + '%';
						$(this).data('tooltip').show().children(0).text(tip);
					}
					$(this).data('tooltip').css({
						top : pos.pageY + 10,
						left : pos.pageX + 10
					});
				} else {
					$(this).data('tooltip').hide();
					previousPoint = null;
				}

			});
			var d1 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d1.push([ i, Math.sin(i) ]);
			}
			var d2 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.5) {
				d2.push([ i, Math.cos(i) ]);
			}
			var d3 = [];
			for (var i = 0; i < Math.PI * 2; i += 0.2) {
				d3.push([ i, Math.tan(i) ]);
			}

			var sales_charts = $('#sales-charts').css({
				'width' : '100%',
				'height' : '220px'
			});
			$.plot("#sales-charts", [ {
				label : "Domains",
				data : d1
			}, {
				label : "Hosting",
				data : d2
			}, {
				label : "Services",
				data : d3
			} ], {
				hoverable : true,
				shadowSize : 0,
				series : {
					lines : {
						show : true
					},
					points : {
						show : true
					}
				},
				xaxis : {
					tickLength : 0
				},
				yaxis : {
					ticks : 10,
					min : -2,
					max : 2,
					tickDecimals : 3
				},
				grid : {
					backgroundColor : {
						colors : [ "#fff", "#fff" ]
					},
					borderWidth : 1,
					borderColor : '#555'
				}
			});
			$('[data-rel="tooltip"]').tooltip();
		})
		function test11() {
		    $.ajax({
			    url:"count",
			    data:{},
			    async:false,
			    dataType:"json",
			    error:function(){alert("error")},
			    success:function(data){
				    var todayCount = data.todayCount;
					/* 
					console.log("My money:"+data.allMoney[0].COUNT);
					console.log("My money:"+data.todayCount[0].COUNT);
					console.log("My money:"+data.todayMoney[0].COUNT); */
					$("#registerCount").text(data.registerCount[0].COUNT +"人");
					$("#todayCount").html(data.todayCount[0].COUNT  +"人");
					$("#newCount").html(data.newCount[0].COUNT + "人");
					$("#totalCount").html(data.totalCount[0].COUNT+ "人");
					$("#todayMoney").html((data.todayMoney[0] != null ? data.todayMoney[0].COUNT : 0) + "元") ;
					$("#allMoney").html(data.allMoney[0].COUNT+ "元");
					$("#allProject").html(data.allProject[0].COUNT+ "个");
					$("#finishProject").html(data.finishProject[0].COUNT+ "个");
				   }
			   });
			   }
		   test11();
		   
		   function chengView(id) {
			   $(".showView").css("display", "none");
			   $(".showButton").css("background-color", "#6699FF");
			   $("#"+id).css("background-color","#2679b5");
			   $("#"+id+"d").css("display","block");
		   }
	</script>
		
</body>
</html>
