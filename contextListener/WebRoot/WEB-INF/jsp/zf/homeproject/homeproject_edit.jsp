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
			if($("#PROJECT_ID").val()==""){
			$("#PROJECT_ID").tips({
				side:3,
	            msg:'请输入项目',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECT_ID").focus();
			return false;
		}
		if($("#PROJECT_TYPE").val()==""){
			$("#PROJECT_TYPE").tips({
				side:3,
	            msg:'请输入项目类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROJECT_TYPE").focus();
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="homeproject/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="HOMEPROJECT_ID" id="HOMEPROJECT_ID" value="${pd.HOMEPROJECT_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>项目</th>
				<td>
					<select name="PROJECT_ID" id="PROJECT_ID">
						<c:forEach items="${projectList}" var="p">
							<option value="${p.ID}" <c:if test="${p.ID == pd.PROJECT_ID}">selected="selected"</c:if>>${p.PROJECT_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>项目类型</th>
				<td>
					<select name="PROJECT_TYPE" id="PROJECT_TYPE">
						<option value="">请选择类型</option>
						<option value="3" <c:if test="${3 == pd.PROJECT_TYPE}">selected="selected"</c:if>>3月期</option>
						<option value="6" <c:if test="${6 == pd.PROJECT_TYPE}">selected="selected"</c:if>>6月期</option>
						<option value="9" <c:if test="${9 == pd.PROJECT_TYPE}">selected="selected"</c:if>>9月期</option>
						<option value="12" <c:if test="${12 == pd.PROJECT_TYPE}">selected="selected"</c:if>>12月期</option>
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