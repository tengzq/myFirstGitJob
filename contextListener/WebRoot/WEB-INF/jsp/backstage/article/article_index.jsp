<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
<title>文章信息管理</title>
<link type="text/css" rel="stylesheet" href="plugins/layout/layout-default-latest.css" />
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css">	
<script type="text/javascript" src="static/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="plugins/layout/jquery.layout-latest.min.js"></script>
<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
</head>
<body>
<script>
	var selectedNode;
	// 节点选择
	function zTreeOnClick(event, treeId, treeNode) {
		selectedNode = treeNode.id;
	    $('#zzjgContent').attr("src","article/list.do?PROGRAM_ID="+selectedNode);
	};
	// 加载完成后默认展开根节点
	function zTreeOnAsyncSuccess(event, treeId, treeNode, msg) {
		var treeObj = $.fn.zTree.getZTreeObj("zzjgTree");
		if(treeNode == null){
			treeNode = treeObj.getNodeByTId("zzjgTree_1");
			selectedNode = 0;
		}else{
			var nodes = treeObj.getSelectedNodes();
		}
		treeObj.expandNode(treeNode, true);
		treeObj.selectNode(treeNode);
	};
	var setting = {
		//异步加载
		async: {
			//开启异步加载
			enable: true,
			//请求加载的url
			url:"program/listTree.do",
			//异步加载时需要自动提交父节点属性的参数
			//id为tree中的id，下一句意思为将id属性的值赋给PID，即提交给url的参数为：PID=id的值
			autoParam: ["id=PID"]
		},
		callback: {
			onClick: zTreeOnClick,
			//异步加载成功后的操作
			onAsyncSuccess: zTreeOnAsyncSuccess
		}
	};
	// jquery 主体
	$(document).ready(function(){
		$('body').layout();
		$.fn.zTree.init($("#zzjgTree"), setting);
	});
</script>
</head>
<body>
<div id="zzjgTree" class="ui-layout-west ztree">Outer East</div>
<iframe id="zzjgContent" name="zzjgContent" width="100%" height="100%" src="article/list.do?PROGRAM_ID=0" class="ui-layout-center" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
</body>
</html>