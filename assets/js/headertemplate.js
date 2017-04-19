$(document).ready(function() {
	var productid = 0;

	$('#navLogin').click(function()
							{
								document.getElementsByClassName("login-header")[1].style.display="none";
								document.getElementsByClassName("dropdownlogin")[0].style.display="block";
							}
						);
	$('#navLogin').mouseout(function()
							{
								$("#navLogin").css("color","white");
							}
						);					
	
	$('#navRegister').click(function()
							{
								document.getElementsByClassName("dropdownregister")[0].style.display="inline";	
								document.getElementsByClassName("login-header")[0].style.display="none";
								document.getElementsByClassName("dropdownregister")[0].style.margin.left="38%";
								$("#navRegister").css("margin-left","16%");
								$(".dropdownregister form").css("margin-left","16%");
							});
	$('#navRegister').mouseout(function()
							{
								$("#navRegister").css("color","white");
							}
						);	
						
	$('.dropdownregister').mouseover(function()
							{
								$("#navRegister").css("margin-left","16%");
							});


									
	$(document).mouseup(function (e)
		{
			var container = $(".dropdownlogin, .dropdownregister");

			if (!container.is(e.target) // if the target of the click isn't the container...
				&& container.has(e.target).length === 0) // ... nor a descendant of the container
			{
				container.hide();
				$(".login-header").css("display","block");
				$("#navRegister").css("margin-left","0%");
			}
		});
									
	$("#submit").click(function(){
		if($("#search").val().trim() == "")			
			return false;
		else
		{
			
			$.ajax({
						type:"GET",
						url: "../model/components.cfc?method=getproductbyname&ReturnFormat=json",
						data: {value : document.getElementById("search").value.trim()},
						cache:false,
						success : function(data)
									{	
										productid = data;	
										if(productid !=0)
											window.location="https://www.shoponline.com/view/product.cfm?id="+productid+"";
										else
											alert("Product not found");	
									}
				}).fail(function(jqXHR , textStatus )
				{
							alert("database error");		
				});
		}
	})


	$("#btnRegister").click(function()
	{
		$("#username, #password, #phonennumber").attr("required","required");
		$("#phonennumber").attr("pattern",".{10,10}");
	})



	$("#btnLogin").click(function()
	{
		$("#loginphonenumber, #loginpassword").attr("required","required");
		$("#loginphonenumber").attr("pattern",".{10,10}");
		
	})


	$('#password').keydown(function( e ) {
			if(e.which == 32) 
			return false;
	})
	
	$('#phonennumber').keydown(function( e ) {
			if(e.which == 32) 
			return false;
	})

	var pp;    
	$("#username").keydown(function(event) {
		pp = $("#username").val();          
		if( event.keyCode == 32 && document.getElementById("username").selectionStart === 0) {
			return false;
		}
	});

	$('#loginphonenumber').keydown(function( e ) {
			if(e.which == 32) 
			return false;
	})

	$('#loginpassword').keydown(function( e ) {
			if(e.which == 32) 
			return false;
	})		
		
	$("#phonennumber").keyup(function() {
		$("#phonennumber").val(this.value.match(/[0-9]*/));
	});

	$("#loginphonenumber").keyup(function() {
		$("#loginphonenumber").val(this.value.match(/[0-9]*/));
	});
	
	$(".invalidUser").delay(2000).fadeOut();
	
	
	//password strength check//
	$('#password').passwordStrength();

})