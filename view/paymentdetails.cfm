<!--- 
filename 		: paymentdetails.cfm
function 		: This file shows payment mode and inserts details of credit card if credit card is selected.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<html lang="en-US">
<head>
	<link rel="stylesheet" href="../assets/css/paymentdetails.css">
<head>
<body>
	<cfif SESSION.userPhoneNumber NEQ "">
		<cfinclude template = "headertemplate.cfm">
		<cfset controllerObject = CreateObject("component","controller.paymentdetailscontroller") />
		<div class = "payment-area">
			<cfoutput>
				<cfif structKeyExists(form, "address")>
					<cfset VARIABLES.storeaddress = controllerObject.addressstore(name = "#form.name#",address = "#form.add#",city = "#form.city#",state = "#form.state#",zip = "#form.zip#")>
				</cfif>
				<cfif structKeyExists(form, "updateaddress")>
					<cfset VARIABLES.storeaddress = controllerObject.updateaddress(name = "#form.name#",address = "#form.add#",city = "#form.city#",state = "#form.state#",zip = "#form.zip#")>
				</cfif>
				<cfform action = "final.cfm" method = "post">
					<h3>PAYMENT DETAILS</h3>
					<div class = "payment-row">
						<cfselect name = "paytype" id="paytype" onChange = "disabletextboxes()">
							<option value = "" selected disabled >Select Pay type</option>	
							<option value= "cod">Cash On Delevery</option>	
							<option value = "cc">Credit Card</option>	
						</cfselect>
					</div>
					<div class = "payment-row">
						<span class = "col-xs-6 form-lbl">CC Number</span>
						<cfinput type = "text" name = "ccnumber" id = "ccnumber" title = "Must be 16 digits" maxlength = "16" > <span class = "hint">Must be 16 digits</span>
					</div>
					<div class = "payment-row">
						<span class = "col-xs-6 form-lbl">HOLDER NAME</span>
						<cfinput type = "text" name = "holdername" id = "holdername"> <span class = "hint">Name on the card</span>
					</div>
					<div class = "payment-row">
						<span class = "col-xs-6 form-lbl">EXPIRY DATE</span>
						<cfinput type = "date" name = "expdate" id = "expdate" > <span class = "hint">Expiry date on card</span>
					</div>
					<div class = "payment-row">
						<span class = "col-xs-6 form-lbl">CVV NUMBER</span>
						<cfinput type = "text" name = "cvv" id = "cvv" title = "Must be 3 digits" maxlength = "3" > <span class = "hint">Must be of 3 digits</span>
					</div>
					<div class = "payment-row">
					<button  name = "payment" id = "savebtn" class = "btn btn-info btn-lg">
						<span class = "glyphicon glyphicon-credit-card"></span> SAVE AND CONTINUE
					</button>
					</div>
				</cfform>
			</cfoutput>
		</div>
		<cfinclude template = "footer.cfm">
	<cfelse>
		<cflocation url = "/index.cfm" addtoken = "false">
	</cfif>
	<script  src = "../assets/js/paymentdetails.js"></script>
</body>
</html>