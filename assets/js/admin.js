$(document).ready(function() {
	$(".navbar-inverse").hide();
	$(".searcharea").hide();
	$(".useronline").css("margin","-110px 0% 0% 62%");
	$(".loginarea").css("margin-left","63%");
	$(".cart-area").hide();
	$("img").css("margin-top","8px");
	$(".header a").removeAttr("href");
	$(".myOrders").hide();
	
	
	$(".dropdown-content").mouseover(function(){
		$(".dropbtn").css("background-color","rgba(68, 29, 94, 0.78)");
	})
	$(".dropbtn").mouseover(function(){
		$(".dropbtn").css("background-color","rgba(68, 29, 94, 0.78)");
	})
})