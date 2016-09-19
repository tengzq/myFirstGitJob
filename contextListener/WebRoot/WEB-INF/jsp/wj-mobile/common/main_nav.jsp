<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="p322">
    <a href="mobile/main" class="project"><button>理财</button></a>
    <a href="mobile/personal/info" class="personal"><button>账户</button></a>
</div>
<script type="text/javascript">
   	$(function(){
    	var uris = location.href.split('/');
    	var uri = uris[uris.length-2];
    	$('.p322 a').each(function(){
    		if($(this).hasClass(uri)){
    			$(this).addClass('selected');
    		}
    	});
   	});
   </script>