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
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
	<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	
	<style type="text/css">
		.bootbox-input-text{
			width : 95% !important;
		}
	</style>
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="checkuser/list.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="SEARCHTXT" value="${pd.SEARCHTXT}" placeholder="这里输入关键词" />
							<input autocomplete="off" type="text" id="AGELOW" name="AGELOW" value="${pd.AGELOW}" placeholder="年龄范围左" style="width:100px;border-radius:4px"/>
							<input autocomplete="off" type="text" id="AGEHIGH" name="AGEHIGH" value="${pd.AGEHIGH}" placeholder="年龄范围右" style="width:100px;border-radius:4px"/>
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<td><input class="span10 date-picker" name="dateStart" id="dateStart" value="${pd.dateStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>
					<td><input class="span10 date-picker" name="dateEnd" id="dateEnd" value="${pd.dateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>
					<td style="vertical-align:top;"> 
					 	<select name="SEX" id="SEX" data-placeholder="请选择" style="vertical-align:top;width: 120px;">
							<option value="">按性别筛选</option>
							<option value="1">男</option>
							<option value="2">女</option>
					  	</select>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<%-- <c:if test="${QX.cha == 1 }">
					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>
					</c:if> --%>
					<td style="padding-bottom:8px;"><input type="reset" value="重置" class="btn btn-small btn-purple" /></td>
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>序号</th>
						<th>用户登录名</th>
						<th>真实姓名</th>
						<th>联络号</th>
						<th>注册时间</th>
						<th>最后登录时间</th>
						<th>账户余额</th>
						<th>冻结金额</th>
						<!-- <th>投资券</th>
						<th>送券</th> -->
						<!-- <th>累计返现</th> -->
						<th>冻结用户</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty userList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${userList}" var="user" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.USER_ID}" /><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td><a href="javascript:info('${user.USER_ID}')">${user.USERNAME}</a></td>
										<td>${(user.REAL_NAME==null || user.REAL_NAME=='')?'暂未录入':user.REAL_NAME}</td>
										<td>${user.TEL}</td>
										<td>${user.CREATE_DATE}</td>
										<td>${user.LAST_LOGIN}</td>
										<td>${user.BALANCE}</td>
										<td>${user.FROZEN_AMOUNT}</td>
										<!-- 
										<td>${user.TICKET}</td>
										<td>
											<input type="button" class="btn btn-warning btn-mini" value="送卷" onclick="giveTicket('${user.USER_ID}','${user.USERNAME}')"/>
										</td>
										 -->
										<%-- <td>${(user.ACCRUALSUM==null || user.ACCRUALSUM=='')?'暂未返现':user.ACCRUALSUM}</td> --%>
										<td>
											<c:if test="${QX.edit ==1}">
												<c:if test="${user.STATUS=='1'}">
													<input type="button" class="btn btn-minier btn-purple" onclick="frozen('${user.USER_ID}','${user.USERNAME}','frozen')" value="冻结用户">
												</c:if>
												<c:if test="${user.STATUS=='2'}">
													<input type="button" class="btn btn-minier btn-purple" onclick="frozen('${user.USER_ID}','${user.USERNAME}','unfrozen')" value="解冻用户">
												</c:if>
											</c:if>
										</td>
										<td>
											<input type="button" class="btn btn-minier btn-purple" onclick="javascript:window.location.href='<%=basePath%>checkuser/checkYeepayInfo?USER_ID=${user.USER_ID}&from=checkuser'" value="查询易宝信息">
										</td>
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
													<li><a style="cursor:pointer;" title="展开好友" onclick="openClose('${user.USER_ID}',this)"  data-rel="tooltip" title="" data-placement="left"><span class="red"><i class="icon-folder-open-alt" id="i${user.USER_ID}"></i></span></a></li>
													
												</ul>
												</div>
											</c:otherwise>
										</c:choose>
										
									</div>
								</td> --%>
							</tr>
							<c:if test="${not empty user.threeLevelEarnsRecordMap.earningsList}">
								<c:if test="${user.threeLevelEarnsRecordMap.level1Count!=0 }">
									<tr id="first1${user.USER_ID}" style="display: none">
	                   					<td colspan="13" >
	                   						<div style="float: left;font-weight:600;">一级好友</div> 
	                   						<div style="float: right;font-weight:600;">
	                   							${user.threeLevelEarnsRecordMap.level1Count}人，
	                   							累计返现：
	                   							<c:if test="${earningsRecord.level1Amount == null || earningsRecord.level1Amount == ''}">
	                   							0.0
	                   							</c:if>
	                   							<c:if test="${earningsRecord.level1Amount != null && earningsRecord.level1Amount != ''}">
	                   							${earningsRecord.level1Amount}
	                   							</c:if>
	                   							元
	                   						</div>
	                   					</td>
	                   				</tr>
                   				</c:if>
								<c:forEach items="${user.threeLevelEarnsRecordMap.earningsList}" var="jun" varStatus="vs">
                    				<c:if test="${jun.LEVEL=='1'}">
                    					<tr id="first2${user.USER_ID}" name="first2${user.USER_ID}" style="display: none">
                    						<td colspan="4" ><a href="javascript:infomation('${jun.USER_ID}')">${jun.USERNAME}</a></td>
                    						<td colspan="4" >累计投资额：${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
                    						<td colspan="5" >返现金额：${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
                    					</tr>
                    				</c:if>
                    			</c:forEach>
                    			
                    			<c:if test="${user.threeLevelEarnsRecordMap.level2Count!=0 }">
									<tr id="second1${user.USER_ID}" style="display: none">
	                   					<td colspan="13" >
	                   						<div style="float: left;font-weight:600;">二级好友</div> 
	                   						<div style="float: right;font-weight:600;">
	                   							${user.threeLevelEarnsRecordMap.level2Count}人，
	                   							累计返现：
	                   							<c:if test="${earningsRecord.level2Amount == null || earningsRecord.level2Amount == ''}">
	                   							0.0
	                   							</c:if>
	                   							<c:if test="${earningsRecord.level2Amount != null && earningsRecord.level2Amount != ''}">
	                   							${earningsRecord.level2Amount}
	                   							</c:if>
	                   							元
	                   						</div>
	                   					</td>
	                   				</tr>
                   				</c:if>
								<c:forEach items="${user.threeLevelEarnsRecordMap.earningsList}" var="jun" varStatus="vs">
                    				<c:if test="${jun.LEVEL=='2'}">
                    					<tr id="second2${user.USER_ID}" name="second2${user.USER_ID}" style="display: none">
                    						<td colspan="4" ><a href="javascript:infomation('${jun.USER_ID}')">${jun.USERNAME}</a></td>
                    						<td colspan="4" >累计投资额：${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
                    						<td colspan="5" >返现金额：${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
                    					</tr>
                    				</c:if>
                    			</c:forEach>
                    			
                    			<c:if test="${user.threeLevelEarnsRecordMap.level3Count!=0 }">
									<tr id="third1${user.USER_ID}" style="display: none">
	                   					<td colspan="13" >
	                   						<div style="float: left;font-weight:600;">三级好友</div> 
	                   						<div style="float: right;font-weight:600;">
	                   							${user.threeLevelEarnsRecordMap.level3Count}人，
	                   							累计返现：
	                   							<c:if test="${earningsRecord.level3Amount == null || earningsRecord.level3Amount == ''}">
	                   							0.0
	                   							</c:if>
	                   							<c:if test="${earningsRecord.level3Amount != null && earningsRecord.level3Amount != ''}">
	                   							${earningsRecord.level3Amount}
	                   							</c:if>
	                   							元
	                   						</div>
	                   					</td>
	                   				</tr>
                   				</c:if>
								<c:forEach items="${user.threeLevelEarnsRecordMap.earningsList}" var="jun" varStatus="vs">
                    				<c:if test="${jun.LEVEL=='3'}">
                    					<tr id="third2${user.USER_ID}" name="third2${user.USER_ID}" style="display: none">
                    						<td colspan="4" ><a href="javascript:infomation('${jun.USER_ID}')">${jun.USERNAME}</a></td>
                    						<td colspan="4" >累计投资额：${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
                    						<td colspan="5" >返现金额：${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
                    					</tr>
                    				</c:if>
                    			</c:forEach>
                    			
							</c:if>
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
					<c:if test="${QX.del == 1 }">
					<!-- 
					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>
					-->
					</c:if>
					<c:if test="${QX.cha == 1 }"></c:if>
					<!-- 
					<input type="button" class="btn btn-small btn-warning" value="给所有用户发投资券" onclick="giveTicket2All()"/>
					-->
					<c:if test="${QX.edit == 1 }">
					<!-- <input type="button" class="btn btn-small btn-purple" value="给所有用户发信息" onclick="sendSms2All()"/>
					<input type="button" class="btn btn-small btn-pink" value="给指定手机号发信息" onclick="sendSms2mobiles()"/> -->
					<input type="button" class="btn btn-small btn-pink" value="Excel导入员工用户" onclick="excelImport()"/>
					<input type="button" class="btn btn-small btn-pink" value="添加用户" onclick="save()"/>
					<input type="button" class="btn btn-small btn-pink" value="Excel导入模板" onclick="model()"/>
					</c:if>
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
		
		function excelImport(){
			window.location.href = "excel/goImport.do";
		}
		function model(){
			window.location.href = "<%=basePath%>static/user_model.xls";
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
		
		//冻结用户
		function frozen(USER_ID,USER_NAME,FORWHAT){
			console.log("hello");
			console.log(FORWHAT);
			var str="确认要冻结"+USER_NAME+"吗？";
			console.log(str);
			bootbox.confirm(str, function(result) {
				console.log("confirm?");
				if(result) {
					top.jzts();
					var url = "<%=basePath%>checkuser/frozen.do?USER_ID="+USER_ID+"&FORWHAT="+FORWHAT;
					$.get(url,function(data){
						if(data.msg=="success"){
							bootbox.alert("用户"+USER_NAME+"冻结成功！");
						}else{
							bootbox.alert("用户"+USER_NAME+"冻结失败！");
						}
						nextPage(${page.currentPage});
						
					});
				}
			});
		}
		
		//详情
		function info(Id){
			location.href = "<%=basePath%>checkuser/info.do?USER_ID="+Id;
			<%-- console.log("hello");	
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="用户详情";
			 diag.URL = '<%=basePath%>checkuser/info.do?USER_ID='+Id;
			 diag.Width = 900;
			 diag.Height = 750;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show(); --%>
			
		}
		
		var auto_width,auto_height;
		$(function() {
			 auto_width= document.documentElement.clientWidth;
			 auto_height = document.documentElement.clientHeight;
			 auto_width_50= document.documentElement.clientWidth/2;
			 auto_height_50 = document.documentElement.clientHeight/2;
		});
		
		//三级好友详情
		function infomation(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true; 
			 diag.Title ="三级好友详情";
			 diag.URL = '<%=basePath%>checkuser/infomation.do?USER_ID='+Id;
			 diag.Width = auto_width;
			 diag.Height = auto_height;
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
			 diag.URL = '<%=basePath%>checkuser/goEdit.do?USER_ID='+Id;
			 diag.Width = 700;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		function save(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>checkuser/goAdd.do'
			 diag.Width = 700;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//给券
		function giveTicket(Id,name){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="给"+name+"送投资券";
			 diag.URL = '<%=basePath%>checkuser/giveTicket?USER_ID='+Id+'&USERNAME='+name;
			 diag.Width = 600;
			 diag.Height = 350;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//给所有 用户券
		function giveTicket2All(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="给"+name+"送投资券";
			 diag.URL = '<%=basePath%>checkuser/giveTicket2All';
			 diag.Width = 600;
			 diag.Height = 300;
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
			window.location.href='<%=basePath%>checkuser/excel.do';
		}
		
		//展开三级好友
		function openClose(userId,obj){
			var txt = $(obj).attr("title");
			if(txt=="展开好友"){
				$(obj).attr("title","折叠好友");
				$("#i"+userId).attr('class', 'icon-folder-close-alt'); 
				$("#first1"+userId).css('display', ''); 
				$("tr[name='first2"+userId+"']").each(function(){
				    $(this).css('display', '');
				 });
				$("#second1"+userId).css('display', '');  
				$("tr[name='second2"+userId+"']").each(function(){
				    $(this).css('display', '');
				 }); 
				$("#third1"+userId).css('display', '');  
				$("tr[name='third2"+userId+"']").each(function(){
				    $(this).css('display', '');
				 }); 
			} else {
				$(obj).attr("title","展开好友");
				$("#i"+userId).attr('class', 'icon-folder-open-alt'); 
				$("#first1"+userId).css('display', 'none'); 
				$("tr[name='first2"+userId+"']").each(function(){
				    $(this).css('display', 'none');
				 }); 
				$("#second1"+userId).css('display', 'none');  
				$("tr[name='second2"+userId+"']").each(function(){
				    $(this).css('display', 'none');
				 }); 
				$("#third1"+userId).css('display', 'none');  
				$("tr[name='third2"+userId+"']").each(function(){
				    $(this).css('display', 'none');
				 }); 
			}
		}
		
		function sendSms2All(){
			bootbox.prompt({
				title : '给所有用户发短信',
				value : '【万金先生】',
				callback : function(result){
					if(result != null){
						$.ajax({
							type : 'post',
							url : 'checkuser/sendSms2All',
							data : {content : result},
							dataType : 'json',
							success : function(r){
								if(r.msg == 'ok'){
									bootbox.alert('发送成功');
								}else{
									bootbox.alert('发送失败');
								}
							}
						});
					}
				}
			});
		}
		
		function sendSms2mobiles(){
			var mobiles ;
			bootbox.prompt({
				title : '请输入手机号，以英文逗号分隔，首尾不加',
				callback : function(mobis){
					if(mobis != null){
						mobiles = mobis;
						bootbox.prompt({
							title : '请输入短信内容',
							value : '【万金先生】',
							callback : function(content){
								if(content != null){
									$.ajax({
										type : 'post',
										url : 'checkuser/sendSms2mobiles',
										data : {content : content,mobiles : mobiles},
										dataType : 'json',
										success : function(r){
											if(r.msg == 'ok'){
												bootbox.alert('发送成功');
											}else{
												bootbox.alert('发送失败');
											}
										}
									});
								}
							}
						});
					}
				}
			});
		}
		</script>
	</body>
</html>

