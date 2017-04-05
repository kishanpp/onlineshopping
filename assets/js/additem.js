$(document).ready(function() {
	$("#additem").css("display","none");
	$("#pname").attr("required","required");
	$("#pqty").attr("required","required");
	$("#pprice").attr("required","required");
	$("#pimg").attr("required","required");
	$("#desc").attr("required","required");
	

	
	$("form").hide().fadeIn(1000);
	$.ajax({
				type:"GET",
				url: "../model/components.cfc?method=inventorycategory&ReturnFormat=json",
	
				
				cache:false,
				success : function(response)
				{
					
					$.each($.parseJSON(response),function(e,v)
					{
						$('select').append('<option value="'+v+'">'+v+'</option>')
							
					})
				}
											
		}); 
				

$("#ptype").on('change',function(){
	
$("#ptypereq").css("display","none");

$("#additem").delay(0).fadeIn();
})	
			
$("#additem").click(function(){
	
	if( ($("#ptype option:selected").val()) == "")
	{
		
		$("#ptypereq").css("display","block");
		return false;
	}
	else{
		$("#updateitem").css("display","block");
	}
})			
			

$("#pprice").keyup(function() {
    $("#pprice").val(this.value.match(/[0-9]*/));
});

$("#pdisc").keyup(function() {
    $("#pdisc").val(this.value.match(/[0-9]*/));
});

$("#pqty").keyup(function() {
    $("#pqty").val(this.value.match(/[0-9]*/));
});
			
})



	
	