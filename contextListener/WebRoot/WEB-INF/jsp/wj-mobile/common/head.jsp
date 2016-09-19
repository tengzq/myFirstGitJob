<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<header>
	<style type="text/css">
		.selected{  border-bottom: 3px solid #ff6264;}
	</style>
	<div class="logo">
    	<a href="mobile/main"><img src="wj-mobile-static/images/index_03.png"></a>
    </div>
    <nav>
    	<ul class="tagtagtag">
        	<li class="personal"><a href="mobile/personal/info">账户</a></li>
        	<li class="project"><a href="mobile/project/list">理财</a></li>
        </ul>
    </nav>
    <script type="text/javascript">
    	$(function(){
	    	var uris = window.location.href.split('/');
	    	var uri = uris[uris.length-2];
	    	$('.tagtagtag li').each(function(){
	    		if($(this).hasClass(uri)){
	    			$(this).addClass('selected');
	    		}
	    	});
    	});
    </script>
</header>