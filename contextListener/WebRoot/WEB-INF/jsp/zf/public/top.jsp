<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	.new-message-icon{
		position: relative;
	    display: none;
	    font-size: 10px;
	    width: 6px;
	    height: 6px;
	    border-radius: 50%;
	    background-color: red;
	    bottom: 3px;
	    margin-left: 4px;
	}
	.new-m{
		display: none;
	    height: 7px;
	    width: 7px;
	    border-radius: 50%;
	    background-color: red;
	    position: absolute;
	    top: 8px;
	    right: -3px;
	}
</style>
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
						<a href="javascript:void(0);" rel="nofollow" onclick="dologin();">登录</a>
						<a href="register/goAdd" class="tongji" data-category="注册" data-label="header" rel="nofollow">注册</a>
					</c:when>
					<c:otherwise>
						<a href="javascript:void(0);" rel="nofollow">欢迎您，${sessionScope.sessionZfUser.USERNAME}</a>
						<a href="<%=basePath %>myAccount/message" id="unread-message" rel="nofollow"><span style="display: inline-block;height: 100%;position: relative;"><i class="fa fa-envelope-o" ></i><span class="new-m"></span></span></a>
						<a href="register/out" rel="nofollow">[退出]</a>
						<script type="text/javascript">
							//查询用户有没有未读站内信
						$.ajax({
							type : 'get',
							url : 'myAccount/havaUnreadMsg',
							dataType : 'json',
							success : function(rs){
								if(rs.msg == 'show'){
									$('.new-m').css('display','block');
								}
							}
						});
						</script>
					</c:otherwise>
				</c:choose>
                <!-- <a href="#">手机APP</a> -->
                <a href="zfarticle/safety?PROGRAM_ID=pg_bangzhu">帮助中心</a>
            </div>
        </div>
    </div>
    <div class="center main">
    	<div class="fl logo"><h1><a href="${basePath}"><img src="wj-static/images/logo.png" width="425px" alt="万金先生-专业安全的互联网金融投融资平台"></a></h1></div>
        <div class="fr mainmenu">
        	<ul class="clearfix">
				<li class="on" id="indexPage"><a href="">首页</a></li>
				<li class="goProjectList goDetails goInvestment goBuy"><a href="_project/goProjectList">我要理财</a></li>
				<li class="enjoylife"><a href="enjoylife">万金生活</a></li>
				<li class="loanPage"><a href="register/loanPage">我要借款</a></li>
				<li class="safety"><a href="zfarticle/safety?PROGRAM_ID=pg_baozhang">安全保障</a></li>
				<li class="list investList goInvestmentRecord fundsList recharge bindcard draw_cash draw_cash check investTicket realName userinvite"><a href="myAccount/list" rel="nofollow" style="padding:0 20px;">我的账户<!-- <i id="new-msg-icon" class="new-message-icon"></i> --></a>
			</ul>
        </div>
    </div>
</div>

<script type="text/javascript" >
(function(){
	var url = top.location.href;
	var urls = url.split('/');
	var thisTab = urls[urls.length-1].split('?')[0];
	$('.clearfix').find('.'+thisTab).addClass('on').siblings().removeClass('on');
})();
function dologin(){
	var url=top.location.href;
	var urls = url.split('/');
	var before=urls[urls.length-2];
	var after=urls[urls.length-1];
	if(before.match('wanjinxiansheng') && (after=='' || after==undefined)){
		window.location.href=getRootPath()+"/login_toZfLogin";
	}else if(before.match('wanjinxiansheng') && after!='' && after!=undefined){
		window.location.href=getRootPath()+"/login_toZfLogin?callback="+after;
	}else{
		window.location.href=getRootPath()+"/login_toZfLogin?callback="+before+"/"+after;
	}
		
}
</script> 

