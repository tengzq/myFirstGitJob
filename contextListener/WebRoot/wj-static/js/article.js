$(function(){
	var objs = {
			elements : {
				btns : $('.title+ul>li'),
				/*companyBtn : objs.elements.btns.eq(0),
				teamBtn : this.btns.eq(1),
				contactBtn : this.btns.eq(2),
				joinBtn : this.btns.eq(3),
				safeBtn : this.btns.eq(4),
				lawBtn : this.btns.eq(5),*/
				title : $('.pg-guide-title'),
				content : $(".pg-guide-sercurity"),
				titleH1 : $('.h3'),
				mainbody : $('.mainbody'),
			}
	}
	
	
	objs.elements.btns.on('click',function(e){
		if($(this).attr('id')=='latest'){
			//console.log('latest');
			method.getArticleList('pg_latest');
			$('.hover').removeClass('hover');
			$('.left-menu li').removeClass('hover');
			$(this).addClass('hover');
		}else if($(this).attr('id')=='press'){
			method.getPressList('pg_press');
			$('.hover').removeClass('hover');
			$('.left-menu li').removeClass('hover');
			$(this).addClass('hover');
		}else{
			objs.elements.title.hide();
			$(this).parents('.left-menu').find('li').removeClass('hover');
			$(this).addClass('hover');
			//console.log($(this).attr('id'))
			method.getArticle($(this).attr('id'));
		}
	});
	
	var method = {
			getArticle : function(articleId){
				$.ajax({
					type : 'get',
					data : {ARTICLE_ID:articleId},
					dataType : 'json',
					url : 'zfarticle/find',
				})
				.done(function(r){
					//console.log(r);
					if(r.msg=='atc'){
						objs.elements.title.text(r.pd.TITLE);
						objs.elements.content.html('').load(r.pd.FILE_PATH);
					}
				});
			},
			getArticleList : function(programId){
				  // console.log('获取文章列表');
				   $.ajax({
					   type : 'get',
					   url : 'zfarticle/articleList',
					   data : {PROGRAM_ID : programId,COUNT : 10},
					   dataType : 'json',
					   
				   })
				   .done(function(rs){
					   //console.log(rs);
					   var styles = '<style>';
					   styles+='.latestul li{border-bottom: 1px solid #d6d6d6;height:45px;line-height:50px;}';
					   styles+='.latestul li .left-icon{color:#2E9DD0;margin:0 15px;}';
					   styles+='</style>';
					   var htmls = '<ul class="latestul">';
					   if(rs.atcs){
						   $.each(rs.atcs,function(key,val){
							   //var html = '<li>';
							   htmls+='<li>';
							   htmls+='<p class="fr">'+val.UPDATE_DATE.substr(0,10)+'</p>';
							   htmls+='<p class="fl left-icon"><i class="fa fa-circle-o"></i></p>'
							   htmls+='<p class="fl">';
							   htmls+='<a href="zfarticle/latest?ARTICLE_ID='+val.ARTICLE_ID+'" target="_blank">'+val.TITLE+'</a></p>';
							   htmls+='</li>';
							   htmls+='<div class="clear"></div>'
						   })  
					   }
					   htmls+='</ul>';
					   $('.pg-guide-title').text('最新动态').css('color','#FF6633');
					   $('.pg-guide-title').show();
					   objs.elements.mainbody.css('min-height','643px')
					   objs.elements.content.html(styles+htmls);
				   });
			},
			getPressList : function(pId){
				$('.pg-guide-title').text('媒体报道').css('color','#FF6633');
				objs.elements.title.show();
				objs.elements.mainbody.css('min-height','643px')
				$.ajax({
					type : 'get',
					url : 'zfarticle/articleList',
					data : {PROGRAM_ID : pId,COUNT : 10},
					dataType : 'json',
					success : function(rs){
						console.log(rs,rs.atcs);
						if(rs.atcs){
							console.log('operation');
							var htmls = '<div class="record-list"><ul>';
							$.each(rs.atcs,function(i,val){
								htmls += '<li>';
								htmls += '<div style="width: 40%;float: left"><img src="'+val.MARK_PATH+'" alt="" style="overflow: hidden;width: 220px;height: 220px;margin-top:10px;"/></div>';
								htmls += '<div style="width: 60%;float: right"><h5>';
								htmls += '<a href="zfarticle/latest?ARTICLE_ID='+val.ARTICLE_ID+'" target="_blank">'+val.TITLE+'</a>';
								htmls += '<a href="zfarticle/latest?ARTICLE_ID='+val.ARTICLE_ID+'" target="_blank" class="right-icon"><i class="fa fa-chevron-circle-right"></i></a>';
								htmls += '<div class="clear"></div>';
								htmls += '</h5><div class="record-desc"><div class="desc-title">';
								htmls += '<span style="float:right;">'+val.CREATE_DATE+'</span><span>'+val.SUB_TITLE+'</span></div>';
								htmls += '<div class="desc-content">'+val.ARTICLE_DESC+'</div></div></div><div class="clear"></div></li>';
							});
							htmls += '</ul></div>';
							console.log(htmls);
							objs.elements.content.html(htmls);
						}
					}
				})
			}
	}
	
	
})