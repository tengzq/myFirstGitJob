<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@include file="../public/header_v2.jsp" %>
<%@include file="../public/left_nav.jsp" %>
</div>
<script src="<%=basePath%>wj-static/rc/js/echarts.common.min.js" type="text/javascript"></script>
 <div class="content main">
    <div class="wdzy1">
        <dl class="fl">
            <dt><img src="<%=basePath%>wj-static/rc/images/wodezhuye_07.jpg"></dt>
            <dd>${sessionScope.sessionZfUser.USERNAME}</dd>
        </dl>
        <div class="t2 fl">
            <h3>
                <a href="#"><img src="<%=basePath%>wj-static/rc/images/wodezhuye_10.jpg"></a>
               <%--  <a href="#"><img src="<%=basePath%>wj-static/rc/images/wodezhuye_12.jpg"></a> --%>
               <img id="carImg" src="<%=basePath%>wj-static/rc/images/wodezhuye_14.jpg">
            </h3>
          <!--   <h6>信息完整度<b>80%</b></h6> -->
        </div>
    </div>
    <div class="wdzy2">
    	<div class="fl">
        	<p>累计收益：<b><i><fmt:formatNumber type="number" value="${zongShouYi }" pattern="0.00" maxFractionDigits="2"/>元</i></b></p>
            <p>冻结金额：
	            <b>
	            <c:if test="${empty pd.ucjib.FROZEN_AMOUNT }">
					0.00
				</c:if>
				<c:if test="${not empty pd.ucjib.FROZEN_AMOUNT }">
					<fmt:formatNumber type="number" value="${pd.ucjib.FROZEN_AMOUNT }" pattern="0.00" maxFractionDigits="2"/>
					
				</c:if>
	            	 元
	            </b>
            </p>
        </div>
        <div class="fr">
        	<p>账户余额：<b>
							<c:if test="${empty pd.ucjib.BALANCE }">
								0.00
							</c:if>
							<c:if test="${not empty pd.ucjib.BALANCE }">
								${pd.ucjib.BALANCE }
							</c:if>
						元</b></p>
            <div class="btn" style="width: 332px;">
                <button class="sbtn1" onclick="location.href='<%=basePath%>pluginsyPay/toRecharge'">充值</button>
                <button class="sbtn2" onclick="location.href='<%=basePath%>pluginsyPay/toWithdraw'">提现</button>
                <c:if test="${pd.ucjib.bindBankStatu!=1}">
                	<button class="sbtn1" onclick="location.href='<%=basePath%>pluginsyPay/toBindBankCard'">绑定银行卡</button>
                </c:if>
                <c:if test="${pd.ucjib.bindBankStatu==1}">
                	<button class="sbtn2" onclick="unbandCard();">解绑银行卡</button>
                </c:if>
            </div>
        </div>
    </div>
    
</div>
<div class="wdzy3">
	<div class="main">
    	<ul>
        	<li style="width: 250px;">总资产<b>=</b></li>
        	<li style="width: 245px;">账户余额<b>+</b></li>
        	<li style="width: 250px;">冻结金额<b>+</b></li>
        	<li>待收本息<b></b></li>
        </ul>
        <ol>
        	<li style="width: 250px;">
	        	<i>
	        	
	        		<c:if test="${(pd.ucjib.BALANCE + pd.ucjib.FROZEN_AMOUNT + tender + income) == 0}">
						0.00
					</c:if>
					<c:if test="${(pd.ucjib.BALANCE + pd.ucjib.FROZEN_AMOUNT + tender + income) != 0}">
						<fmt:formatNumber type="number" value="${pd.ucjib.BALANCE + pd.ucjib.FROZEN_AMOUNT + tender + income}" pattern="0.00" maxFractionDigits="2"/>  
						
					</c:if>
				</i>
			</li>
        	<li style="width: 245px;">
				<c:if test="${empty pd.ucjib.BALANCE }">
					0.00
				</c:if>
				<c:if test="${not empty pd.ucjib.BALANCE }">
					${pd.ucjib.BALANCE }
				</c:if>
			</li>
        	<li style="width: 250px;">
				<c:if test="${empty pd.ucjib.FROZEN_AMOUNT }">
					0.00
				</c:if>
				<c:if test="${not empty pd.ucjib.FROZEN_AMOUNT }">
					${pd.ucjib.FROZEN_AMOUNT }
				</c:if>
			</li>
        	<li>
				<fmt:formatNumber type="number" value="${tender + income }" pattern="0.00" maxFractionDigits="2"/>  
			</li>
        </ol>
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
    
    <div id="container" >
   <!--  <div id="main" style="width: 800px;height: 500px;left: 88px;"> -->
    </div></div>
</div>
<br>
<br>
<br>
		<%@include file="../public/foot_v2.jsp" %>
		
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
				   url: "<%=basePath%>pluginsyPay/toWithdraw",
				   data: val_array.join('&'),
				   success: function(data){}
				 });
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
									$("#carA").attr("onclick", "");
								} else if (data.result == "fail") {
									alert("解除银行卡绑定失败！！！");
								}
						   }
						 });
				}
				
			}
			
			function dailyI() {
				$.ajax({
					   type: "POST",
					   url: "<%=basePath%>myAccount/dailyIncome",
					   data: "",
					   success: function(msg){
					    	var date = [];
					    	var data = [];
					    	var legend = [];
					    	var count = 0;
					    	for (var p in msg.list) {
					    		date[count] = msg.list[p].REAL_REPAY_DATE;
					    		data[count] = msg.list[p].ACCRUAL;
					    		legend[count] = date[count]+"收益"+data[count]+"元"
					    		count++;
					    	}
					    	var myChart = echarts.init(document.getElementById('main'));
					    	option = {
					    		    tooltip: {
					    		        trigger: 'axis'
					    		    },
					    		    title: {
					    		        left: 'center',
					    		        text: '净收益表（近半个月）'
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
					    		            name:'净收益表（近半个月）',
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