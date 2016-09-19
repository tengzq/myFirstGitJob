function Calendar(elements){
	var self = this,
			today = new Date(),
			cacheMonth = {},
			curMonthData = {
				repay: [],
				ahead: []
			},
			APIURL,
			minDate,
			maxDate,
			first = 0;


	var opts = {
		dayNames: ['\u65e5','\u4e00','\u4e8c','\u4e09','\u56db','\u4e94','\u516d'],//星期名称
		monthNames: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],//月数名称
		otherMonthClass : 'other-month',//其他月的样式
		curMonthClass: 'cur-month',//当前月的样式
		todayClass: 'cur-day',//当天的样式
		checkClass: 'ck-day',//可以点击查看的样式
		selectClass: 'select-day',//被选中的样式
		backDayClass: 'back-day',//有还款的日期样式
		aheadDayClass: 'ahead-day',//有提前还款的日期样式
		aheadClass: 'ahead',//有提前还款右侧金额部分增加的样式
		callbackRepayDateName: 'repay_plan',//服务端返回的还款计划的字段名
		callbackAheadDateName: 'repay_ahead',//服务端返回的提前还款计划的字段名
		mock: false, //是否模拟数据
		mock_opts: {
			'status': 200,
			'responseTime': 200,
			'isTimeout': false,
			'proxy': '/mocks/calendar.json'
		}
	};

	var date = {
		year: today.getFullYear(),
		month: today.getMonth()+1,
		day: today.getDate(),
		today: new Date(today.getFullYear(),today.getMonth(),01)
	};

	var selectorClass = {
		y: '.year',
		m: '.month',
		d: '.days li',
		h: '.jump-today',
		p: '.prev',
		n: '.next'
	};

	var dom = {
		calendar: $('#calendar'),//日历组件
		header: $('.cal-header').find(selectorClass.h),//日历头部
		year: $('.cal-header').find(selectorClass.y),//日历头部年份
		month: $('.cal-header').find(selectorClass.m),//日历头部月份
		days: $('.cal-days'),//日历主体
		prev: $('.cal-header').find(selectorClass.p),//日历头部上个月按钮
		next: $('.cal-header').find(selectorClass.n),//日历头部下个月按钮
		payDayCal: $('#payBackCal'),//还款日历组件
		payDayName: $('#payBackCal').find('.dayName'),//还款星期名
		payDay: $('#payBackCal').find('.day'),//还款日
		payYear: $('#payBackCal').find('.year'),//还款年
		payMonth: $('#payBackCal').find('.month'),//还款月
		detailCal: $('#payBackCal').find('.need-pay'),//右侧还款详情
		money: $('#payBackCal').find('.money strong'),//还款金额
		aheadMoney: $('#payBackCal').find('.ahead-part strong'),//提前还款金额
		monthMoney: $('#payBackCal').find('.back-cal-footer strong'),//本月总还款金额
		//当前选中月日期为1号
		curMonth : $(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+'1',
		//当前选中日期yyyy-MM-dd
		//curDate : $(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+$(this).attr("data-day"),
	};

	$.extend(dom, elements);
	
	Calendar.prototype.init = function(min,api) {
		APIURL = api;
		self.setMinDate(min);
		self.generate(date.year,date.month-1);
		self.setHeader(date.year,date.month-1);
		self.bindEvent();
		self.setBackCal(today);
		self.setPayCalMonth(date.year,date.month-1);
		self.setData(date.year,date.month-1);
	};

	Calendar.prototype._getLastDay = function(year,month) {
		//获取每月的最后一天
		var lastDay=[31,28,31,30,31,30,31,31,30,31,30,31];
		if((month===1)&&(year%4===0)&&((year%100!==0)||(year%400===0))){
			return 29;
		}else{
			return lastDay[month];
		}
	};

	Calendar.prototype._formatStringDate = function(dateString) {
		var a = dateString.split('-');
		return{
			year: a[0],
			month: a[1],
			day: +a[2] < 10 ? a[2].substr(1) : a[2]
		};
	};

	Calendar.prototype._formatNumberLength = function(number) {
		return (number < 10 ? '0' : '') + number;
	};

	Calendar.prototype.generate = function(year,month) {
		var firstDayName = new Date(year, month, 1).getDay(),//本月第一天的星期数
				firstDay = firstDayName === 0 ? 7 : firstDayName,//把本月第一天的星期数转为1-7
				monthDays = self._getLastDay(year, month),//本月的天数
				prevMonth = month === 0 ? 11 : month - 1,//上个月
				prevYear = prevMonth === 11 ? year - 1 : year,//去年
				prevMonthDays = self._getLastDay(prevYear,prevMonth),//上个月天数
				count = 0;
		//生成星期 周日到周六
		var html = '<ul class="day-name clearfix">';
		for (var cols = 0; cols < 7; cols++) {
			html += '<li>' + opts.dayNames[cols] + '</li>';
		}
		html += '</ul>';
		html += '<ul class="days clearfix">';
		//生成本月的日历
		for (var rows = 0; rows < (firstDay+monthDays<= 35 ? 35 : 42); rows++) {
			if (rows < firstDay) {
				//上个月的几天
				if( firstDay < 7){
					html += '<li class="'+opts.otherMonthClass+'">'+(prevMonthDays-firstDay+rows+1)+'</li>';
				}
			} else if (rows >= firstDay + monthDays) {
				//下个月的几天
				++count;
				html += '<li class="'+opts.otherMonthClass+'">'+count+'</li>';
			} else {
				//这个月的几天
				var curDate = rows-firstDay+1,
						curDateString = self._formatNumberLength(curDate),
						getCurDate = new Date(year,month,curDate),
						getToday = new Date(date.year,date.month-1,date.day),
						stateClass = opts.curMonthClass;
				if( +getCurDate === +getToday){
					stateClass = opts.curMonthClass+ ' '+ opts.checkClass +' '+ opts.todayClass;
				}else{
					stateClass = opts.curMonthClass+ ' '+ opts.checkClass;
				}
				html += '<li class="'+stateClass+'" data-date="'+getCurDate+'" data-day="'+curDateString+'">'+curDate+'</li>';
			}
		}
		html += '</ul>';
		dom.days.html(html);
	};

	Calendar.prototype.setHeader = function(year,month) {
		dom.header.data('date', new Date(year,month,01));
		dom.year.text(year+'年').data('year',year);
		dom.month.text(opts.monthNames[month]+'月').data('month',month);
		dom.prev.removeClass('disabled');
		dom.next.removeClass('disabled');
		if (+dom.header.data('date')===+minDate) {
			//dom.prev.addClass('disabled');
		}
	};

	Calendar.prototype.setMinDate = function(date) {
		minDate = new Date(+date.substr(0,4),+date.substr(4,2)-1,01);
	};

	Calendar.prototype.setMaxDate = function(date) {
		maxDate = new Date(+date.substr(0,4),+date.substr(4,2)-1,01);
		if(+dom.header.data('date')===+maxDate){
			dom.next.addClass('disabled');
		}
	};

	Calendar.prototype.bindEvent = function() {
		dom.calendar.on('click', selectorClass.p, function(e) {
			e.preventDefault();
			//切换上个月 日期小于本月的不可切换
			var curMonth = dom.month.data('month'),
					curYear = dom.year.data('year'),
					prevMonth,
					prevYear;
			if ( curMonth === 0) {
				prevMonth = 11;
				prevYear = curYear - 1;
			}else{
				prevMonth = curMonth - 1;
				prevYear = curYear;
			}
			if (!$(this).hasClass('disabled')) {
				self.setHeader(prevYear,prevMonth);
				self.generate(prevYear,prevMonth);
				self.setPayCalMonth(prevYear,prevMonth);
				self.setData(prevYear,prevMonth);
				
				var selMonth=$(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+'1';
				getAccrual(selMonth,true);
			}
		}).on('click', selectorClass.n, function(e) {
			e.preventDefault();
			//切换下个月
			var curMonth = dom.month.data('month'),
					curYear = dom.year.data('year'),
					nextMonth,
					nextYear;
			if ( curMonth === 11) {
				nextMonth = 0;
				nextYear = curYear + 1;
			}else{
				nextMonth = curMonth + 1;
				nextYear = curYear;
			}
			if (!$(this).hasClass('disabled')) {
				self.setHeader(nextYear,nextMonth);
				self.generate(nextYear,nextMonth);
				self.setPayCalMonth(nextYear,nextMonth);
				self.setData(nextYear,nextMonth);
			}
			var selMonth=$(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+'1';
			//ajax获取选中月应收本息总额
			getAccrual(selMonth,true);
		}).on('click',selectorClass.h, function(e) {
			e.preventDefault();
			//回到今天
			self.setHeader(date.year,date.month-1);
			self.generate(date.year,date.month-1);
			dom.days.find('li[data-day="' + date.day + '"]').click();
			self.setPayCalMonth(date.year,date.month-1);
			self.setData(date.year,date.month-1);
			var _today=$(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+'1';
			//ajax获取当前月应收本息总数
			getAccrual(_today,'both');
		}).on('click', selectorClass.d, function(e) {
			e.preventDefault();
			//可点击的日期的查看日历事件
			var $ele = $(this);
			if($ele.hasClass(opts.checkClass)){
				$ele.addClass(opts.selectClass).siblings('li').removeClass(opts.selectClass);
				self.setBackCal($ele.data('date'));
			}
			var _curDate=$(".jump-today .year").text().replace('年','-')+$(".jump-today .month").text().replace('月','-')+$(this).attr("data-day");
			//获取选中天应收本息
			getAccrual(_curDate,false);
		});
	};
	
	function getAccrual(curDate,month){
		//console.log('获取返现金额',curDate,month);
		$.post("mobile/personal/dailyIncome",{REPAYMENT_DATE:curDate},function(data){
			if(month){
				//console.log('当前月应收金额：'+data.pt.M_ACCRUALALL);
				$(".back-cal-footer").find("strong").text(data.pt.M_ACCRUALALL==undefined?'0.00':data.pt.M_ACCRUALALL);
			}else if(month=='both'){
				$(".back-cal-footer").find("strong").text(data.pt.M_ACCRUALALL==undefined?'0.00':data.pt.M_ACCRUALALL);
				$(".need-pay .money").find("strong").text(data.pt.ACCRUALALL==undefined?'0.00':data.pt.ACCRUALALL);
			}else{
				//console.log('当天金额：',data.pt.ACCRUALALL,data.pt.ACCRUALALL==undefined);
				//console.log('当天应收利息：'+data.pt.ACCRUALALL);
				$(".need-pay .money").find("strong").text(data.pt.ACCRUALALL==undefined?'0.00':data.pt.ACCRUALALL);
			}
		},"json");
	}
	

	Calendar.prototype.setBackCal = function(date) {
		var payDate = new Date(date),
				payDay = payDate.getDate(),
				payDayName = '星期'+opts.dayNames[payDate.getDay()];

		dom.payDayName.text(payDayName);
		dom.payDay.text(payDay);
		//当天的金额
		self.setAheadDate(payDay);
	};

	Calendar.prototype.setAheadCal = function(money){
		//提前还款右侧标记
		dom.detailCal.addClass(opts.aheadClass);
		dom.aheadMoney.text(money/100);
	};

	Calendar.prototype.setAheadDate = function(day) {
		//提前还款右侧标记
		if (curMonthData.repay[day]!==undefined&&curMonthData.ahead[day]!==undefined) {
			dom.money.text((curMonthData.repay[day]+curMonthData.ahead[day])/100);
			self.setAheadCal(curMonthData.ahead[day]);
		}else if(curMonthData.repay[day]!==undefined){
			dom.money.text(curMonthData.repay[day]/100);
			dom.detailCal.removeClass(opts.aheadClass);
		}else if(curMonthData.ahead[day]!==undefined){
			dom.money.text(curMonthData.ahead[day]/100);
			self.setAheadCal(curMonthData.ahead[day]);
		}else {
			dom.money.text('0.00');
			dom.detailCal.removeClass(opts.aheadClass);
		}
	};

	Calendar.prototype.setPayCalMonth = function(year,month) {
		dom.payYear.text(year);
		dom.payMonth.text(month+1);
	};

	Calendar.prototype.setData = function(year,month) {
		var key = year.toString() + self._formatNumberLength(month+1);
		if(cacheMonth[key]===undefined){
			self.getData(year,month);
		}else{
			self.handleData(cacheMonth[key]);
		}
	};

	Calendar.prototype.getData = function(year,month) {
		var key = year.toString() + self._formatNumberLength(month+1);
		if (opts.mock && $.mockjax) {
			$.mockjax($.extend(opts.mock_opts,{url:APIURL}));
		}
		$.ajax({
			url: APIURL,
			type: 'GET',
			dataType: 'json',
			data: {year: year,month:month+1},
		})
		.done(function(d) {
			cacheMonth[key] = d.data;
			self.handleData(cacheMonth[key]);
		});
	};

	Calendar.prototype.handleData = function(data) {
		var total = data.total;
		//设置日历最远日期
		maxDate = self._formatStringDate(data.maxDate).year+self._formatStringDate(data.maxDate).month;
		self.setMaxDate(maxDate);
		//准备数据 正常还款计划 兼容IE6,8
		curMonthData.repay = [];//清除缓存
		$.each(data[opts.callbackRepayDateName], function(index, val) {
			curMonthData.repay[self._formatStringDate(index).day] = val;
		});
		//准备数据 提前还款
		curMonthData.ahead = [];//清除缓存
		$.each(data[opts.callbackAheadDateName], function(index, val) {
			curMonthData.ahead[self._formatStringDate(index).day] = val;
		});
		//标记有还款的日期
		$.each(curMonthData.repay, function(index, val) {
			if (val!==undefined) {
				dom.days.find('li[data-day="' + self._formatNumberLength(index) + '"]').addClass(opts.backDayClass);
			}
		});
		//标记有提前还款的日期
		$.each(curMonthData.ahead, function(index, val) {
			if (val!==undefined) {
				dom.days.find('li[data-day="' + self._formatNumberLength(index) + '"]').addClass(opts.aheadDayClass);
			}
		});
		//标记当月所有的还款金额
		dom.monthMoney.text(total!==0? total/100 : 0.00);
		//首次加载载入当天的金额
		if (first===0) {
			self.setAheadDate(date.day);
			first = 1;
		}
	};
}