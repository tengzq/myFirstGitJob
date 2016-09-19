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
		<meta name="description" content="overview & stats" />
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
			if($("#USER_NAME").val()==""){
			$("#USER_NAME").tips({
				side:3,
	            msg:'请输入投资人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_NAME").focus();
			return false;
		}
		if($("#INVEST_AMOUNT").val()==""){
			$("#INVEST_AMOUNT").tips({
				side:3,
	            msg:'请输入投资金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVEST_AMOUNT").focus();
			return false;
		}
		if($("#INVEST_DATE").val()==""){
			$("#INVEST_DATE").tips({
				side:3,
	            msg:'请输入投资时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVEST_DATE").focus();
			return false;
		}
		if($("#INTEREST_BEARING_TIME").val()==""){
			$("#INTEREST_BEARING_TIME").tips({
				side:3,
	            msg:'请输入起息时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INTEREST_BEARING_TIME").focus();
			return false;
		}
		if($("#INVSET_WAY").val()==""){
			$("#INVSET_WAY").tips({
				side:3,
	            msg:'请输入投资方式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVSET_WAY").focus();
			return false;
		}
		if($("#INVSET_STATE").val()==""){
			$("#INVSET_STATE").tips({
				side:3,
	            msg:'请输入投资状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVSET_STATE").focus();
			return false;
		}
		if($("#BASE_INTERESTRATE").val()==""){
			$("#BASE_INTERESTRATE").tips({
				side:3,
	            msg:'请输入基准利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BASE_INTERESTRATE").focus();
			return false;
		}
		if($("#BOSS_INTERESTRATE").val()==""){
			$("#BOSS_INTERESTRATE").tips({
				side:3,
	            msg:'请输入老板贴息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BOSS_INTERESTRATE").focus();
			return false;
		}
		if($("#IS_BOSS_INTERESTRATE").val()==""){
			$("#IS_BOSS_INTERESTRATE").tips({
				side:3,
	            msg:'请输入是否包含老板贴息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_BOSS_INTERESTRATE").focus();
			return false;
		}
		if($("#EXCHANGE_INTERESTRATE").val()==""){
			$("#EXCHANGE_INTERESTRATE").tips({
				side:3,
	            msg:'请输入换手气利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXCHANGE_INTERESTRATE").focus();
			return false;
		}
		if($("#IS_EXCHANGE_INTERESTRATE").val()==""){
			$("#IS_EXCHANGE_INTERESTRATE").tips({
				side:3,
	            msg:'请输入是否包含换手气利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_EXCHANGE_INTERESTRATE").focus();
			return false;
		}
		if($("#INVITATION_RATE").val()==""){
			$("#INVITATION_RATE").tips({
				side:3,
	            msg:'请输入邀请码利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#INVITATION_RATE").focus();
			return false;
		}
		if($("#IS_INVITATION_RATE").val()==""){
			$("#IS_INVITATION_RATE").tips({
				side:3,
	            msg:'请输入是否包含邀请码利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_INVITATION_RATE").focus();
			return false;
		}
		if($("#TOTAL_INTERESTRATE").val()==""){
			$("#TOTAL_INTERESTRATE").tips({
				side:3,
	            msg:'请输入总利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TOTAL_INTERESTRATE").focus();
			return false;
		}
		if($("#TOTAL_PROFIT").val()==""){
			$("#TOTAL_PROFIT").tips({
				side:3,
	            msg:'请输入总收益',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TOTAL_PROFIT").focus();
			return false;
		}
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入会员ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		if($("#PROJECT_ID").val()==""){
			$("#PROJECT_ID").tips({
				side:3,
	            msg:'请输入项目ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECT_ID").focus();
			return false;
		}
		if($("#TICKET_DISCOUNT_AMOUNT").val()==""){
			$("#TICKET_DISCOUNT_AMOUNT").tips({
				side:3,
	            msg:'请输入优惠券金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_DISCOUNT_AMOUNT").focus();
			return false;
		}
		if($("#TICKET_ID").val()==""){
			$("#TICKET_ID").tips({
				side:3,
	            msg:'请输入优惠券ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_ID").focus();
			return false;
		}
		if($("#REMARK").val()==""){
			$("#REMARK").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REMARK").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="zfuserproject/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ZFUSERPROJECT_ID" id="ZFUSERPROJECT_ID" value="${pd.ZFUSERPROJECT_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME}" maxlength="32" placeholder="这里输入投资人" title="投资人"/></td>
			</tr>
			<tr>
				<td><input type="number" name="INVEST_AMOUNT" id="INVEST_AMOUNT" value="${pd.INVEST_AMOUNT}" maxlength="32" placeholder="这里输入投资金额" title="投资金额"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="INVEST_DATE" id="INVEST_DATE" value="${pd.INVEST_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="投资时间" title="投资时间"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="INTEREST_BEARING_TIME" id="INTEREST_BEARING_TIME" value="${pd.INTEREST_BEARING_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="起息时间" title="起息时间"/></td>
			</tr>
			<tr>
				<td><input type="text" name="INVSET_WAY" id="INVSET_WAY" value="${pd.INVSET_WAY}" maxlength="32" placeholder="这里输入投资方式" title="投资方式"/></td>
			</tr>
			<tr>
				<td><input type="text" name="INVSET_STATE" id="INVSET_STATE" value="${pd.INVSET_STATE}" maxlength="32" placeholder="这里输入投资状态" title="投资状态"/></td>
			</tr>
			<tr>
				<td><input type="number" name="BASE_INTERESTRATE" id="BASE_INTERESTRATE" value="${pd.BASE_INTERESTRATE}" maxlength="32" placeholder="这里输入基准利率" title="基准利率"/></td>
			</tr>
			<tr>
				<td><input type="number" name="BOSS_INTERESTRATE" id="BOSS_INTERESTRATE" value="${pd.BOSS_INTERESTRATE}" maxlength="32" placeholder="这里输入老板贴息" title="老板贴息"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IS_BOSS_INTERESTRATE" id="IS_BOSS_INTERESTRATE" value="${pd.IS_BOSS_INTERESTRATE}" maxlength="32" placeholder="这里输入是否包含老板贴息" title="是否包含老板贴息"/></td>
			</tr>
			<tr>
				<td><input type="number" name="EXCHANGE_INTERESTRATE" id="EXCHANGE_INTERESTRATE" value="${pd.EXCHANGE_INTERESTRATE}" maxlength="32" placeholder="这里输入换手气利率" title="换手气利率"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IS_EXCHANGE_INTERESTRATE" id="IS_EXCHANGE_INTERESTRATE" value="${pd.IS_EXCHANGE_INTERESTRATE}" maxlength="32" placeholder="这里输入是否包含换手气利率" title="是否包含换手气利率"/></td>
			</tr>
			<tr>
				<td><input type="number" name="INVITATION_RATE" id="INVITATION_RATE" value="${pd.INVITATION_RATE}" maxlength="32" placeholder="这里输入邀请码利率" title="邀请码利率"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IS_INVITATION_RATE" id="IS_INVITATION_RATE" value="${pd.IS_INVITATION_RATE}" maxlength="32" placeholder="这里输入是否包含邀请码利率" title="是否包含邀请码利率"/></td>
			</tr>
			<tr>
				<td><input type="number" name="TOTAL_INTERESTRATE" id="TOTAL_INTERESTRATE" value="${pd.TOTAL_INTERESTRATE}" maxlength="32" placeholder="这里输入总利率" title="总利率"/></td>
			</tr>
			<tr>
				<td><input type="number" name="TOTAL_PROFIT" id="TOTAL_PROFIT" value="${pd.TOTAL_PROFIT}" maxlength="32" placeholder="这里输入总收益" title="总收益"/></td>
			</tr>
			<tr>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入会员ID" title="会员ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}" maxlength="32" placeholder="这里输入项目ID" title="项目ID"/></td>
			</tr>
			<tr>
				<td><input type="number" name="TICKET_DISCOUNT_AMOUNT" id="TICKET_DISCOUNT_AMOUNT" value="${pd.TICKET_DISCOUNT_AMOUNT}" maxlength="32" placeholder="这里输入优惠券金额" title="优惠券金额"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TICKET_ID" id="TICKET_ID" value="${pd.TICKET_ID}" maxlength="32" placeholder="这里输入优惠券ID" title="优惠券ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
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