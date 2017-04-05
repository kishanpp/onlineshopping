$(document).ready(function() {
	var productid=0;

$('#btnLogin').attr("disabled","true");
$("#loginphonenumber").keyup(function(){
	if(this.value.length != 10){
		$("#btnLogin").attr("disabled","true");
	}
	else{
		$("#btnLogin").removeAttr("disabled");
	}
})
	
$('#navLogin').click(function()
						{
							document.getElementsByClassName("login-header")[1].style.display="none";
							//$(".dropdownlogin").delay(0).fadeIn();
								document.getElementsByClassName("dropdownlogin")[0].style.display="block";
								
								
								
						}
					);
$('.dropdownlogin').mouseover(function()
						{
							document.getElementsByClassName("login-header")[1].style.display="none";
							document.getElementsByClassName("dropdownlogin")[0].style.display="block";
							
							//$(".dropdownlogin").delay(0).fadeIn();
						}
					);
					
$('.dropdownlogin').mouseout(function()
	{
		document.getElementsByClassName("dropdownlogin")[0].style.display="none";
		//$(".dropdownlogin").delay(100).fadeOut();
		//$(".login-header").delay(0).fadeIn();
		document.getElementsByClassName("login-header")[1].style.display="block";
		
	}
);
$('#btnRegister').attr("disabled","true");
$("#phonennumber").keyup(function(){
	if(this.value.length != 10){
		$("#btnRegister").attr("disabled","true");
	}
	else{
		$("#btnRegister").removeAttr("disabled");
	}
})
$('#navRegister').click(function()
						{
								document.getElementsByClassName("dropdownregister")[0].style.display="inline";
								document.getElementsByClassName("login-header")[0].style.display="none";
								document.getElementsByClassName("dropdownregister")[0].style.margin.left="38%";
								$("#navRegister").css("margin-left","16%");
								$(".dropdownregister form").css("margin-left","16%");
						}
					);

					
$('.dropdownregister').mouseover(function()
						{
								document.getElementsByClassName("dropdownregister")[0].style.display="inline";
								document.getElementsByClassName("login-header")[0].style.display="none";
								$("#navRegister").css("margin-left","16%");
						}
					);

$('.dropdownregister').mouseout(function(){
									
										document.getElementsByClassName("dropdownregister")[0].style.display="none";
										document.getElementsByClassName("login-header")[0].style.display="block";
										$("#navRegister").css("margin-left","0%");
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
		url: "../model/components.cfc?method=getproductbyname&ReturnFormat=json",
	
		data: {value : document.getElementById("search").value.trim()},
		cache:false,
		success : function(data)
					{
						
						productid=data;
						
						
						if(productid !=0)
						window.location="https://www.shoponline.com/view/product.cfm?id="+productid+"";
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

$("#loginphonenumber").keyup(function() {
    $("#loginphonenumber").val(this.value.match(/[0-9]*/));
});



		
})
								
								
								
							
								
				
								
								
								

