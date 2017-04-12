<!--- 
filename 		: headertemplate.cfm
function 		: This file display the header and left navigation informations.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<!DOCTYPE html>
<html lang = "en-US">
<head>
	<meta charset = "utf-8">
    <meta http-equiv = "X-UA-Compatible" content = "IE=edge">
    <meta name = "viewport" content = "width = device-width, initial-scale = 1">
	
	<title> Shop Online </title>

	<script src = "https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src = "https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link rel = "shortcut icon" href = "../assets/css/favicon.ico" type = "image/x-icon">
	<link href = "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel = "stylesheet">
	<link href = "../assets/css/animate.css" rel = "stylesheet">
	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel = "stylesheet" href = "https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<link rel = "stylesheet" href = "../assets/css/headertemplate.css">
</head>
<body>
	<cfset controllerObject = CreateObject("component","controller.headertemplatecontroller") />
	<cfif StructKeyExists(form,"loginbtn")>
		<cfset VARIABLES.logged = controllerObject.loginUser(phonenumber = "#form.phonenumber#",password = "#form.password#")>
		<cfif VARIABLES.logged EQ false>
			<div class = "invalidUser"> Invalid userId / Password </div>
		</cfif>
	</cfif>
	<cfif StructKeyExists(form,"logoutbtn")>
		<cfset VARIABLES.logged = controllerObject.logoutUser()>	
	</cfif>
	<cfif StructKeyExists(form,"registerbtn")>
		<cfset VARIABLES.logged = controllerObject.registerUser(username = "#form.username#",password = "#form.password#",phone = "#form.phonenumber#")>
		<cfif VARIABLES.logged EQ false>
			<div class = "invalidUser"> User already exists </div>
		</cfif>
	</cfif>
	<div class = "navbar-inner">
		<div class = "header">
				<a href = "https://www.shoponline.com/"><img src = "/assets/images/logo.gif" ></a>
				<div class = "searcharea">
					<cfoutput>
					<div id = "searchbox">
						<cfform >
							<cfinput id = "search"  type = "text" name = "artname" placeholder = "Phones,PowerBanks,Cases,Cameras and more" autosuggest = "cfc:model/components.productname({cfautosuggestvalue})">
						</cfform>
						<a>
							<button id = "submit"  name = "submit" >SEARCH</button>
						</a>					
					</div>
					</cfoutput>	
				</div>
			<div class = "useronline">
				<cfoutput>
					<cfset sessions = createObject("java","coldfusion.runtime.SessionTracker")>
					<cfset VARIABLES.count = #sessions.getSessionCount()#>
					#VARIABLES.count# <span class = "glyphicon glyphicon-eye-open"/>
				</cfoutput>
			</div>
			<a href = "../view/cartpage.cfm">
				<div class = "cart-area">
					<span class = "glyphicon glyphicon-shopping-cart"> </span> Cart 
					<cfif  SESSION.isLogged>
						<cfset SESSION.cartnumber = controllerObject.getno()>
						<cfoutput>
							<span class = "cart-item">#SESSION.cartnumber#</span>
						</cfoutput>
					</cfif>
				</div>
			</a>
			<!--- login and register area starts  ---> 
			<div class = "loginarea">
				<cfif  SESSION.isLogged>
					<ul>
						<cfoutput>
							<li><span class = "glyphicon glyphicon-user"></span> Hi, <div class = "usernamearea">#SESSION.userName#</div></li>
						</cfoutput>
							<li>
								<cfform >
									<cfinput type = "submit" class = "btn"  value = "Logout" name = "logoutbtn" id = "logoutbtn" >
								</cfform>
							</li>
					</ul>
				<cfelse>
					<ul>
						<li>
							<div class = "login-header">
								<a href = "#"  id = "navLogin">Login&nbsp|&nbsp</a> <br />
							</div>		
							<div class = "dropdownlogin" >
								<cfform> 
									<cfinput name = "phonenumber" id = "loginphonenumber" maxlength = "10" type = "text" placeholder = "Phonenumber" > 
									<cfinput name = "password" id = "loginpassword" type = "password" placeholder = "Password" ><br>
									<cfinput name = "loginbtn" type = "submit" id = "btnLogin" class = "btn" value = "Login"  >
								</cfform>	
							</div>
						</li>
						<li>
							<div class = "login-header">
								<a  href = "#" id = "navRegister" >Register</a>
							</div>
							<div class = "dropdownregister" >
								<cfform > 
									<cfinput name = "username" id = "username" type = "text" placeholder = "Username" maxlength = "20" > 
									<cfinput name = "password" id = "password" type = "password" placeholder = "Password" ><br>
									<cfinput name = "phonenumber" id = "phonennumber" type = "text" maxlength = "10" placeholder = "PhoneNumber" ><br>
									<cfinput type = "submit" id = "btnRegister" class = "btn" name = "registerbtn" value = "Register"><br />
								</cfform>
							</div>
						</li>
					</ul>
				</cfif>
			</div>
		</div>
	</div>
	<!--- login and register area ends  --->

	<!---left navigation starts --->

	<cfset VARIABLES.getcategory = controllerObject.getinventorycategory() >
	<div class = "navbar-inverse navbar-fixed-left">
		<a class = "navbar-brand" href = "#">TOP CATEGORIES</a>
		<ul class = "nav navbar-nav">
			<cfloop query = "VARIABLES.getcategory" >
				<li class = "dropdown">
					<a href = "#" class = "dropdown-toggle" data-toggle = "dropdown">
						<cfoutput>#VARIABLES.getcategory.ProductName#</cfoutput>
						<span class = "caret"></span>
					</a>
					<ul class = "dropdown-menu" role = "menu">
						<cfset VARIABLES.getproducts = controllerObject.getinventorysubcategory(VARIABLES.getcategory.InventorycategoryId) />	
						<cfloop query = "VARIABLES.getproducts" >
							<cfoutput>
								<li id = "#VARIABLES.getproducts.InventorySubCategoryId#">
									<a href = "../view/product.cfm?id=#VARIABLES.getproducts.InventorySubCategoryId#">#VARIABLES.getproducts.ProductSubCategoryName#</a>
								</li>
							</cfoutput>
						</cfloop>
					</ul>
				</li>
				<li class = "divider"></li>
			</cfloop>
		</ul> 
	</div>
	<!--- left navigation ends --->
	<script src="../assets/js/headertemplate.js"></script>
</body>
</html>