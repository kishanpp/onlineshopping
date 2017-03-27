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
			



$("select[name=ptype]").on('change',function(){
	$('select[name=psubtype]').empty();
	$('select[name=psubtype]').append('<option value ="" selected disabled>Select Product Sub Category</option>');
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


$("select[name=psubtype]").on('change',function(){
		$("#psubtypereq").css("display","none");						
											
				$.ajax({
				type:"GET",
				url: "cffiles/components.cfc?method=inventorysubcategorydata&ReturnFormat=json",
	
				data: {psubname : $("#psubtype option:selected").val()},
				cache:false,
				success : function(response)
					{
						$.each($.parseJSON(response),function(e,v)
						
						{
							if(e == 0)
								$("#pname").val(v);
							if(e == 1)
								$("#pqty").val(v);
							if(e == 2)
								$("#pprice").val(v);
							if(e == 3)
								$("#desc").val(v);
							
						})			
					}									
						})
			})


			
$("#updateitem").click(function(){
	$("#pname").attr("required","required");
	$("#pqty").attr("required","required");
	$("#pprice").attr("required","required");
	//$("#pimg").attr("required","required");
	$("#desc").attr("required","required");
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
			

$("#pprice").keyup(function() {
    $("#pprice").val(this.value.match(/[0-9]*/));
});


$("#pqty").keyup(function() {
    $("#pqty").val(this.value.match(/[0-9]*/));
});
			
})


				
	
	
	