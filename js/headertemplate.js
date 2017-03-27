$(document).ready(function() {
	var productid=0;
$('#navLogin').click(function()
						{
							$(".dropdownlogin").show();
								//document.getElementsByClassName("dropdownlogin")[0].style.display="block";
								document.getElementsByClassName("login-header")[1].style.display="none";
								
								
						}
					);
$('.dropdownlogin').mouseover(function()
						{
							document.getElementsByClassName("dropdownlogin")[0].style.display="block";
							document.getElementsByClassName("login-header")[1].style.display="none";
						}
					);
					
$('.dropdownlogin').mouseout(function()
	{
		document.getElementsByClassName("dropdownlogin")[0].style.display="none";
		document.getElementsByClassName("login-header")[1].style.display="block";
	}
);
$('#navRegister').click(function()
						{
								document.getElementsByClassName("dropdownregister")[0].style.display="inline";
								document.getElementsByClassName("login-header")[0].style.display="none";
								$(".login-header").css("margin-left","18%");
								$(".dropdownregister").css("margin-left","18%");
						}
					);

					
$('.dropdownregister').mouseover(function()
						{
								document.getElementsByClassName("dropdownregister")[0].style.display="inline";
								document.getElementsByClassName("login-header")[0].style.display="none";
						}
					);

$('.dropdownregister').mouseout(function(){
									
										document.getElementsByClassName("dropdownregister")[0].style.display="none";
										document.getElementsByClassName("login-header")[0].style.display="block";
										//$(".login-header").css("margin-left","0%");
								});
								


$(document).keypress(function(e){
    if (e.which == 13){
        $("#submit").click();
    }
})

								
								
								
$("#submit").click(function(){
	if($("#search").val().trim() == "")
	alert("Enter product name");
	else
	{
		
		$.ajax({
		type:"GET",
		url: "cffiles/components.cfc?method=getproductbyname&ReturnFormat=json",
	
		data: {value : document.getElementById("search").value.trim()},
		cache:false,
		success : function(data)
					{
						
						productid=data;
						
						
						if(productid !=0)
						window.location="https://www.shoponline.com/product.cfm?id="+productid+"";
						else
						alert("Product not found");
						
					}
		});
  
	}
		
	
})




/*
$("#search").keyup(function(){
 $.ajax({
      type:"GET",
      url: "cffiles/components.cfc?method=getproductbyname&ReturnFormat=json",
	
 data: {value : document.getElementById("search").value.trim()},
      cache:false,
      success : function(data)
					{
						
						productid=data;
						
					}
  });
}) */


$("#btnRegister").click(function()
{
	if( $("#username").val().trim() == "" )
	{
		alert("Enter username");
		return false;
	}
	
	else if( $("#password").val().trim() == "" )
	{
		
		alert("Enter password");
		return false;
	}
	else if( $("#phonennumber").val().trim() == "" )
	{
		alert("Enter Phone Number");
		return false;
	}
	else
	{
		
	}
})



$("#btnLogin").click(function()
{
	if( $("#loginphonenumber").val().trim() == "" )
	{
		alert("Enter Phone Number");
		return false;
	}
	else if( $("#loginpassword").val().trim() == "" )
	{
		alert("Enter password");
		return false;
	}
	else
	{
		
	}
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
        pp =$("#username").val();          
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


		
})
								
								
								
							
								
				
								
								
								

