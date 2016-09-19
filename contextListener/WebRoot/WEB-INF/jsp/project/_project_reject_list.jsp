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
		<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
		<%@ include file="../system/admin/top.jsp"%> 
		
		<link rel="stylesheet" href="wj-static/css/font-awesome.min.css" />
<style type="text/css">
.moneyStyle{
color: red;font-weight:bold;
}
</style>
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="reject/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="keyword" value="${pd.KEYW}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="dateStart" id="dateStart" value="${pd.dateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="dateEnd" id="dateEnd" value="${pd.dateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
					<td><input type="reset" value="重置" class="btn btn-small btn-purple" /></td>
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
						<th>项目名称</th>
						<th>基准利率</th>
					<!-- 	<th>老板贴息</th> -->
						<th>投资期限（天）</th>
						<th>创建时间</th>
						<th>募集金额</th>
						<th>剩余金额</th>
						<!--<th>分期</th> -->
						<th>项目状态</th>
						<!--<th>最低起投资金</th>
						<th>还款人数</th>-->
						<!--  -->
							<th>投资记录</th>
							<th>驳回详情</th>
							<th>审核状态</th>
						<th class="center">操作<%-- ${QX.cha } --%></th>
					</tr>
				</thead>
										
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
					
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<%-- <td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
								</td> --%>
								<td class='center' style="width: 25px;">${vs.index+1}</td>
										<td>${var.PROJECT_NAME}</td>
										<td  class="moneyStyle">${var.BASE_INTEREST_RATE}%</td>
							<%-- 			<td  class="moneyStyle">${var.BOSS_INTEREST_RATE}%</td> --%>
										<td>${var.DEADLINE}</td>
										<td>
											<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${var.CREATE_DATE}" var="createDate"></fmt:parseDate>
											<fmt:formatDate value="${createDate}" pattern="yyyy-MM-dd"/>
										</td>
										<td  class="moneyStyle">${var.TOTAL_RAISE_AMOUNT}</td>
										<td  class="moneyStyle">${var.SURPLUS_RAISE_AMOUNT}</td>
									<%-- 	<td>${var.TOTAL_PHASE}</td> --%>
										<td>
										<c:if test="${var.PROJECT_STATE==1}">募集中</c:if>
										<c:if test="${var.PROJECT_STATE==2}">还款中</c:if>
										<c:if test="${var.PROJECT_STATE==3}">已结束</c:if>
										<c:if test="${var.PROJECT_STATE==4}">已结束</c:if>
										</td>
										<!--<td  class="moneyStyle">${var.LOWEST_AMOUNT}</td>-->
										<%-- <td>
										<c:if test="${var.IS_PUBLISH==true}">已发布</c:if>
										<c:if test="${var.IS_PUBLISH==false}">未发布</c:if>
										<label>
												 <input type="checkbox" id="CHK_PUBLISH${var.ID}" class="ace-switch ace-switch-5" title="是否发布" onclick="setPublish('${var.ID}',this);" <c:if test="${var.IS_PUBLISH==true}">checked=""</c:if>/>
												<span class="lbl"></span>
											</label>
										</td> --%>
										<!-- <td>${var.renshu}</td> -->
										<td>
											<input type="button" class="btn btn-warning btn-mini" value="查看记录" onclick="viewBuyerRecord('${var.ID}')"/>
										</td>
										<td>
											<input type="button" class="btn btn-warning btn-mini" value="查看驳回内容" onclick="viewListReject('${var.ID}')"/>
										</td>
										<td id="reject_${var.ID}">
										<c:if test="${var.IS_PUBLISH==0}">
											<input id="check_${var.ID}" type="button" class="btn btn-warning btn-mini" value="审核" onclick="changeIsPublish('${var.ID}',2)"/>
											<input id="check_${var.ID}" type="button" class="btn btn-warning btn-mini" value="驳回" onclick="rejectReason('${var.ID}')"/>
										</c:if>
										<c:if test="${var.IS_PUBLISH==2}">
											<input type="button" class="btn btn-warning btn-mini" value="已审核"/>
										</c:if>
										<c:if test="${var.IS_PUBLISH==3}">
											<input type="button" class="btn btn-warning btn-mini" value="已驳回"/>
										</c:if>
										<c:if test="${var.IS_PUBLISH==1}">
											<input type="button" class="btn btn-warning btn-mini" value="已审核"/>
										</c:if>
										
										
										
										</td>
								<td style="width: 140px;" class="center">
									<!-- <div class='hidden-phone visible-desktop btn-group'> -->
										<c:choose>
	  										 <c:when test="${QX.edit != 1 && QX.del != 1 }">  
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:when>
											<c:otherwise> 
												<!-- <div class="inline position-relative"> -->
												<!-- <button class="btn btn-mini btn-info" data-toggle="dropdown"><i class="icon-cog icon-only"></i></button> -->
												<!-- <ul class="dropdown-menu dropdown-icon-only dropdown-light pull-right dropdown-caret dropdown-close"> -->
													<c:if test="${QX.edit == 1 }">
													<!-- <li style="display: inline;"> -->
												<%-- 		<a style="cursor:pointer;" title="编辑" onclick="edit('${var.ID}');" class="tooltip-success" data-rel="tooltip" title="" ><span class="green"><i class="icon-edit" style="font-size:18px;"></i></span></a>
													<c:if test="${QX.del == 1 }">
													<!-- <li> --><a style="cursor:pointer;" title="结标" onclick="man('${var.ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="green">结标</span> </a><!-- </li> -->
													</c:if>
													<a style="cursor:pointer;" title="还款" onclick="huan('${var.ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="green">还款</span> </a> --%>
													<a style="cursor:pointer;" title="预览" class="tooltip-error" data-rel="tooltip" title="" data-placement="left" href="<%=basePath%>_project/preview?ID=${var.ID }" target="_blank"><span class="green">预览</span> </a>
													<!-- 
														<a style="cursor:pointer;" title="控标管理" onclick="que('${var.ID}');" class="tooltip-success" data-rel="tooltip" title=""><span class="green">弃标</span></a>
													 -->
													<%-- 	<a style="cursor:pointer;" title="项目详情" onclick="editDetails('${var.ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="fa fa-newspaper-o" style="font-size:18px;"></i></span></a> --%>
													<!-- </li> -->
													</c:if>
													<%-- <c:if test="${QX.edit == 1 }">
													<!-- <li> --><a style="cursor:pointer;" title="还款计划" onclick="editRepayment('${var.ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-edit"></i></span></a><!-- </li> -->
													</c:if>
													<c:if test="${QX.edit == 1 }">
													<!-- <li> --><a style="cursor:pointer;" title="项目详情" onclick="editDetails('${var.PROJECT_DETAILS_ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="block"><i class="icon-edit"></i></span></a><!-- </li> -->
													</c:if> --%>
												<!-- </ul> -->
												<!-- </div> -->
											</c:otherwise>
										</c:choose>
									<!-- </div> -->
								</td>
							</tr>
						
						</c:forEach>
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
				<%-- 	<c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:if> --%>
					<!-- 
					<c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="xmzz();">项目转账</a>
					</c:if>
					 -->
					<%-- <c:if test="${QX.del == 1 }">
					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>
					</c:if> --%>
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
		<script type="text/javascript" src="static/js/utils/style-util.js"></script>
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function xmzz(){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="项目转账";
			 diag.URL = '<%=basePath%>_project/goxiangmuhuihuang.do';
			 diag.Width = auto_width ;
			 diag.Height = auto_height;
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
		function add(){
				/* $("#aaaaaaa").attr("class","active open");
				$("#asdf").attr("class","active");
				top.mainFrame.tabAddHandler('asdf','修改','_project/goAdd.do');
				if(MENU_URL != "druid/index.html"){
					jzts();
				} */
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>_project/goAdd.do';
			 diag.Width = auto_width ;
			 diag.Height = auto_height;
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
					var url = "<%=basePath%>_project/delete.do?ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改项目发布状态
		function setPublish(projectId,model){
		var $model = $(model),
			publish = 1;
			console.log($model,model);
			console.log($model.attr('checked'));
			if($model.attr('checked')==undefined){
				//改为不发布
				publish = 0;
			}
			$.ajax({
				type : 'post',
				url : '_project/modifyPublish',
				data : {ID : projectId,IS_PUBLISH : publish},
				dataType : 'json',
				success : function(rs){
					if(rs.msg=='success'){
						bootbox.alert('修改成功',function(){
							location.reload();
						});
					}else{
						bootbox.alert('修改失败',function(){
							nextPage(${page.currentPage});
						});
					}
				}
			});
		}
		
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>_project/goEdit.do?ID='+Id;
			 diag.Width = auto_width ;
			 diag.Height = auto_height;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//还款计划
		function editRepayment(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="还款计划管理";
			 diag.URL = '<%=basePath%>zfprojectrepaymentplan/getProRepayList.do?project_id='+Id;
			 diag.Width = auto_width ;
			 diag.Height = auto_height;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		//编辑详情
		function editDetails(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="项目详细信息填写";
			 diag.URL = '<%=basePath%>zfprojectdetails/goEdit.do?PROJECT_ID='+Id;
			 diag.Width = auto_width ;
			 diag.Height = auto_width;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
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
								url: '<%=basePath%>_project/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>_project/excel.do';
		}
		function xiamgmuhuankuan(a){
			/* $.ajax({
				   type: "POST",
				   url: "some.php",
				   data: "name=John&location=Boston",
				   success: function(msg){
				     alert( "Data Saved: " + msg );
				   }
				}); */
			
			//window.location.href='<%=basePath%>pluginsyPay/Repayment.do?xmid='+a;
			window.location.href='<%=basePath%>_project/goRepayment.do?PROJECT_ID='+a;
		}
		function xiamgmuhuankuan(a){
			/* $.ajax({
				   type: "POST",
				   url: "some.php",
				   data: "name=John&location=Boston",
				   success: function(msg){
				     alert( "Data Saved: " + msg );
				   }
				}); */
			
			window.location.href='<%=basePath%>pluginsyPay/Repayment.do?xmid='+a;
		}
		function viewBuyerRecord(projectId){
			window.location.href='<%=basePath%>_project/goBuyerRecord.do?PROJECT_ID='+projectId;
		}
		function viewListReject(projectId){
			window.location.href='<%=basePath%>_project/listReject.do?PROJECT_ID='+projectId;
		}
		function man(a){
			<%-- window.location.href='<%=basePath%>_project/goManRecord.do?PROJECT_ID='+a; --%>
			bootbox.confirm("确认结标？",function(flag){
			if(flag){
				$.ajax({
					type : 'post',
					url : '<%=basePath%>_project/goManRecord',
					data : {
						PROJECT_ID : a
					},
					dataType : 'json',
					success : function(rs){
						//操作成功
						if(rs.result === 0){
							bootbox.alert("操作成功",function(){
								location.reload();
							});
						}else{
							bootbox.alert("操作失败："+rs.msg);
						}
					}
				});
			}
			});
		}	
		
		function huan(a){
			window.location.href='<%=basePath%>_project/goRepayment.do?PROJECT_ID='+a;
		}
		function que(a){
			window.location.href='<%=basePath%>_project/goQueRecord.do?PROJECT_ID='+a;
		}
		
		function changeIsPublish(id, is_publish) {
			$.ajax({
					type: "POST",
					url: "<%=basePath%>_project/modifyPublish.do",
					data: {ID:id, IS_PUBLISH:is_publish},
					success: function(data){
					if (data.msg == "success") {
						console.log(is_publish);
						if (is_publish == 2) {
							console.log("it's work!!!");
							$("#reject_" + id).html('<input type="button" class="btn btn-warning btn-mini" value="已审核"/>');
							$("#check_"+id).attr("onclick", "");
							$("#td_"+id).html('<input id="publish_'+id+'" type="button" class="btn btn-warning btn-mini" value="发布" onclick="changeIsPublish(\''+id+'\',1)"/>');
						}
						if (is_publish == 1) {
							$("#publish_"+id).val("已发布");
							$("#publish_"+id).attr("onclick", "");
						}
					}
			}});
		}
		
		function rejectReason(project_id) {
			bootbox.confirm('<h>驳回理由</h><br><textarea id="reject_reason" type="text" style="width: 519px;height: 136px;">',function(flag){
				if (flag) {
					var reason = $("#reject_reason").val();
					reject(project_id, reason);
				} else {
					
				}
				
			});
		}
		
		
		function reject(project_id, reason) {
			$.ajax({
					type: "POST",
					url: "<%=basePath%>_project/reject.do",
					data: {PROJECT_ID:project_id, REASON : reason},
					success: function(data){
					if (data.msg == "success") {
							$("#reject_" + project_id).html('<input type="button" class="btn btn-warning btn-mini" value="已驳回"/>');
						//	$("#check_"+id).val("已审核");
							//$("#check_"+id).attr("onclick", "");
							//$("#td_"+id).html('<input id="publish_'+id+'" type="button" class="btn btn-warning btn-mini" value="发布" onclick="changeIsPublish(\''+id+'\',1)"/>');
					}
			}});
		}
		</script>
		
	</body>
</html>

