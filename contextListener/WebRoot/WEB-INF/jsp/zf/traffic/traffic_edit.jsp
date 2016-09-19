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
			if($("#COMING_FROM").val()==""){
			$("#COMING_FROM").tips({
				side:3,
	            msg:'请输入来源',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMING_FROM").focus();
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
		if($("#UID").val()==""){
			$("#UID").tips({
				side:3,
	            msg:'请输入站外用户ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UID").focus();
			return false;
		}
		if($("#EXT1").val()==""){
			$("#EXT1").tips({
				side:3,
	            msg:'请输入扩展字段',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXT1").focus();
			return false;
		}
		if($("#EXT2").val()==""){
			$("#EXT2").tips({
				side:3,
	            msg:'请输入扩展字段',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXT2").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="traffic/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="TRAFFIC_ID" id="TRAFFIC_ID" value="${pd.TRAFFIC_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>来源</th>
				<td><input type="number" name="COMING_FROM" id="COMING_FROM" value="${pd.COMING_FROM}" maxlength="32" placeholder="这里输入来源" title="来源"/></td>
			</tr>
			<tr>
				<th>用户ID</th>
				<td><input type="text" name="USER_ID" id="USER_ID" value="${pd.USER_ID}" maxlength="32" placeholder="这里输入用户ID" title="用户ID"/></td>
			</tr>
			<tr>
				<th>注册时间</th>
				<td><input class="span10 date-picker" name="CREATE_DATE" id="CREATE_DATE" value="${pd.CREATE_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="注册时间" title="注册时间"/></td>
			</tr>
			<tr>
				<th>站外用户ID</th>
				<td><input type="text" name="UID" id="UID" value="${pd.UID}" maxlength="32" placeholder="这里输入站外用户ID" title="站外用户ID"/></td>
			</tr>
			<tr>
				<th>扩展字段</th>
				<td><input type="text" name="EXT1" id="EXT1" value="${pd.EXT1}" maxlength="32" placeholder="这里输入扩展字段" title="扩展字段"/></td>
			</tr>
			<tr>
				<th>扩展字段</th>
				<td><input type="text" name="EXT2" id="EXT2" value="${pd.EXT2}" maxlength="32" placeholder="这里输入扩展字段" title="扩展字段"/></td>
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