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
			if($("#DESCRIPTION").val()==""){
			$("#DESCRIPTION").tips({
				side:3,
	            msg:'请输入描述',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DESCRIPTION").focus();
			return false;
		}
		if($("#SRC").val()==""){
			$("#SRC").tips({
				side:3,
	            msg:'请输入保存路径',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SRC").focus();
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
		if($("#CREATE_BY").val()==""){
			$("#CREATE_BY").tips({
				side:3,
	            msg:'请输入创建人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_BY").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="contractTemplateManager/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="TEMPLATE_ID" id="TEMPLATE_ID" value="${pd.TEMPLATE_ID}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>描述</th>
				<td><input type="text" name="DESCRIPTION" id="DESCRIPTION" value="${pd.DESCRIPTION}" maxlength="32" placeholder="这里输入描述" title="描述"/></td>
			</tr>
			<tr>
				<th>上传模板文件</th>
				<td>
					<c:if test="${pd == null || pd.SRC == '' || pd.SRC == null }">
						<input type="file" id="templateFile" name="templateFile" onchange="fileTypePdf(this)"/>
					</c:if>
					<c:if test="${pd != null && pd.SRC != '' && pd.SRC != null }">
						<input type="text" value="${pd.SRC}" readonly="readonly"/>
						<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delFile('${pd.TEMPLATE_ID }');" />
						<input type="hidden" name="SRC" id="SRC" value="${pd.SRC }"/>
					</c:if>
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
			
			$('#templateFile').ace_file_input({
				no_file:'请选择PDF模板文件 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'pdf',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
			
		});
		
		//过滤类型
		function fileTypePdf(obj){
			var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
		    if(fileType != '.pdf'){
		    	$("#templateFile").tips({
					side:3,
		            msg:'请上传PDF模板文件',
		            bg:'#AE81FF',
		            time:3
		        });
		    	$("#templateFile").val('');
		    	document.getElementById("templateFile").files[0] = '请选择PDF模板文件';
		    }
		}
		</script>
</body>
</html>