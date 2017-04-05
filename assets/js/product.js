$(document).ready(function() {





$('button[name="add-to-cart"]').on("click",function()
{
	
						$.ajax({
							type:"GET",
							url: "../model/components.cfc?method=updatecart&ReturnFormat=json",
	
								data: {value : $("#added").text()},
								cache:false,
								success : function(response)
							{
									$("#add-to-cart").delay(0).fadeOut();
									document.getElementById("added").innerHTML = "ADDED TO CART";
									$("#added").delay(400).fadeIn();
									document.getElementsByClassName("cart-item")[0].innerHTML = response;
						
						
							}
						}); 
		
  
});
 
})