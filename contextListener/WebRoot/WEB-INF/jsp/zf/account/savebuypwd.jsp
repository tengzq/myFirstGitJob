<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv= "pragma " content= "no-cache "/>
<meta http-equiv= "cache-control " content= "no-cache "/>
<meta http-equiv= "expires " content= "0 "/>
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="text/css" href="jingtai/css/base.css" rel="stylesheet" />
<link type="text/css" href="jingtai/css/p2p.css" rel="stylesheet" />
<link type="text/css" href="jingtai/css/jquery-ui-1.8.13.custom.css" rel="stylesheet" />
<script type="text/javascript" src="jingtai/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="jingtai/js/jquery-ui-1.8.13.min.js"></script>
</head>
<script type="text/javascript">

$(document).ready(function() {
	var ide='${pd.IDENTITY}';
	if(ide.length==18){
		var iden=ide.replace(/(\d{4})\d{10}(\d{3})([a-z]{1})/,'$1****$2$3');
		$("#identity").text(iden);
	}
	if(ide.length==15){
		var iden='${pd.IDENTITY}'.replace(/(\d{4})(\d{7})(\d{3})([a-z]{1})/,'$1****$2$3');
		$("#identity").text(iden);
	}
	$("#acceptButton").click(function() {
		if(checkRepeatPassword()||checkRepeatPassword()){
			$("#form")[0].submit();
		}
	});
});
var reg=/^[a-zA-Z0-9]+\d+[a-zA-Z0-9]{4,18}$/;
var reg2=/^[0-9]*(([a-zA-Z]+[0-9]+)|([0-9]+[a-zA-Z]+))+[a-zA-Z]*$/;
function checkPassword(){
	var psw = $("#tradePassword").val();
	if (psw == 0||psw == '') {
		alert("请输入交易密码");
		return false;
	}
	if(!reg.test(psw)){
		$("#tradePasswordSpan").css('color', 'red');
		$("#tradePasswordSpan").html('交易密码格式非法，为6到18位数字和字母（含大小写）');
		return false;
	}else{
		$("#tradePasswordSpan").css('color', '');
		$("#tradePasswordSpan").html('交易密码为6到18位数字和字母（含大小写）');

		return true;
		}
}

function checkRepeatPassword(){
	var tradePassword = $("#tradePassword").val();
	var tradePassword2 = $("#tradePassword2").val();
	if (tradePassword !== tradePassword2) {
		$("#tradePasswordSpan2").css('color', 'red');
		$("#tradePasswordSpan2").html('两次输入的交易密码不一致');
		return false;
	}else{
		$("#tradePasswordSpan2").css('color', '');
		$("#tradePasswordSpan2").html('');
		return true;
	}
}
function doclick(){
	$("#tradePasswordSpan").css('color', '');
	$("#tradePasswordSpan").html('交易密码为6到18位数字和字母（含大小写）');
}
</script>
</head>

<body class="f12">
  






<!--头部-->
<div class="header">
  <div class="layout">
    <h1 class="logo fl mt15"><a href="http://www.yeepay.com/" target="_blank"><img src="images/logo.png" alt="易宝支付" /></a></h1>
    <div class="fr miniNav mt10"><a href="http://www.yeepay.com/" target="_blank">易宝支付首页</a></div>
  </div>
</div>
<!--头部结束--> 
<!--头部结束-->
    
    <h2 class="layout regHd">会员注册</h2>
<!--业务信息主要内容-->
  <div style="display: none;">
    <input id="platformNo" type="hidden" name="platformNo" value="10012413453"/>
    <input id="platformUserNo" type="hidden" name="platformUserNo" value="dwj_user-840753-online"/>
  </div>
