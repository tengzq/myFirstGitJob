<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<!--[if lt IE 7 ]><html class="ie6" lang="zh-cn"><![endif]-->
<!--[if IE 7 ]><html class="ie7" lang="zh-cn"><![endif]-->
<!--[if IE 8 ]><html class="ie8" lang="zh-cn"><![endif]-->
<!--[if IE 9 ]><html class="ie9" lang="zh-cn"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html><!--<![endif]-->
<head>
<meta charset="utf-8">
<base href="<%=basePath%>">
<title>账房先生 - 专为账房打造的优质理财平台</title>
<meta name="keywords" content="账房先生,账房投资,懒理财,理财" />
<meta name="description" content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。" />
<link rel="stylesheet" type="text/css" href="jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit"/>
<script async="" src="jingtai/js/analytics.js"></script>
<script type="text/javascript" async="" src="jingtai/js/trace.js">
</script><script src="jingtai/js/hm.js"></script>

<script type="text/javascript" src="jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="jingtai/js/seed.min.js"></script>
	<link rel="stylesheet" type="text/css" href="jingtai/css/my.css">
	<script src="jingtai/js/PagerView.js"></script>
<img src="jingtai/css/v.do" height="1" width="1"><script type="text/javascript" src="jingtai/js/zz.js"></script></head>
<body>
	<div id="doc">
		<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
<%@ include file="../public/top.jsp"%>
		<div id="bd">
			<div class="content clearfix">
				<div class="main alignright">
					<style>
	.ll-notice {width:600px;margin-top:50px;margin-left:50px;}
	.ll-notice p {margin-bottom: 20px;}
</style>
<div class="my-page my-page-bindcard">
	<div class="my-mod my-bindcard">
		<div class="hd">
			<h2>提现银行卡</h2>
		</div>
		<div class="bd">
			<div class="clearfix">
				<div class="alignleft bindcard-show">
					
					<c:choose>
						<c:when test="${pd.BANK_CARD==''||pd.BANK_CARD==null}">
							<a class="bank-card-blank" href="myAccount/addBind" target="_blank">
							<span class="highlight">立即绑定银行卡</span>
							</a>
						</c:when>
						<c:otherwise>
							<div class="bank-card">
								<strong class="bank-name">建设银行</strong>
								<em class="bank-num"></em>
								<a href="" target="_blank" title="解绑这张银行卡" class="unbind-btn">取消绑定</a>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="alignleft bindcard-help">
					<p>说明</p>
					<p style="margin-top:10px">1、提现银行卡，姓名需与认证身份一致，否则无法提现。</p>
					<p>2、提现银行卡绑定验证，大行需T+1日完成，小行需大于T+1日完成，均受节假日影响，建议提前绑定。</p>
					<p>3、当日申请提现，次日到账。</p>
					<p>4、如有绑定失败情况，请重试或联系账房先生客服。</p>
				</div>
			</div>
			<div class="ll-notice">
									<p>推荐绑定以下14家银行的银行卡，到账更快捷。同时，在移动端可享受大额充值通道。</p>
					<p>分别为：中国银行，农业银行，中国工商银行，建设银行，招商银行，光大银行，华夏银行，平安银行，浦发银行，中信银行，兴业银行，中国邮政储蓄银行，广发银行，民生银行。</p>
							</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var has_llpay = false;
(function(){
	$('.unbind-btn').on('click', function(e){
		if(has_llpay){
			alert('抱歉，由于您的银行卡在移动端使用连连支付进行过充值，解绑及换卡需要联系客服。');
			return false;
		}
		if(!confirm('确定解绑银行卡？\n银行卡解绑之后将进行无法提现操作。')){
			e.preventDefault();
		}
	});
	var bankNum='${pd.BANK_CARD}'.replace(/(\d{4})\d{11}(\d{4})/, '$1****$2');
	$(".bank-num").text(bankNum);
})();
</script>
				</div>
				<%@ include file="../public/acc_left.jsp"%>
			</div>			
		</div>
		<%@ include file="../public/foot.jsp"%>

<script type="text/javascript">
var LINKS = [{
	'name': '网贷之家',
	'url': 'http://www.wangdaizhijia.com/'
},{
	'name': '网贷联盟网',
	'url': 'http://www.wdlm.cn/'
}, {
	'name': '网贷天眼',
	'url': 'http://www.p2peye.com/'
},{
	'name': '融途网',
	'url': 'http://www.erongtu.com/'
},{
	'name': '理财114',
	'url': 'http://www.licai114.com/'
},{
	'name': 'P2P理财',
	'url': 'http://www.dianpifa.com'
}];

</script>
	</div>
</body>
</html>
