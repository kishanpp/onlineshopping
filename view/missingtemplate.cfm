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
	<cfif SESSION.admin EQ false>
		<meta http-equiv = "refresh" content="6;url=https://www.shoponline.com">
	<cfelse>
		<meta http-equiv = "refresh" content="6;url=https://www.shoponline.com/view/admin.cfm">
	</cfif>
	<link href = 'https://fonts.googleapis.com/css?family=Amarante' rel='stylesheet' type='text/css'>
</head>
<body>
	<cfinclude template = "headertemplate.cfm">
	<img src="../assets/images/label.png"/> 
	<div class = "redirectarea">
		Redirecting to HomePage in <span class = "redirect"> 5</span> Seconds.
	</div>

	<div class="wrap">
		<div class="logo">
			<img src="../assets/images/woody-404.png"/>
			<div class="sub">
			<cfif SESSION.admin EQ false>
				<p><a href="../index.cfm">Go Back to Home</a></p>
			<cfelse>
				<p>Return to <a href = "admin.cfm"> Admin</a> page</p>
			</cfif>
			</div>
		</div>
	</div>	
		

	<cfinclude template = "footer.cfm">
</body>
<link rel="stylesheet" href = "../assets/css/missingtemplate.css">
<script src = "../assets/js/missingtemplate.js"></script>
</html>