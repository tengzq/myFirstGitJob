<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="footer">
	<div class="main">
    	<div class="footer1">
        	<div class="fl">
            	<dl>
                	<dt>关于融巢资本</dt>
                    <dd>
                    	<a href="<%=basePath%>information/about/team">团队介绍</a>
                    	<a href="<%=basePath%>information/about/contact">联系我们</a>
                    	<a href="<%=basePath%>information/about/company">公司介绍</a>
                    	<a href="<%=basePath%>information/about/joinus">加入我们</a>
                    </dd>
                </dl>
            	<dl>
                	<dt>保障协议</dt>
                    <dd>
                    	<a href="<%=basePath%>information/about/fuxieyi">服务协议</a>
                    	<a href="<%=basePath%>information/about/yinsi">隐私条款</a>
                    	<a href="<%=basePath%>information/about/falv">法律保障</a>
                    </dd>
                </dl>
            	<dl>
                	<dt>帮助中心</dt>
                    <dd>
                    	<a href="<%=basePath%>information/about/wenti">常见问题</a>
                    	<a href="<%=basePath%>information/about/fengxian">风险提示</a>
                    </dd>
                </dl>
            </div>
            <div class="fr">
            	<div class="box">
                	<img src="<%=basePath%>wj-static/rc/images/index_31.jpg">
                    <b>下载融巢APP</b>
                </div>
            	<div class="box">
                	<img src="<%=basePath%>wj-static/rc/images/index_34.jpg">
                    <b>微信订阅号</b>
                </div>
            </div>
        </div>
        <div class="footer2">
        	<div class="fl">
            	<a href="#"><img src="<%=basePath%>wj-static/rc/images/index_39.jpg"></a>
            	<a href="#"><img src="<%=basePath%>wj-static/rc/images/index_41.jpg"></a>
            	<a href="#"><img src="<%=basePath%>wj-static/rc/images/index_43.jpg"></a>
            	<a href="#"><img src="<%=basePath%>wj-static/rc/images/index_45.jpg"></a>
            	<a href="#"><img src="<%=basePath%>wj-static/rc/images/index_47.jpg"></a>
            </div>
            <div class="fr">
            	<p>联系电话：4008-337-520（工作日9：00am-9：00pm）</p>
            	<p>客服邮箱：kf@rongchaoziben.com</p>
            	<p>公司地址：北京市海淀区中关村牡丹园</p>
            </div>
        </div>
    </div>
    <div class="footer3">
    	<div class="main">
        	京ICP备15033688号   北京灜通投资管理有限公司 版权所有
        </div>
    </div>
</div>
<div class="backTop">
	<ul>
    	<li><a href="javascript:scroll(0,0)"><img src="<%=basePath%>wj-static/rc/images/backtop.png"></a></li>
    </ul>
</div>
</body>
</html>

<script type="text/javascript">
/*
 * 回到顶部
 */
	$("#sbto22").click(function(){
		window.location.href = "";
	});
 
/* $(function(){
	var html="";
	$.ajax({
		url:'zfarticle/pageFooter',
		type:'post',
		dataType:"json",
		success:function(data){
			if(data.listArticle!=null&&data.listArticle.length>0){
				for(var i=0;i<data.listArticle.length; i++){
					if(data.listArticle[i].PROGRAM_ID==2){
						html="";
						html+="<p><a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a></p>";
						$(".about").append(html);
					}
					 if(data.listArticle[i].PROGRAM_ID==3||data.listArticle[i].PROGRAM_ID==7){
						html="";
						 html+="<p><a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a></p>";
						 $(".protocol").append(html);
					}
					if(data.listArticle[i].PROGRAM_ID==4){
						html="";
						 html+="<p><a href='zfarticle/footFind?ARTICLE_ID="+data.listArticle[i].ARTICLE_ID+"' rel='nofollow'>"+data.listArticle[i].TITLE +"</a></p>";
						 $(".help").append(html);
					} 
				}
				
			}
		}
	});
}); */

</script>