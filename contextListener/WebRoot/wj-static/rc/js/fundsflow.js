$(function(){
	getFundsflow(1,10,'');
	
	
	$('.tzjl nav li').on('click',function(){
		$(this).addClass('hover').siblings().removeClass('hover');
		var type = $('.tzjl nav li.hover').index();
		if(0 == type){
			type = '';
		}else{
			type -= 1;
		}
		getFundsflow(1,10,type);
	});
});

var hashCode = $('#hashCode').val(),
	basePath = $('#basePathUrl').val();
var type = '';

/**
 * 分页获取资金流水
 * @param currentPage 获取第几页
 * @param showCount 每页显示条数
 * @param type 获取资金流水的类型
 */
function getFundsflow(currentPage,showCount,type){
	$.ajax({
		type : "get",
		url : basePath+"fundsflow/allList",
		cache : false,
		data : {
			TYPE : type,
			currentPage : currentPage,
			showCount : showCount,
			USER_ID : hashCode
		},
		dataType : "json",
		success : function(rs){
			refreshData(rs);
		}
	})
}
/**
 * 处理异步返回数据
 * @param jsonData 返回的json数据
 */
function refreshData(jsonData){
	var $tr = $('#table-template tbody').html();//数据模板
	var htmls = "";
	$.each(jsonData.singlefundsList,function(k,v){
		
		var tr = $tr.replace(/@type@/,getTypeString(v.TYPE))
					.replace(/@tradeTime@/,v.TRADE_TIME)
					.replace(/@amount@/,v.AMOUNT)
					.replace(/@balance@/,v.BALANCE)
					.replace(/@remark@/,v.REMARK);
		htmls += tr;
	});
	$('.table table tbody').html(htmls);
	kkpager.generPageHtml({
		pno : jsonData.page.currentPage || 1,
		//总页码
		total : jsonData.page.totalPage || 1,
		//总数据条数
		totalRecords : jsonData.page.totalResult || 0,
		mode : 'click',//默认值是link，可选link或者click
		click : function(n){
			// do something
			getFundsflow(n,10,type);
			//手动选中按钮
			this.selectPage(n);
			return false;
		}
	});
}
/**
 * 根据类型返回类型中文
 * @param type
 * @returns {String}
 */
function getTypeString(type){
	var returnString = "";
	switch(type){
		case 0 :
			returnString = "充值";
			break;
		case 1 :
			returnString = "投资";
			break;
		case 2 :
			returnString = "提现";
			break;
		case 3 :
			returnString = "收益";
			break;
		case 4 :
			returnString = "回收本金";
			break;
		case 5 :
			returnString = "转账";
			break;
		case 6 :
			returnString = "返现";
			break;
		default :
			returnString = "其他";
	}
	return returnString;
}