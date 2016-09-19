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
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="<%=basePath%>static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="<%=basePath%>static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=basePath%>static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="<%=basePath%>static/css/chosen.css" />
		
		<link rel="stylesheet" href="<%=basePath%>static/css/ace.min.css" />
		<link rel="stylesheet" href="<%=basePath%>static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="<%=basePath%>static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="<%=basePath%>static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>
		<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css">
		<script type="text/javascript" src="ueditor/ueditor.config.js"></script>
		<!-- 编辑器源文件 -->
		<script type="text/javascript" src="ueditor/ueditor.all.js"></script>
		
		
<script type="text/javascript">
	
	
	//保存
	function save(){
		if($("#PROJECT_DETAIL_TEXT").val()==""){
			$("#PROJECT_DETAIL_TEXT").tips({
				side:3,
	            msg:'请输入项目详情',
	            bg:'#AE81FF',
	            time:2
	        });
	        $("#riskControl").removeAttr('class');
	        $("#riskControl").addClass('tab-pane');
	        $("#riskControl2").removeAttr('class');
	        $("#riskControl2").addClass('tab-pane');
	        $("#projectDetils").addClass('tab-pane active');
	         $("#riskControlLi").removeAttr('class');
	         $("#riskControlLi2").removeAttr('class');
	        $("#projectDetilsLi").addClass('active');
			$("#PROJECT_DETAIL_TEXT").focus();
			return false;
		}
		if($("#PROJECT_RISK_CONTROL").val()==""){
			$("#PROJECT_RISK_CONTROL").tips({
				side:3,
	            msg:'请输入风险控制',
	            bg:'#AE81FF',
	            time:2
	        });
	         $("#projectDetils").removeAttr('class');
	        $("#projectDetils").addClass('tab-pane');
	        $("#riskControl").addClass('tab-pane active');
	        $("#riskControl2").addClass('tab-pane active');
	         $("#riskControlLi").addClass('active');
	         $("#riskControlLi2").addClass('active');
	        $("#projectDetilsLi").removeAttr('class');
			$("#PROJECT_RISK_CONTROL").focus();
			return false;
		}
		if($("#PROJECT_RISK_JS").val()==""){
			$("#PROJECT_RISK_JS").tips({
				side:3,
	            msg:'请输入风险揭示',
	            bg:'#AE81FF',
	            time:2
	        });
	         $("#projectDetils").removeAttr('class');
	        $("#projectDetils").addClass('tab-pane');
	        $("#riskControl").addClass('tab-pane active');
	        $("#riskControl2").addClass('tab-pane active');
	         $("#riskControlLi").addClass('active');
	         $("#riskControlLi2").addClass('active');
	        $("#projectDetilsLi").removeAttr('class');
			$("#PROJECT_RISK_CONTROL").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
</head>
<body>
	<form action="zfprojectdetails/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ZFPROJECTDETAILS_ID" id="ZFPROJECTDETAILS_ID" value="${pd.ZFPROJECTDETAILS_ID}"/>
<div id="zhongxin">
	<div class="tabbable" align="center">
            <ul class="nav nav-tabs" id="myTab">
              <li id="projectDetilsLi" class="active"><a data-toggle="tab" href="#projectDetils"><i class="green icon-home bigger-110"></i>项目详情</a></li>
              <li id="riskControlLi"><a data-toggle="tab" href="#riskControl"><i class="green icon-cog bigger-110"></i>风险控制</a></li>
              <li id="riskControlLi2"><a data-toggle="tab" href="#riskControl2"><i class="green icon-cog bigger-110"></i>风险揭示</a></li>
            </ul>
            <div class="tab-content" >
			  <div id="projectDetils" class="tab-pane in active">
				<p><script id="projectDetilsinp" style="width:890px;height:350px;" type="text/plain" name="PROJECT_DETAIL_TEXT" id="PROJECT_DETAIL_TEXT"  title="项目详情">${pd.PROJECT_DETAIL_TEXT}</script></p>
			  </div>
			  <div id="riskControl" class="tab-pane">
				<p><script id="riskControlinp" style="width:890px;height:350px;" type="text/plain" name="PROJECT_RISK_CONTROL" id="PROJECT_RISK_CONTROL" value="" maxlength="32" placeholder="这里输入风险控制" title="风险控制">${pd.PROJECT_RISK_CONTROL}</script></p>
			  </div>
			  <div id="riskControl2" class="tab-pane">
				<p><script id="riskControlinp2" style="width:890px;height:350px;" type="text/plain" name="PROJECT_RISK_JS" id="PROJECT_RISK_js" value="" maxlength="32" placeholder="这里输入风险揭示" title="风险揭示">${pd.PROJECT_RISK_JS}</script></p>
			  </div>
            </div>
	</div>
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<tr>
				<td style="text-align: center;" colspan="100">
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
		//初始化ue
		var editor = UE.getEditor("projectDetilsinp");	
		var editor2 = UE.getEditor("riskControlinp");
		var editor3 = UE.getEditor("riskControlinp2");
		$(top.hangge());
		$(function() {
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			//日期框
			$('.date-picker').datepicker();
			
			<c:if test="${pd.PROJECT_DETAIL_TEXT==''}">
				$.ajax({
					type : 'get',
					url : 'uploadFiles/info_template/ProjectDetailTemplate.html',
					dataType : 'html',
					success : function(html){
						//console.log(html);
						editor.addListener('ready',function(){
							editor.setContent(html);
						});
					}
				});
			</c:if>
			var details= '';
			//console.log(details);
			/* if(details==''){
				$.ajax({
				type : 'get',
				url : 'uploadFiles/info_template/ProjectDetailTemplate.html',
				dataType : 'html',
				success : function(html){
					editor.addListener('ready',function(){
						editor.setContent(html);
					});
				}
			}); 
			}*/
		});
		</script>
</body>
</html>