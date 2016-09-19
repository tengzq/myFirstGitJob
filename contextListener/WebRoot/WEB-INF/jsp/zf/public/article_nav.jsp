<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="left">
	<div class="nav">
   	<ul>
       	<li class="company"><a href="<%=basePath%>information/about/company">公司介绍</a></li>
       	<li class="team"><a href="<%=basePath%>information/about/team">团队介绍</a></li>
       	<li class="contact"><a href="<%=basePath%>information/about/contact">联系我们</a></li>
       	<li class="joinus"><a href="<%=basePath%>information/about/joinus">加入我们</a></li>
       	<li class="mtbdgd"><a href="<%=basePath%>zfarticle/mtbdgd">最新动态</a></li>
       	<li class="risk"><a href="<%=basePath%>information/about/risk">风控管理</a></li>
       	<li class="safety"><a href="<%=basePath%>information/about/safety">资金安全</a></li>
       	<li class="guide"><a href="<%=basePath%>information/about/guide">新手指引</a></li>
       	<%-- <li class="ensure"><a href="<%=basePath%>information/about/ensure">安全保障</a></li> --%>
       </ul>
   </div>
</div>
<script>
	(function(){
		var url = top.location.href;
		var urls = url.split('/');
		var thisTab = urls[urls.length-1].split('?')[0];
		$('.left .nav ul').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
	})();
</script>