<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<!--<![endif]-->
<head>
<base href="<%=basePath%>">

<title>万金先生 - 专为万金打造的优质理财平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。"/>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="wj-static/css/reset.css">
<link href="wj-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="wj-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="wj-static/css/recharge.css">

<script src="wj-static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="wj-static/js/datepick/laydate.js"></script>
<script src="wj-static/js/jquery.tips.js" type="text/javascript"></script>
<script src="wj-static/js/layout.js" type="text/javascript"></script>
<script src="wj-static/js/recharge.js" type="text/javascript"></script>

</head>
<body>
<%@ include file="../public/top.jsp"%>
<div id="main">
	<div class="mainbody main">
		<%@include file="../public/acc_left.jsp" %>
	    <div class="content">
	    	<div class="gerenxinxi woyaochongzhi">
	        	<h3>
	            	<span>我要充值</span>
	            </h3>
	            <div class="nav">
            	<ul>
                	<!-- <li class="hover"><a href="javascript:void(0)" id="net">宝付支付</a></li> -->
                	<li class="hover"><a href="javascript:void(0)" id="99">快钱支付</a></li>
                	<li><a href="javascript:void(0)" id="bank">银行卡转账</a></li>
                    <div class="clear"></div>
                </ul>
            	</div>
	           <%--  <div class="con" id="wangyin">
	            	
						<div class="fastRecharge_bindCard">
							<form class="fastRecharge_bindCard_formBox">
								<input type="hidden" id="bankCode" value=""/>
								<ul>
									<li><label class="title"> 可用余额： </label> <span class="text"> <span class="amount">${sessionScope.sessionZfUser.BALANCE}</span> 元
									</span> <span style="line-height: 32px; margin-left:10px;">（注：充值最低金额为100元）</span></li>
									<li><label class="title mt8"> 选择银行： </label>
										<div class="bindedBank clearfix" style="display:none;">
											<input type="hidden" id="bankid" value=""> <input type="hidden" id="channel" value="">
											<div class="checked"> 
												<em style="background-image: url(http://pay.ppdaicdn.com/2015/img/banklog/bank_gs.png);"></em><i></i> 
											</div>
											<div class="otherBank">
												<img src="http://pay.ppdaicdn.com/2015/img/icon/fastrecharge-morebank.png"> <span>选择其他银行</span>
											</div>
											<div class="clear"></div>
					                        <section data-code="3001">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>大众版</td>
					                                        <td>500</td>
					                                        <td>500</td>
					                                    </tr>
					                                    <tr>
					                                        <td>专业版</td>
					                                        <td>200万</td>
					                                        <td>200万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">"单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95555"</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3026">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td>储蓄卡</td>
					                                        <td>USBKey证书认证、令牌+动态口令</td>
					                                        <td>5万</td>
					                                        <td>20万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95566</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3002">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="4">储蓄卡</td>
					                                        <td>电子口令卡</td>
					                                        <td>500</td>
					                                        <td>1000</td>
					                                    </tr>
					                                    <tr>
					                                        <td> 短信认证 </td>
					                                        <td> 2000 </td>
					                                        <td> 5000 </td>
					                                    </tr>
					                                    <tr>
					                                        <td> 电子密码 </td>
					                                        <td> 50万 </td>
					                                        <td> 100万 </td>
					                                    </tr>
					                                    <tr>
					                                        <td> U盾 </td>
					                                        <td> 100万 </td>
					                                        <td> 100万 </td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95588</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3003">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="3">储蓄卡</td>
					                                        <td>账号支付</td>
					                                        <td>5000</td>
					                                        <td>5000</td>
					                                    </tr>
					                                    <tr>
					                                        <td> 网银盾1代 </td>
					                                        <td> 5万 </td>
					                                        <td> 10万 </td>
					                                    </tr>
					                                    <tr>
					                                        <td> 网银盾2代 </td>
					                                        <td> 50万 </td>
					                                        <td> 50万 </td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95588</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3005">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="3">储蓄卡</td>
					                                        <td>动态口令</td>
					                                        <td>1000</td>
					                                        <td>3000</td>
					                                    </tr>
					                                    <tr>
					                                        <td> 移动证书（一代k宝） </td>
					                                        <td> 50万 </td>
					                                        <td> 100万 </td>
					                                    </tr>
					                                    <tr>
					                                        <td> 移动证书（二代k宝） </td>
					                                        <td> 100万 </td>
					                                        <td> 500万 </td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95599</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3020">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>手机短信密码验证</td>
					                                        <td>5万</td>
					                                        <td>5万</td>
					                                    </tr>
					                                    <tr>
					                                        <td> USBKey证书认证 </td>
					                                        <td> 100万 </td>
					                                        <td> 100万 </td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95559</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3036">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="3">储蓄卡</td>
					                                        <td>手机动态密码版</td>
					                                        <td>5000</td>
					                                        <td>5000</td>
					                                    </tr>
					                                    <tr>
					                                        <td>key盾</td>
					                                        <td>100万</td>
					                                        <td>100万</td>
					                                    </tr>
					                                    <tr>
					                                        <td>key令</td>
					                                        <td>1万</td>
					                                        <td>5万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：4008308003</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3035">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td>储蓄卡</td>
					                                        <td>网银</td>
					                                        <td>5万</td>
					                                        <td>5万</td>
					                                    </tr>
					
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：4006699999</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3038">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="3">储蓄卡</td>
					                                        <td>手机短信客户</td>
					                                        <td>1万</td>
					                                        <td>1万</td>
					                                    </tr>
					                                    <tr>
					                                        <td>电子令牌+短信客户</td>
					                                        <td>20万</td>
					                                        <td>20万</td>
					                                    </tr>
					                                    <tr>
					                                        <td>Ukey+短信客户</td>
					                                        <td>100万</td>
					                                        <td>100万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95580</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3022">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>手机动态密码</td>
					                                        <td>1万</td>
					                                        <td>1万</td>
					                                    </tr>
					                                    <tr>
					                                        <td>令牌动态密码及阳光网盾验证方式</td>
					                                        <td>50万</td>
					                                        <td>50万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95595</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3009">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>手机动态密码</td>
					                                        <td>日累积范围内无限额</td>
					                                        <td>初始5000，可至网点加大</td>
					                                    </tr>
					                                    <tr>
					                                        <td>U盾</td>
					                                        <td>40万</td>
					                                        <td>100万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95558</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3006">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="3">储蓄卡</td>
					                                        <td>大众版</td>
					                                        <td>300</td>
					                                        <td>300</td>
					                                    </tr>
					                                    <tr>
					                                        <td>贵宾班</td>
					                                        <td>5000</td>
					                                        <td>5000</td>
					                                    </tr>
					                                    <tr>
					                                        <td>U宝用户</td>
					                                        <td>50万</td>
					                                        <td>50万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95568</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3004">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>手机动态密码</td>
					                                        <td>20万</td>
					                                        <td>20万</td>
					                                    </tr>
					                                    <tr>
					                                        <td>数字证书（浏览器证书或U盾）</td>
					                                        <td>无限额，自行设置</td>
					                                        <td>无限额，自行设置</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95528</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
					                        <section data-code="3039">
					                            <table>
					                                <thead>
					                                    <tr>
					                                        <td width="18%">卡种</td>
					                                        <td width="18%">客户类型</td>
					                                        <td width="26%">单笔限额（元）</td>
					                                        <td width="26%">每日限额（元）</td>
					                                    </tr>
					                                </thead>
					                                <tbody>
					                                    <tr>
					                                        <td rowspan="2">储蓄卡</td>
					                                        <td>手机动态密码</td>
					                                        <td>1000</td>
					                                        <td>5000</td>
					                                    </tr>
					                                    <tr>
					                                        <td>U盾</td>
					                                        <td>100万</td>
					                                        <td>100万</td>
					                                    </tr>
					                                </tbody>
					                                <tfoot>
					                                    <tr>
					                                        <td colspan="4">单笔和当日限额仅供参考。如有疑问请致电银行客服热线：95528</td>
					                                    </tr>
					                                </tfoot>
					                            </table>
					                        </section>
										</div>
										<div class="bankList" style="display: block;">
											<ul>
												<li title="招商银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1001.jpg);" data-code="3001" bankid="1" channel="2" alone="5000" limit="5000000"><i></i></li>
												<li title="中国银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1026.jpg);" data-code="3026" bankid="2" channel="2" alone="5000" limit="10000"><i></i></li>
												<li title="中国工商银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1002.jpg);" data-code="3002" bankid="3" channel="2" alone="5000" limit="50000"><i></i></li>
												<li title="中国建设银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1003.jpg);" data-code="3003" bankid="4" channel="2" alone="5000" limit="1000000"><i></i></li>
												<li title="中国农业银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1005.jpg);" data-code="3005" bankid="5" channel="2" alone="5000" limit="200000"><i></i></li>
												<li title="交通银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1020.jpg);" data-code="3020" bankid="6" channel="2" alone="5000" limit="1000000"><i></i></li>
												<li title="上海浦东发展银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1004.jpg);" data-code="3004" bankid="7" channel="2" alone="5000" limit="1000000"><i></i></li>
												<li title="中国民生银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1006.jpg);" data-code="3006" bankid="8" channel="2" alone="5000" limit="5000"><i></i></li>
												<li title="兴业银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1009.jpg);" data-code="3009" bankid="9" channel="2" alone="5000" limit="10000"><i></i></li>
												<li title="中信银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1039.jpg);" data-code="3039" bankid="11" channel="2" alone="5000" limit="1000000"><i></i></li>
												<li title="中国光大银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1022.jpg);" data-code="3022" bankid="21" channel="2" alone="5000" limit="5000"><i></i></li>
												<li title="中国邮政储蓄所" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1038.jpg);" data-code="3038" bankid="22" channel="2" alone="5000" limit="5000"><i></i></li>
												<li title="平安银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1035.jpg);" data-code="3035" bankid="23" channel="2" alone="5000" limit="5000"><i></i></li>
												<li title="广发银行" style="background-image:url(https://res.baofoo.com/gw/resource/images/yh/1036.jpg);" data-code="3036" bankid="24" channel="2" alone="5000" limit="5000"><i></i></li>
											</ul>
										</div></li>

									<li>
										<label class="title"> 充值金额： </label> 
										<input type="text" class="text w146" value="" id="recharge-amount" maxlength="10" placeholder=""> 
										<em class="yuan">元</em> 
										<span class="finish"></span> 
										<span class="errorMsg"></span>
									</li>
									<li><label class="title" style="letter-spacing:0.2em;"> 手续费： </label> <span class="text" id="fee"> 免费 </span></li>
									<li><label class="title"> 实际到账： </label> <span class="text"> <span id="arrive" class="orange">0.00</span> 元
									</span></li>
								</ul>
								<p class="error"></p>
								<input type="button" value="立即充值" class="submitBtn" id="recharge-btn">
							</form>

						</div>
						<div class="wycz3">
		                	<h3>充值说明：</h3>
		                    <p>1.当日充值金额不可提现，充值未投资金额每日仅可提现10000元。</p>
		                    <p>2.万金先生严禁信用卡充值、套现等行为，一经发现将予以处罚，包括但不限于：限制收款、 冻结账户、永久停止服务，并会影响银行征信记录。</p>
		                    <p>3.开启自动投标后，充值金额会在次日零点加入自动投标。</p>
		                </div>
					</div>
	             --%>
	            <div class="con" id="99bill">
	            	<div class="fastRecharge_bindCard">
						<form id="kq-form" class="fastRecharge_bindCard_formBox" method="post" action="recharge/redirectRecharge">
							<ul>
								<li>
									<label class="title"> 可用余额： </label>
									<span class="text"> <span class="amount">${sessionScope.sessionZfUser.BALANCE}</span> 元 </span>
									<span style="line-height: 32px; margin-left:10px;">（注：充值最低金额为100元）</span></li>
								<li>
									<label class="title mt8"> 充值银行： </label>
									<div class="bindedBank clearfix bindedBank-kq">
										<input type="hidden" id="bankid-kq" name="bankId" value="${bankAb}">
										<input type="hidden" id="bank-card-kq" name="cardNum" value="${bankCardInfo.BANK_CARD}">
										<input type="hidden" id="channel-kq" value="">
										<div class="checked"> 
											<c:set value="${bankCardInfo.BANK_CODE}" var="bankCodeKq"></c:set>
											<em style="background-image: url(https://res.baofoo.com/gw/resource/images/yh/10${fn:substring(bankCodeKq,2,fn:length(bankCodeKq))}.jpg);"></em>
											<c:set value="${bankCardInfo.REAL_NAME}" var="kqRealName"></c:set>
											<span class="text" id="limit-kq" limit="50000.0000">持卡人：*${fn:substring(kqRealName,1,fn:length(kqRealName))}</span> 
											<c:set value="${bankCardInfo.BANK_CARD}" var="kqBankCard"></c:set>
											<span class="text" id="alone-kq" alone="5000.0000">尾号：${fn:substring(kqBankCard,fn:length(kqBankCard)-4,fn:length(kqBankCard))}</span> 
											<i></i> 
										</div>
									</div>
									<div>
										<section data-code="ICBC">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>5000</td>
				                                        <td>5万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
				                        <section data-code="CCB">
				                           <table>
					                             <thead>
					                                 <tr>
					                                     <td width="18%">卡种</td>
					                                     <td width="26%">单笔限额（元）</td>
					                                     <td width="26%">每日限额（元）</td>
					                                 </tr>
					                             </thead>
					                             <tbody>
					                                 <tr>
					                                     <td>储蓄卡</td>
					                                     <td>5万</td>
					                                     <td>100万</td>
					                                 </tr>
					                             </tbody>
					                         </table>
				                        </section>
										<section data-code="ABC">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>50万</td>
				                                        <td>50万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="CMB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>30万</td>
				                                        <td>无</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="BOC">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>1万</td>
				                                        <td>1万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="SPDB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>2万</td>
				                                        <td>2万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="GDB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>1万</td>
				                                        <td>1万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="CMBC">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>5000</td>
				                                        <td>5000</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="CIB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>5000</td>
				                                        <td>5000</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="CEB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>5000</td>
				                                        <td>5000</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
										<section data-code="PAB">
				                            <table>
				                                <thead>
				                                    <tr>
				                                        <td width="18%">卡种</td>
				                                        <td width="26%">单笔限额（元）</td>
				                                        <td width="26%">每日限额（元）</td>
				                                    </tr>
				                                </thead>
				                                <tbody>
				                                    <tr>
				                                        <td>储蓄卡</td>
				                                        <td>1万</td>
				                                        <td>1万</td>
				                                    </tr>
				                                </tbody>
				                            </table>
				                        </section>
									</div>
								<li>
									<label class="title"> 充值金额： </label>
									<input type="number" class="text w146" value="" id="amount-kq" name="amountKq" maxlength="10" placeholder="">
									<em class="yuan">元</em> <span class="finish"></span> <span class="errorMsg"></span> </li>
								<li>
									<label class="title" style="letter-spacing:0.2em;"> 手续费： </label>
									<span class="text" id="fee"> 免费 </span></li>
								<li>
									<label class="title"> 实际到账： </label>
									<span class="text"> <span id="arrive-kq" class="orange">0.00</span> 元 </span> </li>
							</ul>
							<p class="error kq-error"> </p>
							<input type="button" value="立即充值" class="submitBtn" id="submitBtn-kq">
						</form>
					</div>
	            </div>
	            
	            <div class="con" id="sqdiv" style="display: none">
	            	
					<div class="fastRecharge_bindCard">
						<form class="fastRecharge_bindCard_formBox" id="shenqingfrom" action="<%=basePath%>myAccount/moneyOrderReques" method="post">
							<input type="hidden" name="MONEY_ORDER_METHOD" id="MONEY_ORDER_METHOD" value="1"/>
							<ul>
								<li><label class="title"> 贷 账 号： </label> <span class="text"><input name="MONEY_ORDER_TO" class="span-input" value="110916851210101" readonly="readonly"/></span></li>
								<li><label class="title"> 账 户 名 ： </label> <span class="text"><input name="MONEY_ORDER_TO" class="span-input" value="北京灜通投资管理有限公司" readonly="readonly"/></span></li>
								<li><label class="title"> 开 户 行： </label> <span class="text"><input name="MONEY_ORDER_TO" class="span-input" value="北京市-招商银行股份有限公司北京大运村支行" readonly="readonly"/></span></li>
	
								<li><label class="title">汇款日期： </label> <input type="text" id="MONEY_ORDER_DATE" name="MONEY_ORDER_DATE" class="text w146 laydate-icon" value=""><span class="lineh ml20">银行汇款时间</span></li>
								<li><label class="title"> 汇款金额： </label> <input type="text" id="MONEY_ORDER_NUM" name="MONEY_ORDER_NUM" class="text w146" value=""><span class="lineh ml20">货币为人民币，格式如100.00</span></li>
								<li><label class="title"> 汇 出 行： </label> <input type="text" id="MONEY_ORDER_BANK" name="MONEY_ORDER_BANK" class="text w146" value=""></li>
								<li class="lineh" style="overflow:visible;">
									<label class="title"> 汇款方式： </label> 
									<input class="radio" type="radio" name="huikuan" value="1" checked="checked">
									<em style=" position:relative; top:2px;" class="">银行卡转账</em> <input class="radio ml20" type="radio" name="huikuan" value="2"><em style=" position:relative; top:2px;">现金汇款</em>
									<span class="ml20 viewPic" style="display: none"> 
										<span><a href="##">【手机端】</a>
										<img src="http://pay.ppdaicdn.com/2015/img/banklog/bank_zs.png"></span> 
										<span><a href="##">【网页版】</a>
										<img src="http://pay.ppdaicdn.com/2015/img/banklog/bank_gs.png"></span> 
										<a href="##">【请点击此处查询】</a>
									</span>
								</li>
								<li id="tradeAccount"><label class="title"> 汇款账户： </label> <input type="text" id="MONEY_ORDER_FROM" name="MONEY_ORDER_FROM" class="text w146" value=""></li>
								<li id="xianjin"><label class="title"> 交易流水号： </label> <input type="text" id="MONEY_ORDER_BATCH" name="MONEY_ORDER_BATCH" class="text w146" value=""></li>
								<li>
									<label class="title"> <span style="letter-spacing:1em;">说明</span>：
									</label> <input type="text" id="MARK" name="MARK" class="text w146" value="" placeholder="您的姓名">
								</li>
								<li style="margin-bottom: 5px;display: none;" id="error-area">
									<p style="color:red;text-align: center;width: 420px; font-size: 15px;">，提交失败，请确认信息完整度</p>
								</li>
							</ul>
							<input type="button" value="提交" class="submitBtn" id="tradeBtn" style="display:inline-block; width:150px;margin-left: 50px;"> <input type="button" value="重置" class="btnSet ml20"
								id="submitBtn">
						</form>
						<div class="instant_recharge_three">
							<h3>信用卡充值套现客户一律按原路返回处理，产生手续费、提现费一切有客户承担</h3>
						</div>
					</div>
				</div>
	    	</div>
	   		<div class="clear"></div>
		</div>
	</div>
