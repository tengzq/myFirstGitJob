<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#TO_USER_ID").val()==""){
			$("#TO_USER_ID").tips({
				side:3,
	            msg:'请输入获得收益USER',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TO_USER_ID").focus();
			return false;
		}
		if($("#FROM_USER_ID").val()==""){
			$("#FROM_USER_ID").tips({
				side:3,
	            msg:'请输入收益来自USER',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#FROM_USER_ID").focus();
			return false;
		}
		if($("#TO_USER_LEVEL").val()==""){
			$("#TO_USER_LEVEL").tips({
				side:3,
	            msg:'请输入获得收益USER是触发收益USER的第几级',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TO_USER_LEVEL").focus();
			return false;
		}
		if($("#EARNINGS_AMOUNT").val()==""){
			$("#EARNINGS_AMOUNT").tips({
				side:3,
	            msg:'请输入收益金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EARNINGS_AMOUNT").focus();
			return false;
		}
		if($("#PROJECT_ID").val()==""){
			$("#PROJECT_ID").tips({
				side:3,
	            msg:'请输入触发收益用户购买的项目',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECT_ID").focus();
			return false;
		}
		if($("#BUY_PROJECT_AMOUNT").val()==""){
			$("#BUY_PROJECT_AMOUNT").tips({
				side:3,
	            msg:'请输入购买项目金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BUY_PROJECT_AMOUNT").focus();
			return false;
		}
		if($("#RATE").val()==""){
			$("#RATE").tips({
				side:3,
	            msg:'请输入利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RATE").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		if($("#DISPOSE_DATE").val()==""){
			$("#DISPOSE_DATE").tips({
				side:3,
	            msg:'请输入处理时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DISPOSE_DATE").focus();
			return false;
		}
		if($("#DISPOSE_BY").val()==""){
			$("#DISPOSE_BY").tips({
				side:3,
	            msg:'请输入处理人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DISPOSE_BY").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="inviteearnings/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="INVITEEARNINGS_ID" id="INVITEEARNINGS_ID" value="${pd.INVITEEARNINGS_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="TO_USER_ID" id="TO_USER_ID" value="${pd.TO_USER_ID}" maxlength="32" placeholder="这里输入获得收益USER" title="获得收益USER"/></td>
			</tr>
			<tr>
				<td><input type="text" name="FROM_USER_ID" id="FROM_USER_ID" value="${pd.FROM_USER_ID}" maxlength="32" placeholder="这里输入收益来自USER" title="收益来自USER"/></td>
			</tr>
			<tr>
				<td><input type="number" name="TO_USER_LEVEL" id="TO_USER_LEVEL" value="${pd.TO_USER_LEVEL}" maxlength="32" placeholder="这里输入获得收益USER是触发收益USER的第几级" title="获得收益USER是触发收益USER的第几级"/></td>
			</tr>
			<tr><td><input type="text" name="EARNINGS_AMOUNT" id="EARNINGS_AMOUNT" value="${pd.EARNINGS_AMOUNT}" maxlength="32" placeholder="这里输入收益金额" title="收益金额"/></td></tr>
			<tr>
				<td><input type="text" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}" maxlength="32" placeholder="这里输入触发收益用户购买的项目" title="触发收益用户购买的项目"/></td>
			</tr>
			<tr>
				<td><input type="text" name="BUY_PROJECT_AMOUNT" id="BUY_PROJECT_AMOUNT" value="${pd.BUY_PROJECT_AMOUNT}" maxlength="32" placeholder="这里输入购买项目金额" title="购买项目金额"/></td>
			</tr>
			<tr>
				<td><input type="text" name="RATE" id="RATE" value="${pd.RATE}" maxlength="32" placeholder="这里输入利率" title="利率"/></td>
			</tr>
			<tr>
				<td><input type="text" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入状态" title="状态"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" maxlength="32" placeholder="这里输入创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DISPOSE_DATE" id="DISPOSE_DATE" value="${pd.DISPOSE_DATE}" maxlength="32" placeholder="这里输入处理时间" title="处理时间"/></td>
			</tr>
			<tr>
				<td><input type="text" name="DISPOSE_BY" id="DISPOSE_BY" value="${pd.DISPOSE_BY}" maxlength="32" placeholder="这里输入处理人" title="处理人"/></td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>