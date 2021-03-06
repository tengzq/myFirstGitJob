
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
						<span><b>风险提示</b></span>
					</div>
					<div class="con">
						<%-- <img src="<%=basePath%>wj-static/rc/images/banner_03.jpg"> --%>
						<p>尊敬的客户：
在购买投资产品之前，请您仔细阅读如下风险提示，并按照您的实际资产情况与风险承受能力，审慎作出投资决策。</p>
						<p>一、 债务无法兑付风险
债务人仅以质押之对应产品收益权的实际价值为限承担本协议项下的借款偿还义务。对应产品收益权的实际价值优先偿还借款本金部分，但仍可能存在偿还不足。若对应产品收益权的实际价值不足以偿还借款本金与对应借款利息的，您的本金及利息将面临亏损。</p>
						<p>二、 提前/延期兑付风险
    若债务人用于质押的产品收益权提前于《个人借款及担保协议》（“借款合同”）所述“产品收益权预计到期清算日”到期的，对应借款将提前到期，届时将按您实际持有标的债权的实际天数计算标的债权利息，您可能无法实现期初预期的全部借款利息，且可能无法达到预计借款年化利率，并将面临再投资机会风险。若债务人用于质押的产品收益权晚于借款合同所述“产品收益权预计到期清算日”到期的，对应借款将相应延期，届时将按您实际持有标的债权的实际天数计算标的债权收益，您将面临一定流动性风险。</p>
						<p>
						三、 不能对抗第三人的风险
债务人将以其持有的对应产品收益权为您的债权提供质押担保。虽然该质押担保已根据借款合同办理相关登记手续，但债务人可能还存在其他债权人，如该等债权人要求强制执行债务人持有的对应产品收益权并获得法院支持，则可能影响到该产品收益权承担担保责任的能力，相应地，您的债权可能遭受损失。
						</p>
						<p>四、 质押品风险：
您的债权对应的质押品为债务人所持有的产品收益权，该产品收益权对应的基础资产（“产品”）投资于房地产行业，近年来国家宏观调控政策偏紧，以抑制投资、投机性需求为重点。短期来看，国家将继续实施商品房价格行政控制目标。
1. 交易对手的信用风险。产品投资于房地产开发项目，对于项目盈利情况及现金流的预测全部基于现有的国家宏观经济政策、行业调控政策、当地相关产业政策、规划政策以及当前的房地产市场预期。如上述因素发生超出预期的调整，产品、质押品可能面临整体收益低于预期的情况出现。
2. 担保方信用风险。产品投资项下各担保人（保证人、出质人、抵押人）的担保能力、各担保人是否按约履行担保义务、担保范围是否获得法院支持、是否及时按约办理质押/抵押登记、质押物/抵押物的变现能力、质押物/抵押物的价值等均可能影响到财产安全及收益。质押人/抵押人为基础资产履行相关义务提供担保，如质押物/抵押物的价值不足以全额履行相关义务的，则将使产品面临风险，并可能对产品财产造成损失，进而使质押品遭受损失。保证人为产品履行相关义务提供保证担保。如产品与保证人签署的保证合同被有权机关认定为无效或因保证人未完成适当的内部授权手续签署保证合同，或保证人的担保金额不足全额履行相关义务，则将使产品面临风险，并可能对产品财产造成损失，进而使质押品遭受损失。
3. 产品投资运作过程中，如果该产品投资的债务人、交易对手、担保方等发生违约，信用状况恶化等，可能会使产品财产及质押品遭受损失，您将面临提供的借款本金和利息损失的风险。
4. 延期兑付风险。产品存续期间届满时，如委托财产未能全部变现的，产品将延长至委托财产全部变现为止。相应地，您的债权则将相应延期，您可能无法及时、足额获得借款本息。
5. 委托财产无法变现风险。产品终止（包括提前终止）时，受市场环境或其他原因影响，财产可能部分或者全部不能变现或者变现价值降低，您的借款本金及利息可能因此受到影响，可能无法及时、足额获得偿付。
6. 提前终止风险。如果产品提前终止，相应地，您的债权则将提前到期，您的资金将提前收回且不能继续享有借款利息，也无法获得按照预计借款年化利率计算的收益。
7. 产品采取的投资策略可能存在使产品收益不能达到投资目标或者本金损失的风险。即，产品主要通过委托贷款方式投资于房地产项目，由于房地产市场波动较大，后期销售回款具有不确定性，如果该房地产项目不能成功运作将直接影响到产品的投资收益，并进而影响到质押品的收益及您的借款利息，甚至可能产生本金损失。
8. 产品项下委托贷款通过委贷银行发放，但委贷银行不承担贷款风险。如果委贷银行不予协助或怠于协助管理人督促借款人如期归还借款本息和逾期催收、保全等工作，均可能给产品财产造成损害。此外，委托贷款项下的相关担保措施由委贷银行担任担保权利人，如果委贷银行不予履行或怠于履行相关担保权利，可能给产品财产造成损害。
9. 产品项下委托贷款利率、计提及支付方式由相关各方约定，如果法律环境、贷款政策、金融市场发生变化，或根据监管机构、司法机关或其他有权部门不时提出的要求需要对上述事项进行调整，可能导致产品无法依照约定收取利息的风险，并进而影响到质押品的收益及您的借款本息。</p>
						<p>五、 法律与政策风险：
