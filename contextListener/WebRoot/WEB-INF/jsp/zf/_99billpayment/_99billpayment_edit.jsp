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
			if($("#CITY").val()==""){
			$("#CITY").tips({
				side:3,
	            msg:'请输入收款人开户城市',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CITY").focus();
			return false;
		}
		if($("#BANK_NAME").val()==""){
			$("#BANK_NAME").tips({
				side:3,
	            msg:'请输入收款银行',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BANK_NAME").focus();
			return false;
		}
		if($("#DEPOSIT_BANK").val()==""){
			$("#DEPOSIT_BANK").tips({
				side:3,
	            msg:'请输入开户行',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DEPOSIT_BANK").focus();
			return false;
		}
		if($("#CREDIT_NAME").val()==""){
			$("#CREDIT_NAME").tips({
				side:3,
	            msg:'请输入收款人姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREDIT_NAME").focus();
			return false;
		}
		if($("#BANK_CARD_NUM").val()==""){
			$("#BANK_CARD_NUM").tips({
				side:3,
	            msg:'请输入卡号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BANK_CARD_NUM").focus();
			return false;
		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入付款金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
		if($("#DESCRIPTION").val()==""){
			$("#DESCRIPTION").tips({
				side:3,
	            msg:'请输入交易备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DESCRIPTION").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="_99billpayment/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="_99BILLPAYMENT_ID" id="_99BILLPAYMENT_ID" value="${pd._99BILLPAYMENT_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>收款人开户城市</th>
				<td><input type="text" name="CITY" id="CITY" value="${pd.CITY}" maxlength="32" placeholder="这里输入收款人开户城市" title="收款人开户城市"/></td>
			</tr>
			<tr>
				<th>收款银行</th>
				<td>
					<select name="BANK_NAME" id="BANK_NAME">
						<option value="中国工商银行">中国工商银行</option>
						<option value="招商银行">招商银行</option>
						<option value="中国建设银行">中国建设银行</option>
						<option value="中国农业银行">中国农业银行</option>
						<option value="中国银行">中国银行</option>
						<option value="上海浦东发展银行">上海浦东发展银行</option>
						<option value="交通银行">交通银行</option>
						<option value="中国民生银行">中国民生银行</option>
						<option value="深圳发展银行">深圳发展银行</option>
						<option value="广东发展银行">广东发展银行</option>
						<option value="中信银行">中信银行</option>
						<option value="华夏银行">华夏银行</option>
						<option value="兴业银行">兴业银行</option>
						<option value="广州市农村信用合作社">广州市农村信用合作社</option>
						<option value="广州市商业银行">广州市商业银行</option>
						<option value="上海农村商业银行">上海农村商业银行</option>
						<option value="中国邮政储蓄">中国邮政储蓄</option>
						<option value="中国光大银行">中国光大银行</option>
						<option value="上海银行">上海银行</option>
						<option value="北京银行">北京银行</option>
						<option value="渤海银行">渤海银行</option>
						<option value="北京农村商业银行">北京农村商业银行</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>开户行</th>
				<td><input type="text" name="DEPOSIT_BANK" id="DEPOSIT_BANK" value="${pd.DEPOSIT_BANK}" maxlength="32" placeholder="这里输入开户行" title="开户行"/></td>
			</tr>
			<tr>
				<th>收款人姓名</th>
				<td><input type="text" name="CREDIT_NAME" id="CREDIT_NAME" value="${pd.CREDIT_NAME}" maxlength="32" placeholder="这里输入收款人姓名" title="收款人姓名"/></td>
			</tr>
			<tr>
				<th>卡号</th>
				<td><input type="text" name="BANK_CARD_NUM" id="BANK_CARD_NUM" value="${pd.BANK_CARD_NUM}" maxlength="32" placeholder="这里输入卡号" title="卡号"/></td>
			</tr>
			<tr>
				<th>付款金额</th>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入付款金额" title="付款金额"/></td>
			</tr>
			<tr>
				<th>交易备注</th>
				<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="32" placeholder="这里输入交易备注" title="交易备注"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">确认</a>
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