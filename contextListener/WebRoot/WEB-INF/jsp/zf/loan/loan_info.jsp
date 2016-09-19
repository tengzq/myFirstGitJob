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
	</head>
<body>
	
		<input type="hidden" name="ID" id="ID" value="${info.ID}"/>
		<div id="zhongxin" style="text-align:center">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>真实姓名：</th>	
				<td><input type="text" name="NAME" id="NAME" value="${info.NAME}" maxlength="32" placeholder="空" title="真实姓名" readonly="readonly"/></td>
				<th>身份证号：</th>	
				<td><input type="text" name="IDENTITY" id="IDENTITY" value="${info.IDENTITY}" maxlength="32" placeholder="空" title="身份证号" readonly="readonly"/></td>
				
			</tr>
			<tr>
				<th>性别：</th>
				<td><input type="text" name="SEX" id="SEX" value="${info.SEX}" maxlength="32" placeholder="空" title="性别" readonly="readonly"/></td>
				<th>手机号：</th>
				<td><input type="text" name="TEL" id="TEL" value="${info.TEL}" maxlength="32" placeholder="空" title="手机号" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>真实年龄：</th>
				<td><input type="text" name="AGE" id="AGE" value="${info.AGE}" maxlength="32" placeholder="空" title="真实年龄" readonly="readonly"/></td>
				<th>税后月薪：</th>	
				<td><input type="text" name="MONTHLY_PAY" id="MONTHLY_PAY" value="${info.MONTHLY_PAY}" maxlength="32" placeholder="空" title="税后月薪" readonly="readonly"/></td>
			<tr>
				<th>居住城市：</th>	
				<td><input type="text" name="ADRESS" id="ADRESS" value="${info.ADRESS}" maxlength="32" placeholder="空" title="居住城市" readonly="readonly"/></td>
				<th>居住时间：</th>
				<td><input type="text" name="RESIDENCE_TIME" id="RESIDENCE_TIME" value="${info.RESIDENCE_TIME}" maxlength="32" placeholder="空" title="居住时间" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>客户类别：</th>
				<td><input type="text" name="CLIENT_SORT" id="CLIENT_SORT" value="${info.CLIENT_SORT}" maxlength="32" placeholder="空" title="客户类别" readonly="readonly"/></td>
				<th>在职时间或公司成立时间（月）：</th>
				<td><input type="text" name="CTIME" id="CTIME" value="${info.CTIME}" maxlength="32" placeholder="空" title="在职时间或公司成立时间" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>借款申请金额：</th>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${info.AMOUNT}" maxlength="32" placeholder="空" title="借款申请金额" readonly="readonly"/></td>
				<th>借款目的：</th>
				<td><input type="text" name="PURPOSE" id="PURPOSE" value="${info.PURPOSE}" maxlength="32" placeholder="空" title="借款目的" readonly="readonly"/></td>
			</tr>
			<tr>
				<td colspan="100" style="text-align:center">
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
		</script>
</body>
</html>