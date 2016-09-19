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
	            msg:'请输入栏目类型(1:文章，2:广告)',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TYPE").focus();
			return false;
		}
		if($("#PROGRAM_NAME").val()==""){
			$("#PROGRAM_NAME").tips({
				side:3,
	            msg:'请输入栏目名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROGRAM_NAME").focus();
			return false;
		}
		if($("#PARENT").val()==""){
			$("#PARENT").tips({
				side:3,
	            msg:'请输入父级栏目ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PARENT").focus();
			return false;
		}
		if($("#REMARK").val()==""){
			$("#REMARK").tips({
				side:3,
	            msg:'请输入栏目说明',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REMARK").focus();
			return false;
		}
		if($("#IS_USE").val()==""){
			$("#IS_USE").tips({
				side:3,
	            msg:'请输入是否启用(0:不起用，1:启用)，默认:1',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_USE").focus();
			return false;
		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建时间，默认:1900-01-01 00:00:00',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		if($("#CREATE_BY").val()==""){
			$("#CREATE_BY").tips({
				side:3,
	            msg:'请输入创建人ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_BY").focus();
			return false;
		}
		if($("#UPDATE_DATE").val()==""){
			$("#UPDATE_DATE").tips({
				side:3,
	            msg:'请输入最后编辑时间，默认：1900-01-01 00:00:00',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPDATE_DATE").focus();
			return false;
		}
		if($("#UPDATE_BY").val()==""){
			$("#UPDATE_BY").tips({
				side:3,
	            msg:'请输入最后编辑人ID',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#UPDATE_BY").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="program/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="PROGRAM_ID" id="PROGRAM_ID" value="${pd.PROGRAM_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>栏目名称：</th>
				<td><input type="text" name="PROGRAM_NAME" id="PROGRAM_NAME" value="${pd.PROGRAM_NAME}" maxlength="32" placeholder="这里输入栏目名" title="栏目名"/></td>
			</tr>
			<tr>
				<th>所属父栏目：</th>
				<td>
					<select id="PARENT" name="PARENT">
						<option value="0">顶级栏目</option>
						<c:forEach items="${pList}" var="p">
							<option value="${p.PROGRAM_ID}">${p.PROGRAM_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>备注：</th>
				<td><input type="text" name="REMARK" id="REMARK" value="${pd.REMARK}" maxlength="32" placeholder="这里输入栏目说明" title="栏目说明"/></td>
			</tr>
			<tr>
				<th>是否启用：</th>
				<td>
					<select id="IS_USE" name="IS_USE">
						<option value="1">是</option>
						<option value="0" <c:if test="${pd.IS_USE=='0'}">selected="selected"</c:if>>否</option>
					</select>
				</td>
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