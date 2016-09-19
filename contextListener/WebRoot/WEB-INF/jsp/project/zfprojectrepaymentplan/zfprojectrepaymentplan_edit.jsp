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
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
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
<style type="text/css">
.rateSpan{color: red;font-weight: bolder;font-size: 18px;padding-bottom: 10px;padding-left:3px;}
.rateSpanDes{color:#AAA;font-weight: bolder;font-size: 15px;padding-left:3px;}
</style>
<script type="text/javascript">
	
	
	//保存
	function save(){
		if($("#BATCH").val()==""){
			$("#BATCH").tips({
				side:3,
	            msg:'请输入批次',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BATCH").focus();
			return false;
		}
		if($("#REPAYMENT_DATE").val()==""){
			$("#REPAYMENT_DATE").tips({
				side:3,
	            msg:'请输入还款时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REPAYMENT_DATE").focus();
			return false;
		}
		if($("#CAPITAL").val()==""){
			$("#CAPITAL").tips({
				side:3,
	            msg:'请输入应还本金',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CAPITAL").focus();
			return false;
		}
		if($("#ACCRUAL").val()==""){
			$("#ACCRUAL").tips({
				side:3,
	            msg:'请输入应还利息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ACCRUAL").focus();
			return false;
		}
		if($("#REPAYMENT_WAY").val()==""){
			$("#REPAYMENT_WAY").tips({
				side:3,
	            msg:'请输入还款方式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REPAYMENT_WAY").focus();
			return false;
		}
		if($("#STATUS").val()=="" || $("#STATUS").val()==0){
			$("#STATUS").tips({
				side:3,
	            msg:'请选择还款状态',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="zfprojectrepaymentplan/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ZFPROJECTREPAYMENTPLAN_ID" id="ZFPROJECTREPAYMENTPLAN_ID" value="${pd.ZFPROJECTREPAYMENTPLAN_ID}"/>
		<input type="hidden" name="PROJECT_ID" id="PROJECT_ID" value="${pd.PROJECT_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="number" name="BATCH" id="BATCH" value="${pd.BATCH}" maxlength="32" placeholder="这里输入还款批次" title="还款批次"/></td>
			</tr>
			<tr>
				<td><input style="width:220px;" class="span10 date-picker" name="REPAYMENT_DATE" id="REPAYMENT_DATE" value="${pd.REPAYMENT_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="还款时间" title="还款时间"/></td>
			</tr>
			<tr>
				<td><input type="number" name="CAPITAL" id="CAPITAL" value="${pd.CAPITAL}" maxlength="32" placeholder="这里输入应还本金" title="应还本金"/><span class="rateSpanDes">元</span></td>
			</tr>
			<tr>
				<td><input type="number" name="ACCRUAL" id="ACCRUAL" value="${pd.ACCRUAL}" maxlength="32" placeholder="这里输入应还利息" title="应还利息"/><span class="rateSpanDes">元</span></td>
			</tr>
			<tr>
				<td><input type="text" name="REPAYMENT_WAY" id="REPAYMENT_WAY" value="${pd.REPAYMENT_WAY}" maxlength="32" placeholder="这里输入还款方式" title="还款方式"/><span class="rateSpanDes">如：按月付息，到期还本</span></td>
			</tr>
			<tr>
				<td>
				<select name="STATUS" id="STATUS"  title="还款状态">
				 			<option value="0" selected="selected">还款状态</option>
				  			<option value="1" <c:if test="${pd.STATUS==1}">selected="selected"</c:if>>待还款</option>
							<option value="2" <c:if test="${pd.STATUS==2}">selected="selected"</c:if>>已还款</option>
				 </select>
				</td>
			</tr>
			<tr>
				<td><input style="width:220px;" class="span10 date-picker" name="REAL_REPAY_DATE" id="REAL_REPAY_DATE" value="${pd.REAL_REPAY_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="实际还款时间" title="实际还款时间"/></td>
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