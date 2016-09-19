<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<!--[if (gt IE 9)|!(IE)]><!-->
<html>
<!--<![endif]-->
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<link href="jingtai/css/dialog_style.css" rel="stylesheet">
<meta charset="utf-8">
<base href='<%=basePath%>'>
<title>账房先生_专为账房投资理财打造的平台</title>
<meta name="keywords" content="账房先生,账房投资">
<meta name="description"
	content="账房先生是国内领先的互联网金融平台，专注于应收账款保理业务，账房投资理财就上账房先生网">
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">

<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>

<script>
// jquery 主体
$(document).ready(function(){
	// 填充需要记录的数据
	var val_array = new Array();
	val_array.push("TYPE=1");
	val_array.push("VIEW_ID=0");
	val_array.push("USER_ID=${sessionScope.sessionZfUser.USER_ID}");
	val_array.push("RANDOM_CODE=${RANDOM_CODE}");
	
	$.ajax({
	   type: "post",
	   url: "<%=basePath%>register/log",
	   data: val_array.join('&'),
	   success: function(msg){}
	 });
});
  




    $(function(){
    	//账房播报
    	$.ajax({
    		type:'POST',
    		data: {},
    		url:'zfReport/singleReport',
			dataType : 'json',
			success : function(data) {
				$("#invest").text((data.ReportList[0].total_invest).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('') + "元");
				$("#earn").text((data.ReportList[0].total_earn).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('') + "元");
			},
		});
		//投资风云榜
		$.ajax({
			type : 'POST',
			data : {},
			url : 'rechargeData/rechargeList',
			dataType : 'json',
			success : function(data) {
				for (var i = 1; i <11; i++){
					$("#rechargeName"+i).text((data.rechargedataList[i-1].username).substr(0,1)+"******"+(data.rechargedataList[i-1].username).substr(-1));    
					$("#rechargeAmount"+i).text("￥"+(data.rechargedataList[i-1].amount).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')+".00");
				}
    		},
    	});
    });
    

</script>

<script src="jingtai/js/zz.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="jingtai/css/style.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/slider.css">
		
</head>
<body>
	<div id="doc">
		<style>
.nav a i {
	display: block;
	position: absolute;
	width: 36px;
	height: 16px;
	line-height: 16px;
	color: #fff;
	background: #ff7744;
	border-radius: 5px;
	top: 50%;
	margin-top: -20px;
	left: 50%;
	margin-left: 38px;
	text-align: center;
	font-style: normal;
	font-size: 12px;
}
</style>
		<%@ include file="../public/top.jsp"%>

		<div id="bd">
			<div class="banner">
				<div id="slider1_container" style="width: 1400px; height: 355px;">
					<div u="slides"
						style="cursor: move; position: absolute; overflow: hidden; left: 0px; top: 0px; width: 1400px; height: 355px;">
						<!-- <div>
							<a
								style="background:url('https://s1.lantouzi.com/img/201505/518/douniu2_banner.jpg') center top no-repeat #f1712d;"
								href="" target="_blank"></a>
						</div>
						<div>
							<a
								style="background:url('https://s1.lantouzi.com/img/201505/ryuyan/banner_new3.jpg') center top no-repeat #1b1b1b;"
								href="" target="_blank"></a>
						</div>
						<div>
							<a
								style="background:url('https://s1.lantouzi.com/img/lingqian/lingqian9dian.jpg') center top no-repeat #f5de73;"
								href="" target="_blank"></a>
						</div>
						<div>
							<a
								style="background:url('https://s1.lantouzi.com/img/201505/alun_new/alun_banner_new.jpg') center top no-repeat #da8600;"
								href="" target="_blank"></a>
						</div> -->
						
					</div>
					<script type="text/javascript">
					(function(){
						$.ajax({
							type : 'post',
							url : '<%=basePath%>ad/mainAd',
							data : {LIMIT:5,PROGRAM_ID:'ad_main_slide'},
							async : false,
							dataType : 'json',
							success : function(data){
								console.log(data);
								if(data.msg=="success"){
									console.log('成功');
									
									var htmls="";
									$.each(data.adList,function(key,val){
										var html = "";
										html+='<div style="width:'+$(window).width()+'px;">';
										html+='<a style="background:url('+val.FILE_PATH+') center top no-repeat '+val.BGCOLOR+';" href='+val.URLPATH+' target="_blank"></a>';
										html+='</div>';
										
										htmls+=html;
										/* transform: perspective(2000px); */
									});
									 
									$("div[u=slides]").html(htmls);
								}
							}
						});
					})();
					</script>
					<div u="navigator" class="jssorb21" style="bottom: 16px; right: 6px;">
						<div u="prototype"></div>
					</div>
					<span u="arrowleft" class="jssora21l" style="top: 123px; left: 8px;"></span> 
					<span u="arrowright" class="jssora21r" style="top: 123px; right: 8px;"></span>
				</div>
						<div class="user-panel">
						<c:choose>
							<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
							      <div class="notlogin">
									<h3>
										<strong>35</strong>倍<br />活期存款收益
									</h3>
									<span class="welcome"></span> <a class="reg"
										href="register/goAdd" title="注册领红包" rel="nofollow"><span></span>注册领红包</a>
									<p>
										已有账户?<a href="login_toZfLogin" title="立即登录"
											rel="nofollow">立即登录</a>
									</p>
									</div>
							</c:when>
							<c:otherwise>
								<div class="logined">
								<h3>欢迎使用账房先生</h3>
								<span class="welcome"></span>
									<div>
										<ul class="amount-info">
											<li><span>可用余额：</span><em><span>${sessionScope.sessionZfUser.BALANCE}</span></em> 元</li>
											<li><span>我的投资券：</span><a href="investrecord/investTicket" title="我的投资卷">${sessionScope.sessionZfUser.TICKET}</a></li>
										</ul>
										<a href="myAccount/list" class="btn btn-1 btn-mgn">管理我的账户</a>
									</div>
									<div class="ft">
										<a href="myAccount/recharge" class="recharge tongji" data-category="首页-充值" data-label="index">充值</a>
										<a href="myAccount/draw_cash" class="withdrawal tongji" data-category="首页-提现" data-label="index">提现</a>
										<b class="red-dot"></b>
									</div>
								</div>
							     </c:otherwise>
						       </c:choose>
				            </div>
						</div>
			</div>
			<div class="starpart">
				<div class="content">
					<div class="notice clearfix">
						<h2>最新公告</h2>
						<c:forEach items="${noticePmList}" var="nnt" varStatus="vs">
						<a href="zfarticle/toNotice?id=${nnt.ARTICLE_ID}" target="_blank" 
							title="${nnt.TITLE}" class="notice-title">${nnt.TITLE}</a>
						</c:forEach>
						<!-- 
						<a href="" target="_blank"
							title="2015年5月23日项目回款完毕公告" class="notice-title"
							style="display:none">2015年5月23日项目回款完毕公告</a> 
						<a href="" target="_blank"
							title="2015年5月22日项目回款完毕公告" class="notice-title"
							style="display:none">2015年5月22日项目回款完毕公告</a> 
							 -->
						<a href="zfarticle/notice" target="_blank" title="更多公告"
							class="notice-more">更多</a>
					</div>
					<!--Spring Festival Start-->
					<div style="width:980px;height:90px;position:relative">
						<div
							style="position:absolute;bottom:-6px;width:980px;height:60px;background:url('https://s1.lantouzi.com/img/201502/festival/index_notice_b.png') no-repeat;text-align:center;font-size:14px;color:#dd5561;line-height:60px;">
							为保证资产优质，小懒正在努力审核。每日 <strong style="font-size:20px">10:00、14:00、20:00</strong>
							发标，其余时间随机上标。
						</div>
					</div>
					<!--Spring Festival End-->
					<div class="star-project">
						<div class="star-title">
							<img src="https://s1.lantouzi.com/img/201501/homepage_king.png"
								width="70px" height="70px" />
							<h2>斗牛行动</h2>
							<p>
								浮动收益<br /> 最高20%
							</p>
						</div>
						<div class="star-earnings">
							<p>
								<strong>11.00</strong>%
							</p>
							<p>年化收益率</p>
							<a class="hd-patch douniu"
								href="" target="_blank">最高20%</a>
						</div>
						<div class="star-info">
							<p>
								<em>项目期限</em> <strong>9</strong>个月
							</p>
							<p>
								<em>剩余金额</em> 1,149,400元
							</p>
						</div>
						<a href="" title="账房计划9月期1069"
							class="button tongji" data-category="明星-马上投资" data-label="index">马上投资</a>
						<span class="bottom_line"></span>
					</div>
				</div>
			</div>
			<div class="mainpart">
				<div class="content">
					<h2>更多产品</h2>
					<ul class="clearfix">
						<li>
							<div class="project">
								<h3>短期灵活</h3>
								<a href="" title="账房计划2月期1042">
									<div class="project-profit" data-rate="0.5606">
										<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>1.00%</span>
										<p>
											<strong>7</strong><span>.50%</span><br />年化收益率
										</p>
										<canvas width="210px" height="210px"></canvas>
									</div>
								</a>
								<div class="project-info">
									<strong> 2个月 </strong>
									<p>剩余金额：878,800元</p>
									<a href="" title="马上投资"
										class="button tongji" data-category="短期灵活-马上投资"
										data-label="index">马上投资</a>
								</div>
							</div>
						</li>

						<li>
							<div class="project">
								<h3>中期稳健</h3>
								<a href=""
									title="账房计划保理3月期1075">
									<div class="project-profit" data-rate="0.30925">
										<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>2.00%</span>
										<p>
											<strong>8</strong><span>.00%</span><br />年化收益率
										</p>
										<canvas width="210px" height="210px"></canvas>
									</div>
								</a>
								<div class="project-info">
									<strong> 3个月 </strong>
									<p>剩余金额：1,381,500元</p>
									<a href="" title="马上投资"
										class="button tongji" data-category="中期稳健-马上投资"
										data-label="index">马上投资</a>
								</div>
							</div>
						</li>

						<li>
							<div class="project">
								<h3>长期猛赚</h3>
								<a href="" title="账房计划6月期1030">
									<div class="project-profit" data-rate="0.9257">
										<div class="platform_rate_tips"></div>
										<span title="额外补息" class="platform_rate"><sub>+</sub>1.00%</span>
										<p>
											<strong>10</strong><span>.00%</span><br />年化收益率
										</p>
										<canvas width="210px" height="210px"></canvas>
									</div>
								</a>
								<div class="project-info">
									<strong> 6个月 </strong>
									<p>剩余金额：148,600元</p>
									<a href="" title="马上投资"
										class="button tongji" data-category="长期猛赚-马上投资"
										data-label="index">马上投资</a>
								</div>
							</div>
						</li>


					</ul>
				</div>
			</div>
			<div class="advantagepart">
				<div class="content clearfix">
					<h2>账房计划优势</h2>
		<img src="jingtai/img/homepage_advantage.png" title="账房计划优势" width="980px" height="355px">
		<div class="ranking">
			<div class="ranking-title">
				<h3>投资风云榜</h3>	
			</div>
			<div class="tuhao clearfix">
			<table class="first">
				<tbody>
				   <tr>
						<td style="text-align: center;" width="15%">1</td>
						<td width="55%" id="rechargeName1">q***o</td>
						<td width="30%" id="rechargeAmount1">￥5,487,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">2</td>
						<td width="55%" id="rechargeName2">y***n</td>
						<td width="30%" id="rechargeAmount2">￥5,047,700.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">3</td>
						<td width="55%" id="rechargeName3">j***1</td>
						<td width="30%" id="rechargeAmount3">￥3,356,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">4</td>
						<td width="55%" id="rechargeName4">y***2</td>
						<td width="30%" id="rechargeAmount4">￥3,272,300.00</td>
					</tr>
									<tr>
						<td style="text-align: center;" width="15%">5</td>
						<td width="55%" id="rechargeName5">b***t</td>
						<td width="30%" id="rechargeAmount5">￥2,987,600.00</td>
					</tr>
					</tbody>
				</table>
				<table>
									<tbody><tr>
						<td width="15%">6</td>
						<td width="55%" id="rechargeName6">x***y</td>
						<td width="30%" id="rechargeAmount6">￥2,479,400.00</td>
					</tr>
									<tr>
						<td width="15%">7</td>
						<td width="55%" id="rechargeName7">y***e</td>
						<td width="30%" id="rechargeAmount7">￥2,467,000.00</td>
					</tr>
									<tr>
						<td width="15%">8</td>
						<td width="55%" id="rechargeName8">y***u</td>
						<td width="30%" id="rechargeAmount8">￥2,459,000.00</td>
					</tr>
									<tr>
						<td width="15%">9</td>
						<td width="55%" id="rechargeName9">L***u</td>
						<td width="30%" id="rechargeAmount9">￥2,437,700.00</td>
					</tr>
									<tr>
						<td width="15%">10</td>
						<td width="55%" id="rechargeName10">l***g</td>
						<td width="30%" id="rechargeAmount10">￥2,431,300.00</td>
					</tr>
					</tbody>
				</table>
			</div>
			<span class="bottom_line"></span>
		</div>
		<div class="broadcast">
			<h3>账房播报</h3>
			<div class="lr-total">
				<h4><span>账房累计投资</span></h4>
				<p id="invest"></p>
			</div>
			<div class="lr-total">
				<h4><span style="margin-left:-56px">为账房赚取</span></h4>
				<p id="earn"></p>
			</div>
			<span class="bottom_line"></span>
		</div>
				</div>
			</div>
			<div class="line clearfix">
				<div class="lineOne"></div>
				<div class="lineTwo"></div>
				<img src="https://s1.lantouzi.com/img/ltz/homepage_line_2.png">
			</div>
			<div class="thankpart">
				<div class="content">
					<img src="https://s1.lantouzi.com/img/ltz/homepage_thank_v2.jpg"
						title="我们能给你的不只是财富，更多的是一份感动" width="980px" height="380px" />
				</div>
			</div>
			<div class="home-feedback">
				<!-- <div class="crazymay_nav">
		<p class="crazy_fcb">Apple Watch<br/>Macbook<br/>疯抢中</p>
		<p class="mt5">距活动结束还剩</p>
		<p id="crazy_time">0天0小时0分</p>
		<div class="btn-wrap" id="crazy_btn">
			<a href="https://lantouzi.com/zt/crazymay" class="crazy_btn"><img src="https://s1.lantouzi.com/img/201505/crazymay/crazy_btn_v2.png" alt="马上去抢"></a>
		</div>
	</div> -->
				<a
					href=""
					target="_blank" title="在线客服" rel="nofollow"><i
					class="ol-service"></i>在线客服</a> <a id="backTop" title="回到顶部"
					rel="nofollow"><i class="backtop"></i>回到顶部</a>
			</div>
			<div class="home-alert-temp"
				style="display:none;width: 100%;height: 100%;position: fixed;top: 0;background-color: rgba(0,0,0,0.6);z-index:9999"
				id="home-licaijie">
				<div style="width:680px;height:520px;position: absolute;margin-left:auto;margin-right:auto;left:0;right:0;top:0px;bottom:0px;margin-top:auto;margin-bottom:auto;background:url('')">
					<div style="width:100%;height:100%;position:relative;">
						<a id="close-home"
							style="position: absolute;width:50px;height:50px;right: 46px;top: 0;cursor: pointer;"></a>
						<a id="goto-licaijie"
							style="position: absolute;width: 250px;height: 70px;bottom: 139px;left: 300px;cursor: pointer;"
							href=""></a>

					</div>
				</div>
			</div>
			<script type="text/tmpl" id="dialog-tmpl">
<div class="dg_wrapper home-feedback-dialog">
	<h3>意见反馈<span class="close-btn" title="关闭">X</span></h3>
	<textarea id="feedback-content" cols="30" rows="10" maxlength="300" autocomplete="off" placeholder="您的意见对我们十分重要，请您不吝指教。"></textarea>
	<a class="btn" id="feedback-submit">递交反馈</a>
	<p class="feedback-success"><i></i>感谢您的反馈！</p>
</div>
</script>
	
			<script src="jingtai/js/jssor.js"></script>
			<script src="jingtai/js/jssor.slider.mini.js"></script>	
			<script>
				
			
			
				/* Notice */
				function Notice(time) {
					var $notice = $('.notice-title'), length = $notice.length, count = 1, speed = time || 3 * 1000, t;

					Notice.prototype.play = function() {
						t = setInterval(function() {
							$notice.eq(count).show().siblings('.notice-title')
									.hide();
							if (count < length - 1) {
								count++;
							} else {
								count = 0;
							}
						}, speed);
					};

					Notice.prototype.pause = function() {
						clearInterval(t);
					};

				}

				function slider() {
					var _SlideshowTransitions = [ {
						$Duration : 1200,
						x : 1,
						$Easing : {
							$Left : $JssorEasing$.$EaseInOutQuart,
							$Opacity : $JssorEasing$.$EaseLinear
						},
						$Opacity : 2,
						$Brother : {
							$Duration : 1200,
							x : -1,
							$Easing : {
								$Left : $JssorEasing$.$EaseInOutQuart,
								$Opacity : $JssorEasing$.$EaseLinear
							},
							$Opacity : 2
						}
					} ];
					var options = {
						$BulletNavigatorOptions : {
							$Class : $JssorBulletNavigator$,
							$ChanceToShow : 2,
							$SpacingX : 7,
							$AutoCenter : 1
						},
						$ArrowNavigatorOptions : {
							$Class : $JssorArrowNavigator$,
							$ChanceToShow : 2,
							$AutoCenter : 2
						},
						$SlideshowOptions : {
							$Class : $JssorSlideshowRunner$,
							$Transitions : _SlideshowTransitions,
							$TransitionsOrder : 1,
							$ShowLink : true
						},
						$PauseOnHover : 3,
						$AutoPlayInterval : 3000,
						$SlideDuration : 200,
						$AutoPlay : true
					};
					var jssor_slider1 = new $JssorSlider$('slider1_container',
							options);

					//responsive code begin
					//you can remove responsive code if you don't want the slider scales
					//while window resizes
					function ScaleSlider() {
						var parentWidth = $('#slider1_container').parent()
								.width();
						if (parentWidth) {
							jssor_slider1.$ScaleWidth(parentWidth);
						} else
							window.setTimeout(ScaleSlider, 30);
					}
					//Scale slider after document ready
					ScaleSlider();

					//Scale slider while window load/resize/orientationchange.
					$(window).bind("load", ScaleSlider);
					$(window).bind("resize", ScaleSlider);
					$(window).bind("orientationchange", ScaleSlider);
				}



				$(document)
						.ready(
								function(e) {
									//platform rate
									$('.platform_rate').on(
											'mouseenter',
											function(event) {
												event.preventDefault();
												$(this).siblings(
														'.platform_rate_tips')
														.show();
											});
									$('.platform_rate').on(
											'mouseleave',
											function(event) {
												event.preventDefault();
												$(this).siblings(
														'.platform_rate_tips')
														.hide();
											});
									//Notice
									var ntc = new Notice();
									ntc.play(3000);
									$('.notice').on('mouseenter', function(e) {
										ntc.pause();
									}).on('mouseleave', function(e) {
										ntc.play();
									});
									//slider
									slider();
									//feedback
									
									

								});
			</script> 
		</div>
<%@ include file="../public/foot.jsp"%>

		
	</div>
</body>
</html>
