<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生-专业安全的互联网金融投融资平台</title>
<meta name="keywords" content="万金先生">
<meta name="Description" content="万金先生是中国更安全的P2P网贷平台,专业的P2P理财专家为投资理财人士提供安全、高收益的投资理财产品,万金先生为中小企业和信用良好的个人提供P2P网贷、P2P贷款、p2p理财、网络贷款等服务。 K 万金先生,P2P贷款网,互联网理财,万金先生官网"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/index.css" rel="stylesheet" type="text/css">


<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="//modernizr.com/downloads/modernizr-latest.js" type="text/javascript" charset="utf-8"></script>
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
    	if(window.innerWidth<1440){
			$('.pic img').eq(0).css('margin-left','-300px');
		}
    	
    
    	//明星项目进度条
   		/* var baifenbi=Math.floor(${(onlyStar.TOTAL_RAISE_AMOUNT-onlyStar.SURPLUS_RAISE_AMOUNT)/onlyStar.TOTAL_RAISE_AMOUNT*100});
   		$(".barbox.${onlyStar.PROJECT_ID}").find("p").css("width",baifenbi+"px");
   		$(".txt.${onlyStar.PROJECT_ID}").text(baifenbi+"%"); */
		
		//公告
   		var $newsContent = $('.index1>.main>div').eq(1);
    	$.ajax({
    		type:'POST',
    		data: {},
    		url:'zfarticle/noticelist',
			dataType : 'json',
			async : false,
			success : function(data) {
				var html=''
				for(var i=0;i<data.noticePlist.length;i++){
					/* html+='<span><a href="zfarticle/toNotice?id='+data.noticePlist[i].ARTICLE_ID+'">'+data.noticePlist[i].TITLE+'</a></span>' */
					html+='<span>'+data.noticePlist[i].TITLE+'</span>'
				}
				$newsContent.append(html);
				gonggao();
			},
		});
		function gonggao(){
			var $newsContent = $('.index1>.main>div').eq(1);
			var $newsItem = $newsContent.find('span');
			var newsCount = $newsItem.length;
			var oneNewsH = $newsItem.eq(0).height();
			var newsListH = parseInt(newsCount) * parseInt(oneNewsH);
			var $newsList = $newsContent.html();
			$newsContent.append($newsList);
			var index = 1;
			setInterval(function(){
				if (parseInt($newsContent.css('margin-top'))<=-parseInt(newsListH)) {
					$newsContent.css('margin-top',0);
					index=1;
				}
				$newsContent.animate({
					'margin-top':'-' + (40 * parseInt(index)) + 'px'
				},2000);
				index++;
			},4000);
		}
    
    	//万金播报
    	$.ajax({
    		type:'POST',
    		data: {},
    		url:'zfReport/singleReport',
			dataType : 'json',
			success : function(data) {
				$(".leiji").text((data.ReportList[0].total_invest).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('') + "元");
				$(".zhuanqu").text((data.ReportList[0].total_earn).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('') + "元");
				var zqNum=(data.ReportList[0].total_earn/10000).toString();
				var cjNum=(data.ReportList[0].total_invest/100000000).toString();
				//$(".zqW").text(parseInt(zqNum.substring(0,zqNum.indexOf('.')))+1);
				$(".cjY").text(parseInt(cjNum.substring(0,cjNum.indexOf('.')))+1);
				html1='<span>累计投资：'+(data.ReportList[0].total_invest).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')+'元<span>'; 
				html2='<span>累计为用户赚取：'+(data.ReportList[0].total_earn).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('') + '元</span>';
				$('.data-report-div>.data-report>div').eq(1).append(html1);
				$('.data-report-div>.data-report>div').eq(1).append(html2);
				data_report();
			},
		});
		
		function data_report(){
			var $dataContent = $('.data-report-div>.data-report>div').eq(1);
			var $newsItem = $dataContent.find('span');
			var newsCount = $newsItem.length;
			var oneNewsH = $newsItem.eq(0).height();
			var newsListH = parseInt(newsCount) * parseInt(oneNewsH);
			var $newsList = $dataContent.html();
			$dataContent.append($newsList);
			var index = 1;
			setInterval(function(){
				if (parseInt($dataContent.css('margin-top'))<=-parseInt(newsListH)) {
					$dataContent.css('margin-top',0);
					index=1;
				}
				$dataContent.animate({
					'margin-top':'-' + (40 * parseInt(index)) + 'px'
				},2000);
				index++;
			},4000);
		}
		//投资风云榜
		<%--
		var html='';
		$.ajax({
			type : 'POST',
			data : {},
			url : 'rechargeData/rechargeList',
			dataType : 'json',
			success : function(data) {	
				for(var i=0;i<2;i++){
					html='';
					html+='<ol>';
					if(i==0){
						for(var j=1;j<6;j++){
						/* html+='<li><a href="#"><span>'+j+'</span>'; */
						html+='<li><span>'+j+'</span>';
						html+='<b>'+(data.rechargedataList[j-1].username).substr(0,1)+'******'+(data.rechargedataList[j-1].username).substr(-1)+'</b>';
						/* html+='<i>￥'+(data.rechargedataList[j-1].amount).toString().split("").reverse().join("").replace(/(\d{3})/g,"$1,").replace(/\,$/,"").split("").reverse().join("")+'.00</i></a></li>'; */
						html+='<i>￥'+(data.rechargedataList[j-1].amount).toString().split("").reverse().join("").replace(/(\d{3})/g,"$1,").replace(/\,$/,"").split("").reverse().join("")+'.00</i></li>';
						}
						html+='</ol>';
						$(".fyb").append(html);
					}
					if(i==1){
						for(var j=6;j<11;j++){
						/* html+='<li><a href="#"><span>'+j+'</span>'; */
						html+='<li><span>'+j+'</span>';
						html+='<b>'+(data.rechargedataList[j-1].username).substr(0,1)+'******'+(data.rechargedataList[j-1].username).substr(-1)+'</b>';
						/* html+='<i>￥'+(data.rechargedataList[j-1].amount).toString().split("").reverse().join("").replace(/(\d{3})/g,"$1,").replace(/\,$/,"").split("").reverse().join("")+'.00</i></a></li>'; */
						html+='<i>￥'+(data.rechargedataList[j-1].amount).toString().split("").reverse().join("").replace(/(\d{3})/g,"$1,").replace(/\,$/,"").split("").reverse().join("")+'.00</i></li>';
						}
						html+='</ol>';
						$(".fyb").append(html);	
					}
					
				}
    		},
    	}); --%>
    });
