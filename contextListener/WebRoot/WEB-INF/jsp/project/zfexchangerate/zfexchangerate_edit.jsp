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
			
		if($("#ZFEXCHANGERATE_NAME").val()==""){
			$("#ZFEXCHANGERATE_NAME").tips({
				side:3,
	            msg:'请输入换手气名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ZFEXCHANGERATE_NAME").focus();
			return false;
		}
		if($("#ENABLE_MIN_AMOUNT").val()==""){
			$("#ENABLE_MIN_AMOUNT").tips({
				side:3,
	            msg:'请输入换手气最低投资额度(元)',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENABLE_MIN_AMOUNT").focus();
			return false;
		}
		if($("#EXCHANGE_NUM").val()==""){
			$("#EXCHANGE_NUM").tips({
				side:3,
	            msg:'请输入换手气次数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXCHANGE_NUM").focus();
			return false;
		}
		if($("#IS_ENABLE").val()==""){
			$("#IS_ENABLE").tips({
				side:3,
	            msg:'请输入是否启用',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_ENABLE").focus();
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
		if($("#CREATE_USER").val()==""){
			$("#CREATE_USER").tips({
				side:3,
	            msg:'请输入创建人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_USER").focus();
			return false;
		}
		if($("#ZFEXCHANGERATE_DES").val()==""){
			$("#ZFEXCHANGERATE_DES").tips({
				side:3,
	            msg:'请输入换手气说明',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ZFEXCHANGERATE_DES").focus();
			return false;
		}
		if($("#EXCHANGE_MAX_RATE").val()==""){
			$("#EXCHANGE_MAX_RATE").tips({
				side:3,
	            msg:'请输入换手气最大利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXCHANGE_MAX_RATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="zfexchangerate/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ZFEXCHANGERATE_ID" id="ZFEXCHANGERATE_ID" value="${pd.ZFEXCHANGERATE_ID}"/>
		<div id="zhongxin" align="center">
		<table style="margin-top: 20px;">
			<tr>
				<td><input type="text" name="ZFEXCHANGERATE_NAME" id="ZFEXCHANGERATE_NAME" value="${pd.ZFEXCHANGERATE_NAME}" maxlength="32" placeholder="这里输入换手气名称" title="换手气名称"/></td>
			</tr>
			<tr>
				<td><input type="number" name="ENABLE_MIN_AMOUNT" id="ENABLE_MIN_AMOUNT" value="${pd.ENABLE_MIN_AMOUNT}" maxlength="32" placeholder="这里输入最低投资额度(元)" title="换手气最低投资额度(元)"/></td>
			</tr>
			<tr>
				<td><input type="number" name="EXCHANGE_MAX_RATE" id="EXCHANGE_MAX_RATE" value="${pd.EXCHANGE_MAX_RATE}" maxlength="32" placeholder="这里输入换手气最大利率" title="换手气最大利率"/></td>
			</tr>
			<tr>
				<td><input type="number" name="EXCHANGE_NUM" id="EXCHANGE_NUM" value="${pd.EXCHANGE_NUM}" maxlength="32" placeholder="这里输入换手气次数" title="换手气次数"/></td>
			</tr>
			<tr>
				<td>
					<select name="IS_ENABLE" id="IS_ENABLE" value="${pd.IS_ENABLE}"  placeholder="这里输入是否启用" title="是否启用">
							<option value="0">是否启用</option>
							<option value="1" <c:if test="${pd.IS_ENABLE==1}">selected="selected"</c:if> >是</option>
							<option value="2" <c:if test="${pd.IS_ENABLE==2}">selected="selected"</c:if>>否</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="ZFEXCHANGERATE_DES" id="ZFEXCHANGERATE_DES" value="${pd.ZFEXCHANGERATE_DES}" maxlength="32" placeholder="这里输入换手气说明" title="换手气说明"/></td>
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