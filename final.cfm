<link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/final.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="js/final.js"></script>
<body>


<cfif session.userPhoneNumber NEQ "">


<script src="js/final.js"></script>

	
		<cfoutput>
		 
	<cfif structKeyExists(form, "payment")>
	
			<cfif #SESSION.cartpurchase# EQ TRUE>
				<cfset SESSION.cartpurchase = FALSE />
				
			<cfset updateVal=createObject("component","cffiles.components").buyallfromcart(DateFormat(Now(),"mm/dd/yy"))>
			<cfset SESSION.cartnumber = #updateVal#>
			</cfif>
			<cfif  SESSION.CurrentTransaction EQ true>
				<cfset storeaddress= createObject("component","cffiles.components").addorder(id="#SESSION.id#",date="#(DateFormat(Now(),"mm/dd/yy"))#")>
				<cfset SESSION.CurrentTransaction = false />
			</cfif>
		
		<cfif structKeyExists(form,"ccnumber")>
			<cfset storeaddress= createObject("component","cffiles.components").paymentdetails(ccnumber="#form.ccnumber#",holdername="#form.holdername#",expdate="#form.expdate#",cvvnumber="#form.cvv#")>
		</cfif>
	</cfif>
<cfinclude template="headertemplate.cfm">	
	<div class="final-area">

	
	<h3>TRANSACTION SUCCESSFULLY</h3>
	
	<cfset var1=myobject.gettotalamount() />
		<p class="totalamount">You purchased items worth Rs.#var1.TotalAmount#</p>
			
				<div class="details-area">
				<h4>You purchased Items </h4>
				<cfset var2=myobject.getitems() />
				<cfloop query="var2">
					<p class="items-purchased">#var2.ProductSubCategoryName#</p>
				</cfloop>
				<h4>Shipping Address</h4>
				<cfset var3=myobject.getaddress()>
				<cfloop query="var3">
					<p class="delevery-address"><strong>SHIPPING NAME : #var3.Name#</strong><br />
												
												ADDRESS : #var3.Address#<br />
												CITY : #var3.City# <br />
												STATE : #var3.State# <br />
												ZIP : #var3.Zip# <br />
												PHONE NUMBER : #var3.PhoneNumber#
				</cfloop>
				
				
				</div>
				
				
		
		<cfform action="index.cfm" method="POST">
			<button class="btn btn-info btn-lg" name="buymore" >
        <span class="glyphicon glyphicon-shopping-cart"></span> BUY MORE
			</button>
        </cfform>
			
			
		
		
		</cfoutput>
	</div>
		
	
	
	<cfinclude template="footer.cfm">
<cfelse>
<cflocation url="/index.cfm">
</cfif>

</body>