<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<!-- ace styles -->
	<link rel="stylesheet" href="static/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />
	
	<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css">
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

<script type="text/javascript" src="<%=basePath%>ueditor/ueditor.config.js"></script>
<!-- 编辑器源文件 -->
<script type="text/javascript" src="<%=basePath%>ueditor/ueditor.all.js"></script>


<script type="text/javascript" src="<%=basePath%>static/js/jquery.tips.js"></script>


</head>
<body style="text-align:center">
	
	<form action="article/${msg}.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
			<input type="hidden" name="ARTICLE_ID" id="ARTICLE_ID"	value="${pd.ARTICLE_ID}" />
			<input type="hidden" name="CREATE_BY" id="CREATE_BY"	value="${pd.CREATE_BY}" />
			<input type="hidden" name="CREATE_DATE" id="CREATE_DATE"	value="${pd.CREATE_DATE}" />
			<input type="hidden" name="filePath" id="filePath" value="${filePath}">
			<div id="zhongxin">
				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th>文章所属栏目：</th>
						<td>
							<select name="PROGRAM_ID" id="PROGRAM_ID" class="input_txt" title="栏目">
								<c:forEach items="${proList}" var="program">
									<option value="${program.PROGRAM_ID }" <c:if test="${INIT_PROGRAM_ID==program.PROGRAM_ID}">selected="selected"</c:if>>
										${program.PROGRAM_NAME}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<th>栏目下序号：</th>
						<td>
							<input type="number" name="INDEX_IN_PROGRAM" id="INDEX_IN_PROGRAM" value="${pd.INDEX_IN_PROGRAM}" maxlength="32" placeholder="请输入数字" title="标题" />
						</td>
					</tr>
					<tr>
					<tr>
						<th>文章标题：</th>
						<td>
							<input type="text" name="TITLE" id="TITLE" value="${pd.TITLE}" maxlength="32" placeholder="这里输入标题" title="标题" />
						</td>
					</tr>
					<tr>
						<th>宣传图（如不需要可不使用，最佳图片大小220*146）：</th>
						<td>
							<c:if test="${pd == null || pd.MARK_PATH == '' || pd.MARK_PATH == null || pd.MARK_PATH == '0'}">
								<input type="file" id="titlePic" name="titlePic" onchange="fileTypePic(this)"/>
							</c:if>
							<c:if test="${pd != null && pd.MARK_PATH != '' && pd.MARK_PATH != null && pd.MARK_PATH != '0'}">
								<a href="<%=basePath%>${pd.MARK_PATH}" target="_blank"><img src="<%=basePath%>${pd.MARK_PATH}" width="210"/></a>
								<input type="button" class="btn btn-mini btn-danger" value="删除" onclick="delP('${pd.ARTICLE_ID }');" />
								<input type="hidden" name="tpz" id="tpz" value="${pd.MARK_PATH }"/>
							</c:if>
						</td>
					</tr>
					<tr>
						<th>列表页简介（不需要可为空）：</th>
						<td>
							<input type="text" name="ARTICLE_DESC" id="ARTICLE_DESC" value="${pd.ARTICLE_DESC}" maxlength="200" placeholder="列表页描述" title="列表页描述" />
						</td>
					</tr>
					<tr>
						<th>子标题（不需要可为空）：</th>
						<td>
							<input type="text" name="SUB_TITLE" id="SUB_TITLE" value="${pd.SUB_TITLE}" maxlength="12" placeholder="子标题" title="子标题" />
						</td>
					</tr>
					<tr>
						<th>关键字</th>
						<td>
							<input type="text" name="KEYWORDS" id="KEYWORDS" value="${pd.KEYWORDS}" maxlength="32" placeholder="这里输入关键字" title="关键字" />
						</td>
					</tr>
					<tr>
						<th>是否发布</th>
						<td>
							<select id="IS_PUBLISH" name="IS_PUBLISH">
								<option value="1">是</option>
								<option value="0" >否</option>
								<c:if test="${pd.IS_PUBLISH=='0'}">selected=selected</c:if>
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div class="col-sm-6">
										<div class="tabbable">
											<ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
												<li class="active">
													<a data-toggle="tab" href="#richtext">富文本编辑</a>
												</li>

												<li>
													<a data-toggle="tab" href="#profile4">上传文件</a>
												</li>
											</ul>

											<div class="tab-content">
												<div id="richtext" class="tab-pane in active">
													<textarea id="container" name="content" type="text/plain" style="width:845px">${content}</textarea>
												</div>

												<div id="profile4" class="tab-pane">
													<input type="file" id="staticHtml" name="staticHtml" onchange="fileType(this)"/>
												</div>
											</div>
										</div>
									</div>
						<%--  --%>
							
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center;">
							<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
							<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
						</td>
					</tr>
				</table>
				


			</div>

			<div id="zhongxin2" class="center" style="display:none">
				<br /> <br /> <br /> <br /> <br /> <img
					src="static/images/jiazai.gif" /><br />
				<h4 class="lighter block green">提交中...</h4>
			</div>
		
		</form>
	
	<!-- 引入 -->
	
	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript">
		//初始化ue
		var editor = UE.getEditor("container");	
		
		console.log(${INIT_PROGRAM_ID});
	
		$(top.hangge());
		$(function() {

			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//日期框
			$('.date-picker').datepicker();
			//$('input.color').colorPicker();
			
			//上传
			$('#titlePic').ace_file_input({
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
		
		$('#staticHtml').ace_file_input({
				no_file:'请选择静态HTML页面 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'html|htm',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
		
		
		function save() {
			
			if ($("#TITLE").val() == "") {
				$("#TITLE").tips({
					side : 3,
					msg : '请输入标题',
					bg : '#AE81FF',
					time : 2
				});
				$("#TITLE").focus();
				return false;
			}
			/* if ($("#SUB_TITLE").val() == "") {
				$("#SUB_TITLE").tips({
					side : 3,
					msg : '请输入子标题',
					bg : '#AE81FF',
					time : 2
				});
				$("#SUB_TITLE").focus();
				return false;
			} */
			if ($("#KEYWORDS").val() == "") {
				$("#KEYWORDS").tips({
					side : 3,
					msg : '请输入关键字',
					bg : '#AE81FF',
					time : 2
				});
				$("#KEYWORDS").focus();
				return false;
			}
			
			if ($("#FILE_PATH").val() == "") {
				$("#FILE_PATH").tips({
					side : 3,
					msg : '请输入文件存放相对路径',
					bg : '#AE81FF',
					time : 2
				});
				$("#FILE_PATH").focus();
				return false;
			}
			if ($("#CONTENT").val() == "") {
				$("#CONTENT").tips({
					side : 3,
					msg : '请输入是否发布',
					bg : '#AE81FF',
					time : 2
				});
				$("#CONTENT").focus();
				return false;
			}
			if ($("#IS_PUBLISH").val() == "") {
				$("#IS_PUBLISH").tips({
					side : 3,
					msg : '请输入是否发布',
					bg : '#AE81FF',
					time : 2
				});
				$("#IS_PUBLISH").focus();
				return false;
			}
			
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		//过滤类型
	function fileType(obj){
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.html' && fileType != '.htm'){
	    	$("#staticHtml").tips({
				side:3,
	            msg:'请上传静态网页文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#staticHtml").val('');
	    	document.getElementById("staticHtml").files[0] = '请选择静态网页文件';
	    }
	}
	
	//过滤类型
	function fileTypePic(obj){
		//$("#ISSAVEPIC").val("1");
		var fileType=obj.value.substr(obj.value.lastIndexOf(".")).toLowerCase();//获得文件后缀名
	    if(fileType != '.gif' && fileType != '.png' && fileType != '.jpg' && fileType != '.jpeg'){
	    	$("#titlePic").tips({
				side:3,
	            msg:'请上传图片格式的文件',
	            bg:'#AE81FF',
	            time:3
	        });
	    	$("#titlePic").val('');
	    	//$("#ISSAVEPIC").val('0');
	    	document.getElementById("pic").files[0] = '请选择图片';
	    }
	}
	//删除图片
	function delP(ARTICLE_ID){
		console.log(ARTICLE_ID);
		bootbox.confirm('确认删除该图片（删除后无法恢复）？',function(isConfirm){
			if(isConfirm){
				var url = "article/delpppic.do?ARTICLE_ID="+ARTICLE_ID;
				$.get(url,function(data){
					if(data.msg=="success"){
						bootbox.alert('删除成功',function(){
							document.location.reload()
						})
						
					}
				});
			}
		})
	}
	
	</script>
</body>
</html>