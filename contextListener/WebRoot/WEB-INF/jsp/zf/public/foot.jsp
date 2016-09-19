<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="clear"></div>	
<div class="footer">
	<div class="main">
    	<div class="ft1">
        	<dl class="about">
            	<dt>关于万金先生</dt>
                <dd  class="bd">
                	
                </dd>
            </dl>
        	<dl class="protocol">
            	<dt>保障/协议</dt>
                <dd  class="bd">
                	
                </dd>
            </dl>
        	<dl class="help">
            	<dt>帮助中心</dt>
                <dd  class="bd">
                </dd>
            </dl>
        	<dl>
            	<dt>联系我们</dt>
                <dd>
                	<a href="javascript:void(0)" style="cursor:text;">联系电话：4008-337-520（工作日9:00 am-9:00 pm）</a>
                	<a href="javascript:void(0)" style="cursor:text;">客服邮箱：kf@wanjinxiansheng.com</a>
                	<a href="javascript:void(0)" style="cursor:text;">公司地址：北京市海淀区翠微路2号院</a>
                	<a href="javascript:void(0)" style="cursor:text;">我要合作：bd@wanjinxiansheng.com</a>
                </dd>
            </dl>
            <dl><dt></dt><dd><img src="wj-static/images/index1_31.png" class="fr" width="120px" height="120px" title="扫描关注万金先生"></dd></dl>
        </div>
        <div class="ft2">
        	<div class="fl">
            	<a href="http://www.wodai.com/" target="_blank" style="cursor: pointer;"><img src="wj-static/images/wodai_03.png" width="113" style="border-radius: 8px;"></a>
    	        <a href="http://www.wangdaichina.com/" target="_blank" style="cursor: pointer;padding-top: 0px;display: inline-block;background-color: #fff;border-radius: 8px;height: 31px;margin: 0 8px 0 0; "><img src="wj-static/images/wdtx.gif" width="110" style="border-radius: 8px;"></a>
            	<a href="http://www.zongls.cn/" target="_blank" style="cursor: pointer;display: inline-block; width: 110px; text-align: center; background-color: #EBE9E5; border-radius: 8px;padding-top: 1px; height: 31px;"><img src="wj-static/images/palm.png" width="89" style="border-radius: 8px;"></a>
            	<a href="http://hao.wdzx.com/" target="_blank" style="cursor: pointer;"><img src="wj-static/images/wdzx.png" width="131" style="border-radius: 8px;"></a>
            	<a href="http://www.p2peye.com/" target="_blank" style="cursor: pointer;display: inline-block; border-radius: 8px; border: 1px solid #909090; padding-top: 2px; height: 29px;"><img src="wj-static/images/p2peye.png" width="110" style="border-radius: 8px;"></a><br>
            	<a href="http://www.wangdainengliang.com/" target="_blank" style="cursor: pointer;display: inline-block; border-radius: 8px; border: 1px solid #909090; padding-top: 1px; height: 30px;margin-left:8px;"><img src="wj-static/images/logo_wdnl.png" width="145"></a>
            	<!-- <a href="http://www.226w.com/" target="_blank"><img src="wj-static/images/226w.png" style="width: 140px;padding-left: 6px;  background-color: #fff;border-radius: 8px; height: 43px;"></a> -->
            	<a href="http://www.p2pxing.com/" style="padding:0" target="_blank"><img src="wj-static/images/p2pxing.png" style=" width: 108px;background-color: #fff;border-radius: 8px;"></a>
            	<a href="http://www.erongtu.com/" target="_blank"><img src="wj-static/images/rt.png" style="width: 153px;background-color: #fff;border-radius: 8px;padding: 0 5px;"></a>
            	<a href="http://www.wangdaizhijia.com/" target="_blank" style="cursor: pointer;padding-top: 0px;display: inline-block;background-color: #fff;border-radius: 8px;height: 31px;margin: 0 8px 0 0;padding: 6px; "><img src="wj-static/images/wdzz.png" width="110" style="border-radius: 8px;"></a>
            	<!-- <a href="javascript:void(0)"><img src="wj-static/images/index2_41.png"></a> -->
            	<!-- <a href="javascript:void(0)"><img src="wj-static/images/index2_37.png"></a> -->
            	<!-- <a href="javascript:void(0)"><img src="wj-static/images/index2_39.png"></a> -->
            </div>
            <div class="fr">
            	<p>京ICP备15033688号</p>
            	<p>北京灜通投资管理有限公司 版权所有</p>
            	<p><a href="">pc版 </a><a href="http://m.wanjinxiansheng.com/mobile/main"> 手机版</a></p>
            	<p><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1256226736'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1256226736%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script></p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	var html="";
	$.ajax({
		url:'zfarticle/pageFooter',
		type:'post',
		dataType:"json",
		success:function(data){
			if(data.listArticle!=null&&data.listArticle.length>0){
				for(var i=0;i<data.listArticle.length; i++){
					if(data.listArticle[i].PROGRAM_ID==4){
						html="";
						html+="<a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a>";
						$(".about").find(".bd").append(html);
					}
					 if(data.listArticle[i].PROGRAM_ID==5||data.listArticle[i].PROGRAM_ID==7){
						html="";
						 html+="<a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a>";
						 $(".protocol").find(".bd").append(html);
					}
					if(data.listArticle[i].PROGRAM_ID==6){
						html="";
						 html+="<a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a>";
						 $(".help").find(".bd").append(html);
					} 
				}
				
			}
		}
	});
	
		/*** 控制foot高度 */
// 		var _footerHeight = $('.footer').innerHeight();
		/**浏览器可见高度*/
// 		var _windowHeight = $(window).height();
		/**浏览器主内容距离上边滚动高度*/
// 		var _footerOffsetTop = $('.footer').offset().top;
// 		if(_footerOffsetTop+_footerHeight<_windowHeight){
// 			$('.footer').css('position', 'fixed');
// 		}
	
});

</script>
