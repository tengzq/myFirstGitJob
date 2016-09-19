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
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#CONFIG_KEY").val()==""){
			$("#CONFIG_KEY").tips({
				side:3,
	            msg:'请输入配置名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONFIG_KEY").focus();
			return false;
		}
		if($("#CONFIG_VALUE").val()==""){
			$("#CONFIG_VALUE").tips({
				side:3,
	            msg:'请输入配置值',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CONFIG_VALUE").focus();
			return false;
		}
		if($("#REMARK").val()==""){
			$("#REMARK").tips({
				side:3,
	            msg:'请输入说明',
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
	<form action="config/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="CONFIG_ID" id="CONFIG_ID" value="${pd.CONFIG_ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="CONFIG_KEY" id="CONFIG_KEY" value="${pd.CONFIG_KEY}" maxlength="32" placeholder="这里输入配置名" title="配置名"/></td>
			</tr>
			<tr>
				<td><input type="text" name="CONFIG_VALUE" id="CONFIG_VALUE" value="${pd.CONFIG_VALUE}" maxlength="32" placeholder="这里输入配置值" title="配置值"/></td>
			</tr>
			<tr>
				<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="32" placeholder="这里输入说明" title="说明"/></td>
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