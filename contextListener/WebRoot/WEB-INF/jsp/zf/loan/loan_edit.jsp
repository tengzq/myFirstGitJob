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
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
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
		
<script type="text/javascript">
	//保存
	function save(){
		
		if($("#TEL").val()==""||$("#TEL").val()==null){
			$("#TEL").tips({
				side:3,
	            msg:'请输入手机号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#TEL").focus();
			return false;
		}	
		if($("#SEX").val()==""||$("#SEX").val()==null){
			$("#SEX").tips({
				side:3,
	            msg:'请输入性别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#SEX").focus();
			return false;
		}	
		if($("#AGE").val()==""||$("#AGE").val()==null){
			$("#AGE").tips({
				side:3,
	            msg:'请输入真实年龄',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AGE").focus();
			return false;
		}	
		if($("#MONTHLY_PAY").val()==""||$("#MONTHLY_PAY").val()==null){
			$("#MONTHLY_PAY").tips({
				side:3,
	            msg:'请输入税后月薪',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#MONTHLY_PAY").focus();
			return false;
		}	
		
		if($("#ADRESS").val()==""||$("#ADRESS").val()==null){
			$("#ADRESS").tips({
				side:3,
	            msg:'请输入居住城市',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#ADRESS").focus();
			return false;
		}	
		if($("#RESIDENCE_TIME").val()==""||$("#RESIDENCE_TIME").val()==null){
			$("#RESIDENCE_TIME").tips({
				side:3,
	            msg:'请输入居住时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#RESIDENCE_TIME").focus();
			return false;
		}	
		
		if($("#CLIENT_SORT").val()==""||$("#CLIENT_SORT").val()==null){
			$("#CLIENT_SORT").tips({
				side:3,
	            msg:'请输入客户类别',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CLIENT_SORT").focus();
			return false;
		}
		if($("#CTIME").val()==""||$("#CTIME").val()==null){
			$("#CTIME").tips({
				side:3,
	            msg:'请输入在职时间或公司成立时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CTIME").focus();
			return false;
		}
		
		if($("#IDENTITY").val()==""){
			$("#IDENTITY").tips({
				side:3,
	            msg:'请输入身份证',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#IDENTITY").focus();
			return false;
		}
		if($("#AMOUNT").val()==""){
			$("#AMOUNT").tips({
				side:3,
	            msg:'请输入借款金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#AMOUNT").focus();
			return false;
		}
		if($("#PURPOSE").val()==""){
			$("#PURPOSE").tips({
				side:3,
	            msg:'请输入借款目的',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#PURPOSE").focus();
			return false;
		}
		if($("#REMARK").val()==""){
			$("#REMARK").tips({
				side:3,
	            msg:'请输入其他说明',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REMARK").focus();
			return false;
		}
		if($("#STATUS").val()==""){
			$("#STATUS").tips({
				side:3,
	            msg:'请输入状态(0：未处理；1：处理中；2：同意申请 3：驳回申请)',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#STATUS").focus();
			return false;
		}
		if($("#DISPOSE_BY").val()==""){
			$("#DISPOSE_BY").tips({
				side:3,
	            msg:'请输入处理人',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DISPOSE_BY").focus();
			return false;
		}
		if($("#DISPOSE_DATE").val()==""){
			$("#DISPOSE_DATE").tips({
				side:3,
	            msg:'请输入处理日期',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#DISPOSE_DATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="loan/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="LOAN_ID" id="LOAN_ID" value="${pd.LOAN_ID}"/>
		<input type="hidden" name="DISPOSE_BY" id="DISPOSE_BY" value="${sessionScope.sessionUser.USERNAME}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>提交人姓名：</th>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" maxlength="32" placeholder="这里输入借款人真实姓名" title="借款人真实姓名" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>手机号：</th>
				<td><input type="text" name="TEL" id="TEL" value="${pd.TEL}" maxlength="32" placeholder="这里输入借款人联络号" title="借款人联络号" /></td>
			</tr>
			<tr>
				<th>性别：</th>
				<td><input type="text" name="SEX" id="SEX" value="${pd.SEX}" maxlength="32" placeholder="这里输入性别" title="性别" /></td>
			</tr>
			<tr>
				<th>真实年龄：</th>
				<td><input type="text" name="AGE" id="AGE" value="${pd.AGE}" maxlength="32" placeholder="这里输入真实年龄" title="真实年龄" /></td>
			</tr>
			<tr>
				<th>税后月薪：</th>
				<td><input type="text" name="MONTHLY_PAY" id="MONTHLY_PAY" value="${pd.MONTHLY_PAY}" maxlength="32" placeholder="这里输入税后月薪" title="税后月薪"/></td>
			</tr>
			<tr>
				<th>居住城市：</th>
				<td><input type="text" name="ADRESS" id="ADRESS" value="${pd.ADRESS}" maxlength="32" placeholder="这里输入居住城市" title="居住城市" /></td>
			</tr>
			<tr>
				<th>居住时间：</th>
				<td><input type="text" name="RESIDENCE_TIME" id="RESIDENCE_TIME" value="${pd.RESIDENCE_TIME}" maxlength="32" placeholder="这里输入居住时间" title="居住时间" /></td>
			</tr>
			<tr>
				<th>客户类别：</th>
				<td><input type="text" name="CLIENT_SORT" id="CLIENT_SORT" value="${pd.CLIENT_SORT}" maxlength="32" placeholder="这里输入客户类别" title="客户类别" /></td>
			</tr>
			<tr>
				<th>在职时间或公司成立时间(月)：</th>
				<td><input type="text" name="CTIME" id="CTIME" value="${pd.CTIME}" maxlength="32" placeholder="这里输入在职时间或公司成立时间" title="在职时间或公司成立时间" /></td>
			</tr>
			<tr>
				<th>身份证号：</th>
				<td><input type="text" name="IDENTITY" id="IDENTITY" value="${pd.IDENTITY}" maxlength="32" placeholder="这里输入身份证" title="身份证"/></td>
			</tr>
			<tr>
				<th>借款金额：</th>
				<td><input type="text" name="AMOUNT" id="AMOUNT" value="${pd.AMOUNT}" maxlength="32" placeholder="这里输入借款金额" title="借款金额"/></td>
			</tr>
			<tr>
				<th>借款目的：</th>
				<td><input type="text" name="PURPOSE" id="PURPOSE" value="${pd.PURPOSE}" maxlength="32" placeholder="这里输入借款目的" title="借款目的"/></td>
			</tr>
			<tr>
				<th>其他说明：</th>
				<td><textarea name="REMARK" id="REMARK" cols="20" rows="5" title="其他说明">${pd.REMARK}</textarea></td>
			</tr>
			<tr>
				<th>当前状态：</th>
				<td>
					<input type="text" value="${pd.STATUS=='0'?'未处理':(pd.STATUS=='1'?'处理中':(pd.STATUS=='2'?'同意申请':'驳回申请'))}" readonly="readonly"/>
				</td>
			</tr>
			<tr>
				<th>修改为状态：</th>
				<td>
					<select id="STATUS" name="STATUS">
						<option value="0">未处理</option>
						<option value="1">处理中</option>
						<option value="2">同意申请</option>
						<option value="3">驳回申请</option>
					</select>
				</td>
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
		$(function(){
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
		});
		</script>
</body>
</html>