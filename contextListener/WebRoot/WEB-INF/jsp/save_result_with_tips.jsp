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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>保存结果</title>
<base href="<%=basePath%>">
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="static/css/bootstrap.min.css" rel="stylesheet" />
<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link rel="stylesheet" href="static/css/font-awesome.min.css" />
<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
<script src="static/js/bootstrap.min.js"></script>

<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
</head>
<body>
	<div id="zhongxin"></div>
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg=="success"){
			document.getElementById('zhongxin').style.display = 'none';
			bootbox.alert("操作成功！",function(){
				top.Dialog.close();
			});
			
		}else{
			bootbox.alert("操作失败！"+msg,function(){
				history.go(-1);
			});
			//top.Dialog.close();
		}
	</script>
</body>
</html>