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
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
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
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<!-- jQuery分页插件 -->
		<link rel="stylesheet" href="plugins/jpaginate/css/style.css" />
		<script type="text/javascript" src="plugins/jpaginate/jquery.paginate.js"></script>
		
		
		
		<style type="text/css">
			#zhongxin th{text-align:right !important;}
			#chgRcd{border:0;width:97%;height:93%;position:absolute;}
			#b-record-type{padding-bottom:10px}
			#f-flow-type{padding-bottom:10px}
			#paginate{width:93% !important;}
		</style>
		
<script type="text/javascript">
	
	
	//保存
	/* function save(){
			if($("#USERNAME").val()==""){
			$("#USERNAME").tips({
				side:3,
	            msg:'请输入用户登录名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#USERNAME").focus();
			return false;
		}
		if($("#REAL_NAME").val()==""){
			$("#REAL_NAME").tips({
				side:3,
	            msg:'请输入真实姓名',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REAL_NAME").focus();
			return false;
		}
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入注册时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		if($("#LAST_LOGIN").val()==""){
			$("#LAST_LOGIN").tips({
				side:3,
	            msg:'请输入最后登录时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#LAST_LOGIN").focus();
			return false;
		}
		if($("#BALANCE").val()==""){
			$("#BALANCE").tips({
				side:3,
	            msg:'请输入账户余额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BALANCE").focus();
			return false;
		}
		if($("#TICKET").val()==""){
			$("#TICKET").tips({
				side:3,
	            msg:'请输入投资券',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	} */
	
</script>
	</head>
