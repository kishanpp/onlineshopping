<link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/product.css">
<link rel="stylesheet" href="css/buyproduct.css">
<body>
<cfif session.userPhoneNumber NEQ "">
<cfinclude template="headertemplate.cfm">
<div class="address-area">


	<cfoutput>

	<cfif structKeyExists(form,"buy-product")>
	<cfset SESSION.CurrentTransaction = true />
		<cfif SESSION.CurrentTransaction EQ true>
			<cfset SESSION.id = "#URL.id#" />
			
							
			<!--- <cfset SESSION.CurrentTransaction = true /> --->
		<cfelse>
			<cfset update= createObject("component","cffiles.components").updateorder(id="#URL.id#",orderid="#SESSION.OrderId#")>
		</cfif>
		
	</cfif>
	<cfset SESSION.cartpurchase = FALSE />
	<cfif structKeyExists(form,"buy-all-product")>
		<cfset SESSION.cartpurchase = TRUE />
	</cfif>
	
	
	<cfform action="paymentdetails.cfm" method="post">
	<h3>DELIVERY ADDRESS</h3>
	<div class="address-row">
	<span name="name" class="col-xs-6 form-lbl">NAME</span>
	<cfinput type="text" id="name" name="name" required>
	</div>
	
	
	<div class="address-row">
	<span name="add" class="col-xs-6 form-lbl">ADDRESS</span>
	<cfinput name="add" type="text" id="add" required>
	</div>
	
	
	<div class="address-row">
	<span name="city" class="col-xs-6 form-lbl">CITY</span>
	<cfinput type="text" name="city" id="city" required>
	</div>
	
	
	<div class="address-row">
	<span name="state" class="col-xs-6 form-lbl">STATE</span>
	<cfinput type="text" name="state" id="state" required>
	</div>
	
	<div class="address-row">
	<span name="zip" class="col-xs-6 form-lbl">ZIP</span>
	<cfinput type="text" name="zip" id="zip"  pattern="([0-9]|[0-9]|[0-9])"  maxlength="6" required>
	</div>
	
	<cfquery name="resultset1" datasource="OnlineShopping">
		SELECT * FROM dbo.ADDRESS WHERE PhoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
	<cfif resultset1.recordCount EQ 0>
	<button type="submit" name="address" class="btn btn-info btn-lg">
        <span class="glyphicon glyphicon-home"></span> SAVE ADDRESS
    </button>
	<cfelse>
	<script>
		document.getElementById("name").value = "#resultset1.Name#" ;
		document.getElementById("add").value = "#resultset1.Address#" ;
		document.getElementById("city").value = "#resultset1.City#" ;
		document.getElementById("state").value = "#resultset1.State#" ;
		document.getElementById("zip").value = "#resultset1.Zip#" ;
	</script>
	<button type="submit" name="updateaddress" class="btn btn-info btn-lg">
        <span class="glyphicon glyphicon-home"></span> UPDATE ADDRESS
    </button>
	</cfif>
	
	</cfform>
	
	

	
	</cfoutput>
</div>
<cfinclude template="footer.cfm">
</body>
<cfelse>
<cflocation url="/index.cfm">
</cfif>
<script src="js/buyproduct.js"></script>