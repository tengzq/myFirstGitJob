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
			if($("#UT_ID").val()==""){
			$("#UT_ID").tips({
				side:3,
	            msg:'请输入投资卷序号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UT_ID").focus();
			return false;
		}
		if($("#UT_CREATE_DATE").val()==""){
			$("#UT_CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UT_CREATE_DATE").focus();
			return false;
		}
		if($("#UT_ENABLE_DATE").val()==""){
			$("#UT_ENABLE_DATE").tips({
				side:3,
	            msg:'请输入有效时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UT_ENABLE_DATE").focus();
			return false;
		}
		if($("#UT_IS_ENABLED").val()==""){
			$("#UT_IS_ENABLED").tips({
				side:3,
	            msg:'请输入是否可用',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UT_IS_ENABLED").focus();
			return false;
		}
		if($("#TICKET_ID").val()==""){
			$("#TICKET_ID").tips({
				side:3,
	            msg:'请输入投资卷ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_ID").focus();
			return false;
		}
		if($("#USER_ID").val()==""){
			$("#USER_ID").tips({
				side:3,
	            msg:'请输入用户ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_ID").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="zfuserticket/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ZFUSERTICKET_ID" id="ZFUSERTICKET_ID" value="${pd.ZFUSERTICKET_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="UT_ID" id="UT_ID" value="${pd.UT_ID}" maxlength="32" placeholder="这里输入投资卷序号" title="投资卷序号"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="UT_CREATE_DATE" id="UT_CREATE_DATE" value="${pd.UT_CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="创建时间" title="创建时间"/></td>
			</tr>
			<tr>
				<td><input class="span10 date-picker" name="UT_ENABLE_DATE" id="UT_ENABLE_DATE" value="${pd.UT_ENABLE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="有效时间" title="有效时间"/></td>
			</tr>
			<tr>
				<td><input type="number" name="UT_IS_ENABLED" id="UT_IS_ENABLED" value="${pd.UT_IS_ENABLED}" maxlength="32" placeholder="这里输入是否可用" title="是否可用"/></td>
			</tr>
			<tr>
				<td><input type="text" name="TICKET_ID" id="TICKET_ID" value="${pd.TICKET_ID}" maxlength="32" placeholder="这里输入投资卷ID" title="投资卷ID"/></td>
			</tr>
			<tr>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入用户ID" title="用户ID"/></td>
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