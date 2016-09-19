<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
		<%@include file="../public/header_v2.jsp" %>
		<%@include file="../public/left_nav222.jsp" %>
		</div>
        <link href="<%=basePath %>wj-static/rc/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/reset.css"/>
        <link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>wj-static/rc/css/fundsflow.css"/>
		<link href="<%=basePath%>wj-static/css/kkpager_rongchao.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
		function huan(a){
			window.location.href='<%=basePath%>_project/goRepayment.do?PROJECT_ID='+a;
		}
		</script>
		<style>
		  .huankuan {
			    background: url(<%=basePath%>wj-static/rc/images/wodezhuye_03.jpg);
			    height: 36px;
			    width: 70px;
			    color: #fff;
			    border: 0;
			    font-size: 16px;
			    margin-left: 56px;
			}
			.huankuan2{
				height: 36px;
			    width: 70px;
			    font-size: 16px;
			    margin-left: 56px;
			    background-color: #fff;
			    color: #999;
			    border: 1px solid #eee;
			}
		</style>
		<input type="hidden" id="basePathUrl2" value="<%=basePath%>">
        <div class="main">
            <div class="zhuye" style="padding-left: 0px;">
            	
                <div class="right">
                	<div class="title2">
                    	<h2><b>项目记录</b></h2>
                    </div>
                    <div class="con">
                    	<div class="tzjl">
                        	<%-- <nav>
                                <ul>
                                    <li class="-1 hover"><a href="<%=basePath %>fundsflow/fundsList?type=-1">全部</a></li>
                                    <li class="0"><a href="<%=basePath %>fundsflow/fundsList?type=0">充值</a></li>
                                    <li class="2"><a href="<%=basePath %>fundsflow/fundsList?type=2">提现</a></li>
                                    <li class="5"><a href="<%=basePath %>fundsflow/fundsList?type=5">转账</a></li>
                                </ul>
                            </nav> --%>
                            <input type="hidden" id="hashCode" value="${pd.id}"/>
                            <input type="hidden" id="basePathUrl" value="<%=basePath%>"/>
                            <div class="table">
                            	<table>
                                	<thead>
                                		<tr>
                                			<th>序号</th>
	                                    	<th>项目名</th>
	                                    	<th>募集金额</th>
	                                    	<th>创建时间</th>
	                                    	<th>状态</th>
	                                    	<th>还款</th>
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
            			<td>@COUNT@</td>
	                    <td>@PROJECT_NAME@</td>
	                    <td>@TOTAL_RAISE_AMOUNT@元</td>
	                  	<td>@CREATE_DATE@</td>
	                  	<td>@PROJECT_STATE@</td>
	                  	<td>@PAYMENT@</td>
	                    </tr>
            		</tbody>
            	</table>
            </div>
		</div>
		
		<script src="<%=basePath%>wj-static/js/kkpager.js" type="text/javascript"></script>
		<script src="<%=basePath%>wj-static/rc/js/payment.js" type="text/javascript"></script>
		<%@include file="../public/foot_v2.jsp" %>
		