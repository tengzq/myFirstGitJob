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
			if($("#TYPE").val()==""){
			$("#TYPE").tips({
				side:3,
	            msg:'请输入访问类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if($("#VIEW_ID").val()==""){
			$("#VIEW_ID").tips({
				side:3,
	            msg:'请输入访问页面的编码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VIEW_ID").focus();
			return false;
		}
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入微信名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		if($("#VIEW_DATETIME").val()==""){
			$("#VIEW_DATETIME").tips({
				side:3,
	            msg:'请输入访问时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#VIEW_DATETIME").focus();
			return false;
		}
		if($("#IP").val()==""){
			$("#IP").tips({
				side:3,
	            msg:'请输入ip地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IP").focus();
			return false;
		}
		if($("#BROWER").val()==""){
			$("#BROWER").tips({
				side:3,
	            msg:'请输入浏览器类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BROWER").focus();
			return false;
		}
		if($("#MOBILETYPE").val()==""){
			$("#MOBILETYPE").tips({
				side:3,
	            msg:'请输入手机类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MOBILETYPE").focus();
			return false;
		}
		if($("#USER_AGENT").val()==""){
			$("#USER_AGENT").tips({
				side:3,
	            msg:'请输入用户浏览器参数信息',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USER_AGENT").focus();
			return false;
		}
		if($("#RANDOM_CODE").val()==""){
			$("#RANDOM_CODE").tips({
				side:3,
	            msg:'请输入用户行为轨迹码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RANDOM_CODE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="viewlog/${msg}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="VIEWLOG_ID" id="VIEWLOG_ID" value="${pd.VIEWLOG_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="number" name="TYPE" id="TYPE" value="${pd.TYPE}" maxlength="32" placeholder="这里输入访问类型" title="访问类型"/></td>
			</tr>
			<tr>
				<td><input type="text" name="VIEW_ID" id="VIEW_ID" value="${pd.VIEW_ID}" maxlength="32" placeholder="这里输入访问页面的编码" title="访问页面的编码"/></td>
			</tr>
			<tr>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入微信名称" title="微信名称"/></td>
			</tr>
			<tr>
				<td><input type="text" name="VIEW_DATETIME" id="VIEW_DATETIME" value="${pd.VIEW_DATETIME}" maxlength="32" placeholder="这里输入访问时间" title="访问时间"/></td>
			</tr>
			<tr>
				<td><input type="text" name="IP" id="IP" value="${pd.IP}" maxlength="32" placeholder="这里输入ip地址" title="ip地址"/></td>
			</tr>
			<tr>
				<td><input type="text" name="BROWER" id="BROWER" value="${pd.BROWER}" maxlength="32" placeholder="这里输入浏览器类型" title="浏览器类型"/></td>
			</tr>
			<tr>
				<td><input type="text" name="MOBILETYPE" id="MOBILETYPE" value="${pd.MOBILETYPE}" maxlength="32" placeholder="这里输入手机类型" title="手机类型"/></td>
			</tr>
			<tr>
				<td><input type="text" name="USER_AGENT" id="USER_AGENT" value="${pd.USER_AGENT}" maxlength="32" placeholder="这里输入用户浏览器参数信息" title="用户浏览器参数信息"/></td>
			</tr>
			<tr>
				<td><input type="text" name="RANDOM_CODE" id="RANDOM_CODE" value="${pd.RANDOM_CODE}" maxlength="32" placeholder="这里输入用户行为轨迹码" title="用户行为轨迹码"/></td>
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