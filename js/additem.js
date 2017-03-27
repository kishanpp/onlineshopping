$(document).ready(function() {
	
	
	
	$.ajax({
				type:"GET",
				url: "cffiles/components.cfc?method=inventorycategory&ReturnFormat=json",
	
				//data: {value : $("#added").text()},
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
})	
			
$("#additem").click(function(){
	$("#pname").attr("required","required");
	$("#pqty").attr("required","required");
	$("#pprice").attr("required","required");
	$("#pimg").attr("required","required");
	$("#desc").attr("required","required");
	if( ($("#ptype option:selected").val()) == "")
	{
		
		$("#ptypereq").css("display","block");
		return false;
	}
})			
			

$("#pprice").keyup(function() {
    $("#pprice").val(this.value.match(/[0-9]*/));
});


$("#pqty").keyup(function() {
    $("#pqty").val(this.value.match(/[0-9]*/));
});
			
})



	
	