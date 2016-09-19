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
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
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
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<link rel="stylesheet" href="static/css/bootstrap-datetimepicker.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<style type="text/css">
.rateSpan{color: red;font-weight: bolder;font-size: 18px;padding-bottom: 10px;padding-left:3px;}
.rateSpanDes{color:#AAA;font-weight: bolder;font-size: 15px;padding-left:3px;}
</style>
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootstrap-datetimepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
		<script type="text/javascript">
		
	
	function setDay2(){ 
		 var sTime   = new Date($('#STIME').val()).getTime();//项目开始时间
	
	var b=$('#DEADLINE').val();
	 var b1=b*86400000;
	 alert(sTime+b1);
	 var time1 = new Date().Format("yyyy-MM-dd");
	 $('#ETIME').val(time1);
	}
	//保存
	function save(){
		
		if($("#TICKET_NAME").val()==""){
			$("#TICKET_NAME").tips({
				side:3,
	            msg:'请输入投资卷名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_NAME").focus();
			return false;
		}
		if($("#ENABLE_MIN_AMOUNT").val()==""){
			$("#ENABLE_MIN_AMOUNT").tips({
				side:3,
	            msg:'请输入使用优惠券最低金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ENABLE_MIN_AMOUNT").focus();
			return false;
		}
		if($("#DISCOUNT_AMOUNT").val()==""){
			$("#DISCOUNT_AMOUNT").tips({
				side:3,
	            msg:'请输入优惠金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DISCOUNT_AMOUNT").focus();
			return false;
		}
		
		
		if($("#TICKET_STATE").val()==""){
			$("#TICKET_STATE").tips({
				side:3,
	            msg:'选择赠送类型',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_STATE").focus();
			return false;
		}
		
		if($("#IS_ENABLED").val()=="" || $("#IS_ENABLED").val()==0){
			$("#IS_ENABLED").tips({
				side:3,
	            msg:'请输入是否启用',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IS_ENABLED").focus();
			return false;
		}
		if($("#EFFECTIVE_TIME").val()==""){
			$("#EFFECTIVE_TIME").tips({
				side:3,
	            msg:'请输入有效期（天）',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#EFFECTIVE_TIME").focus();
			return false;
		}
		if($("#TICKET_DES").val()==""){
			$("#TICKET_DES").tips({
				side:3,
	            msg:'请输入使用规则',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TICKET_DES").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="zfticket/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table style="margin-top: 20px;" class="table table-striped table-bordered table-hover">
			<tr>
				<th>加息卷名称</th>
				<td><input type="text" name="TICKET_NAME" id="TICKET_NAME" value="${pd.TICKET_NAME}" maxlength="32" placeholder="这里输入投资卷名称" title="投资卷名称"/></td>
			</tr>
			<tr>
				<th>加息率</th>
				<td><input type="text" name="TICKET_LV" id="TICKET_LV" value="${pd.TICKET_LV}" maxlength="32" placeholder="这里输入投资卷利率" title="投资卷利率"/></td>
			</tr>
			<%-- <tr>
				<th>最低使用金额</th>
				<td><input type="number" name="ENABLE_MIN_AMOUNT" id="ENABLE_MIN_AMOUNT" value="${pd.ENABLE_MIN_AMOUNT}" maxlength="32" placeholder="这里输入使用现金券最低金额" title="使用优惠券最低金额"/><span class="rateSpanDes">元</span></td>
			</tr> --%>
		<%-- 	<tr>
				<th>是否算作本金</th>
				<td>
					<select name="IS_REPAY_CAPITAL" id="IS_REPAY_CAPITAL">
						<option value="0">否</option>
						<option value="1" <c:if test="${pd.IS_REPAY_CAPITAL}">selected=selected</c:if>>是</option>
					</select>
				</td>
			</tr> --%>
		<%-- 	<tr>
				<th>优惠金额</th>
				<td><input type="number" name="DISCOUNT_AMOUNT" id="DISCOUNT_AMOUNT" value="${pd.DISCOUNT_AMOUNT}" maxlength="32" placeholder="这里输入优惠金额" title="优惠金额"/><span class="rateSpanDes">元</span></td>
			</tr> --%>
			 <tr>
				<th>选择项目</th>
				<td>
						<select name="project_id" id="project_id"   placeholder="选择项目" title="选择项目">
							<option value="" selected="selected">选择项目</option>
								<c:forEach items="${ppd}" var="var">
								<option value="${var.ID}" >${var.PROJECT_NAME}</option>
						</c:forEach>
						</select>
				</td>
			</tr>
			<%-- <tr>
				<th>券类型</th>
				<td>
				  	 <select name="TICKET_TYPE" id="TICKET_TYPE" value="${pd.TICKET_TYPE}"  placeholder="这里输入投资卷类型" title="投资卷类型">
							<option value="TZ_TICKET" <c:if test="${pd.TICKET_TYPE=='TZ_TICKET'}">selected="selected"</c:if> >现金卷</option>
							<option value="JX_TICKET" <c:if test="${pd.TICKET_TYPE=='JX_TICKET'}">selected="selected"</c:if>>加息卷</option>
					</select>
				</td>
			</tr>
			 --%>
			 
			<%-- <tr>
				<th>是否启用</th>
				<td>
					<select name="IS_ENABLED" id="IS_ENABLED" value="${pd.IS_ENABLED}"  placeholder="这里输入是否启用" title="是否启用">
							<option value="0">是否启用</option>
							<option value="1" <c:if test="${pd.IS_ENABLED==1}">selected="selected"</c:if> >是</option>
							<option value="2" <c:if test="${pd.IS_ENABLED==2}">selected="selected"</c:if>>否</option>
					</select>
				</td>
			</tr> --%>
			
			<tr><th>开始时间</th>
				<td width="33%">
					
					<input style="width: 206px"  class="span10 date-picker" name="create_date" id="STIME" value="${pd.create_dates}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="开始时间" title="开始时间"/>
				</td>
				<%-- <td width="33%">
					<span class="rateSpanDes">项目结束时间：</span>
					<input style="width: 206px"  class="span10 date-picker" name="ETIME" id="ETIME" value="${pd.ETIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="结束时间" title="结束时间" />
				</td>--%>
			</tr> 
			<tr><th>周期</th>
				<td width="33%">
					<input style="color: red;" type="number"  name="day"id="DEADLINE"  maxlength="32"  title="投资期限（天）" /><span class="rateSpanDes">天</span>
				</td>
				
			</tr> 
			
			<tr>
				<th>使用规则</th>
				<td><textarea  name="TICKET_DES" id="TICKET_DES"  maxlength="32" placeholder="这里输入使用规则" title="使用规则" >${pd.TICKET_DES}</textarea></td>
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
			
		});
		
		</script>
</body>
</html>