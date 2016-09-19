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
		
		<!-- jQuery分页插件 -->
		<link rel="stylesheet" href="plugins/jpaginate/css/style.css" />
		<script type="text/javascript" src="plugins/jpaginate/jquery.paginate.js"></script>
		
		
		
		<style type="text/css">
			#zhongxin th{text-align:right !important;}
			#zhongxin input{color:#000 !important;}
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
	
		<input type="hidden" name="ID" id="ID" value="${recharge.ID}"/>
		<div id="zhongxin" style="text-align:center">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>用户名：</th>	
				<td><input type="text" name="USERNAME" id="USERNAME" value="${recharge.USERNAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>真实姓名：</th>	
				<td><input type="text" name="REAL_NAME" id="REAL_NAME" value="${recharge.REAL_NAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				
			</tr>
			<tr>
				<th>性别：</th>
				<td><input type="text" name="SEX" id="SEX" value="${recharge.SEX=='1'?'男':'女'}" maxlength="32" placeholder="空" title="真实姓名" readonly="readonly"/></td>
				<th>手机号：</th>
				<td><input type="text" name="TEL" id="TEL" value="${recharge.TEL}" maxlength="32" placeholder="空" title="注册时间" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>E-MAIL：</th>
				<td><input type="text" name="EMAIL" id="EMAIL" value="${recharge.EMAIL}" maxlength="32" placeholder="空" title="账户余额" readonly="readonly"/></td>
				<th>身份证号：</th>	
				<td><input type="text" name="IDENTITY" id="IDENTITY" value="${recharge.IDENTITY}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
			<tr>
				<th>银行卡号：</th>
				<td><input type="text" name="BANK_CARK" id="BANK_CARD" value="${recharge.BANK_CARD}" maxlength="32" placeholder="空" title="银行卡号" readonly="readonly"/></td>
				<th>充值订单号：</th>
				<td><input type="text" name="ORDER_FORM_CODE" id="ORDER_FORM_CODE" value="${recharge.ORDER_FORM_CODE}" maxlength="32" placeholder="空" title="订单号" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>充值金额：</th>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${recharge.AMOUNT}" maxlength="32" placeholder="空" title="充值金额金额" readonly="readonly"/></td>
				<th>充值手续费：</th>
				<td><input type="text" name="FEE" id="FEE" value="${recharge.FEE}" maxlength="32" placeholder="空" title="充值手续费" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>充值时间：</th>
				<td><input type="text" name="CREATE_DATE" id="CREATE_DATE" value="${recharge.CREATE_DATE}" maxlength="32" placeholder="空" title="申请提现日期" readonly="readonly"/></td>
				<th>充值状态：</th>
				<td><input type="text" id="RECHARGE_STATUS" value="${recharge.RECHARGE_STATUS=='1'?'等待支付':(recharge.RECHARGE_STATUS=='2'?'充值成功':'充值失败')}" maxlength="32" placeholder="空" title="充值状态" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>最后处理人：</th>
				<td><input type="text" name="DISPOSE_BY" id="DISPOSE_BY" value="${recharge.DISPOSE_BY}" maxlength="32" placeholder="空" title="最后处理时间" readonly="readonly"/></td>
				<th>最后处理时间：</th>
				<td><input type="text" name="DISPOSE_DATE" id="DISPOSE_DATE" value="${recharge.DISPOSE_DATE}" maxlength="32" placeholder="空" title="充值状态" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>备注(最后处理人填写)</th>
				<td colspan="3">
					<textarea name="REMARK" id="REMARK" style="width:85%">${recharge.REMARK}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="100" style="text-align:center">
					<input type="button" class="btn btn-sm btn-pink" onclick="modify('${recharge.RECHARGE_ID}');" value="保存">
					<input type="button" class="btn btn-sm btn-inverse" onclick="top.Dialog.close();" value="关闭">
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
		
		//修改备注
		function modify(rID){
			var remark=$("#REMARK").val();
			$.ajax({
				type : 'post',
				data : {REMARK:remark,ID:rID},
				dataType : 'json',
				url : 'recharge/modifyRemark',
				success : function(data){
					if(data.msg == "success"){
						bootbox.alert("修改备注成功！",function(){
							location.reload();
						});
					}else{
						bootbox.alert("修改备注失败");
					}
				}
			});
		}
		</script>
</body>
</html>