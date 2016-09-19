<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="../public/header_v2.jsp" %>
<%@include file="../public/left_nav222.jsp" %>
</div>
<script src="<%=basePath%>wj-static/rc/js/echarts.common.min.js" type="text/javascript"></script>
<div class="content main">
    <div class="wdzy1">
        <dl class="fl">
            <dt><img src="<%=basePath%>wj-static/rc/images/wodezhuye_07.jpg"></dt>
            <dd>${sessionScope.sessionZfBuUser.username}</dd>
        </dl>
        <div class="t2 fl">
            <h3>
                <a href="#"><img src="<%=basePath%>wj-static/rc/images/wodezhuye_10.jpg"></a>
              <%--   <a href="#"><img src="<%=basePath%>wj-static/rc/images/wodezhuye_12.jpg"></a> --%>
                <img id="carImg" src="<%=basePath%>wj-static/rc/images/wodezhuye_14.jpg">
            </h3>
          <!--   <h6>信息完整度<b>80%</b></h6> -->
        </div>
    </div>
    <div class="wdzy2">
    	<%-- <div class="fl">
        	<p>今日理财产品加投人数：<b><i>${count.COUNT }人</i></b></p>
            <p>今日金额增长：<b>
            				<c:if test="${empty count.SUM }">
								0.00
							</c:if>
							<c:if test="${not empty count.SUM }">
								<fmt:formatNumber type="number" value="${count.SUM }" pattern="0.00" maxFractionDigits="2"/>
							</c:if>
              元</b></p>
        </div> --%>
        <div class="fl">
        	<p>账户余额：<b>
							<c:if test="${empty pdb.yue }">
								0.00
							</c:if>
							<c:if test="${not empty pdb.yue }">
								${pdb.yue }	
								
							</c:if>
						元</b></p>
            <div class="btn">
                <button class="sbtn1" onclick="location.href='<%=basePath%>pluginsyPay/toRecharge'">充值</button>
                <button class="sbtn2" onclick="location.href='<%=basePath%>pluginsyPay/toWithdraw'">提现</button>
                <c:if test="${pdb.isBindBank == 0 }">
                	<button class="sbtn1" onclick="location.href='<%=basePath%>pluginsyPay/toBindBankCard'">绑卡</button>
				</c:if>
				<c:if test="${pdb.isBindBank == 1 }">
					<button class="sbtn2" onclick="unbandCard();">解绑银行卡</button>		
				</c:if>
            </div>
        </div>
    </div>
    
</div>

<div class="main">
	<div class="chart">
    	<div class="title">
        	<!-- <h3 class="fl">净收益表（近半个月）</h3>
            <h6 class="fr">
                <button class="sbtn3">一个月</button>
                <button class="sbtn3">三个月</button>
                <button class="sbtn3">一年</button>
            </h6> -->
        </div>
    </div>
    <div id="container" ><div id="main" style="width: 800px;height: 500px;left: 88px;"></div>
	</div>
</div>

		<%-- <%@include file="../public/foot_v2.jsp" %> --%>
		<script type="text/javascript">
			$(document).ready(function(){
				// 填充需要记录的数据
				var val_array = new Array();
				var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
				val_array.push("TYPE=1");
				val_array.push("VIEW_ID=8");
				val_array.push("WEB_OR_MOBILE=1");
				val_array.push("RANDOM_CODE="+randomCode);
				$.ajax({
				   type: "post",
				   url: "<%=basePath%>register/viewlog",
				   data: val_array.join('&'),
				   success: function(data){}
				 });
				$("#cashTransfer").attr("href", $("#cashTransfer").attr("href")+"?id="+$("#choseUser").val());
			});
			
			function unbandCard() {
				if (window.confirm('你确定要解除银行卡绑定吗？')) {
					$.ajax({
						   type: "get",
						   url: "<%=basePath%>pluginsyPay/toUnbindBankCard",
						   success: function(data){
								if (data.result == "success") {
									alert("解除银行卡绑定成功！！！需等待两日才可再绑定");
									$("#jiebang").attr("style", "display: none;");
									$("#carImg").attr("src", "<%=basePath%>wj-static/rc/images/wodezhuye_14.jpg");
									$("#carA").attr("href", "<%=basePath%>pluginsyPay/toBindBankCard");
								} else if (data.result == "fail") {
									alert("解除银行卡绑定失败！！！");
								}
						   }
						 });
				}
				
			}
			function changeUser() {
				var url = "<%=basePath%>pluginsyPay/toCpTransaction";
				url = url + "?id="+$("#choseUser").val();
				url = url + "&amount="+$("#amount").val();
				//$("#cashTransfer").attr("href", url+"?id="+$("#choseUser").val());
				//$("#cashTransfer").attr("href", $("#cashTransfer").attr("href")+"&amount="+$("#amount").val());
				window.location.href=url; 
			}
			
			function dailyI() {
				$.ajax({
					   type: "POST",
					   url: "<%=basePath%>myAccount/dailyInvestPersonCount",
					   data: "",
					   success: function(msg){
					    	var date = [];
					    	var data = [];
					    	var legend = [];
					    	var count = 0;
					    	for (var p in msg.list) {
					    		date[count] = msg.list[p].TRADE_TIME;
					    		data[count] = msg.list[p].SUM;
					    		legend[count] = date[count]+""+data[count]+"";
					    		count++;
					    	}
					    	
					    	var myChart = echarts.init(document.getElementById('main'));
					    	option = {
					    		    tooltip: {
					    		        trigger: 'axis'
					    		    },
					    		    title: {
					    		        left: 'center',
					    		        text: '筹到金额（近半个月）'
					    		    },
					    		    legend: {
					    		        top: 'bottom',
					    		        data: legend
					    		    },
					    		    toolbox: {
					    		        show: true,
					    		        feature: {
					    		            dataView: {show: true, readOnly: false},
					    		            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
					    		            restore: {show: true},
					    		            saveAsImage: {show: true}
					    		        }
					    		    },
					    		    xAxis: {
					    		        type: 'category',
					    		        boundaryGap: false,
					    		        data: date
					    		    },
					    		    yAxis: {
					    		        type: 'value',
					    		        boundaryGap: [0, '100%']
					    		    },
					    		    dataZoom: [{
					    		        type: 'inside',
					    		        start: 0,
					    		        end: 100
					    		    }, {
					    		        start: 0,
					    		        end: 10
					    		    }],
					    		    series: [
					    		        {
					    		            name:'筹到金额（近半个月）',
					    		            type:'line',
					    		            smooth:true,
					    		            symbol: 'none',
					    		            sampling: 'average',
					    		            itemStyle: {
					    		                normal: {
					    		                    color: 'rgb(168, 168, 168)'
					    		                }
					    		            },
					    		            areaStyle: {
					    		                normal: {
					    		                    color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
					    		                        offset: 0,
					    		                        color: 'rgb(236, 236, 236)'
					    		                    }, {
					    		                        offset: 1,
					    		                        color: 'rgb(236, 236, 236)'
					    		                    }])
					    		                }
					    		            },
					    		            data: data
					    		        }
					    		    ]
					    		};
					    	myChart.setOption(option);
					   }
				});
			}
			//dailyI();
		</script>
	</body>
</html>

