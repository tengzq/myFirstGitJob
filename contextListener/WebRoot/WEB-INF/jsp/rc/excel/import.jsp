<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		
		<!-- ace styles -->
		<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
		
		checkExcel();
			
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
	//过滤类型
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.xls' && fileType != '.xlsx'){
	    	$("#excel").tips({
				side:3,
	            msg:'请上传Excel格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#excel").val('');
	    	document.getElementById("excel").files[0] = '请选择Excel';
	    }
	}
	
	function checkExcel(){
		var file = $("#excel").get(0).files[0];
		console.log(file.name);
		$.ajax({
			type : 'post',
			url : 'excel/checkName',
			data : {PROJECT_NAME:file.name},
			async : false,
			dataType : 'json',
			success : function(data){
				if(data.msg=="success"){
					console.log('success');					
				}else{
					bootbox.alert("项目不存在！");
					console.log("失败");
					return false;
				}
			}
		});
	}
	
	function delP(FILE_ID){
		 if(confirm("确定要删除图片？")){
			var url = "files/delete.do?FILE_ID="+FILE_ID;
			$.get(url,function(data){
				if(data=="success"){
					alert("删除成功!");
					document.location.reload();
				}
			});
		} 
	}
	
</script>
	</head>
<body>
	<form action="excel/import.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<div id="zhongxin" style="text-align: center">
		<table class="table table-striped table-bordered table-hover">
			
			<tr>
				<th style="width:160px">请选择Excel文件：</th>
				<td>
					<input type="file" id="excel" name="excel" onchange="fileType(this)"/>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;"  colspan="2">
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
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script src="static/assets/js/ace/elements.fileinput.js"></script>
		<script src="static/assets/js/ace/ace.js"></script>
		
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
		
		
		$(function() {
			//上传
			$('#excel').ace_file_input({
				no_file:'请选择Excel文件 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'xls|xlsx',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
			
			
		});
		
		
		</script>
</body>
</html>