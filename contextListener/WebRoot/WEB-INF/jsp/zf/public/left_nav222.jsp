<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="header2">
	<div class="main">
		<div class="menu">
			<a href="<%=basePath%>register/out"><button class="fr">退出</button></a>
			<a href="<%=basePath%>myAccount/list" class="list hover">账户概览</a>
            <a href="<%=basePath%>myAccount/qiyexinxi" class="qiyexinxi">企业信息</a>
            <a href="<%=basePath%>fundsflow/fundsList" class="fundsList">资金流水</a>
             <a href="<%=basePath%>myAccount/payment" class="payment">项目记录</a>
            <a href="<%=basePath%>myAccount/toTransfer" class="toTransfer">转账</a>
        </div>
     </div>
</div>
<script>
	(function(){
		//设置当前选中的导航标题
		var url = top.location.href;
		var urls = url.split('/');
		var thisTab = urls[urls.length-1].split('?')[0];
		$('.main .menu').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
		console.log("it's work!!!");
		if (thisTab == "qiyexinxi") {
			$('.left ul.nav').find(".realName").addClass('selected').siblings().removeClass('selected');
		} else if (thisTab == "liushuiList") {
			$('.left ul.nav').find(".fundsList").addClass('selected').siblings().removeClass('selected');
		} else if (thisTab == "toTransfer") {
			$('.left ul.nav').find(".transfer").addClass('selected').siblings().removeClass('selected');
		}
		//计算信息完整度
		var iii = 0;
		if(null != '${pd.USERNAME}' || '' != '${pd.USERNAME}'){
			//如果controller把最新的user信息传过来了，用最新的
			if(null != '${pd.BANK_CARK}' && '' != '${pd.BANK_CARD}'){
				iii++;
			}
			if(null != '${pd.EMAIL}' && '' != '${pd.EMAIL}'){
				iii++;
			}
			if(null != '${pd.TEL}' && '' != '${pd.TEL}'){
				iii++;
			}
			if(null != '${pd.ADRESS}' && '' != '${pd.ADRESS}'){
				iii++;
			}
			$('.left .top h6 b').css('width',parseInt(iii/4*100)+'%');
			$('.left .top h6 em').text(parseInt(iii/4*100));
		}else{
			//否则用session中的user信息
		}
	})();
</script>