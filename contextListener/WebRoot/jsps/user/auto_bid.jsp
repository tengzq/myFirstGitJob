<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<!-- saved from url=(0038)https://lantouzi.com/user/autobid/open -->
<html><!--<![endif]--><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="https://lantouzi.com/css/dialog_style.css?v2">
<meta charset="utf-8">
<title>懒投资 - 专为懒人打造的优质理财平台</title>
<meta name="keywords" content="懒投资,懒人投资,懒理财,理财">
<meta name="description" content="国内领先的互联网金融平台，专注于应收账款保理业务。第三方托管，本息保障。已获得策源创投、贝塔斯曼、源码资本、夏佐全共同参与的2100万美金A轮融资。核心成员来自360、百度、建设银行等知名企业。">
<link rel="stylesheet" type="text/css" href="../../jingtai/css/reset.css">
<link rel="stylesheet" type="text/css" href="../../jingtai/css/common.css">
<meta baidu-gxt-verify-token="8fd06ee5eb68e0def0986730ace33d6e">
<meta name="renderer" content="webkit">
<script async="" src="../../jingtai/js/analytics.js"></script><script type="text/javascript" async="" src="../../jingtai/js/trace.js"></script><script src="../../jingtai/js/hm.js"></script><script type="text/javascript">
(function(){
	window.CONFIG = {"PASSPORT_API_HOST":"https:\/\/u.dawanjia.com.cn\/user\/api\/","CAPTCHA_HOST":"https:\/\/u.dawanjia.com.cn\/captcha","ENCRYPT_TIMEOUT":120000,"SERVER_TIME":1432021087000};
	window.CONFIG.BASE_URI = 'https://lantouzi.com';
	window.CONFIG.SSO_URI  = CONFIG.BASE_URI + '/dwjsso';
	window.CONFIG.LTZ_API = CONFIG.BASE_URI + '/api/uc/';
	!window.console && (window.console = {log:function(){}});
})();
</script>
<script type="text/javascript" src="../../jingtai/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../../jingtai/js/ltz.common.js"></script>
<script type="text/javascript" src="../../jingtai/js/seed.min.js"></script>
<script type="text/javascript">
seed.config({
    baseUrl : CONFIG.BASE_URI + '/js/components/',
    alias : {
       jquery : CONFIG.BASE_URI + '/js/'+'jquery-1.11.1.min'
   } 
});
var _hmt = _hmt || [];
</script>	<link rel="stylesheet" type="text/css" href="../../jingtai/css/my.css">
	<script src="../../jingtai/js/PagerView.js"></script>
