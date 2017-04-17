<!--- 
filename 		: buyproduct.cfm
function 		: This file inserts/updates address of the respective user .
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->

<html lang = "en-US">
<head>
	<link rel = "shortcut icon" href = "../assets/css/favicon.ico" type = "image/x-icon">
	<link rel = "stylesheet" href = "../assets/css/buyproduct.css">
</head>
<body>
	<cfif SESSION.userPhoneNumber NEQ "">
		<cfinclude template = "headertemplate.cfm">
		<cfset controllerObject = CreateObject("component","controller.buyproductcontroller") />
		<div class = "address-area">
			<cfoutput>
			<cfif structKeyExists(form,"buy-product")>
				<cfset SESSION.CurrentTransaction = true />
				<cfif SESSION.CurrentTransaction EQ true>
					<cfset SESSION.id = "#URL.id#" />
				<cfelse>
					<cfset VARIABLES.update = controllerObject.updateorder(id = "#URL.id#",orderid = "#SESSION.OrderId#")>
				</cfif>
			</cfif>
			<cfset SESSION.cartpurchase = FALSE />
			<cfif structKeyExists(form,"buy-all-product")>
				<cfset SESSION.cartpurchase = TRUE />
			</cfif>
			<cfform action = "paymentdetails.cfm" id = "addressform" method = "post">
				<h3>DELIVERY ADDRESS</h3>
				<div class = "address-row">
					<span name = "name" class = "col-xs-6 form-lbl">NAME</span>
					<cfinput type = "text" id = "name" name = "name" >
				</div>
				<div class = "address-row">
					<span name = "add" class = "col-xs-6 form-lbl">ADDRESS</span>
					<cfinput name = "add" type = "text" id = "add" >
				</div>
				<div class = "address-row">
					<span name = "city" class = "col-xs-6 form-lbl">CITY</span>
					<cfinput type = "text" name = "city" id = "city" >
				</div>
				<div class = "address-row">
					<span name = "state" class = "col-xs-6 form-lbl">STATE</span>
					<cfinput type = "text" name = "state" id = "state" >
				</div>
				<div class = "address-row">
					<span name = "zip" class = "col-xs-6 form-lbl">PIN</span>
					<cfinput type = "text" name = "zip" id = "zip"  title = "must be of 8 digits"  maxlength = "6" > *must be of 8 digits
				</div>
				<button type = "submit" name = "address" class = "btn btn-info btn-lg">
					<span class = "glyphicon glyphicon-home"></span> SAVE ADDRESS
				</button>
				<button type = "submit" name = "updateaddress" class = "btn btn-info btn-lg">
					<span class = "glyphicon glyphicon-home"></span> SAVE & CONTINUE
				</button>
			</cfform>
			</cfoutput>
		</div>
		<cfinclude template = "footer.cfm">
	<cfelse>
		<cfdump var = "#SESSION.userPhoneNumber#">
		<cflocation url = "/index.cfm" addtoken = "false">
	</cfif>
	<script src  = "../assets/js/buyproduct.js"></script>
</body>
</html>