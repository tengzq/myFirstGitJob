$(function(){
	
	
	var url = top.location.href;
	var urls = url.split('/');
	var thisTab = urls[urls.length-1].split('=')[1];
	$('.con div.tzjl nav ul').find('.'+thisTab).addClass('hover').siblings().removeClass('hover');
	type = thisTab;
	if (type == -1) {
		type = '';
	}
	getFundsflow(1,10, type);
/*	$('.tzjl nav li').on('click',function(){
		$(this).addClass('hover').siblings().removeClass('hover');
		var type = $('.tzjl nav li.hover').index();
		if(0 == type){
			type = '';
		}else{
			type -= 1;
		}
		getFundsflow(1,10,type);
	});*/
});

var hashCode = $('#hashCode').val(),
	basePath = $('#basePathUrl2').val();
var type = '';

/**
 * 分页获取资金流水
 * @param currentPage 获取第几页
 * @param showCount 每页显示条数
 * @param type 获取资金流水的类型
 */
function getFundsflow(currentPage,showCount,type){
	console.log(type);
	$.ajax({
		type : "get",
		url : basePath+"_project/allList",
		cache : false,
		data : {
			TYPE : type,
			currentPage : currentPage,
			showCount : showCount,
			USER_ID : hashCode
		},
		dataType : "json",
		success : function(rs){
			console.log(rs);
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
	var count = 0;
	for (var v in jsonData.singlefundsList) {
		count++;
		var temp;
		var button;
		if (jsonData.singlefundsList[v].PROJECT_STATE == 1) {
			temp = "募集中";
			button = "&nbsp;&nbsp;&nbsp;<a href='javascript:;'><button class='huankuan2'>还款</button></a>";
		} else if (jsonData.singlefundsList[v].PROJECT_STATE == 2) {
			temp = "还款中";
			button = "&nbsp;&nbsp;&nbsp;<a href='"+basePath+"_project/goRepaymentConfirm?ID="+jsonData.singlefundsList[v].ID+"'><button class='huankuan'>还款</button></a>";
		} else if (jsonData.singlefundsList[v].PROJECT_STATE == 3) {
			temp = "已结束";
			button = "&nbsp;&nbsp;&nbsp;<a href='javascript:;'><button class='huankuan2'>还款</button></a>";
		}
		var tr = $tr.replace(/@COUNT@/,count)
		.replace(/@PROJECT_NAME@/,"<a style='color:#d6b470;' target='_blank' href='"+basePath+"_project/goDetails?ID="+jsonData.singlefundsList[v]["ID"]+"'>"+jsonData.singlefundsList[v]["PROJECT_NAME"]+"</a>")
		.replace(/@TOTAL_RAISE_AMOUNT@/,jsonData.singlefundsList[v].TOTAL_RAISE_AMOUNT.toFixed(2))
		.replace(/@CREATE_DATE@/,jsonData.singlefundsList[v].CREATE_DATE)
		.replace(/@PROJECT_STATE@/,temp)
		.replace(/@PAYMENT@/, button);
		htmls += tr;
	}
	//$.each(jsonData.singlefundsList,function(k,v){
		/*var remark = v.REMARK;
		var project_name = v.PROJECT_NAME;
		var arr = remark.split(project_name);*/
		//arr = arr[0] + "<a href='"+base+"_project/goDetails?ID="+v.LINK_ID+"' style='color: #d6b470;' target='_blank'>" +project_name + "</a>" + arr[1];
		
	//});
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