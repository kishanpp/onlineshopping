$(document).ready(function() {





$('button[name="add-to-cart"]').on("click",function()
{
	
						$.ajax({
							type:"GET",
							url: "cffiles/components.cfc?method=updatecart&ReturnFormat=json",
	
								data: {value : $("#added").text()},
								cache:false,
								success : function(response)
							{
									$("#add-to-cart").css("display","none");
									document.getElementById("added").innerHTML = "ADDED TO CART";
									document.getElementById("added").style.display = 'block';
									document.getElementsByClassName("cart-item")[0].innerHTML = response;
						
						
							}
						}); 
		
  
});
 
})