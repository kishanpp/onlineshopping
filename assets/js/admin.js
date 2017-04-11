$(document).ready(function() {
	$(".navbar-inverse").hide();
	$(".searcharea").hide();
	$(".useronline").css("margin","-135px 0% 0% 57%");
	$(".loginarea").css("margin-left","63%");
	$(".cart-area").hide();
	$("img").css("margin-top","8px");
	$(".header a").removeAttr("href");
	$(".dropdown-content").mouseover(function(){
		$(".dropbtn").css("background-color","rgba(68, 29, 94, 0.78)");
	})
	$(".dropbtn").mouseover(function(){
		$(".dropbtn").css("background-color","rgba(68, 29, 94, 0.78)");
	})
})