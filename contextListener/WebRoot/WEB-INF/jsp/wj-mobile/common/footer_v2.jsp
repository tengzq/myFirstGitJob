<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <footer>
	<ul>
		<li><a href="mobile/invitation">邀请码机制</a></li>
		<li><a href="newspage/safetylist.html">安全保障</a></li>
		<li><a href="mobile/question">常见问题</a></li>
		<li>
			<c:choose>
				<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
					<a href="mobile/login"><span>登陆/注册</span></a>
				</c:when>
				<c:otherwise>
					<a href="mobile/personal/info"><span>个人中心</span></a>
				</c:otherwise>
			</c:choose>
		</li>
		<!-- <li><a href="mobile/login"><span>登陆/注册</span></a></li> -->
	</ul>
</footer> --%>
<div class="p16">
	<a href="mobile/invitation">邀请码机制</a>｜
	<a href="newspage/safetylist.html">安全保障</a>｜
	<a href="mobile/question">常见问题</a>｜
	<c:choose>
		<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
			<a href="mobile/login" class="lanzi">登陆/注册</a>
		</c:when>
		<c:otherwise>
			<a href="mobile/personal/info" class="lanzi">个人中心</a>
		</c:otherwise>
	</c:choose>
</div>
<p style="display: none"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256242491'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1256242491%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script></p>