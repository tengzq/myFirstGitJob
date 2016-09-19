//$(".wocao").decoratSelect().decoratSelect_addOption([{value:"aaa`1",text:"aaa`2"},{value:"bbb`1",text:"bbb`2"}]).decoratSelect_removeOption();
$.prototype.extend({
    decoratSelect: function(decoratSelectOption) {
        var _this = this;
            _this._decoratSelects = [];
        _this.each(function(i, elm) {
            elm = $(elm);
            if (elm.is("select")) {
                elm._decoratSelectOption = decoratSelectOption;
                elm._decoratSelect_createDOM()._decoratSelect_eventBind()._decoratSelect_optionEventBind(elm._decorator.find("ul li"))._decoratSelect_inputEventBind();
                $(document).click(function() {
                    elm._decorator.find("ul").hide();
                    elm._decorator.css("zIndex","");
                });
                _this._decoratSelects.push(elm);
            }
        });
        return _this;
    },
    _decoratSelect_createDOM: function() {
        var decoratorStr, titleStr, optionStr, optionStrAry = [], options = this.find("option"), decorator,inputAble = this._decoratSelectOption&&this._decoratSelectOption["inputAble"],
        maxLength = this._decoratSelectOption&&this._decoratSelectOption["maxLength"],
        display = this._decoratSelectOption&&this._decoratSelectOption["display"],
        width = this._decoratSelectOption&&this._decoratSelectOption["width"];
        this._decoratSelectOption?(this._decoratSelectOption["disabled"]?this._decoratSelectOption["disabled"]=true:this._decoratSelectOption["disabled"]=false):(this._decoratSelectOption={},this._decoratSelectOption["disabled"]=false);
        var disabled = this._decoratSelectOption["disabled"];
        for (var i = 0, option, len = options.length; i < len; i++) {
            option = options.eq(i);
            if (option.is(":selected")) {
                titleStr = "<span "+(width?"style='width:"+width+"px;'":"")+"><input type='text' "+(width?"style='width:"+(width-38)+"px;'":"")+" "+(disabled?"class='disabled'":"")+" value='" + (option.text() || "") + "' "+(option.attr("value")||option.attr("value")==""?"hidevalue='"+option.attr("value")+"'":"") + (inputAble?"":"disabled='disabled'")+"/>"+(inputAble?"":"<div "+ (width?"style='width:"+(width-31)+"px;'":"")+"></div>")+"</span>";
                optionStrAry.push("<li "+(width?"style='width:"+(width-6)+"px;'":"")+" " + (option.attr("value")||option.attr("value")=="" ? "hidevalue='"+option.attr("value")+"'":"") + " check='true'>" + (option.text() || "") + "</li>");
            } else {
                optionStrAry.push("<li "+(width?"style='width:"+(width-6)+"px;'":"")+" " + (option.attr("value")||option.attr("value")=="" ? "hidevalue='"+option.attr("value")+"'":"") + ">" + (option.text() || "") + "</li>");
            }
        }
        if(!titleStr&&len!=0){
            var topOption = options.eq(0);
            titleStr = "<span "+(width?"style='width:"+width+"px;'":"")+"><input type='text' "+(width?"style='width:"+(width-38)+"px;'":"")+" "+(disabled?"class='disabled'":"")+" value='" + (topOption.text() || "") + "' "+(topOption.attr("value")||topOption.attr("value")==""?"hidevalue='"+option.attr("value")+"'":"") + (inputAble?"":"disabled='disabled'")+"/>"+(inputAble?"":"<div "+ (width?"style='width:"+(width-31)+"px;'":"")+"></div>")+"</span>";
            optionStrAry[0] = "<li "+(width?"style='width:"+(width-6)+"px;'":"")+" " + (topOption.attr("value")||topOption.attr("value")=="" ? "hidevalue='"+topOption.attr("value")+"'":"") + " check='true'>" + (topOption.text() || "") + "</li>";
        }else if(!titleStr){
            titleStr = "<span "+(width?"style='width:"+width+"px;'":"")+"><input type='text' "+(width?"style='width:"+(width-38)+"px;'":"")+" value='' "+(disabled?"class='disabled'":"")+" "+(inputAble?"":"disabled='disabled'")+"/>"+(inputAble?"":"<div "+ (width?"style='width:"+(width-31)+"px;'":"")+"></div>")+"</span>";
        }
        optionStr = "<ul style='display:none;"+(width?"width:"+(width-2)+"px;":"")+"' >" + optionStrAry.join("") + "</ul>";
        decoratorStr = "<div class='decoratSelect' to='" + this.attr("name") + "' style='display:" + (display||this.css("display")) + ";"+(width?"width:"+width+"px;":"")+"'>" + titleStr + optionStr + "</div>";
        decorator = $(decoratorStr);
        this.hide();
        this.after(decorator);
        this._decorator = decorator;
        decorator._select = this;
        return this;
    },
    _decoratSelect_eventBind: function() {
        var _this = this;
        _this._decorator.click(function(e) {
            var disabled = (!_this._decoratSelectOption||!_this._decoratSelectOption["disabled"])?false:true;
            if(!disabled){
                _this._decorator.find("ul").toggle().find("li").show();
                if(_this._decorator.find("ul").is(":visible")){
                    $(".decoratSelect").css("zIndex","").find("ul").not(_this._decorator.css("zIndex","994").find("ul")).hide();
                }else{
                    _this._decorator.css("zIndex","");
                }
                e.stopPropagation();
            }
        });
        return _this;
    },
    _decoratSelect_optionEventBind: function(option) {
        var _this = this,onselectEvent = _this._decoratSelectOption&&_this._decoratSelectOption["onselect"];
        option.click(function(e) {
            var li = $(this);
            _this.find("option"+(li.attr("hidevalue")||li.attr("hidevalue")==""?"[value='" + li.attr("hidevalue") + "']":":not([value])")).attr("selected", true).siblings().removeAttr("selected");
            _this._decorator.find("input").val(li.text());
            if(li.attr("hidevalue")||li.attr("hidevalue")==""){
                _this._decorator.find("input").attr("hidevalue", li.attr("hidevalue"));
            }else{
                _this._decorator.find("input").removeAttr("hidevalue");
            }
            li.attr("check", true).siblings().removeAttr("check");
            _this._decorator.find("ul").hide().find(li).show();
            _this._decorator.css("zIndex","");
            onselectEvent&&onselectEvent.call(li,li.attr("hidevalue"));
            e.stopPropagation();
        });
        return _this;
    },
    decoratSelect_addInputAble:function(){
        var _this = this;
        $.each(_this._decoratSelects,function(i, elm) {
            elm._decoratSelectOption["inputAble"] = true;
            elm._decorator.find("input").removeAttr("disabled");
            elm._decorator.find("input").siblings("div").remove();
        });
        return _this;
    },
    decoratSelect_removeInputAble:function(){
        var _this = this;
        $.each(_this._decoratSelects,function(i, elm) {
            var width = elm._decoratSelectOption["width"];
            elm._decoratSelectOption["inputAble"] = false;
            elm._decorator.find("input").attr("disabled","disabled");
            elm._decorator.find("input").after("<div "+ (width?"style='width:"+(width-31)+"px;'":"")+"></div>");
        });
        return _this;
    },
    decoratSelect_addDisabled:function(){
        var _this = this;
        $.each(_this._decoratSelects,function(i, elm) {
            elm._decoratSelectOption["disabled"] = true;
            elm._decorator.find("input").addClass("disabled");
        });
        return _this;
    },
    decoratSelect_removeDisabled:function(){
        var _this = this;
        $.each(_this._decoratSelects,function(i, elm) {
            elm._decoratSelectOption["disabled"] = false;
            elm._decorator.find("input").removeClass("disabled");
        });
        return _this;
    },
    _decoratSelect_inputEventBind:function(){
        var _this = this,oninput = _this._decoratSelectOption&&_this._decoratSelectOption["oninput"];
        function query(e) {
            var $this = $(this),text = $this.val(),
            lis = _this._decorator.find("li"),
            showNum = 0;
            $this.attr("hidevalue",text);
            lis.each(function(i,elm){
                elm = $(elm);
                if(elm.text().indexOf(text)!=-1){
                    elm.show();
                    showNum++;
                }else{
                    elm.hide();
                }
            });
            if(showNum){
                _this._decorator.find("ul").show();
            }else{
                _this._decorator.find("ul").hide();
            }
            oninput&&oninput.call($this,text);
            e.stopPropagation();
        }
        _this._decorator.find("input").on("keyup",query).on("focus",function(){
            var input = _this._decorator.find("input");
            _this._decoratSelectOption["defaultValue"] = input.val();
            input.val("");
        }).on("blur",function(){
            var input = _this._decorator.find("input");
            if(!input.val()&&_this._decoratSelectOption["defaultValue"]){
                input.val(_this._decoratSelectOption["defaultValue"]);
            }
        });
        return _this;
    },
    decoratSelect_show:function(){
        var _this = this;
        $.each(this._decoratSelects,function(i, elm) {
            elm._decoratSelectOption["display"] = "inline-block";
            elm._decorator.show();
        });
    },
    decoratSelect_hide:function(){
        var _this = this;
        $.each(this._decoratSelects,function(i, elm) {
            elm._decoratSelectOption["display"] = "none";
            elm._decorator.hide();
        });
    },
    decoratSelect_getValue:function(){
        var _this = this,valueAry = [];
        $.each(_this._decoratSelects,function(i, elm) {
            var input = elm._decorator.find("input");
            valueAry.push({value:input.attr("hidevalue"),text:input.val()});
        });
        return valueAry;
    },
    decoratSelect_selectOption:function(options){
        if(!(typeof options=="string"&&options.length)){
            throw new Error("参数错误");
            return this;
        }
        var _this = this;
        $.each(this._decoratSelects,function(i, elm) {
            var $this = elm,onselectEvent = $this._decoratSelectOption&&$this._decoratSelectOption["onselect"],li = $this._decorator.find("ul "+options);
            if(li.length){
                $this.find("option[value='" + li.attr("hidevalue") + "']").attr("selected", true).siblings().removeAttr("selected");
                $this._decorator.find("input").val(li.html());
                if(li.attr("hidevalue")||li.attr("hidevalue")==""){
                    $this._decorator.find("input").attr("hidevalue", li.attr("hidevalue"))
                }else{
                    $this._decorator.find("input").removeAttr("hidevalue");
                }
                li.attr("check", true).siblings().removeAttr("check");
                $this._decorator.find("ul").hide().find(li).show();
                $this._decorator.css("zIndex","");
                onselectEvent&&onselectEvent.call(li,li.attr("hidevalue"));
            }
        });
        return _this;
    },
    //
    decoratSelect_addOption:function(options){
        $.each(this._decoratSelects,function(i, elm) {
            var _this = elm,_decoratorUl = _this._decorator.find("ul"),newOption,nowLiLength = _decoratorUl.find("li").length,
            width = _this._decoratSelectOption&&_this._decoratSelectOption["width"]

            if(Object.prototype.toString.call(options) == "[object Array]"){
                var htmlStr = "",selectStr = "";
                for(var i = 0,len = options.length;i<len;i++){
                    htmlStr += "<li "+(width?"style='width:"+(width-6)+"px;'":"")+" "+(!nowLiLength&&!i?"check='true' ":"") + (options[i]["value"]||options[i]["value"]=="" ? "hidevalue='"+options[i]["value"]+"'":"") + ">" + (options[i]["text"] || "") + "</li>";
                    selectStr += "<option "+(!nowLiLength&&!i?"selected='selected' ":"") + (options[i]["value"]||options[i]["value"]=="" ? "value='"+options[i]["value"]+"'":"") + ">" + (options[i]["text"] || "") + "</option>";
                }
                if(!nowLiLength&&len>0){
                    if(options[0]["text"]||options[0]["text"]==""){
                        _this._decorator.find("input").val(options[0]["text"]);
                    }
                    if(options[0]["value"]||options[0]["value"]==""){
                        _this._decorator.find("input").attr("hidevalue",options[0]["value"]);
                    }else{
                        _this._decorator.find("input").removeAttr("hidevalue");
                    }
                }
            }else if(Object.prototype.toString.call(options) == "[object Object]"){
                var newOption = $("<li "+(width?"style='width:"+(width-6)+"px;'":"")+" "+(!nowLiLength?"check='true' ":"") + (options["value"]||options["value"]=="" ? "hidevalue='"+options["value"]+"'":"") + ">" + (options["text"] || "") + "</li>");
                var selectStr = "<option "+(!nowLiLength?"selected='selected' ":"") + (options["value"]||options["value"]=="" ? "value='"+options["value"]+"'":"") + ">" + (options["text"] || "") + "</option>";
                if(!nowLiLength){
                    if(options["value"]||options["value"]==""){
                        _this._decorator.find("input").val(options["value"]);
                    }
                    if(options["text"]||options["text"]==""){
                        _this._decorator.find("input").attr("hidevalue",options["text"]);
                    }else{
                        _this._decorator.find("input").removeAttr("hidevalue");
                    }
                }
            }else{
                throw new Error("参数错误");
            }

            newOption = $(htmlStr);
            _this._decoratSelect_optionEventBind(newOption);
            _decoratorUl.append(newOption);
            elm.append(selectStr);
        });
        return this;
    },
    decoratSelect_removeOption:function(selector){
        $.each(this._decoratSelects,function(i, elm) {
            var _this = elm,lis = elm._decorator.find("ul " + (selector||"*")),removeChecked = 0;
            lis.each(function(i,elm){
                elm = $(elm);
                if(elm.is("[check='true']")){
                    removeChecked++;
                }
                _this.find("option"+(elm.attr("hidevalue")||elm.attr("hidevalue")==""?"[value='" + elm.attr("hidevalue") + "']":":not([value])")).remove();
                elm.remove();
            })
            
            if(removeChecked){
                var firstLi = elm._decorator.find("li:eq(0)");
                _this.find("option:eq(0)").attr("selected", true);
                firstLi.attr("check", true);
                if(firstLi.length){
                    _this._decorator.find("input").val(firstLi.html());
                    if(firstLi.attr("hidevalue")||firstLi.attr("hidevalue")==""){
                        _this._decorator.find("input").attr("hidevalue", firstLi.attr("hidevalue"));
                    }else{
                        _this._decorator.find("input").removeAttr("hidevalue");
                    }
                }else{
                    _this._decorator.find("input").val("").removeAttr("hidevalue");
                }
            }
        });
        return this;
    }
});
