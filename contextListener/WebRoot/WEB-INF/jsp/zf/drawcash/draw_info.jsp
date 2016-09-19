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
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
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
		
		<!-- jQuery分页插件 -->
		<link rel="stylesheet" href="plugins/jpaginate/css/style.css" />
		<script type="text/javascript" src="plugins/jpaginate/jquery.paginate.js"></script>
		
		
		
		<style type="text/css">
			#zhongxin th{text-align:right !important;}
			#zhongxin input{color:#000 !important;}
			#zhongxin input.dobtn{color:#fff !important;}
			#chgRcd{border:0;width:97%;height:93%;position:absolute;}
			#b-record-type{padding-bottom:10px}
			#f-flow-type{padding-bottom:10px}
			#paginate{width:93% !important;}
		</style>
		
<script type="text/javascript">
	
	
	//保存
	/* function save(){
			if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入用户登录名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			return false;
		}
		if($("#REAL_NAME").val()==""){
			$("#REAL_NAME").tips({
				side:3,
	            msg:'请输入真实姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REAL_NAME").focus();
			return false;
		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入注册时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		if($("#LAST_LOGIN").val()==""){
			$("#LAST_LOGIN").tips({
				side:3,
	            msg:'请输入最后登录时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LAST_LOGIN").focus();
			return false;
		}
		if($("#BALANCE").val()==""){
			$("#BALANCE").tips({
				side:3,
	            msg:'请输入账户余额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BALANCE").focus();
			return false;
		}
		if($("#TICKET").val()==""){
			$("#TICKET").tips({
				side:3,
	            msg:'请输入投资券',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	} */
	
</script>
	</head>
<body>
	
		<input type="hidden" name="ID" id="ID" value="${info.ID}"/>
		<div id="zhongxin" style="text-align:center">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>用户名：</th>	
				<td><input type="text" name="USERNAME" id="USERNAME" value="${info.USERNAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>真实姓名：</th>	
				<td><input type="text" name="REAL_NAME" id="REAL_NAME" value="${info.REAL_NAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				
			</tr>
			<tr>
				<th>性别：</th>
				<td><input type="text" name="SEX" id="SEX" value="${info.SEX=='1'?'男':'女'}" maxlength="32" placeholder="空" title="真实姓名" readonly="readonly"/></td>
				<th>手机号：</th>
				<td><input type="text" name="TEL" id="TEL" value="${info.TEL}" maxlength="32" placeholder="空" title="注册时间" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>E-MAIL：</th>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${info.EMAIL}" maxlength="32" placeholder="空" title="账户余额" readonly="readonly"/></td>
				<th>身份证号：</th>	
				<td><input type="text" name="IDENTITY" id="IDENTITY" value="${info.IDENTITY}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
			<tr>
				<th>账户余额：</th>	
				<td><input type="text" name="BALANCE" id="BALANCE" value="${info.BALANCE}" maxlength="32" placeholder="空" title="账户余额" readonly="readonly"/></td>
				<th>当前冻结金额总数：</th>
				<td><input type="text" name="FROZEN_AMOUNT" id="FROZEN_AMOUNT" value="${info.FROZEN_AMOUNT}" maxlength="32" placeholder="空" title="当前冻结金额总数" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>银行卡号：</th>
				<td><input type="text" name="BANK_CARK" id="BANK_CARK" value="${info.BANK_CARD}" maxlength="32" placeholder="空" title="银行卡号" readonly="readonly"/></td>
				<th>申请提现订单号：</th>
				<td><input type="text" name="ORDER_FORM_CODE" id="ORDER_FORM_CODE" value="${info.ORDER_FORM_CODE}" maxlength="32" placeholder="空" title="订单号" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>申请提现金额：</th>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${info.AMOUNT}" maxlength="32" placeholder="空" title="申请提现金额" readonly="readonly"/></td>
				<th>申请时间：</th>
				<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${info.CREATE_DATE}" maxlength="32" placeholder="空" title="申请提现日期" readonly="readonly"/></td>
			</tr>
			<tr>
				<th colspan="2">当前状态：</th>
				<td colspan="2"><input type="text" id="CURR_STATUS" value="${info.CASH_DRAW_ORDERFORM_STATUS}" maxlength="32" placeholder="空" title="当前状态" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="100" style="text-align:center">
					<c:if test="${info.STATUS_CODE=='1'}">
						<input style="font-family:'黑体';font-size:16px;" type="button" class="btn btn-sm btn-purple dobtn" onclick="modifyStatus('${info.ORDER_FORM_CODE}')" value="转为处理中">
					</c:if>
					<c:if test="${info.STATUS_CODE=='2'}">
						<input style="font-family:'黑体';font-size:16px;" type="button" class="btn btn-sm btn-success dobtn" onclick="drawCashSuccess('${info.ORDER_FORM_CODE}')" value="提现成功">
						<input style="font-family:'黑体';font-size:16px;" type="button" class="btn btn-sm btn-danger dobtn" onclick="drawCashFaild('${info.ORDER_FORM_CODE}')" value="提现失败">
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="100" style="text-align:center">
					<input type="button" class="btn btn-sm btn-inverse dobtn" onclick="top.Dialog.close();" value="关闭">
				</td>
			</tr>
		</table>
		</div>
		
		<!-- <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div> -->
		
	
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
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
			//默认加载充值记录
		});
		
		//将状态转为处理中
		function modifyStatus(ORDER_ID){
			bootbox.confirm("确认修改状态为处理中？",function(result){
				if(result){
					$.ajax({
						type : 'post',
						data : {ORDER_FORM_CODE:ORDER_ID},
						dataType : 'json',
						url : '<%=basePath%>_drawcash/modifyStatus',
						success : function(data){
							if(data.msg=="success"){
								bootbox.alert("已转为提现处理中",function(){
									location.reload();
								});
							}else{
								bootbox.alert("转为处理中失败！");
							}
						}
					});
				}
			});
		}
		
		//将状态转为提款成功
		function drawCashSuccess(ORDER_ID){
			bootbox.confirm("确认设置本次提款成功？",function(result){
				if(result){
					$.ajax({
						type : 'post',
						data : {orderid:ORDER_ID},
						dataType : 'json',
						url : '<%=basePath%>drawcash/_drawCashSuccess',
						success : function(data){
							if(data.msg=="success"){
								bootbox.alert("提款成功操作完成！",function(){
									location.reload();
								});
							}else{
								bootbox.alert(data.msg);
							}
						}
					});
				}
			});
		}
		
		
		//将状态转为提款失败
		function drawCashFaild(ORDER_ID){
			bootbox.confirm("确认设置本次提款为失败？",function(result){
				if(result){
					$.ajax({
						type : 'post',
						data : {orderid:ORDER_ID},
						dataType : 'json',
						url : '<%=basePath%>drawcash/_drawCashFaild',
						success : function(data){
							if(data.msg=="success"){
								bootbox.alert("转为提款失败成功！",function(){
									location.reload();
								});
							}else{
								bootbox.alert(data.msg);
							}
						}
					});
				}
			});
		}
		</script>
</body>
</html>