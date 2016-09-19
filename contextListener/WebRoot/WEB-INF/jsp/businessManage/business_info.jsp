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
		if($("#CREATE_DATE").val()==""){
			$("#CREATE_DATE").tips({
				side:3,
	            msg:'请输入创建时间',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#CREATE_DATE").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="pluginsBmanege/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="id" id="id" value="${pd.id}"/>
		<div id="zhongxin">
		<table class="table table-striped table-bordered table-hover">
			<tr>
				<th>企业名称</th>
				<td><input type="text" name="name" id="name" value="${pd.username}" title="企业名称" readonly="readonly"/></td>
				<th>登陆帐户名</th>
				<td><input type="text" name="username" id="username" value="${pd.username}" title="登录用户名" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>开户银行核准号</th>
				<td><input type="text" name="bankLicense" id="bankLicense" value="${pd.bankLicense}" title="开户银行核准号" readonly="readonly"/></td>
				<th>组织机构代码</th>
				<td><input type="text" name="orgNo" id="orgNo" value="${pd.orgNo}" title="组织机构代码" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>营业执照编号</th>
				<td><input type="text" name="businessLicenese" id="businessLicenese" value="${pd.businessLicenese}" title="营业执照编号" readonly="readonly"/></td>
				<th>税务登记号</th>
				<td><input type="text" name="taxNo" id="taxNo" value="${pd.taxNo}" title="税务登记号" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>法人姓名</th>
				<td><input type="text" name="legal" id="legal" value="${pd.legal}" title="法人姓名" readonly="readonly"/></td>
				<th>法人身份证</th>
				<td><input type="text" name="legalIdNo" id="legalIdNo" value="${pd.legalIdNo}" title="法人身份证" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>企业联系人</th>
				<td><input type="text" name="contact" id="contact" value="${pd.contact}" title="企业联系人" readonly="readonly"/></td>
				<th>企业联系人联系方式</th>
				<td><input type="text" name="contactPhone" id="contactPhone" value="${pd.contactPhone}" title="企业联系人联系方式" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>手机号</th>
				<td><input type="text" name="phone" id="phone" value="${pd.phone}" title="手机号" readonly="readonly"/></td>
				<th>邮箱</th>
				<td><input type="text" name="email" id="email" value="${pd.email}" title="邮箱" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>是否在易宝注册</th>
				<td>
					<select name="isyeepay" id="isyeepay" >
						<c:if test="${pd.isyeepay eq 0}"><option value="0">否</option></c:if>
						<c:if test="${pd.isyeepay eq 1}"><option value="1">是</option></c:if>
					</select>
				</td>
				<th>绑定银行卡</th>
				<td>
					<select name="isBindBank" id="isBindBank" >
						<c:if test="${pd.isBindBank eq 0}"><option value="0">否</option></c:if>
						<c:if test="${pd.isBindBank eq 1}"><option value="1">是</option></c:if>
					</select>
				</td>
			</tr>
			<tr>
				<th>冻结金额</th>
				<td><input type="text" name="dongjie" id="dongjie" value="${pd.dongjie}" title="冻结金额" readonly="readonly"/></td>
				<th>余额</th>
				<td><input type="text" name="yue" id="yue" value="${pd.yue}" title="余额" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>企业用户类型</th>
				<td>
					<select name="memberClassType" id="memberClassType" >
						<c:if test="${pd.memberClassType eq 0}"><option value="0">担保公司</option></c:if>
						<c:if test="${pd.memberClassType eq 1}"><option value="1">放款公司</option></c:if>
						<c:if test="${pd.memberClassType eq 2}"><option value="2">收款公司</option></c:if>
					</select>
				</td>
				<th>当前账户状态</th>
				<td>
					<select name="isdelete" id="isdelete" >
						<option value="0" <c:if test="${pd.isdelete eq 0}">selected=selected</c:if>>待审核</option>
						<option value="1" <c:if test="${pd.isdelete eq 1}">selected=selected</c:if>>冻结</option>
						<option value="2" <c:if test="${pd.isdelete eq 2}">selected=selected</c:if>>通过</option>
					</select>
				</td>
			</tr>
			<tr>
				<th colspan="2">所属集团</th>
				<td colspan="2">
					<select name="belong_group_id" id="belong_group_id">
						<option value="">请选择所属集团</option>
						<c:forEach items="${groupList}" var="g">
							<option value="${g.GROUP_ID}" <c:if test="${g.GROUP_ID eq pd.belong_group_id}">selected=selected</c:if>>${g.GROUP_NAME}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;" colspan="4">
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