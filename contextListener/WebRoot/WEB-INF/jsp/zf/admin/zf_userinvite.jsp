<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="">
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>万金先生 - 会理财，好先生</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">

<link href="wj-static/css/reset.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/layout.css" rel="stylesheet" type="text/css">
<link href="wj-static/css/invite.css" rel="stylesheet" type="text/css">
<!-- <link href="wj-static/css/style.css" rel="stylesheet" type="text/css"/> -->

<script type="text/javascript" src="wj-static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="wj-static/js/jquery.tips.js"></script>
<script type="text/javascript" src="wj-static/js/jquery.zclip.min.js"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>

<script src="wj-static/js/invite.js" type="text/javascript"></script>


<script type="text/javascript" src="plugins/echarts/build/dist/echarts.js"></script>

<!-- jQuery分页插件 -->
<link rel="stylesheet" href="plugins/jpaginate/css/style.css" />
<script type="text/javascript" src="plugins/jpaginate/jquery.paginate.js"></script>

<!-- <style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
	.ecope_dialog{
		background: none !important;
	}
	.dg_wrapper{
		background: none !important;
		border:none !important;
	}
	.ecope_dialog .close{
		width: 50px;
		height: 50px;
		top: 24px;
		right: 50px;
		background: none !important;
	}
</style> -->
<style type="text/css">
	.invite-code-alert{
		white-space: nowrap;
		text-align: center;
		width: 400px;
		margin-left: 20%;
		letter-spacing: 1px;
		line-height: 17px;
		color: #ff6264;
	}
</style>

</head>
<body>
	
