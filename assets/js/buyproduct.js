$(document).ready(function() {
	$("button[name=address]").css("display","none");
	$("button[name=updateaddress]").css("display","none");
	$("#name, #add, #city, #state, #zip").attr("required","required");
	$(".myOrders").css("margin","0px 0px 0px 47%");
	

	$.ajax({
				type:"GET",
				url: "../controller/buyproductcontroller.cfc?method=checkaddress&ReturnFormat=json",
				cache:false,
				success : function(response)
				{
					$.each($.parseJSON(response),function(e,v)
					{	
						if(v == "No address found")
						{
							$("button[name=address]").css("display","block");
						}
						else
						{
							if(e == 0)
								$("#name").val(v);
							if(e == 1)
								$("#add").val(v);
							if(e == 2)
								$("#city").val(v);
							if(e == 3 )
								$("#state").val(v);
							if(e == 4)
								$("#zip").val(v);
							$("button[name=updateaddress]").css("display","block");
						}			
					})
				}									
		}).fail(function(jqXHR , textStatus )
				{
							alert("database error");		
				}); 
				
	$("#zip").keyup(function() {
		$("#zip").val(this.value.match(/[0-9]*/));
		
	});

	$("#zip").attr("pattern",".{6,6}");


	$(".navbar-inverse").hide();
	$(".searcharea").hide();
	$(".loginarea").css('margin-left','65%');
	$(".cart-area").css('margin-left','60%');
	$(".header img").css('margin-top','1%');
})