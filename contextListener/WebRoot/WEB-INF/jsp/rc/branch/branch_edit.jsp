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
			if($("#BRANCH_NAME").val()==""){
			$("#BRANCH_NAME").tips({
				side:3,
	            msg:'请输入分支结构名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BRANCH_NAME").focus();
			return false;
		}
		if($("#GROUP_ID").val()==""){
			$("#GROUP_ID").tips({
				side:3,
	            msg:'请选择所属集团',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#GROUP_ID").focus();
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="branch/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="branchId" id="BRANCH_ID" value="${pd.BRANCH_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>分支结构名</th>
				<td><input type="text" name="branchName" id="BRANCH_NAME" value="${pd.BRANCH_NAME}" maxlength="32" placeholder="这里输入分支结构名" title="分支结构名"/></td>
			</tr>
			<tr>
				<th>所属集团</th>
				<td>
					<select name="groupId" id="GROUP_ID">
						<option value="">请选择所属集团</option>
						<c:forEach items="${groupList}" var="group">
							<option value="${group.GROUP_ID}" <c:if test="${group.GROUP_ID == pd.GROUP_ID}">selected="selected"</c:if>>${group.GROUP_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>分支描述</th>
				<td><input type="text" name="branchRemark" id="BRANCH_REMARK" value="${pd.BRANCH_REMARK}" maxlength="32" placeholder="这里输入分支描述" title="分支描述"/></td>
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