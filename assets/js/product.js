$(document).ready(function() {

	$(".product-area img").elevateZoom();
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
 
})