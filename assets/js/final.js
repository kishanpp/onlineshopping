$(document).ready(function()
{
	$(".details-area").hide().slideDown(1000);
	$(".navbar-inverse").hide();
	$(".searcharea").hide();
	$(".loginarea").css('margin-left','65%');
	$(".cart-area").css('margin-left','60%');
	$(".header img").css('margin-top','1%');
	$(".myOrders").css("margin","0px 0px 0px 47%");
	
	
		//price format for original price
	var pricevalue = $(".totalamount strong").text();
	pricevalue = pricevalue.toString();
	var lastThree = pricevalue.substring(pricevalue.length-3);
	var otherNumbers = pricevalue.substring(0,pricevalue.length-3);
	if(otherNumbers != '')
		lastThree = ',' + lastThree;
	var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
	$(".totalamount strong").text(res);
	
});


