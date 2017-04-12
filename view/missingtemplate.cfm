<!--- 
filename 		: missingtemplate.cfm
function 		: This file display page not found error on accessing the invalid template.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->

<!DOCTYPE HTML>
<html lang = "en-US">
<head>
	<title>oops  404 Page not found</title>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
	<meta http-equiv = "refresh" content="6;url=https://www.shoponline.com">
	<link href = 'https://fonts.googleapis.com/css?family=Amarante' rel='stylesheet' type='text/css'>
	<style type = "text/css">
		body{
			background:url(../assets/images/bg.png);
			margin:0;
		}
		.wrap{
			margin:0 auto;
			width:1000px;
		}
		.logo{
			text-align:center;
		}	
		.logo p span{
			color:lightgreen;
		}	
		.sub a{
			color:white;
			background:rgba(0,0,0,0.3);
			text-decoration:none;
			padding:5px 10px;
			font-size:13px;
			font-family: arial, serif;
			font-weight:bold;
		}	
		.footer{
			color:#555;
			position:absolute;
			right:10px;
			bottom:10px;
			font-weight:bold;
			font-family:arial, serif;
		}	
		.redirectarea
		{
			margin: 0% 0% 0% 39%;
			font-family:arial, serif;
			color: #e51c1c;
		}
	</style>
</head>
<body>
	<img src="../assets/images/label.png"/> 
	<div class = "redirectarea">
		Redirecting to HomePage in <span class = "redirect"> 5</span> Seconds.
	</div>
	<div class="wrap">
		<div class="logo">
			<img src="../assets/images/woody-404.png"/>
			<div class="sub">
				<p><a href="../index.cfm">Go Back to Home</a></p>
			</div>
		</div>
	</div>	
</body>
<script src = "../assets/js/missingtemplate.js"></script>
</html>