<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../commons/taglibs.jsp" %>
<script type="text/javascript">
var SL_USER_NP={
	see : function () {
		$("#user_password").removeAttr("disabled").val("");
		$("#user_bz").val(true);
	},
	blur: function() {
		var $pwd =$("#user_password");
		if ($pwd.val() == "") {
			$pwd.val($("#user_src_pwd").val()).attr("disabled", "disabled");
			$("#user_bz").val("false")
		}
	}
}; 
</script> 
<div class="pageContent">
	<form method="post" action="${CTX }/user/doEdit.do" class="pageForm required-validate" rel="userdoadd" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<input type="hidden" name="userId" value="${user.userId}"/>
		<input type="hidden" name="passWord1" id="user_src_pwd" value="${user.password}"/>
		<input type="hidden" name="bz" id="user_bz" value="false"/>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>用户名：</label>
				<input type="text" class="required" name="name" value="${user.name}" size="30" />
			</p>
			<p>
				<label>密码：</label>
				<input type="button" value="编辑密码" onclick="SL_USER_NP.see();"/>
				<input  onblur="SL_USER_NP.blur();" type="password" id="user_password" name="password" disabled="disabled" class="required password"  value="${user.password}" size="18"/>
			</p>
			<div class="divider"></div>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive"><div class="buttonContent"><button type="submit">确定</button></div></div>
				</li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>