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
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="recharge/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<%-- <td>
						<select id="listWay" name="listWay" style="width:120px">
							<option value="">充值渠道</option>
							<option value="1" <c:if test="${pd.listWay=='1'}">selected="selected"</c:if>>宝付PC</option><c:if test="${pd.listWay=='1'}">selected="selected"</c:if>
							<option value="2" <c:if test="${pd.listWay=='2'}">selected="selected"</c:if>>宝付手机</option>
							<option value="3" <c:if test="${pd.listWay=='3'}">selected="selected"</c:if>>快钱PC</option>
							<option value="4" <c:if test="${pd.listWay=='4'}">selected="selected"</c:if>>快钱手机</option>
						</select>
					</td> --%>
					<td>
						<select id="RECHARGE_STATUS" name="RECHARGE_STATUS" style="width:120px">
							<option value="">充值状态</option>
							<option value="0" <c:if test="${pd.RECHARGE_STATUS=='0'}">selected="selected"</c:if>>未完成</option>
							<option value="1" <c:if test="${pd.RECHARGE_STATUS=='1'}">selected="selected"</c:if>>充值成功</option>
							<%-- <option value="3" <c:if test="${pd.RECHARGE_STATUS=='3'}">selected="selected"</c:if>>充值失败</option> --%>
						</select>
					</td>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="SEARCHTXT" value="${pd.SEARCHTXT}" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="dateStart" id="dateStart" value="${pd.dateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="dateEnd" id="dateEnd" value="${pd.dateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<td><input type="reset" value="重置" class="btn btn-small btn-purple" /></td>
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
						<th>用户登录名</th>
						<th>真实姓名</th>
						<th>充值金额</th>
						<!-- <th>费用</th>
						<th>订单号</th>
						<th>充值渠道</th> -->
						<th>充值状态</th>
						<th>充值时间</th>
						<!-- <th class="center">操作</th> -->
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty rechList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${rechList}" var="rech" varStatus="vs">
							<tr>
								<%-- <td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${rech.RECHARGE_ID}" /><span class="lbl"></span></label>
								</td> --%>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td>${rech.USERNAME}</td>
										<td>${rech.REAL_NAME}</td>
										<td>${rech.AMOUNT}</td>
										<%-- <td>${rech.FEE}</td>
										<td>${rech.ORDER_FORM_CODE}</td>
										<c:set value="${rech.ORDER_FORM_PAYS_TYPE}" var="rtype"></c:set>
										<td>${rtype=='1'?'宝付PC':rtype=='2'?'宝付手机':rtype=='3'?'快钱PC':rtype=='4'?'快钱手机 ':'异常'}</td> --%>
										<td>${rech.STATUS=='0'?'未完成':'充值成功'}</td>
										<td><fmt:formatDate value="${rech.TRADE_TIME}" type="both"/></td>
										
								<%-- <td style="width: 30px;" class="center">
									<div class='hidden-phone visible-desktop btn-group'>
										<c:choose>
	  										 <c:when test="${QX.edit != 1 && QX.del != 1 }">  
												<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
											</c:when>
											<c:otherwise> 
												<div class="inline position-relative">
												<button class="btn btn-mini btn-info" data-toggle="dropdown"><i class="icon-cog icon-only"></i></button>
												<ul class="dropdown-menu dropdown-icon-only dropdown-light pull-right dropdown-caret dropdown-close">
													<c:if test="${QX.edit == 1 }">
													<li><a style="cursor:pointer;" title="编辑" onclick="edit('${user.USER_ID}');" class="tooltip-success" data-rel="tooltip" title="" data-placement="left"><span class="green"><i class="icon-edit"></i></span></a></li>
													</c:if>
													<c:if test="${QX.del == 1 }">
													<li><a style="cursor:pointer;" title="删除" onclick="del('${user.USER_ID}');" class="tooltip-error" data-rel="tooltip" title="" data-placement="left"><span class="red"><i class="icon-trash"></i></span> </a></li>
													</c:if>
												</ul>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</td> --%>
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
				<td style="vertical-align:top;">
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
		<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>checkuser/delete.do?USER_ID="+Id;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		
		
		//详情
		function info(Id){
			top.jzts();
			var diag = new top.Dialog();
			diag.Drag=true;
			diag.Title ="充值订单详情";
			diag.URL = '<%=basePath%>recharge/info.do?ID='+Id;
			diag.Width = 900;
			diag.Height = 750;
			diag.CancelEvent = function(){ //关闭事件
				if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage(${page.currentPage});
				}
				diag.close();
			};
			diag.show();
			
		}
		
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>checkuser/goEdit.do?CHECKUSER_ID='+Id;
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
								url: '<%=basePath%>checkuser/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>checkuser/excelRecharge.do?status='+$('#RECHARGE_STATUS').val()+'&dateStart='+$('#dateStart').val()+'&dateEnd='+$('#dateEnd').val();
		}
		</script>
		
	</body>
</html>

