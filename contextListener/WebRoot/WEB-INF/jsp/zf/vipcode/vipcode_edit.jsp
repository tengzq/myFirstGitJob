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
		<c:if test="${pd.USER_ID == null || pd.USER_ID == ''}">
			$('#USER_ID').val($('#USER').val())
		</c:if>
		if($("#USER_ID").val()==""){
			$("#USER").tips({
				side:3,
	            msg:'请输入号码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER").focus();
			return false;
		}
		if($("#VIP_CODE").val()==""){
			$("#VIP_CODE").tips({
				side:3,
	            msg:'请输入 VIP码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VIP_CODE").focus();
			return false;
		}
		if(!textVIP()){
			console.log('VIP码验证不过');
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	function textVIP(){
		var boolen;
		if(!/^V\d+$/i.test($("#VIP_CODE").val())){
			$("#VIP_CODE").tips({
				side:3,
	            msg:'请输入V加数字格式',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VIP_CODE").focus();
			boolen=false;
		}else{
			boolen = true;
		}
		if($('#oldVipCode').val() != $('#VIP_CODE').val()){
			console.log('vip码变动');
			if(/^V[\d]{3}$/i.test($("#VIP_CODE").val())){
				$.ajax({
					url:'vipcode/textVipCode',
					type:'post',
					async:false,
					data:{VIP_CODE:$("#VIP_CODE").val()},
					dataType:'json',
					success:function(data){
						if(data.msg==false){
							$("#VIP_CODE").tips({
								side:3,
					            msg:'VIP码已存在',
					            bg:'#AE81FF',
					            time:2
					        });
							$("#VIP_CODE").focus();
							boolen=data.msg;
						}
						if(data.msg==true){
							boolen=data.msg;
						}
					}
				});
			}
		}else{
			console.log('vip码没有变动');
			boolen = true;
		}
		return boolen;
	}
	
</script>

	<style>
		table td input{
			color : #000 !important;
		}
	</style>
	</head>
<body>
	<form action="vipcode/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="VIPCODE_ID" id="VIPCODE_ID" value="${pd.VIPCODE_ID}"/>
		<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" />
		<input type="hidden" id="oldVipCode" value="${pd.VIP_CODE}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			
			<tr>
				<th>关联用户</th>
				<td>
					<c:if test="${pd.USER_ID == null || pd.USER_ID == ''}">
						<select class="chzn-select" id="USER" data-placeholder="请选择" style="vertical-align:top;">
							<c:forEach items="${list }" var="user">
								<option value="${user.USER_ID }">${user.USERNAME }-${user.TEL }</option>
							</c:forEach>
						 </select>
					</c:if>
					<c:if test="${pd.USER_ID != null and pd.USER_ID != ''}">
						<input value="${pd.USERNAME}" readonly="readonly"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>VIP码</th>
				<td><input type="text" name="VIP_CODE" id="VIP_CODE" value="${pd.VIP_CODE}"  placeholder="这里输入6位VIP码,以大写V开头" title="用户自己创建的编码"/></td>
			</tr>
			<tr>
				<th>自身利率(%)</th>
				<td><input type="number" name="SELF_RATE" id="SELF_RATE" value="${pd.SELF_RATE}"  placeholder="这里输入自己使用的利率" title="这里输入自己使用的利率"/></td>
			</tr>
			<tr>
				<th>他人利率(%)</th>
				<td><input type="number" name="COMMON_RATE" id="COMMON_RATE" value="${pd.COMMON_RATE}"  placeholder="这里输入他人使用的利率" title="这里输入他人使用的利率"/></td>
			</tr>
			<tr>
				<th>返现利率(%)</th>
				<td><input type="number" name="EARNS_PERCENT" id="EARNS_PERCENT" value="${pd.EARNS_PERCENT}"  placeholder="这里输入返现比例" title="这里输入返现比例"/></td>
			</tr>
			<tr>
				<th>备注</th>
				<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}"  placeholder="这里输入备注" title="这里输入备注"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		
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