</script>
</head>

<body>
<%@ include file="../public/top.jsp"%>
<div class="mainbanner">
	<div class="MB1"> 
    	<div class="bodymain">
            <div class="window" >
                <div class="pic"></div>
                <div class="bottom">
		        	<div class="main">
		            	<ul class="fr">
		                	
		                </ul>
		            </div>
       			</div>
            </div>
        </div>
        <!-- <div class="leftBTN">
        </div>
        <div class="rightBTN">
        </div> -->
        
        <script type="text/javascript">
			(function(){
				var width=$(window).width();
				$.ajax({
					type : 'post',
					url : '<%=basePath%>ad/mainAd',
					data : {LIMIT:5,PROGRAM_ID:'ad_main_slide'},
					async : false,
					dataType : 'json',
					success : function(data){
						//console.log(data);
						if(data.msg=="success"){
							var htmls="";
							var bannerAnchor = "";
							$.each(data.adList,function(key,val){ 
								var html = "";
								html+='<a href="'+val.URLPATH+'" style="background-image:url('+val.FILE_PATH+');width:'+width+'px;">';
								//html+='<img src="'+val.FILE_PATH+'" style="width:'+width+';height: 410px;">';
								html+='</a>';
								htmls+=html;
								bannerAnchor +='<li></li>'
							});
							$("div[class=pic]").html(htmls);
							$('.bottom ul.fr').html(bannerAnchor);
							jQuery(".window").slide({
				    			mainCell : ".pic",
				    			autoPlay : true,
				    			titCell : ".bottom ul li",
				    			interTime : 3000,
				    			titOnClassName : "hover",
				    			trigger : "click",
				    			effect : "leftLoop"
				   			});
						}
					}
				});
			})();
		</script>
    </div>
    <div class="main">
    <div class="layer">
    	<c:choose>
			<c:when test="${sessionScope.sessionZfUser.USERNAME == null||sessionScope.sessionZfUser.USERNAME ==''}">
     			<div>
					<h3>每月优质资产，限量发售</h3>
        			<p style="text-align: center"><span class="zqW">5000</span>万元</p>
        			<p style="text-align: center;">500强企业优质资产，银行千亿级受信企业</p>
					<a href="register/goAdd" title="注册领红包" rel="nofollow" style="color: white;"><button>前去注册</button></a>
					<p style="line-height: 50px;float: right;">已有账户?<a href="login_toZfLogin" title="立即登录"rel="nofollow" style="color: #2e9dd0;">立即登录</a></p>
				</div>
			</c:when>
			<c:otherwise>
				<div class="logined">
					<h3>欢迎使用万金先生</h3>
					<span class="welcome"></span>
				<div>
					<ul class="amount-info">
						<li>可用余额：<em><span>${sessionScope.sessionZfUser.BALANCE} </span></em> 元</li>
						<li><span>我的投资券：</span><a href="investrecord/investTicket" title="我的投资卷">${sessionScope.sessionZfUser.TICKET}</a></li>
					</ul>
					<button><a href="myAccount/list" class="btn-mgn">管理我的账户</a></button>
				</div>
				<div class="ft">
					<a href="myAccount/recharge" class="recharge tongji" data-category="首页-充值" data-label="index">充值</a>
					<a href="myAccount/draw_cash" class="withdrawal tongji" data-category="首页-提现" data-label="index">提现</a>
				</div>
			</div>
     	</c:otherwise>
  	 </c:choose>
    </div>
    </div>
