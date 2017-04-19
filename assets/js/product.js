$(document).ready(function() {

	$(".product-area .images img").elevateZoom();
	$('button[name="add-to-cart"]').on("click",function()
	{
		
		$.ajax({
					type:"GET",
					url: "../model/components.cfc?method=updatecart&ReturnFormat=json",
					data: {productId : $("#productId").text()},
					cache:false,
					success : function(response)
						{
							//$("#add-to-cart").delay(0).fadeOut();
							document.getElementById("added").innerHTML = "ADDED TO CART";
							$("#added").delay().fadeIn();
							$("#added").delay(400).fadeOut();
							document.getElementsByClassName("cart-item")[0].innerHTML = response;
						}
			}).fail(function(jqXHR , textStatus )
				{
							alert("database error");		
				}); 
			
	});
	//price format for discounted value and without discounted value
	var pricevalue = $(".discounted-price").text();
	pricevalue = pricevalue.toString();
	var lastThree = pricevalue.substring(pricevalue.length-3);
	var otherNumbers = pricevalue.substring(0,pricevalue.length-3);
	if(otherNumbers != '')
		lastThree = ',' + lastThree;
	var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
	$(".discounted-price").text(res);
	
	//price format for original price
	var pricevalue = $(".product-price").text();
	pricevalue = pricevalue.toString();
	var lastThree = pricevalue.substring(pricevalue.length-3);
	var otherNumbers = pricevalue.substring(0,pricevalue.length-3);
	if(otherNumbers != '')
		lastThree = ',' + lastThree;
	var res = otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree;
	$(".product-price").text(res);

})