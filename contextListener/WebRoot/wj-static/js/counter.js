$(function(){
	
	$('.re').on('click',function(){
		$('#amount').val('');
		$('#start').val('');
		$('#end').val('');
		$('#totalRate').val('');
		$('.err-area').hide();
	});
	
	$('.counter').on('click',function(){
		var amountVal = $('#amount').val();
		if( amountVal == '' || isNaN(parseInt(amountVal))){
			$('#amount').parent().siblings('p').show().text('请输入合法数字');
			return;
		}else{
			$('#amount').parent().siblings('p').hide();
		}
		var totalRateVal = $('#totalRate').val();
		if(totalRateVal =='' || isNaN(parseFloat(totalRateVal))){
			$('#totalRate').parent().siblings('p').show().text('请输入合法数字');
			return;
		}else{
			$('#totalRate').parent().siblings('p').hide();
		}
		var startVal = $('#start').val(),
			endVal = $('#end').val();
		if(startVal == '' || endVal == ''){
			$('#start').parent().siblings('p').show().text('请选择日期');
			return;
		}else{
			$('#start').parent().siblings('p').hide();
		}
		
		$.ajax({
			type : 'post',
			url : 'tools/accrualList',
			data : {
				amount : $('#amount').val(),
				totalRate : $('#totalRate').val(), 
				startDate : $('#start').val() , 
				endDate : $('#end').val()
				},
			dataType : 'json',
			success : function(rs){
				//console.log(rs);
				var repayList = rs.repaymentList;
				//console.log(repayList,rs.repaymenyList);
				var htmls = '';
				$.each(repayList,function(i,val){
					htmls += '<tr>';
					htmls += '<td>'+val.repayDate + '</td>';
					
					htmls += '<td>'+val.total+'</td>';
					htmls += '<td>'+val.accrual+'</td>';
					htmls += '<td>'+val.capital+'</td>';
					htmls += '</tr>';
				});
				$('#result-body').html(htmls);
				$('#aa').text('投资金额：'+$('#amount').val());
				$('#bb').text('起息日起：'+$('#start').val());
				$('#totalAccrual').text('预计收益：'+rs.totalAccrual);
				$('#days').text('计息天数：'+rs.days);
				$('#tt').show();
			}
		});
	});
})