<img src="../../jingtai/css/v.do" height="1" width="1"><script type="text/javascript" src="../../jingtai/js/zz.js"></script></head>
<body>
	<div id="doc">
		<style>
	.nav a i {display:block;position: absolute;width:36px;height:16px;line-height: 16px;color:#fff;background: #ff7744;border-radius:5px;top:50%;margin-top:-20px;left:50%;margin-left:38px;text-align: center;font-style: normal;font-size:12px;}
</style>
<%@ include file="../public/top.jsp"%>
		<div id="bd">
			<div class="content clearfix">
				<div class="main alignright">
					<div class="my-page my-mod my-autobid">
	<div class="hd">
		<h2>自动投标</h2>
	</div>
	<div class="bd">
		<div class="open_the_autobid">
			<h4>开启自动投标，送30元投资券</h4>
			<div class="notice_box">
				首次开启自动投标功能，送10元投资券。（投资券可立即使用）<br>
				首次使用自动投标功能并投资，项目放款后，再送20元投资券。
			</div>
			<h3>注意事项：</h3>
			<p>1. 设置并保存后，将在次日零点开启自动投标。</p>
			<p>2. 自动投标开启后，若有多个项目可投，将尽可能优先选择可使用投资券的项目，投资券优先选择面值大的、快到期的。</p>
			<p>3. 自动投标开启后，如果不想自动投标，请手动关闭。</p>
			<p>4. 根据您的设置，筛选并自动为您投资，但我们不能保证对所有的项目投资成功。</p>
			<p>5. 用户开通自动投标功能即视为委托懒投资平台与达到用户指定标准的借款人签署借款合同，并承担该合同项下的一切权利及义务。</p>
			<a class="btn" id="open_the_autobid_btn">同&nbsp;&nbsp;意</a>
		</div>
	</div>
</div>
<script type="text/tmpl" id="dialog-tmpl">
	<div class="dg_wrapper dialog-auth">
		<h3>尚未授权<span class="close-btn" title="关闭">X</span></h3>
		<p>尊敬的xyf200948350210,您还尚未授权</br>前往托管平台进行授权，立即享受自动投标功能。</p>
		<a class="btn" id="auto_now" href="https://lantouzi.com/user/autobid/authorize" target="_blank">立即授权</a>
		<a class="btn" id="auth_done" style="display:none;background:#f63;">我已完成授权</a>
	</div>
</script>
<script type="text/javascript">
	$(document).ready(function() {
		seed.use('dialog', function(){
			var dialogAuth = new $.ui.Dialog(document, {
					elem : $('#dialog-tmpl').html(),
					height: '200px',
					drag : false,
					fixed : true,
					overlay : true,
					lock : true,
					trigger : 'authorize'
				});
				$(document).on('click', '.close-btn', function(e){
					e.preventDefault();
					dialogAuth.close();
				}).on('click','#auto_now', function(e){
					$(this).hide();
					$('#auth_done').show();
				}).on('click', '#auth_done', function(e) {
					e.preventDefault();
					dialogAuth.close();
					location.href = "https:\/\/lantouzi.com\/user\/autobid\/open?click=1";
				});
		});
		var $openAutoBid = $('#open_the_autobid_btn');
		$openAutoBid.on('click', function(event) {
							$(document).trigger('authorize');
					});
	});
</script>
				</div>
				<div class="aside alignleft">
	
	<div class="my-nav">
		<ul class="my-nav-1stlevel-list">
			<li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user">账户概览</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/order/datalist">投资记录</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/lingqianjihua">零钱计划<i>Beta</i></a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/trade/datalist">资金流水</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/recharge">我要充值</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/withdraw">我要提现</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/account/bindcard">提现银行卡</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/autobid">自动投标</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/coupon?type=1">投资券</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/tiyanjin">体验金<i>Beta</i></a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/account">个人信息</a></h3></li><li class="my-nav-1stlevel"><h3><a href="https://lantouzi.com/user/invite">邀请有奖</a></h3></li>		</ul>
	</div>
</div>
			</div>			
		</div>
		<div id="ft">
	<div class="clearfix ft-links">
		<div class="alignleft ft-links-item about">
			<h3>关于懒投资</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about" rel="nofollow">公司介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/team" rel="nofollow">团队介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/contact" rel="nofollow">联系我们</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/joinus" rel="nofollow">加入我们</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item protocol">
			<h3>保障/协议</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/security" rel="nofollow">安全保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/law" rel="nofollow">法律保障</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/agreement" rel="nofollow">服务协议</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/privacy" rel="nofollow">隐私声明</a>
				</li>				
			</ul>
		</div>
		<div class="alignleft ft-links-item help">
			<h3>帮助中心</h3>
			<ul class="bd">
				<li>
					<a href="https://lantouzi.com/about/help" rel="nofollow">常见问题</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/baoli" rel="nofollow">保理业务介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/qufenqi" rel="nofollow">分期债权介绍</a>
				</li>
				<li>
					<a href="https://lantouzi.com/about/repayment_ways" rel="nofollow">还款方式介绍</a>
				</li>
			</ul>
		</div>
		<div class="alignleft ft-links-item contact">
			<h3>联系我们</h3>
			<ul class="bd">
				<li>
					联系电话：400-807-8000&nbsp;（工作日 9:00-22:00）
				</li>
				<li>
					客服邮箱：<a href="mailto:kefu@lantouzi.com" rel="nofollow">kefu@lantouzi.com</a>
				</li>
				<li>
					公司地址：北京市朝阳区三里屯SOHO  A座1701室
				</li>
				<li>
					我要合作：<a href="mailto:bd@lantouzi.com" rel="nofollow">bd@lantouzi.com</a>
				</li>
			</ul>
		</div>
		<div class="wx_qrcode">
			<img src="../../jingtai/css/qrcode.png" width="120px" height="120px" title="微信号:lantouzicom">
		</div>
	</div>
	<div class="clearfix ft-bottom">
		<div class="alignleft">
			<div class="safeguard clearfix">
				<a href="http://www.yeepay.com/" class="safe-yeepay" target="_blank" rel="nofollow"></a>
				<a href="http://www.geotrust.com/" class="safe-geotrust" target="_blank" rel="nofollow"></a>
				<a href="http://webscan.360.cn/" class="safe-360" target="_blank" rel="nofollow"></a>
				<a href="https://www.sobug.com/" class="safe-sobug" target="_blank" rel="nofollow"></a>
				<a href="http://sealinfo.trustutn.org/sealinfo/P31000020121218204627106798.html" class="safe-trustutn" target="_blank" rel="nofollow"></a>
				<a href="https://s1.lantouzi.com/img/201412/renzheng.jpg" class="safe-acifi" target="_blank" rel="nofollow"></a>
			</div>
			<div class="links clearfix"></div>
		</div>
		<div class="alignright copyright">
			<p>京ICP备14023229号 京ICP证150240号</p>
			<p>北京大家玩科技有限公司&nbsp;&nbsp;版权所有</p>
			<p><a href="https://lantouzi.com/user/autobid/open?ua=pc" style="color:#999;padding:0px 5px;" rel="nofollow">PC版</a>
			<a href="https://lantouzi.com/user/autobid/open?ua=mobile" style="color:#999;padding:0px 5px;text-decoration:underline" rel="nofollow">手机版</a></p>
		</div>
	</div>
	</div>

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
$(document).ready(function(e){
	if ($.browser.ie && $.browser.version <= 9.0) {
		var placeHoldersrc = "https://lantouzi.com/js/placeholderIE.js?v=2";
		$('body').append('<script type="text/javascript" src="'+ placeHoldersrc +'"/>');
		var els = [];
		$('input[placeholder]').each(function(idx, el){
			els.push(el);
		});
		placeholderIE({margin:'8px 0px 0px 10px',fontSize:'16px'}, els);
	}

	var $social_contact = $('.social_contact'),
			$account_info = $('.account_info'),
			t;
	$social_contact.on('mouseover',function(event) {
		var $target = $('#' + this.id + '_info');
		clearTimeout();
		$target.show();
		$(this).addClass(this.id+'_hover');
	}).on('mouseout', function(event) {
		var name = this.id;
		t = setTimeout(function(){
			$account_info.hide();
			$('#'+name).removeClass(name+'_hover');
		}, 100);
	});
	$account_info.on('mouseenter', function(event){
		clearTimeout(t);
		var $target = $('#' + this.id);
		$target.show();
	}).on('mouseleave', function(event){
		var name = this.id.split('_info')[0];
		$account_info.hide();
		$('#'+name).removeClass(name+'_hover');
	});
	
	//加载友情链接
	//loadLinks();

	function loadLinks(){
		var qd_url = "https://lantouzi.com/union/hello",
			current_url = location.protocol + '//' + location.hostname + location.pathname; 
		if (current_url== qd_url) {
			return;
		}
		var xhr = $.ajax({
			type:'GET',
			url:'/api/links',
			data:"",
			dataType: "json"
		});
		xhr.done(function(r) {
			var h = '',
					i = 0,
					l = r.data.length;
			if (!l) {
				r.data = LINKS;
				l = r.data.length;
			}
			for ( ; i < l; i++) {
				var item = r.data[i];
				if (h) {
					h += '<span>|</span>';
				}
				h += '<a href="' + item.url + '" target="_blank">' + item.name + '</a>';
			}
			var href = "https://lantouzi.com/links";
			h += '<a href="' + href + '" target="_blank" class="all">查看全部链接</a>';

			h = '友情链接：' + h;
			$('#ft .links').html(h);
		});
	}
});
</script>

<script type="text/javascript">
var _zzsiteid="rnhYv03GpMt";
var _zzid = "rnhYv03GpMs";
(function() {
	var hm = document.createElement("script");
	hm.src = "//hm.baidu.com/hm.js?6dea39ac37df9c6f3e7b096755b73949";
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(hm, s);

	$(document).on('mousedown', '.tongji', function(e){
		var $el = $(this);
		var category = $el.attr('data-category') || $.trim($el.text()),
				action   = $el.attr('data-action') || 'click',
				label    = $el.attr('data-label') || '',
				value    = $el.attr('data-value') || '';
		_hmt.push(['_trackEvent', category, action, label, value]);
	});
	var zz = document.createElement('script');
	zz.type = 'text/javascript';
	zz.async = true;
	zz.src = ('https:' == document.location.protocol ? 'https://ssl.trace.zhiziyun.com' : 'http://static.zhiziyun.com/trace') + '/api/trace.js';
	var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(zz, s);

})();
</script>
<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	ga('create', 'UA-60788439-1', 'auto');
	ga('send', 'pageview');
</script>
	</div>


<iframe src="../../jingtai/cm.htm" scrolling="no" width="1" height="1" style="display: none;"></iframe></body></html>