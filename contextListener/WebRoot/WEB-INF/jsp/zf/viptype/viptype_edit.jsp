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
			if($("#TYPE_NAME").val()==""){
			$("#TYPE_NAME").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE_NAME").focus();
			return false;
		}
		if($("#SELF_RATE").val()==""){
			$("#SELF_RATE").tips({
				side:3,
	            msg:'请输入自己使用利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SELF_RATE").focus();
			return false;
		}
		if($("#COMMON_RATE").val()==""){
			$("#COMMON_RATE").tips({
				side:3,
	            msg:'请输入他人使用利率',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMMON_RATE").focus();
			return false;
		}
		/* if($("#EXT1").val()==""){
			$("#EXT1").tips({
				side:3,
	            msg:'请输入扩展1',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXT1").focus();
			return false;
		}
		if($("#EXT2").val()==""){
			$("#EXT2").tips({
				side:3,
	            msg:'请输入扩展2',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EXT2").focus();
			return false;
		} */
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="viptype/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="VIPTYPE_ID" id="VIPTYPE_ID" value="${pd.VIPTYPE_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			
			<tr>
				<th>名称</th>
				<td><input type="text" name="TYPE_NAME" id="TYPE_NAME" value="${pd.TYPE_NAME}" maxlength="32" placeholder="这里输入名称" title="名称"/></td>
			</tr>
			
			<tr>
				<th>自己使用利率（%）</th>
				<td><input type="text" name="SELF_RATE" id="SELF_RATE" value="${pd.SELF_RATE}" maxlength="32" placeholder="这里输入自己使用利率" title="自己使用利率"/></td>
			</tr>
			
			<tr>
				<th>他人使用利率（%）</th>
				<td><input type="text" name="COMMON_RATE" id="COMMON_RATE" value="${pd.COMMON_RATE}" maxlength="32" placeholder="这里输入他人使用利率" title="他人使用利率"/></td>
			</tr>
			
			<%-- <tr>
				<th>扩展1</th>
				<td><input type="text" name="EXT1" id="EXT1" value="${pd.EXT1}" maxlength="32" placeholder="这里输入扩展1" title="扩展1"/></td>
			</tr>
			
			<tr>
				<th>扩展2</th>
				<td><input type="text" name="EXT2" id="EXT2" value="${pd.EXT2}" maxlength="32" placeholder="这里输入扩展2" title="扩展2"/></td>
			</tr> --%>
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