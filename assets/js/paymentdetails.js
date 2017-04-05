$(document).ready(function()
{
	
	
  
  $("form").hide().fadeIn(600);
  
  
	$("#ccnumber").attr("disabled","disabled");
		$("#holdername").attr("disabled","disabled");
		$("#expdate").attr("disabled","disabled");
		$("#cvv").attr("disabled","disabled");
		$("#savebtn").css("display","none");
		
		
		
		
		
		$("#ccnumber").keyup(function() {
    $("#ccnumber").val(this.value.match(/[0-9]*/));
});

$("#cvv").keyup(function() {
    $("#cvv").val(this.value.match(/[0-9]*/));
});

	$(".navbar-inverse").hide();
$(".searcharea").hide();
$(".loginarea").css('margin-left','65%');
$(".cart-area").css('margin-left','60%');
$(".header img").css('margin-top','1%');	
		
});
	
	
	
function disabletextboxes()
{
	$( ".payment-area" ).animate({
    height: "65%"
  }, 600 );
  
  
	$("#savebtn").delay(0).fadeIn(1800);
	
	if( $("#paytype").val()  == "cod")
	{
		$("#ccnumber").attr("disabled","disabled");
		$("#holdername").attr("disabled","disabled");
		$("#expdate").attr("disabled","disabled");
		$("#cvv").attr("disabled","disabled");
	}
	else
	{
		$("#ccnumber").removeAttr("disabled");
		$("#ccnumber").attr("required","required");
		
		$("#holdername").removeAttr("disabled");
		$("#holdername").attr("required","required");
		
		$("#expdate").removeAttr("disabled");
		$("#expdate").attr("required","required");
		
		$("#cvv").removeAttr("disabled");
		$("#cvv").attr("required","required");
	}
	
}	