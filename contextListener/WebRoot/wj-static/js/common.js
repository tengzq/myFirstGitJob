$(document).ready(function(){
    $(function(){
    	//投资风云榜
		$.ajax({
			type : 'POST',
			data : {},
			url : 'rechargeData/prechargeList',
			dataType : 'json',
			success : function(data) {
				for (var i = 1; i <21; i++){
				$("#rechargeName"+i).text((data.rechargedataList[i-1].username).substr(0,1)+"******"+(data.rechargedataList[i-1].username).substr(-1));    
				$("#rechargeAmount"+i).text("￥"+(data.rechargedataList[i-1].amount).toString().split('').reverse().join('').replace(/(\d{3})/g,'$1,').replace(/\,$/,'').split('').reverse().join('')+".00");
				}
    		},
    	});
    });  
});