<%@ include file="../public/top.jsp"%>
<div class="mainbody main">
	<%@include file="../public/acc_left.jsp" %>
    <div class="content">
    	<div class="gerenxinxi my-account">
        	<h3 style="background:#ff6264"><span>邀请有奖</span></h3>
            <div class="clear"></div>
            <div class="banner">
            	
            </div>
            <div class="r1">
				<div class="page">
					<div class="fl flow">
						
						<span>分享邀请链接</span>
						<span>好友通过链接注册</span>
						<span>坐等奖励发放</span>
						<span>成功邀请好友</span>
						<span>参与流程是什么样的？</span>
					</div>
					<div class="fr which">
						<h3>为什么放心推荐给好友？</h3>
						<p>来自500强企业的优质资产，银行千亿级授信企业</p>
						<p>期限灵活多样，安全稳定，最高收益20%</p>
						<p>逾期就陪，风险备用金账户随时待命</p>
					</div>
				</div>
			</div>
			<div class="clear"></div>
            <div class="r3">
				<div class="page">
					<div class="title">
						<h3>好友投资，<span style="color:#FEB00F">提成您享 </span></h3>
						<div class="sbicon">
							<span>提成</span>
						</div>
					</div>
					<div class="r3-2">
						<!-- 您直接邀请的好友（一级）成功投资，您获得其投资金额的年化0.8.%的返现; 如该好友（一级）继续邀请好友（二级）加入，您可以获得对方投资金额的年化0.5%的返现;如该好友（二级）继续邀请好友（三级）加入，您可以获得对方投资金额的年化0.2%的返现; -->
						邀请码返现机制适用于纵向三级好友返现（最多年化1.5%现金返现），横向不限人数次数。（1.5% X N）
					</div>
					<div class="r3-3"></div>
				</div>
			</div>
            <div class="r4">
				<div class="page">
					<div class="title">
						<h3>呼朋唤壕友，<span style="color:#FEB00F">提成必须有 </span></h3>
						<div class="sbicon">
							<span>提成</span>
						</div>
					</div>
					<div class="r4-2">
						<p>
							您的累计<br>投资金额
						</p>
						<p>
							所有好友的<br>累计投资额
						</p>
						<div class="equal-1">超过<span>60w</span>，送两枚<span>1g金钞</span></div>
						<div class="equal-2">超过<span>80w</span>，送<span>5g金条</span></div>
						<div class="equal-3">超过<span>100w</span>，送<span>10g金条</span></div>
					</div>
				</div>
			</div>
			<div style="display: block;height:5px;border:2px dashed #E1E1E1;margin-top: 30px;margin-bottom:20px"></div>
            <div style="width:600px;margin-left:auto">
	            <div class="invite-me">
					<span class="do-invite">谁邀请的我：</span>
					<c:choose>
						<c:when test="${InviteMe.USERNAME==null ||InviteMe.USERNAME == ''}">
							<input type="text" name="" id="entry-code" class="entry-code" title="请输入你的上级好友邀请码，保存后不可修改"/>
							<input type="button" value="确定" class="bth"/>
							<div class="clear"></div>
							<p class="invite-code-alert">请输入您的上级邀请码，您在投资时将获得0.5%的加息。<br>如果您没有上级邀请码，可以在投资的时候使用一次万能邀请码：88888</p>
						</c:when>
						<c:otherwise>
							<span class="do-invite">${InviteMe.USERNAME}</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="me-invite">
					<span class="mine-invite">我的邀请码：</span>
					<span class="mine-code">${pd.INVITE_CODE}</span>
				</div>
				<div class="clear"></div>
			</div>
			<div class="do-share" <c:if test="${InviteMe.USERNAME==null ||InviteMe.USERNAME == ''}">style="margin-top:40px;"</c:if>>
				<span class="share-title">一键分享：</span>
				<!-- <ul>
					<li> <a class="jiathis_button_tsina"><i class="fa fa-weibo"></i></a> </li>
					<li> <a href="javascript:share('2');"><img src="wj-static/images/kongJian.jpg" alt="" /></a> </li>
					<li> <a href="javascript:share('3');"><img src="wj-static/images/renRen.jpg" alt="" /></a> </li>
					<li> <a href="javascript:share('4');"><img src="wj-static/images/weiXin.jpg" alt="" /></a> </li>
				</ul> -->
				<div class="jiathis_style_24x24">
					<a class="jiathis_button_weixin"></a>
					<a class="jiathis_button_cqq"></a>
					<a class="jiathis_button_qzone"></a>
					<a class="jiathis_button_tsina"></a>
					<!-- <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jiathis_separator jtico jtico_jiathis" target="_blank"></a> -->
				</div>
				<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
			</div>
			<h4><span>or</span></h4>
			<div class="net-share">
				<p>通过链接分享：<a href="javascript:void(0)" id="share-url"><%=basePath%>register/goAdd?INVITE_ME=${pd.INVITE_CODE }</a></p>
			</div>
			<div class="btn-share">
				<input type="button" value="复制分享链接" class="bthtow" />
			</div>
			
			<div class="earnings-list">
				<ul>
					<li style="border:0">
						<div class="e-level" style="border:0;">一级好友
							<i class="fa fa-chevron-down fr"></i>
							<p class="fr">，累计返现：${earningsRecord.level1Amount}元</p>
							<p class="fr">${earningsRecord.level1Count}人</p>
						</div>
						<div class="e-content" style="display:none">
							<table>
								<thead>
									<th>好友</th>
	                    			<th>累计投资额</th>
	                    			<th>返现金额</th>
								</thead>
								<tbody>
									<c:choose>
	                    				<c:when test="${not empty earningsRecord.earningsList}">
	                    					<c:forEach items="${earningsRecord.earningsList}" var="jun" varStatus="vs">
			                    				<c:if test="${jun.LEVEL=='1'}">
			                    					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
			                    						<td>${jun.USERNAME}</td>
			                    						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
			                    						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
			                    					</tr>
			                    				</c:if>
			                    			</c:forEach>
	                    				</c:when>
	                    			</c:choose>
	                    			<c:if test="${earningsRecord.level1Count == 0}">
                    					<tr style="border:0">
                    						<td colspan="3">目前没有好友，快去邀请吧！</td>
                    					</tr>
                    				</c:if>
								</tbody>
							</table>
						</div>
					</li>
					
					<li>
						<div class="e-level">二级好友
							<i class="fa fa-chevron-down fr"></i>
							<p class="fr">，累计返现：${earningsRecord.level2Amount}元</p>
							<p class="fr">${earningsRecord.level2Count}人</p>
						</div>
						<div class="e-content" style="display:none">
							<table>
								<thead>
									<th>好友</th>
	                    			<th>累计投资额</th>
	                    			<th>返现金额</th>
								</thead>
								<tbody>
									<c:choose>
	                    				<c:when test="${not empty earningsRecord.earningsList}">
	                    					<c:forEach items="${earningsRecord.earningsList}" var="jun" varStatus="vs">
			                    				<c:if test="${jun.LEVEL=='2'}">
			                    					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
			                    						<td>${jun.USERNAME}</td>
			                    						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
			                    						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
			                    					</tr>
			                    				</c:if>
			                    			</c:forEach>
	                    				</c:when>
	                    			</c:choose>
	                    			<c:if test="${earningsRecord.level2Count == 0}">
                    					<tr style="border:0">
                    						<td colspan="3">目前没有好友，快去邀请吧！</td>
                    					</tr>
                    				</c:if>
								</tbody>
							</table>
						</div>
					</li>
					
					<li>
						<div class="e-level">三级好友
							<i class="fa fa-chevron-down fr"></i>
							<p class="fr">，累计返现：${earningsRecord.level3Amount}元</p>
							<p class="fr">${earningsRecord.level3Count}人</p>
						</div>
						<div class="e-content" style="display:none">
							<table>
								<thead>
									<th>好友</th>
	                    			<th>累计投资额</th>
	                    			<th>返现金额</th>
								</thead>
								<tbody>
									<c:choose>
	                    				<c:when test="${not empty earningsRecord.earningsList}">
	                    					<c:forEach items="${earningsRecord.earningsList}" var="jun" varStatus="vs">
			                    				<c:if test="${jun.LEVEL=='3'}">
			                    					<tr <c:if test="${vs.last}">style="border:0;"</c:if>>
			                    						<td>${jun.USERNAME}</td>
			                    						<td>${jun.TOTAL_BUY_AMOUNT==''||jun.TOTAL_BUY_AMOUNT==null?'0.00':jun.TOTAL_BUY_AMOUNT}</td>
			                    						<td>${jun.TOTAL_EARNINGS==''||jun.TOTAL_EARNINGS==null?'0.00':jun.TOTAL_EARNINGS}</td>
			                    					</tr>
			                    				</c:if>
			                    			</c:forEach>
	                    				</c:when>
	                    			</c:choose>
	                    			<c:if test="${earningsRecord.level3Count == 0}">
                    					<tr style="border:0">
                    						<td colspan="3">目前没有好友，快去邀请吧！</td>
                    					</tr>
                    				</c:if>
								</tbody>
							</table>
						</div>
					</li>
				</ul>
			</div>
			<!-- <div class="spl">
				<h1>普通邀请码使用说明:</h1>
				<ul>
					<li>1. 在万金先生投资时，使用您获得邀请码。您就可以对任意项目享有额外0.5%加息福利，该福利无限重复享有;</li>
					<li>2. 分享邀请码邀请好友，享受1.5%返现。被邀请的好友在投资时均享受额外0.5% 加息福利;</li>
					<li>3. 您直接邀请的好友（一级）成功投资，您获得其投资金额的年化0.8.%的返现（T+1到账）;</li>
					<li>4. 如该好友（一级）继续邀请好友（二级）加入，您可以获得对方投资金额的年化0.5%的返现（T+1到账）;</li>
					<li>5. 如该好友（二级）继续邀请好友（三级）加入，您可以获得对方投资金额的年化0.2%的返现（T+1到账）;</li>
					<li>6. 邀请码返现机制适用于纵向三级好友返现（最多年化1.5%现金返现），横向不限人数次数。（1.5% X N）且用且珍惜;</li>
					<li>7. 您个人的邀请码不能用于自己投资，如您没有额外邀请码，可使用万能邀请码88888享受一次额外0.5%加息 ;</li>
				</ul>
			</div>
			<div class="spl VIP">
				<h1>VIP邀请码使用说明:</h1>
				<ul>
					<li>1. 拥有VIP邀请码的用户，在投资的时候填写VIP邀请码，将获得额外3%加息 ;</li>
					<li>2. 当其他用户使用您的VIP邀请码，该用户获得1%额外加息，您获得该用户投资金额的年化2%的返现（T+1到账）;</li>
					<li>3.  VIP邀请码仅由万金先生官方人工审核发放，请致电XXXXXXX申请VIP邀请码。申请VIP邀请码必要条件为在万金先生投资100万元以上，当前共用76人持有VIP邀请码。</li>
				</ul>
			</div>
			<h2><span>邀请列表</span></h2>
			<div style="position: relative;">
				
				<div class="nav">
	            	<ul>
	                	<li class="hover"><a href="javascript:void(0)" id="real">我的好友关系</a></li>
	                	<li><a href="javascript:void(0)" id="fake">示例图</a></li>
	                    <div class="clear"></div>
	                </ul>
	            </div>	
				<div class="icon-tag" id="echarts">
					
				</div>
				<div class="icon-tag" id="echartsFake" style="display: none">
				</div>
				<div class="tips">
					<ul>
						<li><span></span>一级好友投资：年化<b>0.8%</b>返现</li>
						<li><span></span>二级好友投资：年化<b>0.5%</b>返现</li>
						<li><span></span>三级好友投资：年化<b>0.2%</b>返现</li>
					</ul>
				</div>
			</div>
			<div id="earnings-div" style="display: none">
				<div class="name-tag">
					<h1>奥巴马</h1>
					<span class="riQi">
						
					</span>
				</div>
				<table class="earnings-tb">
					<thead>
						<tr class="color-e">
							<td>投资项目</td>
							<td>返现利率</td>
							<td>返现(元)</td>
							<td>日期</td>
						</tr>
					</thead>
					<tbody id="earnings-body">
						<tr>
							<td >万金先生第123期</td>
							<td>0.5%</td>
							<td>100￥</td>
							<td>2015-6-2  18:21:24</td>
						</tr>
						<tr>
							<td >万金先生第123期</td>
							<td>0.5%</td>
							<td>100￥</td>
							<td>2015-6-2  18:21:24</td>
						</tr>
					</tbody>	
				</table>
				<div id="paginate">
					
				</div> -->
			</div>
        </div>
    </div>
    <div class="clear"></div>
    
