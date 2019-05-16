/**
 * 
 */
function time() {
	var week = [ "星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
	var d = new Date();
	var date = d.getFullYear() + "/" + (d.getMonth() + 1) + "/" + d.getDate() + " "
			+ week[d.getDay()]
	var time = (d.getHours() < 10 ? "0" + d.getHours() : d.getHours()) + ":"
			+ (d.getMinutes() < 10 ? "0" + d.getMinutes() : d.getMinutes())
			+ ":" + (d.getSeconds() < 10 ? "0" + d.getSeconds() : d.getSeconds())
	document.getElementById("time").innerHTML = date + "  " + time
}

setInterval(time, 1000);