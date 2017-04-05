$(document).ready(function() {
//$("button").attr("disabled","true");


            
			
$("#zip").keyup(function() {
    $("#zip").val(this.value.match(/[0-9]*/));
	if(this.value.length != 6){
		$("button").attr("disabled","true");
	}
	else{
		$("button").removeAttr("disabled");
	}
});

$("#zip").focusout(function(){
	if(this.value.length != 6){
		alert("Pin code should be minimum 6 digits");
		}
});






$(".navbar-inverse").hide();
$(".searcharea").hide();
$(".loginarea").css('margin-left','65%');
$(".cart-area").css('margin-left','60%');
$(".header img").css('margin-top','1%');
})