<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
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

<link rel="stylesheet" href="static/css/datepicker.css" />
<!-- 日期框 -->
<link rel="stylesheet"
	href="static/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<style type="text/css">
.rateSpan {
	color: red;
	font-weight: bolder;
	font-size: 18px;
	padding-bottom: 10px;
	padding-left: 3px;
}

.rateSpanDes {
	color: #000000;
	font-weight: bolder;
	font-size: 15px;
	padding-left: 3px;
}
input::-webkit-input-placeholder {
		    color:    #000000;
		}
		input:-moz-placeholder {
		    color:    #000000;
		}
</style>
<script type="text/javascript">
	//保存
	function save() {

		if ($("#PROJECT_NAME").val() == "") {
			$("#PROJECT_NAME").tips({
				side : 3,
				msg : '请输入项目名称',
				bg : '#AE81FF',
				time : 2
			});
			$("#PROJECT_NAME").focus();
			return false;
		}
	
		if ($("#BASE_INTEREST_RATE").val() == "") {
			$("#BASE_INTEREST_RATE").tips({
				side : 3,
				msg : '请输入基准利率',
				bg : '#AE81FF',
				time : 2
			});
			$("#BASE_INTEREST_RATE").focus();
			return false;
		}
		if ($("#INTEREST_BEARING_TIME_DES").val() == "") {
			$("#INTEREST_BEARING_TIME_DES").tips({
				side : 3,
				msg : '请输入起息时间说明',
				bg : '#AE81FF',
				time : 2
			});
			$("#INTEREST_BEARING_TIME_DES").focus();
			return false;
		}
		if ($("#STIME").val() == "") {
			$("#STIME").tips({
				side : 3,
				msg : '请输入开始时间',
				bg : '#AE81FF',
				time : 2
			});
			$("#STIME").focus();
			return false;
		}
		if ($("#ETIME").val() == "") {
			$("#ETIME").tips({
				side : 3,
				msg : '请输入结束时间',
				bg : '#AE81FF',
				time : 2
			});
			$("#ETIME").focus();
			return false;
		}
	
		if ($("#TOTAL_RAISE_AMOUNT").val() == ""
				|| $("#TOTAL_RAISE_AMOUNT").val() == 0) {
			$("#TOTAL_RAISE_AMOUNT").tips({
				side : 3,
				msg : '请输入募集金额',
				bg : '#AE81FF',
				time : 2
			});
			$("#TOTAL_RAISE_AMOUNT").focus();
			return false;
		}

		
		if ($("#LOWEST_AMOUNT").val() == "" || $("#LOWEST_AMOUNT").val() == 0) {
			$("#LOWEST_AMOUNT").tips({
				side : 3,
				msg : '请输入最低起投资金',
				bg : '#AE81FF',
				time : 2
			});
			$("#LOWEST_AMOUNT").focus();
			return false;
		}
		
	
		if ($("#REPAYMENT_MODE_DES").val() == "") {
			$("#REPAYMENT_MODE_DES").tips({
				side : 3,
				msg : '请输入还款方式',
				bg : '#AE81FF',
				time : 2
			});
			$("#REPAYMENT_MODE_DES").focus();
			return false;
		}
		
		if ($("#DEADLINE").val() == "" || $("#DEADLINE").val() == 0) {
			$("#DEADLINE").tips({
				side : 3,
				msg : '请输入项目周期',
				bg : '#AE81FF',
				time : 2
			});
			$("#LOWEST_AMOUNT").focus();
			return false;
		}
		if ($("#INVEST_STEP").val() == "" || $("#INVEST_STEP").val() == 0) {
			$("#INVEST_STEP").tips({
				side : 3,
				msg : '投资递增金额',
				bg : '#AE81FF',
				time : 2
			});
			$("#INVEST_STEP").focus();
			return false;
		}
		var res = formSubmit();
		if (res == false) {
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		/* top.Dialog.close(); */
	}
</script>
</head>
<body>
	<form action="_project/${msg }.do" name="Form" id="Form" method="post"
		>
		<input type="hidden" name="ID" id="ID" value="${pd.ID}" />
		<%--  <input
			type="hidden" name="ZRF_ID" id="ZRF_ID" value="${pd2.ID}" /> --%>
		<div id="zhongxin" style="margin: 20px 20px 20px 20px;">
			<h4>项目基本信息：</h4>
			<table style="width: 100%;border-top: 1px solid #ddd;">
				<tr style="padding-top: 10px;">
					<td width="33%"><span class="rateSpanDes">项目名称：</span> <input
						onchange="checkName();"
						style="width: 300px;" type="text" name="PROJECT_NAME"
						id="PROJECT_NAME" value="${pd.PROJECT_NAME}" maxlength="32"
						placeholder="这里输入项目名称" title="项目名称" /></td>
					<%-- <td width="33%">
					<span class="rateSpanDes">项目类型：</span>
					<select name="PROJECT_TYPE" id="PROJECT_TYPE">
						<option value="">请选择项目类型</option>
						<c:forEach items="${typeList}" var="type">
							<option value="${type.PROJECTTYPE_ID}" <c:if test="${pd.PROJECT_TYPE == type.PROJECTTYPE_ID}">selected=selected</c:if>>${type.TYPE_NAME}</option>
						</c:forEach>
					</select>
				</td> --%>
				</tr>
				<tr>
					<td width="33%"><span class="rateSpanDes">年化利率：</span> <input
					onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101 ||event.KeyCode == charCodeAt('-'))event.returnValue = false;"
						onchange="checkMoney3('BASE_INTEREST_RATE');checkLiLv();"
						type="number" name="BASE_INTEREST_RATE" id="BASE_INTEREST_RATE"
						value="${pd.BASE_INTEREST_RATE}" maxlength="32"
						placeholder="这里输入年化利率" title="年化利率" /><span class="rateSpan">%</span>
					</td>
					<%-- 	<td width="33%">
					<span class="rateSpanDes">加息利率：</span>
					<input type="number" name="BOSS_INTEREST_RATE" id="BOSS_INTEREST_RATE" value="${pd.BOSS_INTEREST_RATE}" maxlength="32" placeholder="这里输入老板贴息" title="老板贴息"/><span class="rateSpan">%</span>
				</td> --%>
				</tr>
				<tr>
					<td width="33%"><span class="rateSpanDes">募集开始时间：</span> <input
						onchange="checkTime();"
						style="width: 206px" class="span10 date-picker" name="STIME"
						id="STIME" value="${fn:substring(pd.STIME, 0, 10)}" type="text"
						data-date-format="yyyy-mm-dd" readonly="readonly"
						placeholder="开始时间" title="开始时间" />
						<input value="${fn:substring(pd.STIME, 11, 13)}" onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="STIME_HOURS" id="STIME_HOURS"
						onchange="checkHourse('STIME_HOURS')"
						maxlength="2" style="width: 30px;" /><span class="rateSpanDes">时</span>
						<input value="${fn:substring(pd.STIME, 14, 16)}" onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="STIME_MINUTE" id="STIME_MINUTE"
						onchange="checkMinute('STIME_MINUTE')"
						 maxlength="2" style="width: 30px;" /><span class="rateSpanDes">分</span>
						</td>
					<td width="33%"><span class="rateSpanDes">募集结束时间：</span> <input
						
						style="width: 206px" class="span10 date-picker" name="ETIME"
						id="ETIME" value="${fn:substring(pd.ETIME, 0, 10)}" type="text"
						data-date-format="yyyy-mm-dd" readonly="readonly"
						placeholder="结束时间" title="结束时间" />
						
						<input value="${fn:substring(pd.ETIME, 11, 13)}" onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="ETIME_HOURS" id="ETIME_HOURS"
						onchange="checkHourse('ETIME_HOURS')"
						value="${pd.TOTAL_RAISE_AMOUNT}" maxlength="2" style="width: 30px;" /><span class="rateSpanDes">时</span>
						<input value="${fn:substring(pd.ETIME, 14, 16)}"  onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="ETIME_MINUTE" id="ETIME_MINUTE"
						onchange="checkMinute('ETIME_MINUTE')"
						value="${pd.TOTAL_RAISE_AMOUNT}" maxlength="2" style="width: 30px;" /><span class="rateSpanDes">分</span>
						
						</td>
				</tr>
				
				<tr>
					<td width="33%"><span class="rateSpanDes">项目周期：</span> <input
					onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
					onchange="checkMoney3('DEADLINE');"
						style="color: red;" type="number" name="DEADLINE" id="DEADLINE"
						value="${pd.DEADLINE}" maxlength="32" title="投资期限（天）" /><span class="rateSpanDes">天</span></td>
					<%-- <td width="33%">
					<span class="rateSpanDes">项目上线时间：</span>	
					<input style="width: 206px"  class="span10 form_datetime" name="PUBLISH_TIME" id="PUBLISH_TIME" value="${pd.PUBLISH_TIME}" type="text" readonly="readonly" placeholder="项目上线时间" title="项目上线时间"/>
				</td> --%>
				</tr>
				<c:if test="${not empty pd.PROJECT_NAME}">
					<input type="hidden" id="editFlag" value="1">
				</c:if>
				
				<tr>
					<td width="33%"><span class="rateSpanDes">项目募集金额：</span> <input
					onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="TOTAL_RAISE_AMOUNT" id="TOTAL_RAISE_AMOUNT"
						onchange="checkMoney3('TOTAL_RAISE_AMOUNT');"
						value="${pd.TOTAL_RAISE_AMOUNT}" maxlength="32"
						placeholder="这里输入募集金额最大32位" title="募集金额" /><span class="rateSpanDes">元</span>
					</td>
					<%-- <td width="33%">
					<span class="rateSpanDes">项目分期：</span>
					<input type="number" name="TOTAL_PHASE" id="TOTAL_PHASE" value="${pd.TOTAL_PHASE}" maxlength="32" placeholder="这里输入分期" title="分期"/>
				</td> --%>

				</tr>
				<%-- <tr>
				<td><input type="text" name="PROJECT_INTEREST_RATE_DES" id="PROJECT_INTEREST_RATE_DES" value="${pd.PROJECT_INTEREST_RATE_DES}" maxlength="32" placeholder="这里输入项目利率说明" title="项目利率说明"/><span class="rateSpanDes">例如：投资10万元</span></td>
				<td><input type="text" name="UNIT_INTEREST_RATE" id="UNIT_INTEREST_RATE" value="${pd.UNIT_INTEREST_RATE}" maxlength="32" placeholder="这里输入预计每天收益" title="这里输入预计每天收益"/><span class="rateSpanDes">元/天</span></td>
			</tr> --%>
				<tr>
					<%-- <td width="33%"><span class="rateSpanDes">项目状态：</span> <select
						name="PROJECT_STATE" id="PROJECT_STATE" title="项目状态">
							<option value="0">请选择项目状态</option>
							<option value="1"
								<c:if test="${pd.PROJECT_STATE==1}">selected="selected"</c:if>>募集中</option>
							<option value="2"
								<c:if test="${pd.PROJECT_STATE==2}">selected="selected"</c:if>>还款中</option>
							<option value="3"
								<c:if test="${pd.PROJECT_STATE==3}">selected="selected"</c:if>>已结束</option>
					</select></td> --%>
					<td><span class="rateSpanDes">最低起投金额：</span> <input
					onchange="checkMoney3('LOWEST_AMOUNT');checkMoney();"
					onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
						type="number" name="LOWEST_AMOUNT" id="LOWEST_AMOUNT"
						value="${pd.LOWEST_AMOUNT}" maxlength="32"
						placeholder="这里输入最低起投资金" title="最低起投资金" /><span
						class="rateSpanDes">元</span></td>

				</tr>
				<tr>
					<td>
					<span class="rateSpanDes">投资递增金额：</span>
					<input type="number" name="INVEST_STEP" id="INVEST_STEP"
					onchange="checkMoney3('INVEST_STEP');checkMoney1();"
					onKeypress="javascript:if(event.keyCode == 45 || event.keyCode == 69 || event.keyCode == 101)event.returnValue = false;"
					 value="${pd.INVEST_STEP}" maxlength="32" placeholder="这里输入投资递增金额" title="投资递增金额"/><span class="rateSpanDes">元</span>
				</td> 
					<td><span class="rateSpanDes">选择集团：</span> <select
						name="group_id" id="group_id" title="选择集团">
							<c:if test="${not empty lastChoiseGroup.group_name }">
								<option value="${lastChoiseGroup.group_id }">${lastChoiseGroup.group_name }</option>
							</c:if>
							<c:forEach items="${groupList }" var="var">
								<option value="${var.group_id }">${var.group_name }</option>
							</c:forEach>
					</select></td>
				</tr>
				<%--<tr>
					<td><span class="rateSpanDes">是否使用加息券：</span> <select
						name="IS_USE_TICKET" id="IS_USE_TICKET"
						value="${pd.IS_USE_TICKET}" title="是否使用优惠券">
							<option value="1"
								<c:if test="${pd.IS_USE_TICKET==true}">selected="selected"</c:if>>是</option>
							<option value="0"
								<c:if test="${pd.IS_USE_TICKET==false}">selected="selected"</c:if>>否</option>
					</select></td>
					 <td style="display: none">
					<span class="rateSpanDes">是否使用换手气利率：</span>
					<select name="IS_USE_EXCHANGE_RATE" id="IS_USE_EXCHANGE_RATE" value="${pd.IS_USE_EXCHANGE_RATE}"   title="是否使用换手气利率">
				 		<option value="1" <c:if test="${pd.IS_USE_EXCHANGE_RATE==true}">selected="selected"</c:if>>是</option>
						<option value="0" <c:if test="${pd.IS_USE_EXCHANGE_RATE==false}">selected="selected"</c:if>>否</option>
					</select>
				</td> --%>
					<%-- <td>
					<span class="rateSpanDes">是否启用邀请码利率：</span>
					<select name="IS_USE_INVITATION" id="IS_USE_INVITATION" value="${pd.IS_USE_INVITATION}"   title="是否启用邀请码利率">
				 		<option value="1" <c:if test="${pd.IS_USE_INVITATION==true}">selected="selected"</c:if>>是</option>
						<option value="0" <c:if test="${pd.IS_USE_INVITATION==false}">selected="selected"</c:if>>否</option>
					</select>
				</td> 
				</tr>--%>
				<tr>
					<%-- <td><span class="rateSpanDes">项目是否发布：</span> <select
						name="IS_PUBLISH" id="IS_PUBLISH" value="${pd.IS_PUBLISH}"
						title="是否启用邀请码利率">
							<option value="0"
								<c:if test="${pd.IS_PUBLISH==false}">selected="selected"</c:if>>否</option>
							<option value="1"
								<c:if test="${pd.IS_PUBLISH==true}">selected="selected"</c:if>>是</option>
					</select></td>--%>
					<td> 
						<%-- <input type="text" name="REPAYMENT_MODE_DES" id="REPAYMENT_MODE_DES" value="${pd.REPAYMENT_MODE_DES}" maxlength="32" placeholder="这里输入还款方式" title="还款方式"/> --%>
						<span class="rateSpanDes">还款方式：</span> <select
						name="REPAYMENT_MODE_DES" id="REPAYMENT_MODE_DES">
							<option value="">请选择还款方式</option>
							<option value="1"
								<c:if test="${pd.REPAYMENT_MODE_DES == 1}">selected="selected"</c:if>>到期还本还息</option>
					</select> <!-- <span class="rateSpanDes">例如：按月付息，到期还本</span> -->
					</td>
				</tr>
				<tr>
					<td width="33%">
						<%-- <input type="text" name="INTEREST_BEARING_TIME_DES" id="INTEREST_BEARING_TIME_DES" value="${pd.INTEREST_BEARING_TIME_DES}" maxlength="32" placeholder="这里输入起息时间说明" title="起息时间说明"/> --%>
						<span class="rateSpanDes">起息时间说明：</span> <select
						name="INTEREST_BEARING_TIME_DES" id="INTEREST_BEARING_TIME_DES">
							<option value="">请选择起息时间说明</option>
							<option value="1"
								<c:if test="${pd.INTEREST_BEARING_TIME_DES == 1}">selected="selected"</c:if>>结标后次日</option>
					</select> <!-- <span class="rateSpanDes">例如：投资次日起息</span> -->
					</td>
					<td><span class="rateSpanDes">项目说明：</span> <textarea
							style="width: 30%;height: 80px;" type="text"
							name="PROJECT_DESCRIPTION" id="PROJECT_DESCRIPTION"
							value="${pd.PROJECT_DESCRIPTION}" maxlength="32"
							placeholder="这里输入项目说明" title="项目说明">${pd.PROJECT_DESCRIPTION}</textarea>
					</td>
				</tr>
				
				
				<tr>
					<td width="33%">
						<%-- <input type="text" name="INTEREST_BEARING_TIME_DES" id="INTEREST_BEARING_TIME_DES" value="${pd.INTEREST_BEARING_TIME_DES}" maxlength="32" placeholder="这里输入起息时间说明" title="起息时间说明"/> --%>
						<span class="rateSpanDes">保理信息：</span>
						<select name="shouqianid" id="group_id" title="选择保理">
						<c:if test="${not empty lastChoise.name }">
							<option value="${lastChoise.id }">${lastChoise.name }</option>
						</c:if>
						<c:forEach items="${list }" var="var">
							<option value="${var.id }">${var.name }</option>
						</c:forEach>
						</select> <!-- <span class="rateSpanDes">例如：投资次日起息</span> -->
					</td>
				</tr>
			</table>


		<%-- 	<h4>核心企业信息：</h4>
			<table style="width: 100%;border-top: 1px solid #ddd;">
				<tr style="padding-top: 10px;">
					<td><select name="hexinid" id="group_id" title="选择企业">
							<c:forEach items="${list }" var="var">
								<option value="${var.id }">${var.name }</option>
							</c:forEach>
					</select></td>
					<td><span class="rateSpanDes">通知转账时间：</span> <input
						style="width: 206px" class="span10 date-picker" name="hexinDate"
						id="hexinDate" value="${pd.hexinDate}" type="text"
						data-date-format="yyyy-mm-dd" readonly="readonly"
						placeholder="通知转账时间" title="通知转账时间" /></td>
				<td><span class="rateSpanDes">转账金额：</span> <input
						type="number" name="hexinAmount" id="hexinAmount"
						value="${pd.hexinAmount}" maxlength="32"
						placeholder="这里输入核心企业转账金额" title="这里输入核心企业转账金额" /><span
						class="rateSpanDes">元</span></td>
				
				</tr> --%>
				<tr>
				<td style="text-align: center;" colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">
						<c:if test="${msg eq 'save'}">下一步</c:if>
						<c:if test="${msg eq 'edit'}">保存</c:if>
					</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
			<!-- </table> -->
		</div>

		<div id="zhongxin2" class="center" style="display:none">
			<br /> <br /> <br /> <br /> <br /> <img
				src="static/images/jiazai.gif" /><br />
			<h4 class="lighter block green">提交中...</h4>
		</div>

	</form>


	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datetimepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript"
		src="static/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>
	<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			var STIME_HOURS = $("#STIME_HOURS").val() == '' ? $("#STIME_HOURS").val("0") : 0;
			var STIME_MINUTE = $("#STIME_MINUTE").val() == '' ? $("#STIME_MINUTE").val("0") : 0;
			var ETIME_HOURS = $("#ETIME_HOURS").val() == '' ? $("#ETIME_HOURS").val("0") : 0;
			var ETIME_MINUTE = $("#ETIME_MINUTE").val() == '' ? $("#ETIME_MINUTE").val("0") : 0;
			
			

			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//日期框
			$('.date-picker').datepicker();
			var now = new Date();
			now.setHours(0);
			now.setMinutes(0);
			now.setSeconds(0);
			/* now.setDate(now.getDate()-1); */
			$(".form_datetime").datetimepicker({
				format : 'yyyy-mm-dd hh:ii',
				language : 'zh-CN',
				startDate : now.Format('yyyy-MM-dd HH:mm'),
				forceParse : false
			});

		});
		function setDay() {
			var sTime = new Date($('#ETIME').val()).getTime();//项目开始时间
			var eTime = new Date($('#STIME').val()).getTime();//项目结束时间
			/*  var sCurrentDay =new Date($('#STIME').val()).getDate();
			 var eCurrentDay =new Date($('#ETIME').val()).getDate();
			 alert(currentDay);
			 if(sCurrentDay>15){
			 	 alert( Math.ceil((sTime-eTime)/86400000/30)+1);
			 }else{
			  	 alert( Math.ceil((sTime-eTime)/86400000/30));
			 } */
			
			$("#DEADLINE").val((sTime - eTime) / 86400000);
		}

		function setDay2() {
			var sTime = new Date($('#STIME').val()).getTime();//项目开始时间
			/*  var eTime   = new Date($('#STIME').val()).getTime();//项目结束时间 */
			/*  var sCurrentDay =new Date($('#STIME').val()).getDate();
			 var eCurrentDay =new Date($('#ETIME').val()).getDate();
			 alert(currentDay);
			 if(sCurrentDay>15){
			 	 alert( Math.ceil((sTime-eTime)/86400000/30)+1);
			 }else{
			  	 alert( Math.ceil((sTime-eTime)/86400000/30));
			 } */
			//var eTime   = new Date($('#DEADLINE').val()).getTime();
			var b = $('#DEADLINE').val();
			var b1 = b * 86400000;
			var time1 = new Date(sTime + b1).Format("yyyy-MM-dd");
			$('#ETIME').val(time1);
			/*  $('#STIME').val(s); */
			/* 	 $("#DEADLINE").val((sTime-eTime)/86400000); */
		}

		//过滤类型 图标
		function fileIcon(obj) {
			var fileType = obj.value.substr(obj.value.lastIndexOf("."))
					.toLowerCase();//获得文件后缀名
			if (fileType != '.gif' && fileType != '.png' && fileType != '.jpg'
					&& fileType != '.jpeg') {
				$("#JFZ").tips({
					side : 3,
					msg : '请上传图片格式的文件',
					bg : '#AE81FF',
					time : 3
				});
				$("#JFZ").val('');
				document.getElementById("JFZ").files[0] = '请选择章';
			}
		}

		//删除转让方章图标
		function delIcon(fileid, filepath) {
			if (confirm("确定要删除章？")) {
				var url = "_project/deleteIcon.do?ID=" + fileid + "&ICON="
						+ filepath;
				$
						.post(
								url,
								function(data) {
									if (data == "success") {
										alert("删除图标成功!");
										$("#iconTd")
												.html(
														"章<input type='file' id='JFZ' name='JFZ' onchange='fileIcon(this)'/>");
										//document.location.reload();
									}
								});
			}
		}
		Date.prototype.Format = function(fmt) { //author: meizz 
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"h+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
				"S" : this.getMilliseconds()
			//毫秒 
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
		
		function checkLiLv() {
			var rate = $("#BASE_INTEREST_RATE").val();
			var reg = /[0-9]{1,2}/;
			if (!reg.test(rate)) {
				alert("年化利率必须为数字");
				return false;
			}
			if (rate > 24) {
				alert("最高利率为24%");
				return false;
			} 
			if (rate <= 0) {
				alert("最低利率为0.01%");
				return false;
			}
		}
		function toDate(str){
		    var sd=str.split("-");
		    return new Date(sd[0],sd[1]-1,sd[2]);
		}
		
		function checkTime() {
			var time = $("#STIME").val();
			console.log(time);
			var choise = toDate(time);
			var now = toDate(new Date().Format("yyyy-MM-dd"));
			
			if (Date.parse(choise) < Date.parse(now)) {
				alert("不能选择已经过去的时间");
				return false;
			}
		}
		
		function checkTime2() {
			var time = toDate($("#STIME").val());
			var time2 = toDate($("#ETIME").val());
			if (Date.parse(time) > Date.parse(time2)) {
				console.log("ss"+Date.parse(time)+"____"+Date.parse(time2));
				alert("不能小于开始时间");
				return false;
			} else if (Date.parse(time) == Date.parse(time2)) {
				if (checkTimeEquels() == false) {
					return false;
				} else {
					return true;
				}
				
			}
		}
		
		function checkMoney() {
			var totel = parseInt($("#TOTAL_RAISE_AMOUNT").val());
			var res = parseInt($("#LOWEST_AMOUNT").val());
			console.log(totel+"_____________"+res);
			if (res > totel) {
				alert("最低起投金额不能大于募集金额");
				return false;
			}
		}
		
		function checkMoney1() {
			var totel = parseInt($("#LOWEST_AMOUNT").val());
			var res = parseInt($("#INVEST_STEP").val());
			if (res < 0) {
				alert("递增金额不能小于零");
				return false;s
			}
		}
		
		
		function checkName() {
			var flag = $("#editFlag").val();
			console.log("____"+flag);
			if (flag == parseInt(1)) {
				
				nameFlag = true;
				return true;
			}
			var name = $("#PROJECT_NAME").val();
			if (name.length > 15) {
				alert("项目名不能超过15位");
				return false;
			}
			$.ajax({
				   type: "POST",
				   url: "<%=basePath%>_project/checkName",
				   data: {PROJECT_NAME : name},
				   async:false,
				   success: function(msg) {
					  if (msg.msg == "EXISTS") {
						  
					  	alert("项目名已经存在");
					  	nameFlag = false;
					  	return false;
					  } else if (msg.msg == "ERORR") {
						  nameFlag = false;
					  	alert("系统出错");
					  	return false;
					  } else {
						  nameFlag = true;
						  return true;
					  }
				   }
			});
		}
	var nameFlag = false;	
		function checkDeadline() {
			var res = $("#DEADLINE").val();
			if (res.length == 0) {
				alert("请输入项目周期");
				return false;
			}
			var check = /[0-9]{1,}/;
			if (check.test(res)) {
				return true;
			} else {
				alert("请输入项目周期");
				return false;
			}
		}
		
		function checkHourse(id) {
			var num = $("#"+id).val();
			if (num > 23) {
				$("#"+id).val("23");
			} else if (num < 0) {
				$("#"+id).val("0");
			} else if (num < 10) {
				$("#"+id).val("0"+num);
			}
		}
		
		function checkMinute(id) {
			var num = $("#"+id).val();
			console.log(num);
			if (num > 59) {
				$("#"+id).val("59");
			} else if (num < 0) {
				$("#"+id).val("0");
			} else if (num < 10) {
				$("#"+id).val("0"+num);
			}
		}
		
		function checkMoney3(id) {
			var num = $("#"+id).val();
			if (num < 0) {
				$("#"+id).val("0");
			}
		}
		
		function checkTimeEquels() {
			var STIME_HOURS = $("#STIME_HOURS").val();
			var STIME_MINUTE = $("#STIME_MINUTE").val();
			var ETIME_HOURS = $("#ETIME_HOURS").val();
			var ETIME_MINUTE = $("#ETIME_MINUTE").val();
			var STIME = parseInt(STIME_HOURS +"" +STIME_MINUTE);
			var ETIME = parseInt(ETIME_HOURS + "" + ETIME_MINUTE);
			if (STIME >= ETIME) {
				alert("募集结束时间不能小于等于开始时间");
				return false;
			}
		}
		
		function formSubmit() {
			if (checkLiLv() == false || checkTime() == false || checkTime2() == false ||
			checkMoney() == false || checkMoney1() == false  || checkDeadline == false ) {
				return false;
			}
			checkName();
			if(nameFlag == false) {
				$("#PROJECT_NAME").tips({
					side : 3,
					msg : '项目名称重复',
					bg : '#AE81FF',
					time : 2
				});
				$("#PROJECT_NAME").focus();
			}
			if (nameFlag == true) {
				return true;
			} else {
				return false;
			}
			
		}
		
	</script>
</body>
</html>