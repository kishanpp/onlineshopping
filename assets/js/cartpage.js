$(document).ready(function() {

	$('button[name="remove-from-cart"]').on("click",function()
	{
		var element = $(this).parent(); 
		$.ajax({
					type:"GET",
					url: "../model/components.cfc?method=removefromcart&ReturnFormat=json",
					data: {value : $(this).parent().find("#id").val()},
					cache:false,
					success : function(response)
								{
									element.remove();
									var x= $.parseJSON(response);
									$.each(x,function(k,v){
															if(k == "TOTALAMOUNT")
															{
																document.getElementsByClassName("totalamount")[0].innerHTML = v;
															}
															if(k == "CART")
															{
																document.getElementsByClassName("cart-item")[0].innerHTML = v;
																if(v == 0)
																{
																	document.getElementsByClassName("cart-item")[0].innerHTML = 0;
																	$(".cart-products-area").append('<div class="products"><strong>NO ITEMS IN THE CART</strong></div>')
																	$("#buy-all-product").remove();
																	$(".paymentdetails").remove();
																}
															}
															
														});			
								}
		}).fail(function(jqXHR , textStatus )
				{
							alert("database error");		
				}); 
		  
	});

	$('button[name="buy-all-product"]').on("click",function()
	{
		window.location="https://www.shoponline.com/view/buyproduct.cfm";
	});

})