</div>
<div class="maibody">
	<div class="index1" style="background:#fff;">
    	<div class="main">
        	<div><span>新公告</span>|</div>
            <div></div>
            <a href="zfarticle/notice" class="fr">更多</a>
        </div>
    </div>
    <div class="index2 main" style="width: 1050px;">
    	<!-- <div class="box no-hover" style="width: 380px;">
        	<a href="zfarticle/safety?PROGRAM_ID=pg_baozhang">zfarticle/safety?PROGRAM_ID=pg_baozhang
                <img src="wj-static/images/index_05.png" height="98px;">
                <h3>安全保障</h3>
                <p>所有投资标的100%适用本金保障计</p>
                <p>划，万金先生资金已被<b>招商银行</b>托</p>
                <p>管，有效保障理财人的本金安全。</p>
            </a>
        </div>
    	<div class="box no-hover" style="width:305px;">
            <a href="zfarticle/safety?PROGRAM_ID=pg_about">zfarticle/safety?PROGRAM_ID=pg_about
                <img src="wj-static/images/index_07.png" height="100px">
                <h3>专业团队</h3>
                <p>规范操作</p>
                <p>创始人团队来自<b>清华，北大</b></p>
                <p> 高管全部来源于银行系</p>
                
            </a>
        </div>
    	<div class="box no-hover" style="border-right: none;width: 360">
        	<a href="_project/goProjectList" style="border-right: none">zfarticle/safety?PROGRAM_ID=pg_bangzhu
                <img src="wj-static/images/index_09.png" style="height: 98px;margin-top:1px;">
                <h3>简单赚钱</h3>
                <p>成为投资人，通过主动投标</p>
                <p>享受邀请码机制</p>
                <p>最高获得<b>12-15%</b>的预期年化收益。</p>
            </a>
        </div> -->
        <ul class="content-desc clearfix">
			<li>
				<dl>
					<dt>安全才是王道</dt>
					<dd>风险备用金提供全年安全保障</dd>
					<dd>风险备用金1亿元</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>有钱才能任性</dt>
					<dd>会理财，好先生，最高18%年化收益</dd>
				</dl>
			</li>
			<li>
				<dl>
					<dt>有心才有服务</dt>
					<dd>7X12小时贴心客服</dd>
					<dd>9:00am-9:00pm</dd>
				</dl>
			</li>
		</ul>
    </div>
    <div class="clear"></div>
    <div class="index3">
    	<div class="main">
        	<div class="stytitle1">
            	<div class="fl">年计划</div>
                <div class="small-title"><!--  class="fr" -->
                	<h3 style="color:#e9953f;margin-bottom:6px;"><sub>适合闲置资金</sub></h3>
                    <p>长期投资，赚钱高收益</p>
                </div>
            </div>
            <div class="con">
            	<div class="box">
                	<img src="wj-static/images/index_15.png">
                    <h3>单笔投资</h3>
                    <p style=" font-size: 17px; ">单笔<span><fmt:formatNumber value="${onlyStar.LOWEST_AMOUNT }" pattern="0"/></span>起</p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/index_17.png">
                    <h3>预期年化收益</h3>
                    <p><span><fmt:formatNumber value="${onlyStar.BASE_INTEREST_RATE }" pattern="0"/>%</span></p>
                </div>
            	<div class="box">
                	<img src="wj-static/images/index_19.png">
                    <%-- <h3>锁定期</h3> --%>
                    <%-- <p>${onlyStar.ETIME }</p> --%>
                    <p class="year-last"><span>${onlyStar.DEADLINE }</span>天</p>
                    <h4>剩余金额：${onlyStar.SURPLUS_RAISE_AMOUNT }元</h4>
                   	<c:if test="${onlyStar.PROJECT_STATE==1}">
                   		<h4>剩余金额：${onlyStar.SURPLUS_RAISE_AMOUNT }元</h4>
                   		<button class="touzi" style="background: #EA943F"><a href="_project/goDetails.do?ID=${onlyStar.PROJECT_ID}"> <span>立即投资</span><i class="fa fa-angle-right circle"></i></a></button>
                   	</c:if>
                    <c:if test="${onlyStar.PROJECT_STATE!=1}">
                   		<h4>剩余金额：0元</h4>
                   		<button class="touzi" style="background: #ccc;"><a href="_project/goDetails.do?ID=${onlyStar.PROJECT_ID}"> <span>卖光了</span></a></button>
                   	</c:if>
                </div>
                <%-- <div class="box" style=" width:15%; float:right ;margin:0;">
                	<h4>剩余金额：${onlyStar.SURPLUS_RAISE_AMOUNT }元</h4>
                    <div class="bar">
                    	<div class="barbox fl ${onlyStar.PROJECT_ID}">
                        	<p style="background-color:#2e9dd0; height: 100%;"></p>
                        </div>
                        <div class="txt fl ${onlyStar.PROJECT_ID}"></div>
                    </div>
                    <button class="touzi" style="background: #EA943F"><a href="_project/goDetails.do?ID=${onlyStar.PROJECT_ID}"> <span>立即投资</span><i class="fa fa-angle-right circle"></i></a></button>
                </div> --%>
            </div>
        </div>
    </div>
    <div class="index4">
    	<div class="main">
        	<div class="stytitle1">
            	<div class="fl">月计划</div>
                <div class="small-title"><!--  class="fr" -->
                	<h3 style="color:#2b9ad2;margin-bottom:6px;">轻松赚钱</h3>
                    <p>一次投资，省心省事</p>
                </div>
            </div>
            <div class="con">
            <c:forEach items="${recommend }" var="list">
            	
            	<div class="box">
                	<div class="project-profit" data-rate="${(list.TOTAL_RAISE_AMOUNT-list.SURPLUS_RAISE_AMOUNT)/list.TOTAL_RAISE_AMOUNT}">
						<div class="platform_rate_tips" style="display: none;"></div>
						<span title="额外补息" class="platform_rate"><sub>+</sub>${list.BOSS_INTEREST_RATE }%</span>
						<c:set var="base" value="${list.BASE_INTEREST_RATE }"></c:set>
						<section>
							<div class="strong-rate">${fn:substringBefore(base,'.') }</div>
							<div class="sub clearfix">
								<sub>%</sub>
								<span>年化</span>
							</div>
						</section>
							<%-- <p><strong>${fn:substringBefore(base,'.') }<span class="percent">.${fn:substringAfter(base,'.')}%</span><br><span class="theyear">年化</span></strong></p> --%>
						<canvas width="140px" height="140px"></canvas>
					</div>
					
                    <div class="fl">
                    	<c:set var="day" value="${list.DEADLINE/30}"></c:set>
                    		<c:if test="${fn:substringAfter(day,'.') >0}">
                    			<h3>${fn:substringBefore(day,'.')}<span>个月</span></h3>
                    		</c:if>
                    		<c:if test="${fn:substringAfter(day,'.') ==0}">
                    			<h3>${fn:substringBefore(day,'.')}<span>个月</span></h3>
                    		</c:if>
                        <c:if test="${list.PROJECT_STATE==1 }">
                        	<h4>剩余金额：${list.SURPLUS_RAISE_AMOUNT}元</h4>
                        	<button class="touzi">
                        		<a href="_project/goDetails.do?ID=${list.ID}" ><span>立即投资   </span><i class="fa fa-angle-right circle"></i></a>
                        	</button>
                        </c:if>
                        <c:if test="${list.PROJECT_STATE==2 }">
                        	<h4>剩余金额：0元</h4>
                        	<button class="touzi" style="background-color: #ccc;"> 
                        		<a href="_project/goDetails.do?ID=${list.ID}">已卖光</a>
                       		</button>
                        </c:if>
                        <c:if test="${list.PROJECT_STATE==3 }">
                        	<h4>剩余金额：0元</h4>
                        	<button class="touzi" style="background-color: #ccc;">
                        		<a href="_project/goDetails.do?ID=${list.ID}">项目结束</a>
                        	</button>
                        </c:if>
                        <%-- <p style="font-size: 14px;line-height: 20px;">剩余余额：&nbsp;<br/>${list.SURPLUS_RAISE_AMOUNT }元</p> --%>
                  		<div class="bar" style="display: none;">
	                    	<div class="barbox month fl ${list.ID}" style="border: 1px solid #E9953F">
	                        	<p style="background-color:#E9953F; height: 100%;"></p>
	                        </div>
	                        <div class="txt month fl ${list.ID}" style="color:#E9953F;"></div>
                    	</div>
                    	<script type="text/javascript">
                    		<%-- $(function(){
							   	var baifenbi${list.ID}=Math.floor(${(list.TOTAL_RAISE_AMOUNT-list.SURPLUS_RAISE_AMOUNT)/list.TOTAL_RAISE_AMOUNT*100});
						   		$(".barbox.${list.ID}").find("p").css("width",baifenbi${list.ID}+"px");
						   		$(".txt.${list.ID}").text(baifenbi${list.ID}+"%");
						   		/* progress.attr('data-rate',baifenbi${list.ID} / 100); */
							}); --%>
                    	</script>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="index5 main" style="display: none;">
    	<div class="fl report">
        	<div class="title">
            	<img src="wj-static/images/index1_13.png">
                万金先生-财富风云榜
            </div>
            <div class="con fyb">
            	
            </div>
        </div>
        <div class="fr report">
        	<div class="title">
            	<img src="wj-static/images/index1_16.png">
                万金先生-数据公告
            </div>
            <div class="con">
            	<div class="fl">
                	<h3>----<b>万金累计投资</b>----</h3>
                    <p class="leiji"></p>
                	<h3>----<b>为万金赚取</b>----</h3>
                    <p class="zhuanqu"></p>
                </div>
                <div class="fr">
                	<h3><fmt:formatNumber value="${userNum.NUMBER +5000}" pattern="#,###"/> </h3>
                    <p>人，发现并注册万金先生</p>
                </div>
            </div>
        </div>
    </div>
    <div class="data-report-div" style="background:#fff;">
    	<div class="data-report main">
	    	<div><span>数据公告</span>|</div>
	        <div>
	        	<span><fmt:formatNumber value="${userNum.NUMBER +5000}" pattern="#,###,###,###"/>人，发现并注册万金先生</span>
	        </div>
	        <!-- <a href="zfarticle/notice" class="fr">更多</a> -->
	    </div>
    </div>
    
    <div class="index6 main">
    	<div class="index_case_case">
	        <div class="img">
	            <a href="_project/goProjectList">
	                <img src="wj-static/images/indexcase1.jpg" /></a>
	            <div class="text">
	                <p><a href="_project/goProjectList"></a></p>
	
	            </div>
	        </div>
	        <div class="explain">
	            <h3>安全投资，稳健增长<br />
	                自助投资，省时省心</h3>
	            <p>
	                享受每天自助投资乐趣，玩转邀请码<br />
	                年化收益可达16%,每月还本付息<br />
	                一键轻松购买，所有项目投资资金适用于本金保障计划<br />
	              低门槛，100元起投
	            </p>
	        </div>
	    </div>
    	<div class="index_case_case center-case">
	        <div class="img" >
	            <a href="zfarticle/safety?flag=press">
	                <img src="wj-static/images/indexcase2.jpg"/></a>
	            <div class="text">
	                <p><a href="zfarticle/safety?flag=press"></a></p>
	            </div>
	            <!-- <div style="position: relative;width: 33%;height: 100%;float: right;"><a href="http://mt.sohu.com/20150831/n420165245.shtml" style="width: 100%;height: 100%;display: block;" target="_blank"></a></div>
	            <div style="position: relative;width: 33%;height: 100%;float: right;"><a href="http://zj.sina.com.cn/news/xfgz/2015-08-12/1523277687.html" style="width: 100%;height: 100%;display: block;" target="_blank"></a></div>
	            <div style="position: relative;width: 33%;height: 100%;float: right;"><a href="http://hebei.news.163.com/15/0730/11/AVP4N2BD027907QS.html" style="width: 100%;height: 100%;display: block;" target="_blank"></a></div> -->
	        </div>
	        <div class="explain">
	            <h3>媒体<br>对万金先生的报道</h3>
	            <p>感谢媒体的支持，<a href="http://www.wanjinxiansheng.com">万金先生</a>永远把投资者的资金安全放在第一位<br />安全，高效，快捷<br />P2b的快速发展离不开媒体的监督和促进<br />万金先生将不断与各类媒体开展深度合作。促进行业发展</p>
	        </div>
	    </div>
    	<div class="index_case_case">
        	<!-- <a href="zfarticle/safety"><img src="wj-static/images/index1_21.png"></a>
        	<a href="zfarticle/safety"><img src="wj-static/images/index1_24.png"></a>
        	<a href="zfarticle/safety"><img src="wj-static/images/index1_26.png"></a>
        	<a href="zfarticle/safety"><img src="wj-static/images/index1_28.png"></a> -->
        	<a href="zfarticle/safety">
        		<img src="wj-static/images/index_qr.jpg">
        	</a>
        	<!-- <form action="zfarticle/safety" method="post">
        		<input type="hidden" name="PROGRAM_ID" value="pg_baozhang"/>
        		<input type="hidden" name="latest" value="news"/>
        	</form> -->
        </div>
    </div>