<div class="layout infoWrap">
  <div class="innerInfo regIn pb20 mt20">
    <div class="row"><span class="tit">商户名称：</span><span class="fb">北京大家玩科技有限公司</span></div>
    <div class="row"><span class="tit">用户名：</span><span class="fb arial">${pd.USERNAME }</span></div>
    <div class="row"><span class="tit">真实姓名：</span><span class="fb"></span>${pd.REAL_NAME }</div>
    <div class="row"><span class="tit">证件号：</span><span class="fb arial" id="identity"></span></div>
    <div class="row"><span class="tit">手机号码：</span><span class="fb arial">${pd.TEL }</span></div>
    <!--表单-->
    <div class="layout formWrap">
      <form id="form" action="register/savePayPassWord" method="post" class="reg">
        <input type="hidden" name="data_finger_sign"  value="4n2bqdyurmxvz50bfdg43xtpvxhwgbmx"/>
        <div>
          <label><span class="sign">设置交易密码：</span>
            <input id="tradePassword" name="PAY_PASSWORD" type="password" onblur="checkPassword()" onclick="doclick()" /><span id="tradePasswordSpan" class="ml10 prm">交易密码为6到18位数字和字母（含大小写）</span>
          </label>
        </div>
        <div class="mt10">
          <label><span class="sign">重复交易密码：</span>
            <input id="tradePassword2" type="password" onblur="checkRepeatPassword()" /><span id="tradePasswordSpan2" class="ml10 prm"></span>
          </label>
          <div class="error none">交易密码有误，请重新输入。</div>
        </div>
        <div class="mt10">
          <label><span class="sign">手机验证码：</span>
            <input id="dynamicPwd" name="dynamicPwd" type="text" class="phoneCode" />
          </label>
          <input type="button" style="width:120px;height:30px;"  id="sendSmsVerify" value="点击获取"></input><span id="sendSmsVerifySpan" class="ml10 prm">发送校验码</span>
          
        </div>
        <div class="btnGroup"><input type="button" id="acceptButton" value="同意以下协议并提交"></div>
      </form>
    </div>
    <!--表单结束--> 
  </div>
  <!--用户协议-->
  <div class="agreWrap">
  	<h2 class="fb">易宝支付托管账户用户协议</h2>
    <p>资金托管账户是易宝支付有限公司（以下简称“易宝支付”）提供给网络特约商户（以下简称“商户”）用于在其基于互联网的交易系统平台为其用户开立并方便用户通过在线向商户预付款并在用户本人授权的前提下实现预付款项的支付、划转、管理的账户系统。商户有因其违反国家法律、法规、从事非法经营、不正当竞争、虚假宣传、非法广告、商业欺诈或侵害用户合法权益的任何活动造成其平台用户的投诉和纠纷，由商户自行承担全部法律责任。
