<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="header">
	<div class="top">
        <div class="main">
            <div class="fl">
                <span>联系电话：4008 337 520</span>
                <b>(工作日9:00 am-9:00 pm)</b>
                <span class="expand weibo">
                	<i class="fa fa-weibo"></i>
                	<div class="pop">
						<em></em>   
						<span></span>
						<p>欢迎关注万金先生官方微博</p>
						<p><a href="http://weibo.com/u/5665865075" style="color:#000">@万金先生官方微博</a></p>
					</div>
                </span>
                <span class="expand weixin">
                	<i class="fa fa-weixin"></i>
                	<div class="pop">
						<em></em>   
						<span></span>
						<p>扫一扫关注万金先生微信</p>
						<img src="wj-static/images/index1_31.png" alt="扫一扫关注万金先生官方微信：万金理财" />
						<p>微信号：万金理财</p>
					</div>
               	</span>
            </div>
            <div class="fr">
            	<c:choose>
					<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
						<a href="login_toZfLogin" rel="nofollow"">登录</a>
						<a href="register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);" rel="nofollow">欢迎您，${sessionScope.sessionZfUser.USERNAME}</a>
						<a href="register/out" rel="nofollow">[退出]</a>
					</c:otherwise>
				</c:choose>
                <!-- <a href="#">手机APP</a> -->
                <a href="zfarticle/safety?PROGRAM_ID=pg_bangzhu">帮助中心</a>
            </div>
        </div>
    </div>
</div>
