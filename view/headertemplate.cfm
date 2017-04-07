
<html>
<head>

<title> Shop Online </title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="shortcut icon" href="../assets/css/favicon.ico" type="image/x-icon">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<link href="../assets/css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/headertemplate.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>
<body>
<cfset controllerObject = CreateObject("component","controller.headertemplatecontroller") />
<cfif StructKeyExists(form,"loginbtn")>
	<cfset VARIABLE.logged = controllerObject.loginUser(phonenumber="#form.phonenumber#",password="#form.password#")>
	
	<cfif VARIABLE.logged EQ false>
		<script>alert("Invalid user");</script>
	</cfif>
</cfif>
	
<cfif StructKeyExists(form,"logoutbtn")>
	<cfset VARIABLE.logged = controllerObject.logoutUser()>	
</cfif>

<cfif StructKeyExists(form,"registerbtn")>
	<cfset VARIABLE.logged = controllerObject.registerUser(username="#form.username#",password="#form.password#",phone="#form.phonenumber#")>
	<cfif VARIABLE.logged EQ false>
		<script>alert("User already exists");</script>
	</cfif>
</cfif>

	<div class="navbar-inner">
		<div class="header">
			<a href="https://www.shoponline.com/"><img src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSale-FGlTOPmjaaJPevPHT0HV16A4OUHfihKiZqc9Cb8b_qjRnkQ" ></a>
			
			<div class="searcharea">
              	<cfoutput>
					<div id="searchbox">
						<!---<input id="search" name="search" type="text" placeholder="Search for Products, Brands and More"> --->
						<cfform >
						<cfinput id="search"  type="text" name="artname" autosuggest="cfc:model/components.productname({cfautosuggestvalue})">
						</cfform>
						 <a><button id="submit"  name="submit" >GO</button></a>					
					</div>
				</cfoutput>	
			</div>
			
			
			<div class="useronline">
			<cfoutput>
			<cfset sessions = createObject("java","coldfusion.runtime.SessionTracker")>
			<cfset count = #sessions.getSessionCount()#>
				Users Online #count#
			</cfoutput>
			</div>

			<a href="../view/cartpage.cfm">
			<div class="cart-area">
					<span class="glyphicon glyphicon-shopping-cart"></span>Cart
					<cfif  session.isLogged>
						<cfset SESSION.cartnumber = controllerObject.getno()>
						
					<cfoutput>
					<span class="cart-item">#SESSION.cartnumber#</span>
					</cfoutput>
					</cfif>
			</div>
			</a>
			
			<!--- login and register area starts   ---> 
			<div class="loginarea">
					<cfif  session.isLogged>
						<ul>
							<cfoutput>
							<li><span class="glyphicon glyphicon-user"></span> Hi, <div class="usernamearea">#session.userName#</div></li>
							</cfoutput>
							<li>	<cfform >
									<cfinput type="submit" class="btn"  value="Logout" name="logoutbtn" id="logoutbtn" >
								</cfform>
							</li>
						</ul>
					<cfelse>
					<ul>
						<li>
							<div class="login-header">
								<a href="#"  id="navLogin">Login&nbsp|&nbsp</a> <br />
							</div>		
							<div class="dropdownlogin" >
								<cfform> 
									<cfinput name="phonenumber" id="loginphonenumber" maxlength="10" type="text" placeholder="Phonenumber" > 
									<cfinput name="password" id="loginpassword" type="password" placeholder="Password" ><br>
									<cfinput name="loginbtn" type="submit" id="btnLogin" class="btn" value="Login"  >
								</cfform>	
							</div>
						</li>
						<li>
							<div class="login-header">
								<a  href="#" id="navRegister" >Register</a>
							</div>
							
							<div class="dropdownregister" >
								<cfform > 
								<cfinput name="username" id="username" type="text" placeholder="Username" maxlength="20" > 
								<cfinput name="password" id="password" type="password" placeholder="Password" ><br>
								<cfinput name="phonenumber" id="phonennumber" type="text" maxlength="10" placeholder="PhoneNumber" ><br>
								<cfinput type="submit" id="btnRegister" class="btn" name="registerbtn" value="Register"><br />
								</cfform>
							</div>
						</li>
					</ul>
				</cfif>
			</div>
		</div>
	</div>


<!--- login and register area ends  --->




<!--- -----------------------------------------left navigation starts --->






<cfset getcategory = controllerObject.getinventorycategory() >


<div class="navbar-inverse navbar-fixed-left">
  <a class="navbar-brand" href="#">TOP CATEGORIES</a>
  <ul class="nav navbar-nav">
		<cfloop query="getcategory" >
			<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					<cfoutput>#getcategory.ProductName#</cfoutput>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu" role="menu">
					<cfset getproducts = controllerObject.getinventorysubcategory(getcategory.InventorycategoryId) />	
					<cfloop query="getproducts" >
						<cfoutput>
						<li id="#getproducts.InventorySubCategoryId#" class="">
							<a href="../view/product.cfm?id=#getproducts.InventorySubCategoryId#">#getproducts.ProductSubCategoryName#</a>
						</li>
						</cfoutput>
					</cfloop>
				</ul>
			</li>
			<li class="divider"></li>
		</cfloop>
	</ul> 
</div>



<!--- left navigation ends --->


<script src="../assets/js/headertemplate.js"></script>
</body>
</html>