鉴于您已选择开通本账户服务，为了保障您的合法权益，请您认真阅读本服务协议全部内容，当您注册或使用账户服务时，即表示您已充分了解您将拥有的权利及需承担的义务并同意接受本协议项下的全部条款。
使用本服务的用户应具有法律规定的完全民事权利能力和行为能力，且为能够独立承担民事责任的自然人、法人或其他组织或机构。若您不不符合前述条件，应立即停止注册和使用账户。
（一）使用规则 
1、用户在申请使用易宝支付网络服务时，必须向易宝支付准确提供必要的资料。如资料有任何变动，请在易宝支付产品网站上（www.yeepay.com）及时更新。  
2、用户应使用真实有效身份信息注册并使用账户，并依注册提示提供用户的正确、完整、有效的相关资料（下称注册信息），用户不得冒用或妨碍其他组织、机构或个人注册使用账户。
3、易宝支付有权通过银行或其他第三方机构验证用户的注册信息，并有权通过第三方获得用户相关信息。
4、用户注册成功后，易宝支付将为其开通一个账户，该账户的登录名和密码由用户负责保管；用户应当对以其账户进行的所有活动和事件负法律责任。  
5、用户有义务维护和更新自己的注册信息，确保其持续的准确性、完整性和有效性，并承担因用户的注册信息缺失、陈旧或不真实而造成的任何损失，且易宝支付有权暂停或终止为用户提供任何账户服务。
6、根据监管机构要求，为了保障用户资金的安全，部分账户功能需要用户进行账户身份认证后方能使用。
7、用户必须同意接受易宝支付通过电子邮件或其他电子方式向其发送的产品或其他相关信息。 
8、用户在使用账户服务过程中，必须遵循以下原则：  
(a) 遵守中国有关的法律和法规；  
(b) 不得为任何非法目的而使用网络服务系统；  
(c) 遵守所有与网络服务有关的网络协议、规定和程序；  
(d) 不得利用易宝支付网络服务系统进行任何可能对互联网的正常运转造成不利影响的行为；
(e) 不得利用易宝支付网络服务系统传输任何骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；  
(f) 不得利用易宝支付网络服务系统进行任何不利于易宝支付的行为；  
(g) 如发现任何非法使用用户账户或账户出现安全漏洞的情况，应立即通告易宝支付。
如用户在使用网络服务时违反任何上述规定，易宝支付或及其授权的人有权要求用户改正或直接采取一切必要的措施（包括但不限于更改或删除用户张贴的内容等、暂停或终止用户使用网络服务的权利）以减轻用户不当行为造成的影响。
（二）服务内容
1、充值：您可在注册完成后，通过在线的方式向商户为您设立的托管账户进行款项划转。款项划转至您的托管账户内，即视您授权商户将您充值资金交付托管账户保管且仅在您授权的情况下进行账户资金的操作使用。
2、支付：您可使用托管账户中的可用余额直接在商户交易系统平台进行支付，根据您的授权，托管账户系统将预授权您指定的金额，并在商户交易系统平台发出交易成功指令后，自动从您对应的托管账户中扣除已支付金额，划转至交易指定账户。如发出失败指令将解除预授权后，将您预授权指定金额即转入可用余额。商户交易系统平台可根据您的授权委托，使用您的托管账户进行自动支付并完成相应资金的划转操作。
3、提现：你可以对商户为您其开设的托管账户中的款项进行取现操作，但您指定的银行账户必须完成身份验证和银行卡验证且该银行账户为您本人有效的国内银行账户，根据您的授权指定款项划转至该银 行账户。
4、除了上述服务外，易宝支付提供其他账户服务，以易宝支付网站公布或与用户另行约定为准。
（三）资费
您在使用相关服务时，易宝支付有权向您收取相应的服务费。具体收费方式及收费标准详见本网站平台所列或与用户的其他约定费用为准。易宝支付拥有制订及不时调整收费方式及服务费标准的权利。
（四）内容所有权  
1、易宝支付所提供的服务内容可能包括：文字、软件、声音、图片、录像、图表等。所有这些内容受版权、商标和其它财产所有权法律的保护。  
2、您只有在获得易宝支付或其他相关权利人的授权之后才能使用这些内容，而不能擅自复制这些内容、或制造与内容有关的派生产品。  
（五）用户的权利及义务
1、您应妥善保管账号、密码及注册信息，确保您的托管 账户及密码的安全，请不要向任何人泄露、透露、 告知的您托管账户和密码，因保管不当所产生的一切损失将由您自行承担，并赔偿因此给易宝支付或其他主体造成的损失。
2、账户仅限用户使用，不得向任何其他第三方出售、出租、转让或者以其他形式进行有偿或无偿转让或提供账户使用。
3、用户应自行查询账户余额和使用情况，并定期保存交易历史记录，如果您认为您的托管账户或密码可能存在任何异常或疑问，或者您认为您的托管账户或密码已 被他人知悉，或者发现任何未经您授权发生的账户操作，应及时以有效方式联系易宝支付客户服务人员。有助于保护您的权益，这亦是你的责任和义务。在收到通知前，对您的托管账户已发生的任何操作及款项转移不承担任何责任。如您密码需要修改或遗忘需找回密码的，您可依据提示进行操作。
4、易宝支付不参与用户与任何其他与易宝支付合作的商户或用户之间的交易，用户对使用账户所进行的网上交易及由此产生的一切后果承担民事法律责任。
5、用户应合理使用账户，不得从事任何违反法律、法规等具有约束力的规范性文件的行为（包括进行没有真实交易的充值、支付与提现等行为）；不得对账户使用过程中的任何计算机数据进行拦截、破解、篡改或对账户服务系统进行非正常的登录。
6、用户使用易宝支付合作机构提供的其他账户增值服务时，应遵守该增值服务的相应规定，否则易宝支付有权依据合作机构的要求停止该增值服务。
7、在发生任何涉嫌违法交易时，用户应根据司法机关、银行及易宝支付的要求提供涉嫌违法交易的相关证明。
（六）易宝支付的权利与义务
1、承担账户系统运行，向用户提供本协议所约定之各项服务。对支付系统的信息处理过程中的安全、保密、及时性负责。
2、当您注册为本服务用户时，易宝支付有权通过第三方审核您的身份。但不对托管账户的用户身份进行任何形式的承诺，亦不承担因托管账户身份信息不实所引发的任何责任。
3、作为本服务的注册用户，易宝支付将遵照您在商户交易系统平台发出的指示，按照您的指令完成账户充值、支付、提现等功能操作，所有操作均是严格依照您的指令完成，即表示您对相应指令所产生的一切后果完全负责。
4、您明确知悉易宝支付仅是您所使用商户交易系统平台的资金托管账户服务的提供商，您在商户交易系统平台所看到的任何信息均由交易系统平台运营方发布，易宝支付对信息的真实性不作 任何担保亦不承担任何责任；易宝支付对您在商户交易系统平台进行的任何操作所产生的投诉或纠纷不承担任何责任。如因上述原因致使您遭受任何形式的损失，易宝支付不承担任何赔偿责任。
5、易宝支付保障用户账户中的资金独立存放，若非收到商户发出的经用户授权的支付指令或法律的规定，不得动用。但是，您通过本服务流转或存放的款项将不产生任何利息。
6、易宝支付有权基于交易安全和系统维护的需要，在预先通过网站公示的情形下，对交易系统进行计划性的暂停服务。
7、在用户涉嫌进行违法交易或违反本协议约定时，易宝支付将无法保证您的款项操作顺利或者正确的完成，且对此不承担任何损害赔偿责任。若在上述状况下款项已先行拨入您的托管账户，易宝支付有权且无需附加任何条件向您收回该款项。此款项若已拨入您的银行账户，您同意易宝支付有向您亊后追索的权利并有权对用户的账户进行限额、冻结、停止服务，直至关闭账户，必要时移交司法机关处理。
8、易宝支付保留单方修改本协议的权利，并以网站公告的方式予以公示，而不另行通知用户。
9、您任何试图破坏、入侵、修改本服务功能或其安全防护体系或者实施其他危害本服务功 能或安全防护体系的行为，易宝支付有权永久终止您账号的使用，您必须承担一切由此产生的损害赔偿责任及一切法律责任。
（七）隐私保护  
1、保护用户隐私是易宝支付的一项基本政策，易宝支付保证不对外公开或向第三方提供用户注册资料及用户在使用网络服务时存储在易宝支付的非公开内容，但下列情况除外：  
(a) 事先获得用户的明确授权；  
(b) 根据有关的法律法规要求；  
(c) 按照相关政府主管部门的要求；  
(d) 为维护社会公众的利益；  
(e) 为维护易宝支付的合法权益。  
2、易宝支付可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与易宝支付同等的保护用户隐私的责任，则易宝支付可将用户的注册资料等信息提供给该第三方。  
3、在不透露单个用户隐私资料的前提下，易宝支付有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。 
（八）免责声明  
1、用户明确同意其使用易宝支付网络服务所存在的风险将完全由其自己承担；因其使用易宝支付网络服务而产生的一切后果也由其自行承担，易宝支付对用户及其网上交易行为的影响不承担任何责任。  
2、易宝支付不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。 
3、易宝支付不保证为向用户提供便利而设置的外部链接的准确性和完整性，同时，对于该外部链接指向的不由易宝支付实际控制的任何网页上的内容，易宝支付不承担任何责任。
4、您了解在使用本服务时，可能由于银行本身系统维护问题、相关网络问题或其他不可抗力，造成托管账户的款项划转无法顺利完成导致款项划转异常易宝支付不对此承担任何责任，但仍将积极协助您处理异常。
（九）服务变更、中断或终止      
如因系统维护或升级的需要而需暂停网络服务，易宝支付将尽可能事先进行通告。如发生下列任何一种情形，易宝支付有权随时中断或终止向用户提供本协议项下的网络服务而无需通知用户：  
1、用户提供的个人资料不真实；  
2、用户违反本协议中规定的使用规则。  
除前款所述情形外，易宝支付同时保留在不事先通知用户的情况下随时中断或终止部分或全部网络服务的权利，对于所有服务的中断或终止而造成的任何损失，易宝支付无需对用户或任何第三方承担任何责任。  
（十）违约赔偿  
用户同意保障和维护易宝支付及其他用户的利益，如因用户违反有关法律、法规或本协议项下的任何条款而给易宝支付或任何其他第三方造成损失，用户同意承担由此造成的损害赔偿责任。  
（十一）协议修改  
易宝支付将有权随时修改本协议的有关条款，一旦本协议的内容发生变动，易宝支付将会通过适当方式向用户提示修改内容。如果不同意易宝支付对本协议相关条款所做的修改，用户有权停止使用网络服务。如果用户继续使用网络服务，则视为用户接受易宝支付对本协议相关条款所做的修改。  
（十二）法律管辖
本协议的订立、执行和解释及争议的解决均应适用中国法律。  
如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向易宝支付所在地的人民法院提起诉讼。  
（十三）通知和送达
本协议项下所有的通知均可通过重要页面公告、电子邮件或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。  
（十四）其他规定
本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。  
如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p>
  </div>
  <!--用户协议结束-->