</div>
<%@ include file="../public/foot.jsp"%>
<script type="text/javascript">
	!function() {
		laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
		laydate({
			elem : '#MONEY_ORDER_DATE',
			min : laydate.now(-50), //-1代表昨天，-2代表前天，以此类推
			max : laydate.now()

		});//绑定元素

	}();
</script>
<script>
	$('.otherBank').click(function() {
		$('.bankList').css('display', 'block');
		$('.bindedBank').eq(0).css('display', 'none');
		$('#bankCode').val('');
		$('#alone').attr('alone','');
		$('#limit').attr('limit','');
	})
	$('.bankList ul li').click(function(i) {
		//$(this).click(function() {
			$('.bankList').css('display', 'none');
			$('.bindedBank').eq(0).css('display', 'block');
			$('.checked em').eq(0).attr('style', $(this).attr('style'));
			$('#bankCode').val($(this).attr('data-code'));
			$('.bindedBank section[data-code=' + $(this).data('code') + ']').css('display', 'block').siblings('section').css('display', 'none');
		//})
	});

	$('.viewPic span a').each(function(i) {
		$(this).hover(function() {
			$('.viewPic span a').next('img').hide();
			$(this).next('img').show();
		}, function() {
			$('.viewPic span a').next('img').hide();
		})
	});
</script>
<div id="tools-a" style="width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 30px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-wrench"></i><span style="font-size: 13px;display: none">工具箱</span></div>
<div id="tools-div" style="display: none;">
	<a href="<%=basePath%>tools/counter" target="_blank"><div id="tools-b" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 100px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-calculator"></i><span style="font-size: 12px;line-height: 16px;display: none">收益<br>计算器</span></div></a>
	<a href="<%=basePath%>tools/rate" target="_blank"><div id="tools-c" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 170px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-bar-chart"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">利率表<br></span></div></a>
	<a href="http://www.sobot.com/chat/pc/index.html?sysNum=9367e183e71642fc80f034cca465d8ae" target="_blank"><div id="tools-d" style="cursor:pointer;width: 60px;height: 60px;display: block;position: fixed;bottom: 60px;right: 240px;background-color: #C3C3C3;color:#fff;font-size: 38px;line-height:60px;text-align: center;"><i class="fa fa-comment"></i><span style="font-size: 12px;line-height: 60px;height:100%;display: none">咨询客服<br></span></div></a>
</div>
</body>
</html>