<body>
	
		<input type="hidden" name="CHECKUSER_ID" id="CHECKUSER_ID" value="${pd.CHECKUSER_ID}"/>
		<div id="zhongxin" style="text-align:center">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>邀请码：</th>	
				<td><input type="text" name="INVITE_CODE" id="INVITE_CODE" value="${info.INVITE_CODE}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>用户名：</th>	
				<td><input type="text" name="USERNAME" id="USERNAME" value="${info.USERNAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>性别：</th>
				<td><input type="text" name="SEX" id="SEX" value="${info.SEX=='1'?'男':'女'}" maxlength="32" placeholder="空" title="真实姓名" readonly="readonly"/></td>
				
			</tr>
			<tr>
				<th>真实姓名：</th>	
				<td><input type="text" name="REAL_NAME" id="REAL_NAME" value="${info.REAL_NAME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>手机号：</th>
				<td><input type="text" name="TEL" id="TEL" value="${info.TEL}" maxlength="32" placeholder="空" title="注册时间" readonly="readonly"/></td>
				<th>身份证号：</th>	
				<td><input type="text" name="IDENTITY" id="IDENTITY" value="${info.IDENTITY}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>银行卡号：</th>
				<td><input type="text" name="BANK_CARK" id="BANK_CARK" value="${info.BANK_CARD}" maxlength="32" placeholder="空" title="最后登录时间" readonly="readonly"/></td>
				<th>账户余额：</th>	
				<td><input type="text" name="BALANCE" id="BALANCE" value="${info.BALANCE}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
				<th>投资券：</th>
				<td><input type="text" name="TICKET" id="TICKET" value="${info.TICKET}" maxlength="32" placeholder="空" title="账户余额" readonly="readonly"/></td>
				
			<tr>
				<th>备注：</th>	
				<td colspan="100"><input type="text" name="INVITE_BY" id="INVITE_BY" value="邀请人：${info.INVITE_NAME},邀请码${info.INVITE_ME}" maxlength="32" placeholder="空" title="用户登录名" readonly="readonly"/></td>
			</tr>
			
		</table>
		</div>
		
		<!-- <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div> -->
		<div>
			<div class="tabbable">
				<ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="seltab">
					<li class="active">
						<a data-toggle="tab" href="#charge_record_div" onclick="javascript:getChargeRecord(1,10);">充值记录</a>
					</li>

					<li>
						<a data-toggle="tab" href="#buyer_record_div" onclick="javascript:getBuyRecord(1,10,'');">投资记录</a>
					</li>
					<li>
						<a data-toggle="tab" href="#funds_flow_div" onclick="javascript:fundsFlow(1,10,'');">资金流水</a>
					</li>
					<li>
						<a data-toggle="tab" href="#invite_user_div" onclick="javascript:inviteRecord(1,10);">邀请用户</a>
					</li>
					<li>
						<a data-toggle="tab" href="#login_record" onclick="javascript:loginHistory(1,10);">登陆记录</a>
					</li>
					<li>
						<a data-toggle="tab" href="#three_record" onclick="javascript:threeUser(1,10);">三级好友</a>
					</li>
				</ul>

				<div class="tab-content">
					<div id="charge_record_div" class="tab-pane in active">
						
					</div>

					<div id="buyer_record_div" class="tab-pane">
						<div id="b-record-type">
							<input type="button" class="btn btn-minier btn-purple" onclick="getBuyRecord(1,10,'all')" value="全部">
							<input type="button" class="btn btn-minier btn-purple" onclick="getBuyRecord(1,10,'running')" value="募集期">
							<input type="button" class="btn btn-minier btn-purple" onclick="getBuyRecord(1,10,'repaying')" value="还款中">
							<input type="button" class="btn btn-minier btn-purple" onclick="getBuyRecord(1,10,'end')" value="已结束">
						</div>
					</div>
					<div id="funds_flow_div" class="tab-pane">
						<div id="f-flow-type">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'')" value="全部">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'1')" value="充值">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'2')" value="投资">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'3')" value="提现">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'4')" value="收益">
							<input type="button" class="btn btn-minier btn-purple" onclick="fundsFlow(1,10,'5')" value="回收本金">
						</div>
					</div>
					<div id="invite_user_div" class="tab-pane">
						
					</div>
					<div id="login_record" class="tab-pane">
						
					</div>
					<div id="three_record" class="tab-pane">
						
					</div>
					<div id="paginate">
					</div>
				</div>
			</div>
		</div>
	
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
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
			//默认加载充值记录
			getChargeRecord(1,10);
			
			
		});
		
		var USER_ID='${info.USER_ID}';
		//获取用户充值记录
		function getChargeRecord(curPage,showCount){
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/chargeRecord?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>充值时间</th>';
						htmls+='<th>充值金额</th>';
						htmls+='<th>充值状态</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result, function(key, val) {
							var html='<tr>';
							html+='<td>'+val.TRADE_TIME+'</td>';
							html+='<td>'+val.AMOUNT+'</td>';
							html+='<td>'+val.STATUS+'</td>';
							html+='</tr>';
							
                            htmls+=html;
                        });
						htmls+='</tbody></table>';
						$("#charge_record_div").html(htmls);
						$("#paginate").paginate({
						    count: data.page.totalPage,
						    start: data.page.currentPage,
						    display: data.page.showCount,
						    border: true,
						    onChange: function(page) {
						    	getChargeRecord(page,10);
						    }
						});
					}
				},
			});
		}
		
		//查询用户购买记录
		var brstate='';
		function getBuyRecord(curPage,showCount,state){
			brstate=state;
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/buyRecord?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount+'&STATE='+state,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='<div id="b-record-type">'+$('#b-record-type').html()+'</div>';
						
						htmls+='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>项目</th>';
						htmls+='<th>投资金额(元)</th>';
						htmls+='<th>投资日期</th>';
						htmls+='<th>状态</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result, function(key, val) {
							var html='<tr>';
							html+='<td>'+val.PROJECT_NAME+'</td>';
							html+='<td>'+val.AMOUNT+'</td>';
							html+='<td>'+val.CREATE_DATE+'</td>';
							html+='<td>'+(val.PROJECT_STATE=="1"?"募集中":(val.PROJECT_STATE=="2"?"还款中":"已结束"))+'</td>';
							html+='</tr>';
							
                            htmls+=html;
                        });
						htmls+='</tbody></table>';
						//htmls+='<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">'+data.pager.pageStr+'</div>';
						$("#buyer_record_div").html(htmls);
						$("#paginate").paginate({
						    count: data.page.totalPage,
						    start: data.page.currentPage,
						    display: data.page.showCount,
						    border: true,
						    onChange: function(page) {
						    	console.log(page);
						    	getBuyRecord(page,10,brstate);
						    }
						});
					}
				},
			});
		}
		
		var fftype='';
		//查询资金流水
		function fundsFlow(curPage,showCount,TYPE){
			fftype=TYPE;
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/fundsFlow?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount+'&TYPE='+TYPE,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='<div id="f-flow-type">'+$('#f-flow-type').html()+'</div>';
						
						htmls+='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>类型</th>';
						htmls+='<th>金额(元)</th>';
						htmls+='<th>日期</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result, function(key, val) {
							var html='<tr>';
							html+='<td>'+(val.TYPE=="0"?"充值":(val.TYPE=="1"?"投资":(val.TYPE=="2"?"提现":(val.TYPE=="3"?"收益":"回收本金"))))+'</td>';
							html+='<td>'+val.AMOUNT+'</td>';
							html+='<td>'+val.TRADE_TIME+'</td>';
							html+='</tr>';
							
                            htmls+=html;
                        });
						htmls+='</tbody></table>';
						//htmls+='<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">'+data.pager.pageStr+'</div>';
						$("#funds_flow_div").html(htmls);
						console.log(data.page.totalResult);
					    
						$("#paginate").paginate({
							count: data.page.totalPage,
						    start: data.page.currentPage,
						    display: data.page.showCount,
						    border: true,
						    onChange: function(page) {
						    	console.log(page);
						    	fundsFlow(page,10,fftype);
						    }
						});
					}
				},
			});
		}
		
		
		//查询邀请记录
		function inviteRecord(curPage,showCount){
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/inviteRecord?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='';
						
						htmls+='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>被邀请用户</th>';
						htmls+='<th>注册时间</th>';
						htmls+='<th>首次投资金额</th>';
						htmls+='<th>邀请奖励</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result, function(key, val) {
							var html='<tr>';
							html+='<td>'+val.INVITED_NAME+'</td>';
							html+='<td>'+val.CREATE_DATE+'</td>';
							html+='<td>'+(val.AMOUNT==undefined?"尚未投资":val.AMOUNT)+'</td>';
							html+='<td>'+'邀请奖励'+'</td>';
							html+='</tr>';
							
                            htmls+=html;
                        });
						htmls+='</tbody></table>';
						//htmls+='<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">'+data.pager.pageStr+'</div>';
						$("#invite_user_div").html(htmls);
						$("#paginate").paginate({
						    count: data.page.totalPage,
						    start: data.page.currentPage,
						    display: data.page.showCount,
						    border: true,
						    onChange: function(page) {
						    	inviteRecord(page,10);
						    }
						});
					}
				},
			});
		}
		
		
		//查询登陆记录
		function loginHistory(curPage,showCount){
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/loginHistory?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='';
						
						htmls+='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>登录时间</th>';
						htmls+='<th>登录IP</th>';
						htmls+='<th>浏览器</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result, function(key, val) {
							var html='<tr>';
							html+='<td>'+val.LOGIN_TIME+'</td>';
							html+='<td>'+val.IP+'</td>';
							html+='<td>'+val.BROWSER+'</td>';
							html+='</tr>';
							
                            htmls+=html;
                        });
						htmls+='</tbody></table>';
						//htmls+='<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">'+data.pager.pageStr+'</div>';
						$("#login_record").html(htmls);
						$("#paginate").paginate({
						    count: data.page.totalPage,
						    start: data.page.currentPage,
						    display: data.page.showCount,
						    border: true,
						    onChange: function(page) {
						    	loginHistory(page,10);
						    }
						});
					}
				},
			});
		}
		
		//三级好友信息
		function threeUser(curPage,showCount){
			$.ajax({
				type : 'get',
				url : '<%=basePath%>checkuser/threeUser?USER_ID='+USER_ID+'&currentPage='+curPage+'&showCount='+showCount,
				dataType : 'json',
				success : function(data){
					console.log(data.msg);
					if(data.msg=="success"){
						var htmls='';
						htmls+='<table id="table_report" class="table table-striped table-bordered table-hover">';
						htmls+='<thead><tr>';
						htmls+='<th>级别</th>';
						htmls+='<th>好友</th>';
						htmls+='<th>累计投资额</th>';
						htmls+='<th>返现金额</th>';
						htmls+='</tr></thead><tbody style="height:">';
						$.each(data.result.earningsList, function(key, val) {
							var html='<tr>';
							var level = val.LEVEL;
							if(level == '1'){
								html+='<td >一级好友</td>';
							} else if(level == '2'){
								html+='<td>二级好友</td>';
							} else if(level == '3'){
								html+='<td>三级好友</td>';
							}
							html+='<td>'+val.USERNAME+'</td>';
							var buyAmount = "0.0";
							if(val.TOTAL_BUY_AMOUNT!=null){
								buyAmount = val.TOTAL_BUY_AMOUNT;
							}
							html+='<td>'+buyAmount+'</td>';
							var totalEarnings = "0.0";
							if(val.TOTAL_EARNINGS!=null){
								totalEarnings = val.TOTAL_EARNINGS;
							}
							html+='<td>'+totalEarnings+'</td>';
							html+='</tr>';
                            htmls+=html;
                            
                            
                        });
						htmls+='</tbody></table>';
						//htmls+='<div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">'+data.pager.pageStr+'</div>';
						$("#three_record").html(htmls);
						
					}
				},
			});
		}
		</script>
</body>
</html>