<!--- 
filename 		: paymentdetails.cfm
function 		: This file shows payment mode and inserts details of credit card if credit card is selected.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<html lang="en-US">
<head>
	<cfinclude template="headertemplate.cfm">
	<link rel="stylesheet" href="../assets/css/paymentdetails.css">
<head>
<body>
	<cfset controllerObject = CreateObject("component","controller.paymentdetailscontroller") />
	<cfif session.userPhoneNumber NEQ "">
		<div class="payment-area">
			<cfoutput>
				<cfif structKeyExists(form, "address")>
					<cfset storeaddress = controllerObject.addressstore(name="#form.name#",address="#form.add#",city="#form.city#",state="#form.state#",zip="#form.zip#")>
				</cfif>
				<cfif structKeyExists(form, "updateaddress")>
					<cfset storeaddress = controllerObject.updateaddress(name="#form.name#",address="#form.add#",city="#form.city#",state="#form.state#",zip="#form.zip#")>
				</cfif>
				<cfform action="final.cfm" method="post">
					<h3>PAYMENT DETAILS</h3>
					<div class="payment-row">
						<cfselect name="paytype" id="paytype" onChange="disabletextboxes()">
							<option value="" selected disabled >Select Pay type</option>	
							<option value="cod">Cash On Delevery</option>	
							<option value="cc">Credit Card</option>	
						</cfselect>
					</div>
					<div class="payment-row">
						<span class="col-xs-6 form-lbl">CC Number</span>
						<cfinput type="text" name="ccnumber" id="ccnumber" maxlength="16" >
					</div>
					<div class="payment-row">
						<span class="col-xs-6 form-lbl">HOLDER NAME</span>
						<cfinput type="text" name="holdername" id="holdername">
					</div>
					<div class="payment-row">
						<span class="col-xs-6 form-lbl">EXPIRY DATE</span>
						<cfinput type="date" name="expdate" id="expdate" >
					</div>
					<div class="payment-row">
						<span class="col-xs-6 form-lbl">CVV NUMBER</span>
						<cfinput type="text" name="cvv" id="cvv" maxlength="3" >
					</div>
					<div class = "payment-row">
					<button  name="payment" id="savebtn" class="btn btn-info btn-lg">
						<span class="glyphicon glyphicon-credit-card"></span> SAVE AND CONTINUE
					</button>
					</div>
				</cfform>
			</cfoutput>
		</div>
		<cfinclude template="footer.cfm">
	<cfelse>
		<cflocation url="/index.cfm">
	</cfif>
	<script  src="../assets/js/paymentdetails.js"></script>
</body>
</html>