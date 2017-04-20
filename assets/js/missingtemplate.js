$(document).ready(function() {
	var sec = 5;
		setInterval(function(){
			$(".redirect").text(sec--);
		},1000);
	
	$(".navbar-inverse").hide();
})