国家监管政策、财政税收政策、产业政策、宏观政策及相关法律、法规的调整与变化将会影响产品、产品收益权、您持有之债权的正常运行，甚至导致您持有的债权不能获得预期借款本息。</p>
						<p>六、 操作风险：
1.平台不可预测或无法控制的系统故障、设备故障、通讯故障、停电等突发事故将有可能给您造成一定损失。因上述事故造成交易或交易数据中断，恢复交易时以事故发生前系统最终记录的交易数据为有效数据。
2.由于您密码失密、操作不当、决策失误、黑客攻击等原因可能会造成您的损失。
3.网上交易、热键操作完毕，未及时退出，他人进行恶意操作将可能造成您的损失。
4.委托他人代理交易、或长期不关注账户变化，可能致使他人恶意操作而造成的您的损失。
5.由于银行系统延迟、代扣代收机构系统故障等原因，造成交易相关方不能及时收取或支付相关协议项下款项。
以上并不能揭示从事交易的全部风险及市场的全部情形。投资者在做出交易决策前，应通过员工宝网站所公布的信息及其他相关公告了解提供借款的风险收益特征，根据自身的风险承受能力和资产状况等谨慎决策，并自行承担全部风险。


风险揭示
本产品为二级市场投资组合产品，属于中高风险中高收益产品。请根据自身的风险承受能力和资产状况谨慎决策。可能面临的风险包括但不仅限于：
一、市场风险：
1.产品收益权对应产品投资领域主要为证券市场中，证券市场价格因受各种因素的影响而引起的波动，将使产品资产面临潜在的风险。市场风险可以分为股票投资风险和债券投资风险。
2.股票投资风险主要包括：
（1）国家货币政策、财政政策、产业政策、宏观经济运行周期性波动等变化对证券市场产生一定的影响，导致市场价格水平波动的风险
（2）上市公司的经营状况受多种因素影响，如市场、技术、竞争、管理、财务等都会导致公司盈利发生变化，从而导致股票价格变动的风险
3.债券投资风险主要包括：
（1）市场平均利率水平变化导致债券价格变化的风险。债券市场不同期限、不同类属债券之间的利差变动导致相应期限和类属债券价格变化的风险。
（2）债券之发行人出现违约、拒绝支付到期本息，或由于债券发行人信用质量降低导致债券价格下降的风险。
二、管理风险：
在实际操作过程中，产品管理人可能限于知识、技术、经验等因素而影响其对相关信息、经济形势和证券价格走势的判断，其精选出的投资品种的业绩表现不一定持续优于其他投资品种。
三、流动性风险：
在市场或个股流动性不足的情况下，产品管理人可能无法迅速、低成本地调整投资计划，从而对产品收益造成不利影响。
四、信用风险：
本产品交易对手方发生交易违约，导致财产损失。
五、特定的投资方法及产品财产所投资的特定投资对象可能引起的特定风险：
本产品采取的投资策略可能存在使产品收益不能达到投资目标或者本金损失的风险。
六、操作或技术风险：
相关当事人在业务各环节操作过程中，因内部控制存在缺陷或者人为因素造成操作失误或违反操作规程等引致的风险，例如，越权违规交易、会计部门欺诈、交易错误、IT系统故障等风险。 在基金的各种交易行为或者后台运作中，可能因为技术系统的故障或者差错而影响交易的正常进行或者导致产品份额持有人的利益受到影响。这种技术风险可能来自基金管理公司、注册登记机构、销售机构、证券交易所、证券注册登记机构等。
七、产品本身面临的风险：
1.法律及违约风险 在本产品的运作过程中，因产品管理人、产品托管人、注册登记机构等合作方违反国家法律规定或者相关合同约定而可能对产品财产带来风险。
2.购买力风险 本产品的目的是产品财产的增值，如果发生通货膨胀，则投资所获得的收益可能会被通货膨胀抵消，从而影响到产品财产的增值。
3.产品管理人不能承诺保本及收益的风险 产品收益受多项因素影响，包括证券市场价格波动、投资操作水平、国家政策变化等，产品既有盈利的可能，亦存在亏损的可能。根据相关法律法规规定，产品管理人不对产品的投资者作出保证本金及其收益的承诺。
4.产品终止的风险 如果发生产品合同所规定的产品终止的情形，管理人将卖出产品财产所投资之全部品种，并终止产品，由此可能导致产品财产遭受损失。
八、特定风险：
本产品主要投资合法成立的、以二级市场证券为主要投资标的的证券投资基金管理公司及其子公司专项资产管理计划、证券公司集合资产管理计划、信托计划、私募证券投资基金等法律、法规和监管机构允许投资的其他金融工具（简称“产品”），面临的风险包括但不限于这些产品的管理人的经营风险和产品运作风险：
1.产品管理人的经营风险。产品管理人的经营业绩受多种因素的影响，如相关投资顾问/投资经理的投资能力、公司管理能力、财务状况、市场前景、行业竞争、人员素质等，以上因素均会导致产品管理人的投资业绩产生波动。如果本产品所投资的产品的管理人经营不善，就会造成本产品投资收益下降。虽然本产品可以通过投资多样化分散这种非系统风险，但不能完全规避。
2.产品运作风险。具体包括产品投资风格漂移风险、投资/产品经理更换风险、产品实际操作风险、产品管理人公司治理风险以及产品设计开发创新风险等。此外，因产品分立、合并及不满足存续要求而清盘时，也会面临风险。虽然产品管理人将会从产品风格、投资能力、管理团队、实际运作情况等多方面精选投资品种，但无法完全规避产品运作风险。
九、相关机构的经营风险：
1.产品管理人经营风险 按照我国相关法律规定，虽产品管理人相信其本身将按照相关法律的规定进行营运及管理，但无法保证其本身可以永久维持符合监管法律和监管部门的要求。如在产品存续期间产品管理人无法继续经营基金业务，则可能会对产品产生不利影响。
2.产品托管人经营风险 按照我国金融监管法律规定，产品托管人须获得中国证监会核准的证券投资基金托管资格方可从事托管业务。虽产品托管人相信其本身将按照相关法律的规定进行营运及管理，但无法保证其本身可以永久维持符合监管部门的金融监管法律。如在产品存续期间产品托管人无法继续从事托管业务，则可能会对产品产生不利影响。
十、关联交易风险
本产品将投资于由产品管理人的关联方管理的产品或者与产品管理人或其关联方进行交易，这构成产品管理人与本产品的关联交易，存在关联交易风险。
十一、净值波动风险
有如下情形之一时，可能导致本产品基础资产的净值波动风险，进而导致本产品净值产生波动：估值日无法及时获取所投资品种的最新估值价格；估值日取得的投资品种的最新估值价格没有或无法排除影响估值价格的因素（例如在估值日无法排除业绩报酬对估值价格的影响）；按照预期收益率反映的估值价格与实际兑付的收益产生差异。
十二、其他风险
战争、自然灾害等不可抗力因素的出现，将会严重影响证券市场的运行，可能导致产品资产的损失。金融市场危机、行业竞争、代理机构违约等超出产品管理人自身直接控制能力之外的风险，可能导致产品份额持有人利益受损。


						</p>
						
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<%@include file="../../public/foot_v2.jsp"%>
</body>
</html>
