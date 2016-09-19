<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta charset="utf-8" name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1 user-scalable=false">
	
	<title>万金理财，全民加息</title>
	<base href="<%=basePath%>"/>
	<link href="wj-mobile-static/css/reset.css" rel="stylesheet" type="text/css">
	<link href="wj-mobile-static/css/campaign.css" rel="stylesheet" type="text/css">
	<script src="wj-mobile-static/js/jquery-1.8.2.min.js" type="text/javascript"></script>
	<script src="wj-mobile-static/js/campaign.js" type="text/javascript"></script>
	<!-- <script src="wj-mobile-static/js/shake.js" type="text/javascript"></script> -->
</head>


<body>
<div class="page2">
	<div class="p1" style="text-align: center;padding-top: 35px;">
    	<!-- <img src="wj-mobile-static/images/p1.png"> -->
    	<img src="wj-mobile-static/images/shake-add.png" style="width: 80%">
    </div>
    <div class="p2">
    	<ul>
        	<li id="a">0</li>
            <li>.</li>
            <li id="b">0</li>
            <li id="c">0</li>
            <li id="d">1</li>
            <li>%</li>
        </ul>
    </div>
    <div style="text-align: center;color: #fff; margin-top: 5px; font-size: 14px;">不满意？继续摇!</div>
    <div class="p3">
    	<a href="mobile/campaign?p=3">
    		<!-- <img src="wj-mobile-static/images/p3.png"> -->
    		<img src="wj-mobile-static/images/make-money.png">
   		</a>
    </div>
    <audio style="display: none" id="shake-audio" preload="auto" src="<%=basePath%>wj-mobile-static/audio/shake.mp3" data-src="<%=basePath%>wj-mobile-static/audio/shake.mp3"></audio>
    <audio style="display: none" id="shake-end-audio" preload="auto"  src="<%=basePath%>wj-mobile-static/audio/shake_end.mp3" data-src="<%=basePath%>wj-mobile-static/audio/shake_end.mp3"></audio>
</div>

<script type="text/javascript">
	function changeNumber(){
		var $a = $('#a'),aV = 0,
		$b = $('#b'),bV = 0,
		$c = $('#c'),cV = 0,
		$d = $('#d');
		var i = 0;
		var interval;
		interval = setInterval(function(){
			if( i == 22){
				clearInterval(interval);
				window.addEventListener('devicemotion', deviceMotionHandler, false);
				$a.text(aV);
				$b.text(bV);
				$c.text(cV);
				$d.text(Math.round(Math.random() * 9));
				var audio = document.getElementById('shake-end-audio');
				audio.play(); 
				ing = false;
				return;
			}
			i++;
			$a.text(Math.round(Math.random() * 9));
			$b.text(Math.round(Math.random() * 9));
			$c.text(Math.round(Math.random() * 9));
			$d.text(Math.round(Math.random() * 9));
			
		},70);
	}
	changeNumber();
	var SHAKE_THRESHOLD = 3000;
	var last_update = 0;
	var x = y = z = last_x = last_y = last_z = 0;
	/* function init() {
	    if (window.DeviceMotionEvent) {
	        window.addEventListener('devicemotion', deviceMotionHandler, false);
	    } else {
	        alert('not support mobile event');
	    }
	} */
	var ing = false;
	function deviceMotionHandler(eventData) {
	    var acceleration = eventData.accelerationIncludingGravity;
	    var curTime = new Date().getTime();
	    if ((curTime - last_update) > 100) {
	        var diffTime = curTime - last_update;
	        last_update = curTime;
	        x = acceleration.x;
	        y = acceleration.y;
	        z = acceleration.z;
	        var speed = Math.abs(x + y + z - last_x - last_y - last_z) / diffTime * 10000;
	
	        if (speed > SHAKE_THRESHOLD) {
	        	//changeNumber();
	        	window.removeEventListener('devicemotion', deviceMotionHandler, false);
	        	if(!ing){
	        		playAudioAndChangeNumber();
	        		setTimeout(changeNumber,800);
	        	}
	        }
	        last_x = x;
	        last_y = y;
	        last_z = z;
	        return;
	    }
	}
	function playAudioAndChangeNumber(){
		ing = true;
		var audio2 = document.getElementById('shake-audio');
		audio2.play(); 
	}
</script>
<%@include file="share.jsp" %>

</body>
</html>
