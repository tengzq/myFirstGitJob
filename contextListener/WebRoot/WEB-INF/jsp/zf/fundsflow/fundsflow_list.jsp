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
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	<style type="text/css">
		table th,td{text-align: center;}
	</style>	
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="fundsFlowBackstage/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="searchTxt" value="${pd.searchTxt}" placeholder="用户名检索" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td style="vertical-align:top;"> 
					 	<select name="TYPE"  id="PROJECT_STATE" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="-1" <c:if test="${pd.TYPE==0}">selected="selected"</c:if>>类型</option>
							<option value="0" <c:if test="${pd.TYPE==0}">selected="selected"</c:if>>充值</option>
							<option value="1" <c:if test="${pd.TYPE==1}">selected="selected"</c:if>>项目投资</option>
							<option value="2" <c:if test="${pd.TYPE==2}">selected="selected"</c:if>>提现</option>
							<option value="3" <c:if test="${pd.TYPE==3}">selected="selected"</c:if>>收益</option>
							<option value="4" <c:if test="${pd.TYPE==4}">selected="selected"</c:if>>回收本金</option>
							<option value="5" <c:if test="${pd.TYPE==5}">selected="selected"</c:if>>转账</option>
							<option value="7" <c:if test="${pd.TYPE==7}">selected="selected"</c:if>>企业还款</option>
							<option value="8" <c:if test="${pd.TYPE==7}">selected="selected"</c:if>>企业收款</option>
					  	</select>
					</td>
					<td style="vertical-align:top;"> 
					 	<select name="USER_TYPE"  id="PROJECT_STATE" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">用户类型</option>
							<option value="1" <c:if test="${pd.PROJECT_STATE==1}">selected="selected"</c:if>>个人用户</option>
							<option value="2" <c:if test="${pd.PROJECT_STATE==2}">selected="selected"</c:if>>企业用户</option>
					  	</select>
					</td>
					<td style="vertical-align:top;"> 
					 	<select name="STATUS"  id="STATUS" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">流水状态</option>
							<option value="1" <c:if test="${pd.STATUS==1}">selected="selected"</c:if>>成功</option>
							<option value="0" <c:if test="${pd.STATUS==2}">selected="selected"</c:if>>失败</option>
					  	</select>
					</td>
					<%-- <td><input class="span10 date-picker" name="dateStart" id="dateStart" value="${pd.dateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="dateEnd" id="dateEnd" value="${pd.dateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td> --%>
					<!-- <td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">1</option>
							<option value="">2</option>
					  	</select>
					</td> -->
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
					</c:if>
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<!-- <th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<th>序号</th>
						<th>用户名</th>
						<th>金额</th>
						<th>备注</th>
						<th>类型</th>
						<th>时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty recordList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${recordList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td>${var.USERNAME}</td>
										<td>${var.AMOUNT}</td>
										<td>${var.REMARK}</td>
										<td>
											<c:if test="${var.TYPE == 0 }">
											充值
											</c:if>
											<c:if test="${var.TYPE == 1 }">
											项目投资
											</c:if>
											<c:if test="${var.TYPE == 2 }">
											提现
											</c:if>
											<c:if test="${var.TYPE == 3 }">
											收益
											</c:if>
											<c:if test="${var.TYPE == 4 }">
											回收本金
											</c:if>
											<c:if test="${var.TYPE == 5 }">
											转账
											</c:if>
											<c:if test="${var.TYPE == 7 }">
											企业还款
											</c:if>
											<c:if test="${var.TYPE == 8 }">
											企业收款
											</c:if>
										</td>
										<td>${var.TRADE_TIME}</td>
										<td>
											
											
											<c:choose> 
											 			
											            <c:when test="${var.STATUS == 1}">成功</c:when> 
											            <c:when test="${var.STATUS == 0}">失败</c:when> 
											            <c:otherwise>失败</c:otherwise> 
											</c:choose>
										</td>
										<td id="td_${var.ID }">
											
											
											<c:choose> 
											 			<c:when test="${var.CANCLE == 1}"><input type="button" class=" btn-mini" style="background-color: green; color: rgb(255, 255, 255);"value="已撤销"/></c:when> 
											            <c:when test="${var.TYPE == 1 and var.STATUS == 0}"><input type="button" class="btn btn-warning btn-mini" value="撤销" onclick="cancleProject('${var.ID}')"/></c:when> 
											</c:choose>
										</td>
						
						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>vipcode/goAdd.do';
			 diag.Width = 450;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>vipcode/delete.do?VIPCODE_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>vipcode/goEdit.do?VIPCODE_ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		<script type="text/javascript">
		
		function cancleProject(id) {
			$.ajax({
					type: "POST",
					url: "<%=basePath%>fundsFlowBackstage/cancle",
					data: {ID:id},
					success: function(data){
					if (data.msg == "success") {
						$("#td_"+id).html('<input type="button" class=" btn-mini" style="background-color: green; color: rgb(255, 255, 255);"value="已撤销"/>');
						alert("撤销成功");
					}
			}});
		}
		
		$(function() {
			$('table:nth-child(2) ').find('th,td').css('text-align','center');
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>vipcode/deleteAll.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>buy/excel.do?searchTxt='+$('#nav-search-input').val();
		}
		</script>
		
	</body>
</html>

