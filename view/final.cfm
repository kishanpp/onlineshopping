<link rel="shortcut icon" href="../assets/css/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="../assets/css/final.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="../assets/js/final.js"></script>
<body>
<cfinclude template="headertemplate.cfm">	
<cfset controllerObject = CreateObject("component","controller.finalcontroller") />

<cfif session.userPhoneNumber NEQ "">




	
		<cfoutput>
		 
	<cfif structKeyExists(form, "payment")>
	
			<cfif #SESSION.cartpurchase# EQ TRUE>
				<cfset SESSION.cartpurchase = FALSE />
				<cfset updateVal = controllerObject.buyallfromcart(date = "#DateFormat(Now(),"mm/dd/yy")#") >
				<cfset SESSION.cartnumber = #updateVal#>
				<cflocation url="final.cfm">
			</cfif>
			<cfif  SESSION.CurrentTransaction EQ true>
				<cfset storeaddress = controllerObject.addorder(id="#SESSION.id#",date="#(DateFormat(Now(),"mm/dd/yy"))#")>
				<cfset SESSION.CurrentTransaction = false />
			</cfif>
		
			<cfif structKeyExists(form,"ccnumber")>
				<cfset storeaddress= createObject("component","cffiles.components").paymentdetails(ccnumber="#form.ccnumber#",holdername="#form.holdername#",expdate="#form.expdate#",cvvnumber="#form.cvv#")>
			</cfif>
				
		
	</cfif>

	<div class="final-area">

	
	<h3>TRANSACTION SUCCESSFULLY</h3>
	<div class="details-area">
	<cfset var1 = controllerObject.gettotalamount() />
		<span class="totalamount">You purchased items worth Rs.#var1.TotalAmount#</span>
			
		
				<h4>You purchased Items </h4>
				<cfset var2 = controllerObject.getitems() />
				<cfloop query="var2">
					<p class="items-purchased">#var2.ProductSubCategoryName#</p>
				</cfloop>
				<h4>Shipping Address</h4>
				<cfset var3 = controllerObject.getaddress()>
				<cfloop query="var3">
					<span class="delevery-address"><strong>SHIPPING NAME : #var3.Name#</strong></span><br />
												
												ADDRESS : #var3.Address#<br />
												CITY : #var3.City# <br />
												STATE : #var3.State# <br />
												ZIP : #var3.Zip# <br />
												PHONE NUMBER : #var3.PhoneNumber#
				</cfloop>
				
				
		</div>
				
				
		
		<cfform action="../index.cfm" method="POST">
			<button class="btn btn-info btn-lg" name="buymore" >
        <span class="glyphicon glyphicon-shopping-cart"></span> BUY MORE
			</button>
        </cfform>
			
			
		
		
		</cfoutput>
	</div>
		
	
	
	<cfinclude template="footer.cfm">
<cfelse>
<cflocation url="../index.cfm">
</cfif>

</body>