</div>
<script type="text/javascript">
	var progress = $('.project-profit');
	(function() {
		circle(progress, '#299ad2', 10);
	}());
	 //Painting
	function circle(elements, color, lineWidth) {
		$.each(elements, function(index, element) {
			var canvas = $(element).find('canvas').eq(0)[0],
				rate = $(element).data('rate'),
				context = canvas.getContext('2d'),
				percentage = 0,
				per = 0,
				x = 70,
				y = x,
				r = 60,
				s = 1.5 * Math.PI;
			if (rate < 0.1) {
				percentage = 0;
			} else {
				percentage = rate;
			}
			function update() {
				per += 0.015;
				context.clearRect(0, 0, canvas.width, canvas.height);
				context.beginPath();
				context.strokeStyle = color;
				context.lineWidth = lineWidth;
				context.arc(x, y, r, s, ((per * 360.0) * (Math.PI / 180)) + s, false);
				context.stroke();
				if (per < percentage) {
					requestAnimationFrame(update);
				}
			}
			requestAnimationFrame(update);
		});
	}
	//浏览记录
	$(document).ready(function(){
		// 填充需要记录的数据
		var val_array = new Array();
		var randomCode = "${sessionScope.sessionZfUser.USER_ID}" || "${sessionScope.sessionViewRandomId}";
		val_array.push("TYPE=1");
		val_array.push("VIEW_ID=0");
		val_array.push("WEB_OR_MOBILE=1");
		val_array.push("RANDOM_CODE="+randomCode);
		$.ajax({
		   type: "post",
		   url: "<%=basePath%>register/viewlog",
		   data: val_array.join('&'),
		   success: function(data){}
		 });
	});
</script>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp" %>
<!-- <script src="http://www.sobot.com/chat/pc/pc.min.js?sysNum=9367e183e71642fc80f034cca465d8ae" id="zhichiload" ></script> -->
</body>
</html>
    
