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
			<form action="_project/goBuyerRecord.do?PROJECT_ID=${proId}" method="post" name="Form" id="Form">
			
			<!-- 检索  -->
		
			<table>
				<tr>
					<td colspan="100"><a class="btn btn-mini btn-deverse" onclick="location.href='_project/list.do'">返回</a></td>
				</tr>
			</table>
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<!-- <th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<th>序号</th>
						<th>投资人</th>
						<th>投资日期</th>
						<th>投资金额</th>
						<th class="center">操作<%-- ${QX.cha } --%></th>
					</tr>
				</thead>
										
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty buyRecordList}">
					
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${buyRecordList}" var="var" varStatus="vs">
							<tr>
								<%-- <td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
								</td> --%>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td>${var.USERNAME}</td>
										<td>${var.trade_time}</td>
										<td>${var.amount}</td>
										
								<td style="width: 100px;" class="center">
									<!-- <div class='hidden-phone visible-desktop btn-group'> -->
									<%-- 	<c:choose>
	  										 <c:when test="${QX.edit != 1 && QX.del != 1 }">  
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:when>
											<c:otherwise> 
													<a style="cursor:pointer;" title="还款计划" onclick="openPDF('${var.project_id}','${var.buyerId }');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="fa fa-dashcube" style="font-size:18px;"></i></span></a>
											</c:otherwise>
										</c:choose> --%>
									<!-- </div> -->
								</td>
							</tr>
						
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
<%-- 		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:if>
					<c:if test="${QX.del == 1 }">
					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>
					</c:if>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
 --%>		</div>
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
		
		</script>
		
		<script type="text/javascript">	
		//下载投资合同
		function openPDF(projectId,ID){
			window.location.href= "<%=basePath%>_project/backContract.do?ID="+projectId+"&buyerId="+ID+"&t="+Math.random();
			
// 			$.ajax({
// 				url: "_project/backContract?ID="+projectId+"&buy_record_order_form="+orderCode+"&t="+Math.random(),
// 				success:function(data){
// 					if(data != null || data !=''){
// 						data = encodeURIComponent(data);
// 						data=encodeURI(data);
// 						window.location="_project/downLoadFile?filePath="+data;
// 					}
// 				}
// 			});
		}
		</script>
		
	</body>
</html>

