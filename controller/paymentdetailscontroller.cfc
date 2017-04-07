<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for paymentdetails page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	<!--- 
	function name			 :	addressstore
	description				 :	this function calls addressstore function in model.
	arguments description	 :	name - name of the buyer
								address - full address of the buyer	
								city - city of the buyer
								state - state of the buyer
								zip - zip of the buyer.
	return type 		  	 :	void
	--->
	<cffunction name="addressstore" returnType="void">
		<cfargument name="name" type="string">
		<cfargument name="address" type="string">
		<cfargument name="city" type="string">
		<cfargument name="state" type="string">
		<cfargument name="zip" type="numeric">
		<cfset storeaddress = modelComponentObject.addressstore(name = "#ARGUMENTS.name#",
																address = "#ARGUMENTS.address#",
																city = "#ARGUMENTS.city#",
																state = "#ARGUMENTS.state#",
																zip = #ARGUMENTS.zip#)>
	</cffunction>
	
	
	<!--- 
	function name			 :	updateaddress
	description				 :	this function calls updateaddress function in model.
	arguments description	 :	name - name of the buyer
								address - full address of the buyer	
								city - city of the buyer
								state - state of the buyer
								zip - zip of the buyer.
	return type 		  	 :	void
	--->
	<cffunction name="updateaddress" returnType="void">
		<cfargument name="name" type="string">
		<cfargument name="address" type="string">
		<cfargument name="city" type="string">
		<cfargument name="state" type="string">
		<cfargument name="zip" type="numeric">
		<cfset updateaddress = modelComponentObject.updateaddress(name = "#ARGUMENTS.name#",
																	address = "#ARGUMENTS.address#",
																	city = "#ARGUMENTS.city#",
																	state = "#ARGUMENTS.state#",
																	zip = #ARGUMENTS.zip#)>
	</cffunction>
	
</cfcomponent>