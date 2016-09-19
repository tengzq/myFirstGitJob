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
		<link rel="stylesheet" href="static/css/tipso.css" />
		
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/tipso.js"></script>
<script type="text/javascript">
	
	
	//保存
	function save(){
		/* 
		if($("#BALANCE").val()==""){
			$("#BALANCE").tips({
				side:3,
	            msg:'请输入账户余额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#BALANCE").focus();
			return false;
		} */
		if($("#ticket-type").val()==""){
			$("#ticket-type").tips({
				side:3,
	            msg:'请选择投资券类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ticket-type").focus();
			return false;
		} 
		
		if($("#TICKET_ID").val()==""){
			$("#TICKET_ID").tips({
				side:3,
	            msg:'请选择投资券',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_ID").focus();
			return false;
		} 
		
		var $amountDom = $("#SEND_AMOUNT");
		if($amountDom.val()==""){
			$amountDom.tips({
				side:3,
	            msg:'请输入数量',
	            bg:'#AE81FF',
	            time:2
	        });
			$amountDom.focus();
			return false;
		} 
		
		var amount = parseInt($amountDom.val());
		if(isNaN(amount) || amount<1){
			$amountDom.tips({
				side:3,
	            msg:'数量最低为1',
	            bg:'#AE81FF',
	            time:2
	        });
			$amountDom.focus();
			return false;
		}
		
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="checkuser/doGive.do" name="Form" id="Form" method="post">
		<input type="hidden" name="USER_ID" id="USER_ID" value="${pd.USER_ID}"/>
		<input type="hidden" name="EFFECTIVE_TIME" id="EFFECTIVE_TIME" value=""/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>用户名</th>
				<td><input type="text" id="USERNAME" value="${pd.USERNAME}" maxlength="32" placeholder="登录用户名" title="用户登录名" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>投资券类型</th>
				<td>
					<select id="ticket-type">
						<option value="">请选择券类型</option>
						<option value="1" onclick="javascript:alert('hh')">投资券</option>
						<option value="2">加息券</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>投资券</th>
				<td>
					<select name="TICKET_ID" id="TICKET_ID">
						<option value="">请先选择投资券类型</option>
					</select>
					<label id="ticket-des" style="color:#FFB752"></label>
				</td>
				
			</tr>
			<tr>
				<th>赠送数量</th>
				<td><input type="number" name="SEND_AMOUNT" id="SEND_AMOUNT" value="" maxlength="32" placeholder="请输入赠送数量" title="赠送数量"/></td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="2">
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
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			
			/* $('#ticket-type').tipso({
				content : $('#ticket-type').attr('id')
			}); */
			
			
			
			var $ticketType = $('#ticket-type'),
				$tickets = $('#TICKET_ID');
			$ticketType.on('change',function(){
				//console.log($(this));
				var TICKET_TYPE='';
				if($ticketType.val()=='1'){
					TICKET_TYPE = 'TZ_TICKET';
				}else if($ticketType.val()=='2'){
					TICKET_TYPE = 'JX_TICKET';
				}
				$.ajax({
					type : 'post',
					url : 'checkuser/getTickets',
					data : {TICKET_TYPE : TICKET_TYPE},
					dataType : 'json',
					success : function(rs){
						if(rs.msg=='success'){
							//遍历
							var options = '<option value="">请选择投资券</option>';
							$.each(rs.tickets,function(key,val){
								options+='<option value="'+val.TICKET_ID+'" data-des="'+val.TICKET_DES+'" data-eftime="'+val.EFFECTIVE_TIME+'">'+val.TICKET_NAME+'</option>';
							});
							//console.log(options);
							$('#TICKET_ID').html(options);
						}else{
							bootbox.alert("获取投资券失败");
						}
					},
					error : function(){
						bootbox.alert('获取投资券失败');
					}
				});
			});
			
			//选中的投资券
			$tickets.on('change',function(){
				//console.log($('#TICKET_ID option:selected').data('des'));
				if($('#TICKET_ID option:selected').val()==''){
					$('#ticket-des').text('');
					return;
				}
				$('#ticket-des').text('使用规则：'+$('#TICKET_ID option:selected').data('des'));
				//投资券有效期，放入隐藏域提交
				$('#EFFECTIVE_TIME').val($('#TICKET_ID option:selected').data('eftime'));
			});
			
		});
		
		
		
		</script>
</body>
</html>