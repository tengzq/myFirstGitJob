//$(function(){
//	$('.tzjl nav li').on('click',function(){
//		$(this).addClass('hover').siblings().removeClass('hover');
//		var type = $('.tzjl nav li.hover').index();
//		if(0 == type){
//			type = '';
//		}else{
//			type -= 1;
//		}
//	
//	});
//});




var hashCode = $('#hashCode').val(),
	basePath = $('#basePathUrl').val();
var type = '0';

/**
 * 分页获取资金流水
 * @param currentPage 获取第几页
 * @param showCount 每页显示条数
 * @param type 获取资金流水的类型
 */
function getFundsflow(currentPage,showCount,type){
	$.ajax({
		type : "get",
		url : basePath+"_project/goProjectList",
		cache : false,
		data : {
			TYPE : type,
			currentPage : currentPage,
			showCount : showCount
			//USER_ID : hashCode
		},
		dataType : "json",
		success : function(rs){
			refreshData(rs);
		}
	})
}
var flag = false;
var project_name = "";
$(function(){
	//获取第一页
	project_name = $("#project_name").val();
	flag = false;
	getProjects(0,setting.showCount, type, "", flag);
	
	
	//加载更多事件
	
});

var setting = {
		lastPageNumber : 0,
		showCount : 9
}
/**
 * 加载更多
 */
function getMore(){
	$('.jingxuan .pc7').one('click',function(){
		getProjects(setting.lastPageNumber+1,setting.showCount, project_name, flag);
	});
}

/**
 * 分页获取数据
 * @param currentPage 当前页
 * @param showCount 显示条数 
 */
function getProjects(currentPage, showCount, type, project_name, flag){
	var url = "getProjectPage";
	if (flag) {
		url = "search"
	}
	setting.lastPageNumber = currentPage;
	$.ajax({
		type : "get",
		url : "getProjectPage",
		data : {
			currentPage : currentPage,
			showCount : showCount,
			PROJECT_STATE : type,
			PROJECT_NAME : project_name
		},
		success : function(rs){
			if(rs.result == 0){
				var ps = "";
				$("#container").html("");
				//console.log("projects length:"+rs.projects.length);
				$.each(rs.projects,function(k,p){
					var totalRate = (parseFloat(p.BASE_INTEREST_RATE));
					var progress = ((p.TOTAL_RAISE_AMOUNT-p.SURPLUS_RAISE_AMOUNT)/p.TOTAL_RAISE_AMOUNT * 100).toFixed(0);
					var $proj = $('#pro-template').html();
					$proj = $proj.replace(/@pName@/,p.PROJECT_NAME)
									.replace(/@link@/,'onclick="javascript:window.location.href=\'goDetails?ID='+p.ID+'\'" style="cursor:pointer;"')
									.replace(/@totalRate@/,totalRate)
									.replace(/@deadline@/,p.DEADLINE)
									.replace(/@totalAmount@/,p.TOTAL_RAISE_AMOUNT)
									.replace(/@progress@/,progress)
									.replace(/@pid@/,p.ID)
									.replace(/@style@/,p.PROJECT_STATE != 1 || p.flag == false || progress == 100 ? "background:#A8A8A8" : "")
									.replace(/@Chinese@/,p.PROJECT_STATE != 1 || p.flag == false || progress == 100 ? "查看详情" : "我要投资")
									.replace(/@progress@/, (p.TOTAL_RAISE_AMOUNT-p.SURPLUS_RAISE_AMOUNT)/p.TOTAL_RAISE_AMOUNT * 98);
					//$('.jingxuan .pc7').before($proj);
					$("#container").append($proj);
				});
				refreshProgress();
				
				initHtml(rs.currentPage, rs.totalPage, rs.totalResult);
				if(rs.totalPage < (setting.lastPageNumber+1)){
					$('.jingxuan .pc7').css('display','none');
				}else{
					getMore();
				}
			}
		}
	});
}

function initHtml(currentPage, totalPage, totalResult) {
	console.log(currentPage+"_________"+totalPage+"***********"+totalResult);
	kkpager.generPageHtml({
		pno : currentPage || 1,
		//总页码
		total : totalPage || 1,
		//总数据条数
		totalRecords : totalResult || 0,
		mode : 'click',//默认值是link，可选link或者click
		click : function(n){
			// do something
			getProjects(n,9,type, project_name, flag);
			this.selectPage(n);
		}
		
	});
}

/**
 * 刷新项目进度
 */
function refreshProgress(){
	$('.progress').each(function(){
		var $_this = $(this);
		var width = parseFloat(parseInt($_this.next('em').text()) / 100 * 128).toFixed(0);
		$_this.find('span').width(width)
	});
}