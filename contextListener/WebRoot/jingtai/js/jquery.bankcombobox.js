/// <reference path="jquery-1.3.2-vsdoc2.js" />
//基于jquery.combobox.js的修改版本，主要是为了实现下拉银行效果
//显示的最大长度
bankcombobox.prototype.maxLength = null;
//是否必须选择
bankcombobox.prototype.mustSelect = false;
//获得焦点是是否显示数据
bankcombobox.prototype.focusShow = false;
//数据id
bankcombobox.prototype.fieldText = 'text';
//数据text
bankcombobox.prototype.fieldValue = 'id';
//列表
bankcombobox.prototype.optionsContainer = null;
//输入框的显示格式&ID&表示option的value &TXT& 表示option标签内的值
bankcombobox.prototype.textFormat=null;
//级联开启
bankcombobox.prototype.cascade=false;
//级联函数
bankcombobox.prototype.cascadeFunction=null;

bankcombobox.prototype.hideFunction=null;
//bankcombobox初始化
bankcombobox.prototype.init = function(id) {
	var textBoxs = $(id);
	textBoxs.each(function(i, dom) {
		textBox = $(dom);
		textBox.wrap('<div style="display:inline" />');
		var additionalHeight = $.browser.msie ? 3 : 6;
	});
	//选项容器。
	if (!this.optionsContainer) {
		this.optionsContainer = $('<ul id="diapol_bankcomboboxDropdown"  />').appendTo($('body'));
		//if there is jquery.bgiframe plugin, use it to fix ie6 select/z-index bug.
		//search "z-index ie6 select bug" for more infomation
		if ($.fn.bgiframe)
			this.optionsContainer.bgiframe();
	}  
}
function bankcombobox(id,selectId) {
	this.host = id;
	this.dataSource = []; //数据源
	this.hiddenSelectId = selectId; //数据源
	this.defaultText = $('#'+selectId).find('option:selected').text();
	var textBox = $(id); //textBox
	var keys = { up: 38, down: 40, enter: 13, tab: 9, esc: 27 };
	var suggestionsKey = 'bankcombobox_suggestions';
	var showing = false;
	var hideTimer;
	var comboObj = this;
	//选择事件
	this.onSelected = null;
	this.dataBind = function() {
		var d=[];
		$("select[name='"+this.hiddenSelectId +"'] option").each(function(index){
			var idStr=$(this).val();
			var textStr=$(this).text();
			if(idStr!=null && idStr!=""){
				if(comboObj.textFormat==null || comboObj.textFormat==""){
					d[d.length]={'id':idStr,'text':textStr};
				}else{
					d[d.length]={'id':idStr,'text':comboObj.textFormat.replace("&TXT&",textStr).replace("&ID&",idStr)};
				}
			}
		});
		if(d.length>0)
			this.dataSource=d;
		textBox.val(this.defaultText);
		//事件触发设置
		textBox.attr('autocomplete', 'off').keydown(keydown).keyup(keyup);
		if (this.focusShow == true) {
		}
		textBox.blur(function() {
			if (!showing && comboObj.mustSelect) {
				textBox.val(comboObj.defaultText);
			}
		});
		//焦点进入输入框
		textBox.click(function() {
			show('');
		});
	}                         //dataBind_end
    //鼠标离开有效区域
	function domClick(e) {
		var dom = $.browser.msie ? event.srcElement : e.target;
		if (showing == true && $(dom).attr("class") != textBox.attr("class")) { //层显示的话隐藏
			hide();
			if (comboObj.mustSelect) {
				textBox.val(comboObj.defaultText);
			}
		}
	}
	function show(filter, len) {

		if (hideTimer) {
			window.clearTimeout(hideTimer);
			hideTimer = 0;
		}
		oriValue = textBox.val(); //获得当前框值
		var html = new StringBuffer();
		var ulLen = 0;
		for (var k in comboObj.dataSource) {
			var v = comboObj.dataSource[k][comboObj.fieldText]; //text
			var vid = comboObj.dataSource[k][comboObj.fieldValue]; //value 
			if((!filter) || (filter && isMatch($.trim(filter.toLowerCase()),v))) {
				html.append('<li id="' + vid + '">' + v + '</li>');
				ulLen++;
				if (len && ulLen >= len) {//
					break;
				}
			}
		}
		//position and size of the options UI
		var loc = { left: textBox.offset().left, top: textBox.offset().top + textBox.height() + 3, width: textBox.width()  + 5 }
		comboObj.optionsContainer.html(html.toString()).css(loc);
		//decide which option is currently selected
		selIndex = 0;
		var found = false;
		var options = comboObj.optionsContainer.children('li').each(function(i) {

			if (found) return;			
			if ($("#"+comboObj.hiddenSelectId +" option[value='"+$(this).attr("id")+"']").text().toLowerCase()== oriValue.toLowerCase()) {
				$(this).addClass('selected');
				selIndex = i;
				found = true;
			}
		});
		//if there is no items matched, hide the empty select list, so user can show options with down key
		if (!options.size()) {
			//hide();
			return;
		}
		if (!found)
			options.eq(0).addClass('selected');
		//mouse hover to change the highlight option, clicking to select it
		options.click(function() {
			if (comboObj.onSelected != null) {
				comboObj.onSelected($(this));
			}
			var selVal=$("#"+comboObj.hiddenSelectId +" option[value='"+$(this).attr("id")+"']").text();
			var changedFlag=false;
			if(selVal!=textBox.val()){
				changedFlag=true;
			}
			textBox.val(selVal);
			$('#'+comboObj.hiddenSelectId).attr('value',$(this).attr('id'));
            //级联菜单初始化
			if(comboObj.cascade && changedFlag){
				comboObj.cascadeFunction();
			}
			comboObj.hideFunction();
			hide();
		}).hover(function() {
			options.each(function() {
				$(this).removeClass('selected');
			});
			$(this).addClass('selected');
			selIndex = options.index(this);
		});

		if (!filter)
			//showing all the options
			comboObj.optionsContainer.slideDown();
		else
			//showing filtered options, happens when textbox.value changed, should not flick
			comboObj.optionsContainer.show();
		showing = true;
		$(document).bind("click", domClick);
	}         //show end
	function hide() {
		if (showing) {
			var flag=true;
			$("select[name='"+comboObj.hiddenSelectId +"'] option").each(function(index){
				if($(this).text()==textBox.val()){
					flag=false;
				}
			})
			if(flag||textBox.val()==null||textBox.val()==""){
				textBox.val("");
				$("#"+comboObj.hiddenSelectId).val("");
				if(comboObj.cascade){
					comboObj.cascadeFunction();
				}
				comboObj.hideFunction();
			}
			comboObj.optionsContainer.hide().children('li').each(function() { $(this).remove(); });
			showing = false;
			$(document).unbind("click");
		}
	} //hide_end


	var selIndex;
	function keydown(evt) {
		switch (evt.keyCode) {
		case keys.esc:
			hide();
			evt.preventDefault();
			return;
		case keys.enter:
			choose();
			//don't submit the form
			evt.preventDefault();
			return;
		case keys.tab:
			choose();
			return;
		case keys.up:
			goup();
			return;
		case keys.down:
			godown();
			return;
		}
	}

	var oldVal = '';
	function keyup(evt) {
		var v = $(this).val();
		if (v != oldVal) {
			show(oldVal = v, comboObj.maxLength);
		}
	}

	function godown() {
		if (showing) {
			var options = comboObj.optionsContainer.children('li');
			var n = options.size();
			if (!n)
				return;
			selIndex++;

			if (selIndex > n - 1)
				selIndex = 0;

			var v = options.eq(selIndex);
			if (v.size()) {
				options.each(function() { $(this).removeClass('selected') });
				v.addClass('selected');
			}
		} else {
			show('');
		}
	}

	function goup() {
		if (showing) {
			var options = comboObj.optionsContainer.children('li');
			var n = options.size();
			if (!n)
				return;
			selIndex--;

			if (selIndex < 0)
				selIndex = n - 1;

			var v = options.eq(selIndex);
			if (v.size()) {
				options.each(function() { $(this).removeClass('selected') });
				v.addClass('selected');
			}
		} else {
			show('');
		}
	}

	function choose() {

		if (showing) {
			var v = $('li', comboObj.optionsContainer).eq(selIndex);
			if (v.size()) {
				var sid=v.val();
				var vv=$("select[name='"+this.hiddenSelectId +"'] option[value='"+sid+"']").text();
				textBox.val(vv);
				oldVal = v.text();
				hide();
				if (comboObj.onSelected != null) {
					comboObj.onSelected($(v));
				}
			}
		}
	}
	function StringBuffer ()
	{
		var container = new Array();

		var append = function (item)
		{
			container.push(item);
		};
		var toString = function ()
		{
			return container.join("");
		};
		this.append = append;
		this.toString = toString;
	}
	function isMatch(filterVlaue,v){
		var inputStr = v.toLowerCase().indexOf($.trim(filterVlaue.toLowerCase()));
		if(inputStr>=0) return true;
		return false;
	}
} //bankcombobox_end


