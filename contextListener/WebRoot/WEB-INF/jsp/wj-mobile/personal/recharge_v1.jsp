<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>

	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>万金先生 - 充值</title>
		<meta name="keywords" content="万金先生,万金投资,懒理财,理财,账房">
		<meta name="Description" content="万金先生 - 会理财，好先生。国内领先的互联网金融平台，来自500强企业优质资产，银行千亿级授信企业。年化收益13-20%，玩转邀请码尽享3%加息。创始人团队全部来自清华，北大。" />
		<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
		<link href="wj-mobile-static/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/layout.css" />
		<link rel="stylesheet" type="text/css" href="wj-mobile-static/css/pay.css" />
		
		<script src="wj-mobile-static/js/jquery-1.9.1.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			.bank-not-support{
			    text-align: center;
			    margin: 20px 10px;
			    background-color: #fff;
			    height: 30px;
			    border-radius: 5px;
			    box-shadow: 0 5px 0 0 #909090;
			    padding-top: 15px;
			    font-size: 15px;
			    color: #ff6264;
			}
		</style>
	</head>

	<body>
		<div id="body">
			<%-- <section id="page1" class="page">
				<!--页头-->
				<%@include file="../common/head.jsp" %>
				<!--主体内容-->
				<ul id="pageNav">
					<li data-page="2">在线充值<i class="fa fa-chevron-right"></i></li>
					<li data-page="3">网银转账<i class="fa fa-chevron-right"></i></li>
				</ul>
			</section> --%>
			<section id="page2" class="page">
				<!--页头-->
				<%@include file="../common/head.jsp" %>
				<!--主体内容-->
				<dl class="syje">
					<dt>可用金额：<span>${pd.BALANCE}</span>元<em>（注：充值最低金额为100元）</em></dt>
					<dd>
						<input type="tel" name="amount" id="rechargeAmount" placeholder="请填写充值金额"/>
						<input type="hidden" name="rechargeBank" id="rechargeBank" value=""/>
						<span class="unit">元</span>
					</dd>
				</dl>
				<h3>当前账户绑定银行</h3>
				<div id="no-bank" class="bank-not-support" style="display: none">
					<p>绑定的银行卡暂不支持移动端充值</p>
				</div>
				<ul class="bank-list">
					<li class="selectedbank" data-bank="ICBC" data-code="3002">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1002.png">
						<span>中国工商银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="ABC" data-code="3005">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1005.png">
						<span>中国农业银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="CCB" data-code="3003">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1003.png">
						<span>中国建设银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="BOC" data-code="3026">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1026.png">
						<span>中国银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="CMB" data-code="3001">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1001.png">
						<span>招商银行</span><i class="fa fa-check"></i>
					</li>
					<!-- <li data-bank="BCOM" data-code="3020">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1020.png">
						<span>交通银行</span><i class="fa fa-check"></i>
					</li> -->
					<li data-bank="CMBC" data-code="3006">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1006.png">
						<span>中国民生银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="CEB" data-code="3022">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1022.png">
						<span>中国光大银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="SPDB" data-code="3004">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1004.png">
						<span>浦发银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="CIB" data-code="3009">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1009.png">
						<span>兴业银行</span><i class="fa fa-check"></i>
					</li>
					<!-- <li data-bank="CITIC" data-code="3039">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1039.png">
						<span>中信银行</span><i class="fa fa-check"></i>
					</li> -->
					<!-- <li data-bank="PSBC" data-code="3038">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1038.png">
						<span>中国邮政储蓄银行</span><i class="fa fa-check"></i>
					</li> -->
					<li data-bank="PAB" data-code="3035">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1035.png">
						<span>平安银行</span><i class="fa fa-check"></i>
					</li>
					<li data-bank="GDB" data-code="3036">
						<img src="https://res.baofoo.com/gw/resource/images/common/s1036.png">
						<span>广发银行</span><i class="fa fa-check"></i>
					</li>
					
				</ul>
				<div class="bank-recharge-limit">
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
				<p style="margin-top: 10px;text-align: center;font-size: 12px; color: red;">如当前银行卡不能满足充值需求<br>可到第三方平台点击“<i class="fa fa-cog"></i>”选择其他银行</p>
				<footer style="display: block" class="showed">
					<!-- <a href="javascript:back('page2');">返回</a> -->
					<a href="javascript:void(0);" id="rechargeBtn" style="width: 100%;">立即充值</a>
				</footer>
			</section>
			<%-- <section id="page3" class="oth-page">
				<!--页头-->
				<%@include file="../common/head.jsp" %>
				<!--主体内容-->
				<form id="shenqingfrom" action="mobile/recharge/moneyOrderReques" method="post">
					<input type="hidden" name="MONEY_ORDER_METHOD" id="MONEY_ORDER_METHOD">
					<dl class="info">
						<dt>贷&nbsp;账&nbsp;号&nbsp;：</dt>
						<dd>110916851210101</dd>
					</dl>
					<dl class="info">
						<dt>账&nbsp;户&nbsp;名&nbsp;：</dt>
						<dd><input name="MONEY_ORDER_TO" readonly="readonly" value="北京灜通投资管理有限公司" style="border: 0;background-color: inherit; width: 200px;"/></dd>
					</dl>
					<dl class="info">
						<dt>开&nbsp;户&nbsp;行&nbsp;：</dt>
						<dd>
							<input name="MONEY_ORDER_TO" readonly="readonly" value="招商银行股份有限公司北京大运村支行" style="border: 0;background-color: inherit; width: 200px;"/>
						</dd>
					</dl>
					<dl>
						<dt>汇款日期&nbsp;：</dt>
						<dd><input type="date" name="MONEY_ORDER_DATE" id="MONEY_ORDER_DATE" placeholder="请填写汇款日期" /></dd>
					</dl>
					<dl>
						<dt>汇款金额&nbsp;：</dt>
						<dd><input type="tel" id="MONEY_ORDER_NUM" name="MONEY_ORDER_NUM" placeholder="请填写汇款金额" /></dd>
					</dl>
					<dl>
						<dt>汇&nbsp;出&nbsp;行&nbsp;&nbsp;：</dt>
						<dd><input type="text" id="MONEY_ORDER_BANK" name="MONEY_ORDER_BANK" placeholder="请填写汇出行" /></dd>
					</dl>
					<dl class="select-type">
						<dt>汇款方式&nbsp;：</dt>
						<dd>
							<ul>
								<li>
									<input type="radio" name="huikuan" id="type1" value="1" checked/>
									<label for="type1">转账</label>
								</li>
								<li>
									<input type="radio" name="huikuan" id="type2" value="2" />
									<label for="type2">汇款</label>
								</li>
							</ul>
							
						</dd>
					</dl>
					<dl class="type" data-type = "type1">
						<dt>汇款账户&nbsp;：</dt>
						<dd><input type="text" id="MONEY_ORDER_FROM" name="MONEY_ORDER_FROM" placeholder="请填写汇款账户" /></dd>
					</dl>
					<dl class="type" data-type = "type2">
						<dt>交易流水号&nbsp;：</dt>
						<dd><input type="text" id="MONEY_ORDER_BATCH" name="MONEY_ORDER_BATCH" placeholder="请填写交易流水号" /></dd>
					</dl>
					<dl>
						<dt>说&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;明&nbsp;：</dt>
						<dd><input type="text" id="MARK" name="MARK" placeholder="您的姓名" /></dd>
					</dl>
					
				</form>
				<footer>
					<a href="javascript:back('page3');">返回</a>
					<a href="javascript:void(0);" id="transBtn">确认</a>
				</footer>
			</section> --%>
		</div>
		<script src="wj-mobile-static/js/jquery.tips.js" type="text/javascript" charset="utf-8"></script>
		<script src="wj-mobile-static/js/recharge.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$('#body').width($(window).width()).height($(window).height());
				
				$('.bank-list li').hide().removeClass('selectedbank');
				var bankCode = '${bankInfo.BANK_CODE}';
				if(bankCode){
					$('[data-code='+bankCode+']').css('border','0').show().click();
					$('section[data-code='+$('#rechargeBank').val()+']').css('display','block');
					
				}else{
					$('#no-bank').show();
				}
				if(!$('.bank-list li').hasClass('selectedbank')){
					$('#rechargeBank').val('');
					$('#no-bank').show();
				}
				//console.log('${bankInfo.BANK_CODE}');
			});
			
		</script>
	</body>
</html>
