
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base href="<%=basePath%>">
<!-- fuxieyi -->
<title>融巢资本--服务协议</title>
<link href="<%=basePath%>wj-static/rc/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/reset.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>wj-static/rc/css/article-common2.css" />
<script src="<%=basePath%>wj-static/js/jquery-1.7.2.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body style="background:#f9f9f9">
	<%@include file="../../public/header_v2.jsp"%>
	<div class="main">
		<div class="mainbody">
		 <%@include file="../../public/article_nav.jsp" %> 
			<div class="right">
				<div class="gsjs">
					<div class="maintit">
						<span><b>常见问题</b></span>
					</div>
					<div class="con">
						<%-- <img src="<%=basePath%>wj-static/rc/images/banner_03.jpg"> --%>
						<p>1.如何充值？支持信用卡充值吗？</p>
						<p>目前融巢宝提供的充值方式：第三方支付（易宝支付）在线充值，包括网银充值和快捷充值。您的账户资金将由易宝支付托管，不收取任何费用。
目前融巢宝暂不支持信用卡充值。</p>
							<p></p>
						<p>2.快捷充值功能是什么？</p>
						<p>用户在PC或其它终端对资金托管账户充值的功能，第一次直接输入用户本人银行卡信息，易宝将通过身份证、姓名、银行卡号、手机号等多种方式进行支付验证，验证通过后，充值完成；第二次继承第一次支付形成的ID对银行卡的自动绑定关系，快捷完成充值。用户绑定的该银行储蓄卡则视用户本人托管账户的唯一提现银行卡，用户不得任意换绑、解绑、新增提现银行卡或快捷充值银行卡，实现同卡进出。
						</p>
						<p>3快捷充值有限额吗？</p>
						<p>有的，单卡单笔充值最高限额为5万元人民币，单卡单日交易最高限额为10万元人民币，单卡单月交易最高限额10万元人民币。单卡单日累计交易次数20次，单卡单月累计交易次数600次。实际限额以银行规定为准。</p>
						<p>4.单笔充值限额是多少？</p>
						<p>平台单笔充值额度范围为0.1元—100万元。</p>
						<p>5.充值收费吗？</p>
						<p>融巢宝在线充值，网银充值用户将由第三方支付平台“易宝支付”每笔收取0.2%的费用，为答谢各位用户，融巢宝将为用户垫付充值手续费。</p>
						<p>6.显示充值成功且银行已扣款，但平台账户余额没有增加怎么办？</p>
						<p>充值成功后,请稍事等待2—5分钟后再次查询您的账户信息。如有出现充值未到账情况，请保留网银充值截图；稍后刷新网页如还未到账，请联系客服400电话。</p>
						<p>7.提现收费吗？提现次数和额度有无限制？</p>
						<p>平台用户每月可享有3次免费提现机会，3次以外的提现行为须由用户自行支付手续费，提现手续费每笔2元；加急提现，每笔收取0.05%的费用，最低5元/笔。
平台单笔提现额度范围为100元-100万元，但绑定的银行卡所属银行可能会有不同的提现额度限制。</p>
						<p>8.提现之后什么时候到账？</p>
						<p>①.普通提现
资金托管方易宝支付在收到提现请求后， T+1日到账（法定节假日顺延）。
②.加急提现
法定节假日不可加急提现，工作日2个小时以内到账（部分银行不支持加急提现）。
注意：请确保您填写的银行账号的开户人姓名和您在平台上实名认证的真实姓名一致，并已经设定了一张可以申请提现的银行账户，否则提现无法成功。</p>
						<p>9.什么时间计息？</p>
						<p>投资项目标满标放款后开始计息，工作日当天下午16：00前满标当日开始计息，16：00后满标次日开始计息（法定节假日顺延），法定节假日满标后第一个工作日开始计息。</p>
						<p>10.可以更换绑定的银行卡吗？如何操作？</p>
						<p>用户申请解除绑定的快捷充值银行卡或提现银行卡的，需提供用户注册手机号、开户人+开户银行+卡号、手持身份证照片（要求身份证正面清晰）+银行卡正面照片发送至客服邮箱，客服收到完整资料后将于2个工作日内向易宝提出更改请求并更改。</p>
						<p>11.为什么我申请提现失败了？</p>
						<p>造成您提现失败的原因可能有以下几种：
未设定银行账户；
银行卡开户人姓名和实名认证姓名不一致；
银行开户行信息错误；
银行账号/户名错误，或是账号和户名不符；
使用信用卡提现 银行账户冻结或正在办理挂失。</p>
						<p>12.常见名词解释：</p>
						<p>年化利率：是指产品的年化收益率，12个月的利率。如果是短期产品，需要进行换算成期间收益率，这样才是产品的实际利率。
账户总额＝成功充值金额+待收总额+已收总额-已付总额-成功投资总额-成功提现总额
可用余额＝账户总额－冻结总额－待收总额，可用于投标或者提现。
流标：指融巢宝平台上因资料上传不全或综合情况不符合借款要求，导致借款申请未通过，或未能在规定时间内完成资金募集而终止的标。</p>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
