<!--- 
filename 		: final.cfm
function 		: This file displays the final receipt with details of products purchased.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->

<html lang = "en-US">
<head>
	<script src = "https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src = "https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src = "../assets/js/final.js"></script>
	<link rel = "shortcut icon" href = "../assets/css/favicon.ico" type = "image/x-icon">
	<link rel = "stylesheet" href = "../assets/css/final.css">
</head>
<body>
	<cfinclude template = "headertemplate.cfm">	
	<cfset controllerObject = CreateObject("component","controller.finalcontroller") />
	<cfif SESSION.userPhoneNumber NEQ "">
		<cfoutput>
		<cfif structKeyExists(form, "payment")>
			<cfif #SESSION.cartpurchase# EQ TRUE>
				<cfset SESSION.cartpurchase = FALSE />
				<cfset VARIABLE.buyFromCart = controllerObject.buyallfromcart(date = "#DateFormat(Now(),"mm/dd/yy")#") >
				<cfset SESSION.cartnumber = #VARIABLE.buyFromCart#>
				<cflocation url = "final.cfm">
			</cfif>
			<cfif  SESSION.CurrentTransaction EQ true>
				<cfset VARIABLE.addOrder = controllerObject.addorder(id = "#SESSION.id#",date = "#(DateFormat(Now(),"mm/dd/yy"))#")>
				<cfset SESSION.CurrentTransaction = false />
			</cfif>
			<cfif structKeyExists(form,"ccnumber")>
				<cfset VARIABLE.storeCreditCardDetails = controllerObject.paymentdetails(ccnumber = "#form.ccnumber#",holdername = "#form.holdername#",expdate = "#form.expdate#",cvvnumber = "#form.cvv#")>
			</cfif>
		</cfif>
		<div class = "final-area">
			<h3>TRANSACTION SUCCESSFULLY</h3>
			<div class = "details-area">
				<cfset VARIABLE.totalAmount = controllerObject.gettotalamount() />
				<span class = "totalamount">You purchased items worth Rs.<strong>#VARIABLE.totalAmount.TotalAmount#</strong></span>
				<h4>You purchased Items </h4>
				<cfset VARIABLE.getItems = controllerObject.getitems() />
				<cfloop query = "VARIABLE.getItems">
					- #VARIABLE.getItems.ProductSubCategoryName# Qty : #VARIABLE.getItems.OrderQty# <br/>
				</cfloop>
				<h4>Shipping Address</h4>
				<cfset VARIABLE.getAddress = controllerObject.getaddress()>
				<span class = "delevery-address"><strong>SHIPPING NAME : #VARIABLE.getAddress.Name#</strong></span><br />
				ADDRESS : #VARIABLE.getAddress.Address#<br />
				CITY : #VARIABLE.getAddress.City# <br />
				STATE : #VARIABLE.getAddress.State# <br />
				ZIP : #VARIABLE.getAddress.Zip# <br />
				PHONE NUMBER : #VARIABLE.getAddress.PhoneNumber#					
			</div>			
			<cfform action = "../index.cfm" method = "POST">
				<button class = "btn btn-info btn-lg" name = "buymore" >
					<span class = "glyphicon glyphicon-shopping-cart"></span> BUY MORE
				</button>
			</cfform>		
		</div>		
		</cfoutput>
		<cfinclude template = "footer.cfm">
	<cfelse>
		<cflocation url = "../index.cfm">
	</cfif>
</body>
</html>