<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="viewlog/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="field1" value="" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart" value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd" value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="field2" id="field2" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">1</option>
							<option value="">2</option>
					  	</select>
					</td>
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
						<th>访问类型</th>
						<th>访问人数</th>
					</tr>
				</thead>
										
				<tbody>
					<c:forEach items="${list }" var="li">
						<tr>
							<c:if test="${li.WEB_OR_MOBILE==1}">
								<td>PC端</td>
							</c:if>
							<c:if test="${li.WEB_OR_MOBILE==2}">
								<td>手机端</td>
							</c:if>
							<td>${li.pcount}</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th>序号</th>
						<th>访问类型</th>
						<th>访问页面</th>
						<!-- <th>微信名称</th> -->
						<th>访问时间</th>
						<th>ip地址</th>
						<th>浏览器类型</th>
						<th>手机类型</th>
						<!-- <th>用户浏览器参数信息</th> -->
						<th>用户</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
									<c:if test="${var.WEB_OR_MOBILE==1}">
										<td>PC端</td>
									</c:if>
									<c:if test="${var.WEB_OR_MOBILE==2}">
										<td>移动端
											<c:set value="${var.USER_AGENT}" var="uag"></c:set>
											<c:choose>
												<c:when test="${fn:contains(uag,'MicroMessenger')}">
													-微信
												</c:when>
												<c:otherwise>
													-浏览器
												</c:otherwise>
											</c:choose>
										</td>
									</c:if>
									
									<td>
										<c:if test="${var.VIEW_ID=='0'}">
											主页
										</c:if>
										<c:if test="${var.VIEW_ID=='1'}">
											项目列表
										</c:if>
										<c:if test="${var.VIEW_ID=='2'}">
											万金生活
										</c:if>
										<c:if test="${var.VIEW_ID=='3'}">
											邀请有奖
										</c:if>
										<c:if test="${var.VIEW_ID=='4'}">
											借款
										</c:if>
										<c:if test="${var.VIEW_ID=='5'}">
											登录
										</c:if>
										<c:if test="${var.VIEW_ID=='6'}">
											注册
										</c:if>
										<c:if test="${var.VIEW_ID=='7'}">
											安全保障
										</c:if>
										<c:if test="${var.VIEW_ID=='8'}">
											个人中心
										</c:if>
										<c:if test="${var.VIEW_ID=='9'}">
											移动端分享页
										</c:if>
										<c:if test="${var.PROJECT_NAME != null && var.PROJECT_NAME !=''}">
											${var.PROJECT_NAME}-${var.SUB_PAGE=='1'?'详情页':var.SUB_PAGE=='2'?'购买页':var.SUB_PAGE=='3'?'项目简介页':'购买确认'}
										</c:if>
									</td>
									<%-- <td>${var.NAME}</td> --%>
									<td>${var.VIEW_DATETIME}</td>
									<td>${var.IP}</td>
									<td>${var.BROWER}</td>
									<td>${var.MOBILETYPE}</td>
									<%-- <td>${var.USER_AGENT}</td> --%>
									<td>
										<a href="javascript:query('${var.RANDOM_CODE}')">${var.USERNAME=='' || var.USERNAME == null?'游客':var.USERNAME}</a>
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
		<table style="width:100%;">
			<tr>
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
		
		function query(random){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="3小时内浏览记录";
			 diag.URL = '<%=basePath%>viewlog/queryTrail.do?RANDOM_CODE='+random;
			 diag.Width = 800;
			 diag.Height = 500;
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

		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>viewlog/excel.do';
		}
		</script>
		
	</body>
</html>

