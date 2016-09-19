<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@include file="../public/header_v2.jsp" %>
</div>
<%@include file="../public/left_nav.jsp" %>
        <link href="<%=basePath %>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/fundsflow.css"/>
		<link href="<%=basePath%>wj-static/css/kkpager_rongchao.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath %>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>

        <div class="main">
            <div class="zhuye" style="padding-left: 0px;">
                <div class="right">
                	<div class="title2">
                    	<h2><b>资金流水</b></h2>
                    </div>
                    <div class="con">
                    	<div class="tzjl">
                        	<nav>
                                <ul>
                                    <li class="-1 hover"><a href="<%=basePath %>fundsflow/fundsList?type=-1">全部</a></li>
                                    <li class="0"><a href="<%=basePath %>fundsflow/fundsList?type=0">充值</a></li>
                                    <li class="1"><a href="<%=basePath %>fundsflow/fundsList?type=1">投资</a></li>
                                    <li class="2"><a href="<%=basePath %>fundsflow/fundsList?type=2">提现</a></li>
                                    <li class="3"><a href="<%=basePath %>fundsflow/fundsList?type=3">收回本息</a></li>
                                </ul>
                            </nav>
                            <input type="hidden" id="hashCode" value="${pd.USER_ID}"/>
                            <input type="hidden" id="basePathUrl" value="<%=basePath%>"/>
                            <div class="table">
                            	<table>
                                	<thead>
                                		<tr>
	                                    	<th>类型</th>
	                                    	<th>交易时间</th>
	                                    	<th>交易金额</th>
	                                    	<th>备注</th>
	                                    </tr>
                                	</thead>
                                    <tbody>
                                    	
                                    </tbody>
                                </table>
                            </div>
                            
                            <div id="kkpager" style="margin-top:10px">
                            	
                            </div>
                        </div>
                	</div>
            	</div>
            	<div class="clear"></div>
            	<table id="table-template" style="display: none">
            		<tbody>
            			<tr>
	                    <td>@type@</td>
	                    <td>@tradeTime@</td>
	                    <td>@amount@元</td>
	                  	<td>@remark@</td>
	                    </tr>
            		</tbody>
            	</table>
            </div>
		</div>
		<script src="<%=basePath%>wj-static/js/kkpager.js" type="text/javascript"></script>
		<script src="<%=basePath%>wj-static/rc/js/fundsflow2.js" type="text/javascript"></script>
		<script>
		var base = "<%=basePath%>";
		</script>
		<%@include file="../public/foot_v2.jsp" %>
		