</div>
<!--业务信息主要内容结束--> 
<!--底部-->
  

  <!--表单结束-->
  






<!--底部-->
<div class="footer">
  <div class="inStation"> <a href="http://www.yeepay.com/category/abuoutYeepZN/%E5%85%B3%E4%BA%8E%E6%98%93%E5%AE%9D" target="_blank">易宝简介</a>|<a href="http://www.yeepay.com/category/aboutYeep/AboutYeePay" target="_blank">About YeePay</a>|<a href="http://www.yeepay.com/category/aboutYeepay/contactus/%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC" target="_blank">联系我们</a>|<a href="http://www.yeepay.com/category/Recruit/%E4%BA%BA%E6%89%8D%E6%88%98%E7%95%A5" target="_blank">诚聘英才</a>|<a href="http://www.yeepay.com/category/merchantServices/friendlink/%E5%8F%8B%E6%83%85%E9%93%BE%E6%8E%A5" target="_blank">友情链接</a>|<a href="http://www.yeepay.com/category/map" target="_blank">网站地图</a> </div>
  <p class="copyright">&copy; 2003-2012 易宝支付有限公司(YeePay.com)版权所有<br />
    京ICP证030831号 京ICP备08100193号-1 京公网安备110105000585</p>
  <div class="footerNew"><a href="http://www.yeepay.com/article?type=wireless&aid=991" target="_blank"><img src="images/footer_icon_03.gif" /></a><a href="http://www.yeepay.com/article?type=wireless&aid=990" target="_blank"><img src="images/footer_icon_06.gif" /></a><a href="http://www.yeepay.com/article?type=wireless&aid=992" target="_blank"><img src="images/footer_icon_22.gif" /></a><a href="#" target="_blank"><img src="images/footer_icon_11.gif" /></a><a href="http://www.visa.com.cn/index.shtml" target="_blank"><img src="images/footer_icon_17.gif" /></a><a href="https://sealinfo.verisign.com/splash?form_file=fdf/splash.fdf&dn=*.yeepay.com&lang=en" target="_blank"><img src="images/footer_icon_25.gif" /></a><a href="http://www.atsec.cn/cn/pci-attestation/YeePay-PCIAttestation-atsec-PCI-DSS-C-36123.jpg" target="_blank"><img src="images/footer_icon_19.gif" /></a><a href="http://www.bj.cyberpolice.cn/index.do" target="_blank"><img src="images/footer_icon_08.gif" /></a><a href="#" target="_blank"><img src="images/footer_icon_28.gif" /></a><a href="https://ss.cnnic.cn/verifyseal.dll?sn=2011051700100008785&ct=df&a=1&pa=0.6245295640708054&rf=https%3A%2F%2Fwww.yeepay.com%2F&vt=1384932064961&mk=9fc6db7293cf165a2301bd54f777d5b8" target="_blank"><img src="images/footer_icon_31.gif" /></a><a href="http://www.360.cn/" target="_blank"><img src="images/footer_icon_14.gif" /></a></div>
</div>
<!--底部-->
</body>
</html>
