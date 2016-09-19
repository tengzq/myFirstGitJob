<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我要借款</title>
    <link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body div{border:0;margin:auto;padding:0;text-align:center;vertical-align:center;}
		.btn{width:30px;height:16px;background-color:#00a7d1;color:white;}
		strong{color:red}
		table{margin:auto}
	</style>
	
	
  </head>
  
  <body>
    <div id="main">
    	<table>
    		<tr>
    			<th>请输入姓名：</th>
    			<td>
    				<input type="text" id="NAME" name="NAME" placeholder="请输入姓名"/>
    			</td>
    		</tr>
    		<tr>
    			<th>请输入手机号：</th>
    			<td>
    				<input type="text" id="TEL" name="TEL" placeholder="请输入手机号" width="120px"/>
    			</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<span class="btn"><a href="javascript:apply();">立即申请</a></span>
    			</td>
    		</tr>
    	</table>
    	
    </div>
    <script type="text/javascript" src="<%=basePath%>static/1.9.1/jquery.min.js"></script>
    <script type="text/javascript">
    	function apply(){
    		var name=$("#NAME").val(),tel=$("#TEL").val();
    		if(confirm('您的姓名为：'+name+'，联系方式为：'+tel+'\u000d是否确认？')){
    			$.ajax({
        			type : 'post',
        			url : 'loan/doApply',
        			data : {NAME:name,TEL:tel},
        			dataType : 'json',
        			success : function(data){
        				if(data.msg=='success'){
        					var result=data.result;
        					alert(data.result);
        					var html='<strong>'+result.NAME+'</strong>,您的借款申请已经收到，之后会有专员与您联系，请保持联络号<strong style="color:red">'+result.TEL+'</strong>畅通！';
        					html+='<br/>';
        					html+='<span class="btn"><a href="<%=basePath%>">返回主页</a></span>';
        					$("#main").html(html);
        					
        				}
        			}
        		});
    		}
    		
    	}
    </script>
  </body>
</html>
