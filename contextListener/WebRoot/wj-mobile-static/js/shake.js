init();
var SHAKE_THRESHOLD = 3000;
var last_update = 0;
var x = y = z = last_x = last_y = last_z = 0;
function init() {
    if (window.DeviceMotionEvent) {
        window.addEventListener('devicemotion', deviceMotionHandler, false);
    } else {
        alert('not support mobile event');
    }
}
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
        	$('.i2 img').removeClass('rock').addClass('rotate')
        	playAudioAndRedirect();
        	window.removeEventListener('devicemotion', deviceMotionHandler, false);
        }
        last_x = x;
        last_y = y;
        last_z = z;
    }
}
function changeNumber(){
	window.removeEventListener('devicemotion', deviceMotionHandler, false);
	var $a = $('#a'),aV = 0,
		$b = $('#b'),bV = 0,
		$c = $('#c'),cV = 0,
		$d = $('#d');
	var i = 0;
	var interval;
	interval = setInterval(function(){
		if( i == 22){
			clearInterval(interval);
			$a.text(aV);
			$b.text(bV);
			$c.text(cV);
			$d.text(Math.round(Math.random() * 9));
			window.addEventListener('devicemotion', deviceMotionHandler, false);
			return;
		}
		i++;
		$a.text(Math.round(Math.random() * 9));
		$b.text(Math.round(Math.random() * 9));
		$c.text(Math.round(Math.random() * 9));
		$d.text(Math.round(Math.random() * 9));
		
	},70);
}

function playAudioAndRedirect(){
	var audio = document.getElementById('shake-audio');
	setTimeout(function(){
		location.href='mobile/campaign?p=2';
	},2000)
	audio.play();
}