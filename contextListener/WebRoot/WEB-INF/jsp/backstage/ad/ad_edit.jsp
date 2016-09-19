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
		
		<link rel="stylesheet" href="static/assets/css/font-awesome.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#TITLE").val()==""){
			$("#TITLE").tips({
				side:3,
	            msg:'请输入标题',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TITLE").focus();
			return false;
		}
		if($("#PROGRAM_ID").val()==""){
			$("#PROGRAM_ID").tips({
				side:3,
	            msg:'请选择所属栏目',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PROGRAM_ID").focus();
			return false;
		}
		if($("#URLPATH").val()==""){
			$("#URLPATH").tips({
				side:3,
	            msg:'请输入链结地址',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#URLPATH").focus();
			return false;
		}
		
		if(typeof($("#tpz").val()) == "undefined"){
			if($("#pic").val()=="" || document.getElementById("pic").files[0] =='请选择图片'){
				
				$("#pic").tips({
					side:3,
		            msg:'请选图片',
		            bg:'#AE81FF',
		            time:3
		        });
				return false;
			}
		}
		if($("#COMMON").val()==""){
			$("#COMMON").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#COMMON").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	//过滤类型
	function fileType(obj){
		$("#ISSAVEPIC").val("1");
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#pic").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#pic").val('');
	    	$("#ISSAVEPIC").val('0');
	    	document.getElementById("pic").files[0] = '请选择图片';
	    }
	}
	
</script>
	</head>
<body>
	<form action="ad/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="AD_ID" id="AD_ID" value="${pd.AD_ID}"/>
		<input type="hidden" id="ISSAVEPIC" name="ISSAVEPIC" value="0"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>广告标题：</th>
				<td><input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="32" placeholder="这里输入标题" title="标题"/></td>
			</tr>
			<tr>
				<th>所属栏目：</th>
				<td>
					<select id="PROGRAM_ID" name="PROGRAM_ID">
						<option value="">请选择所属栏目</option>
						<c:forEach items="${adpList}" var="adp">
							<option value="${adp.AD_PROGRAM_ID}" <c:if test="${adp.AD_PROGRAM_ID==INIT_PROGRAM_ID}">selected="selected"</c:if>>${adp.PROGRAM_NAME}</option>
						</c:forEach>
						
					</select>
				</td>
			</tr>
			<tr>
				<th>链接路径：</th>
				<td><input type="text" name="URLPATH" id="URLPATH" value="${pd.URLPATH}" maxlength="32" placeholder="这里输入链结地址" title="链结地址"/></td>
			</tr>
			<tr>
				<th>图片:</th>
				<td id="picTd">
					<c:if test="${pd == null || pd.FILE_PATH == '' || pd.FILE_PATH == null }">
						<input type="file" id="pic" name="pic" onchange="fileType(this)"/>
					</c:if>
					<c:if test="${pd != null && pd.FILE_PATH != '' && pd.FILE_PATH != null }">
						<a href="<%=basePath%>${pd.FILE_PATH}" target="_blank"><img src="<%=basePath%>${pd.FILE_PATH}" width="210"/></a>
						<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.FILE_ID }','${pd.FILE_PATH}');" />
						<input type="hidden" name="tpz" id="tpz" value="${pd.FILE_PATH }"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>背景色：</th>
				<td>
					<input type="color" id="BGCOLOR" name="BGCOLOR" value="${pd.BGCOLOR}"/>
				</td>
			</tr>
			<tr>
				<th>备注：</th>
				<td><input type="text" name="COMMON" id="COMMON" value="${pd.COMMON}" maxlength="32" placeholder="这里输入备注" title="备注"/></td>
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
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			$(function() {
				//上传
				$('#pic').ace_file_input({
					no_file:'请选择图片 ...',
					btn_choose:'选择',
					btn_change:'更改',
					droppable:false,
					onchange:null,
					thumbnail:false, //| true | large
					whitelist:'gif|png|jpg|jpeg',
					//blacklist:'gif|png|jpg|jpeg'
					//onchange:''
					//
				});
				
			});
		});
		
		
		function delP(FILE_ID){
			bootbox.confirm("确认删除图片？",function(result){
				if(result){
					$.ajax({
						type : 'get',
						url : '<%=basePath%>ad/delpic',
						data : {FILE_ID:FILE_ID},
						dataType : 'json',
						success : function(data){
							if(data.msg=="success"){
								bootbox.alert("删除图片成功，请重新选择图片！");
								$("#picTd").html('<input type="file" id="pic" name="pic" onchange="fileType(this)"/>');
							}
						}
					});
				}
			});
		}
		</script>
</body>
</html>