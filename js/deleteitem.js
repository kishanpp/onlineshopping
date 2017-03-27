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
						$('select[name=ptype]').append('<option value="'+v+'">'+v+'</option>')
							
					})
				}
											
		}); 
		
		
		
		
$("select[name=psubtype]").on('change',function(){	
$("#psubtypereq").css("display","none");
})
		
$("select[name=ptype]").on('change',function(){
	$('select[name=psubtype]').empty();
	$('select[name=psubtype]').append('<option value="" selected disabled>Select Product Sub Category</option>');
	$("#ptypereq").css("display","none");
	$.ajax({
				type:"GET",
				url: "cffiles/components.cfc?method=inventorysubcategory&ReturnFormat=json",
	
				data: {pname : $("#ptype option:selected").val()},
				cache:false,
				success : function(response)
				{
					
					$.each($.parseJSON(response),function(e,v)
					{
						$('select[name=psubtype]').append('<option value="'+v+'">'+v+'</option>')
							
					})
				}
											
		}); 
	
	
})
						
$("#deleteitem").click(function(){
	
	if( ($("#ptype option:selected").val()) == "")
	{
		
		$("#ptypereq").css("display","block");
		return false;
	}
	
	if( ($("#psubtype option:selected").val()) == "")
	{
		
		$("#psubtypereq").css("display","block");
		return false;
	}
	
})			
			


})