</div>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
<%@ include file="../public/foot.jsp"%>
	<script type="text/javascript">
		var jiathis_config={
			siteNum:3,
			sm:"copy,fav,email",
			summary:"",
			boldNum:6,
			shortUrl:true,
			hideMore:false,
			url:'http://www.wanjinxiansheng.com/mobile/share?INVITE_ME=${pd.INVITE_CODE }'
		}
		
		
		/* require.config({
			paths:{
				echarts : 'plugins/echarts/build/dist'
			}
		});
		require(
			[
			 	'echarts',
			 	/* 'echarts/chart/chord', */
		/* 	 	'echarts/chart/tree'
			],
			function(ec){
				console.log('init');
				var myChart = ec.init(document.getElementById('echarts'));
				var option = {
				    title : {
				        text: '树图',
				        subtext: '虚构数据'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    calculable : false,
				
				    series : [
				        {
				            name:'树图',
				            type:'tree',
				            orient: 'horizontal',  // vertical horizontal
				            rootLocation: {x: '150',y: 'center'}, // 根节点位置  {x: 100, y: 'center'}
				            nodePadding: 26,
				            roam: true,
				            itemStyle: {
				                normal: {
				                     label: {
				                        show: true,
				                        position: 'inside',
				                        formatter: "{b}",
				                        textStyle: {
				                            color: '#000',
				                            fontSize: 5
				                        }
				                    },
				                    lineStyle: {
				                        color: '#48b',
				                        shadowColor: '#000',
				                        shadowBlur: 3,
				                        shadowOffsetX: 3,
				                        shadowOffsetY: 5,
				                        type: 'curve' // 'curve'|'broken'|'solid'|'dotted'|'dashed'
				
				                    }
				                },
				                emphasis: {
				                    label: {
				                        show: true
				                    }
				                }
				            },
				            
				            data: [
				              	${juniors}
				            ]
				        }
				    ]
				};	    
				var ecConfig = require('echarts/config');
				function eConsole(param) {
				  console.log(param);
				  console.log(param);
				}
				
				function focus(param) {
					console.log('echarts点击',param);
				    var data = param.data;
				    var links = option.series[0].links;
				    var nodes = option.series[0].nodes;
				    if (
				        data.source !== undefined
				        && data.target !== undefined
				    ) { //点击的是边
				        var sourceNode = nodes.filter(function (n) {return n.name == data.source})[0];
				        var targetNode = nodes.filter(function (n) {return n.name == data.target})[0];
				        //console.log("选中了边 " + sourceNode.name + ' -> ' + targetNode.name + ' (' + data.weight + ')');
				        $("#earnings-div").show();
				        $(".name-tag").find('h1').text(sourceNode.name);
				        getInviteEarnings(1,10,sourceNode.name);
				    } else { // 点击的是点
				        //console.log("选中了" + data.name + '(' + data.value + ')');
				        $("#earnings-div").show();
				        $(".name-tag").find('h1').text(data.name);
				        getInviteEarnings(1,10,data.name);
				    }
				}
				//点击事件
				myChart.on(ecConfig.EVENT.CLICK, focus); */
				/* myChart.on(ecConfig.EVENT.CLICK, function(){
					console.log('点击');
				}); */
				
				
				/* myChart.setOption(option);
				
				
				
				//示例
				var myChartFake = ec.init(document.getElementById('echartsFake'));
				var optionFake = {
				    title : {
				        text: '${sessionScope.sessionZfUser.USERNAME} 的好友',
				        subtext: '数据来自万金先生',
				        x:'right',
				        y:'bottom'
				    },
				    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    series : [
				        {
				            name:'树图',
				            type:'tree',
				            orient: 'horizontal',  // vertical horizontal
				            rootLocation: {x: 100,y: 150}, // 根节点位置  {x: 100, y: 'center'}
				            nodePadding: 20,
				            layerPadding: 100,
				            hoverable: false,
				            roam: true,
				            symbolSize: 12,
				            itemStyle: {
				                normal: {
				                    color: '#4883b4',
				                    label: {
				                        show: true,
				                        position: 'right',
				                        formatter: "{b}",
				                        textStyle: {
				                            color: '#000',
				                            fontSize: 5
				                        }
				                    },
				                    lineStyle: {
				                        color: '#ccc',
				                        type: 'curve' // 'curve'|'broken'|'solid'|'dotted'|'dashed'
				
				                    }
				                },
				                emphasis: {
				                    color: '#4883b4',
				                    label: {
				                        show: false
				                    },
				                    borderWidth: 0
				                }
				            },
				            
				            data: [{"name":"Klaus","itemStyle":{"normal":{"color":"#EB9641"}},"children":[{"itemStyle":{"normal":{"color":"#87CEFA"}},"name":"Katarina","children":[{"itemStyle":{"normal":{"color":"#DA70D6"}},"name":"Elijah","children":[{"itemStyle":{"normal":{"color":"#32CD32"}},"name":"Niko"}]},{"itemStyle":{"normal":{"color":"#DA70D6"}},"name":"King","children":[{"itemStyle":{"normal":{"color":"#32CD32"}},"name":"Prince"}]},{"itemStyle":{"normal":{"color":"#DA70D6"}},"name":"Jack","children":[{"itemStyle":{"normal":{"color":"#32CD32"}},"name":"Rose"}]}]}]}]
				        }
				    ]
				};   
				myChartFake.setOption(optionFake);
			}
		); */ 
			
	
	
	
	var shareText = '我给你抢了两个红包，从这进去就能领取了。',
			shareLink = '',
			text2Copy = shareText + shareLink;
	
	
	<%-- $(function(){
		/* $('.tips').hide(); */
		var realTab = $('#real'),
			fakeTab = $('#fake');
		realTab.on('click',function(){
			console.log($(this));
			$(this).parent('li').addClass('hover');
			$(this).parent('li').siblings().removeClass();
			$('#echartsFake').hide();
			$('#echarts').show();
			/* $('.tips').hide(); */
		});	
		fakeTab.on('click',function(){
			$(this).parent('li').addClass('hover');
			$(this).parent('li').siblings().removeClass();
			$('#echarts').hide();
			$('#echartsFake').show();
			/* $('.tips').show(); */
		});
	}); */ --%>
	$(document).ready(function(){
		$('.e-level').each(function(){
				$(this).on('click',function(){
					if($(this).children('i').hasClass('fa-chevron-down')){
						$(this).children('i').removeClass('fa-chevron-down');
						$(this).children('i').addClass('fa-chevron-up');
						$(this).next('div').show();
					}else{
						$(this).children('i').removeClass('fa-chevron-up');
						$(this).children('i').addClass('fa-chevron-down');
						$(this).next('div').hide();
					}
				});
			
		});
	});
	
	
	</script>

	<script type="text/javascript">
	
	
	
	<%-- $(document).ready(function(){
		/* seed.use(CONFIG.BASE_URI + '/js/zeroclipboard/dist/ZeroClipboard.min.js', function(ZeroClipboard){
			var clipboardBtn = $('#copy_link');
			var clipboard = new ZeroClipboard(clipboardBtn);
			clipboard.on('ready', function(readyEvent) {
				clipboard.on('copy', function(e) {
					var clipboard = e.clipboardData;
					clipboard.setData('text/plain', text2Copy);
				}).on('aftercopy', function(e) {
					alert('复制成功！');
				});
			}).on('error', function(e) {
				ZeroClipboard.destroy();
				clipboardBtn.on('click', function(e){
					e.preventDefault();
					prompt('请复制下面的链接分享给你朋友', text2Copy);
				});
			});
		}); */
		var $this   = $('.share-link'),
				url     = $this.attr('data-url'),
				title   = '我给你抢了两个红包，从这进去就能领取了。',
				summary = '万金先生，专为万金打造的优质理财平台。',
				desc    = title,
				pic     = '',
				sina    = '5281891991',
				encodedUrl = encodeURIComponent(url);
	  var html = [
	  '<a href="http://service.weibo.com/share/share.php?title='+ title + '&url='+ encodedUrl +'&pic='+ pic + '&ralateUid='+ sina +'" title="分享到微博" class="wb-share" target="_blank">微博</a>',
	  '<a href="http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?desc='+ desc +'&url='+ encodedUrl +'&summary='+ summary +'&pics='+ pic +'" title="分享到QQ空间" class="qq-share" target="_blank">QQ</a>',
	  '<a href="http://widget.renren.com/dialog/share?srcUrl=&resourceUrl='+ encodedUrl +'&description='+ desc + '&pic='+ pic +'" title="分享到人人网" class="rr-share" target="_blank">人人</a>',
	  '<a class="wx-share" title="分享到微信">微信</a>'
	  
	  ].join('');
	  $this.append(html);
	
	  seed.use('dialog', function(){
			var dialogPay = new $.ui.Dialog(document, {
						elem : $('#dialog-tmpl').html(),
						drag : false,
						fixed : true,
						overlay : true,
						lock : true,
						trigger : 'wxshare'
		    });
		    $(document).on('click', '.close', function(e){
					e.preventDefault();
					dialogPay.close();
				}).on('click', '.wx-share', function(event) {
					event.preventDefault();
					$(document).trigger('wxshare');
				});
		});
	
	});
	
		--%>
	</script> 
</body>
</html>