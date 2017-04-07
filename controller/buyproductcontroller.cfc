<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for buyproduct page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />


	<!--- 
	function name			 :	updateorder
	description				 :	this function calls getdatabyid function in model.
	arguments description	 :	id - product sub category id
								orderid - orderid of current transaction.
	return type 		  	 :	void
	--->	
	<cffunction name="updateorder" returnType="void">
		<cfargument name="id" type="numeric">
		<cfargument name="orderid" type="numeric">
		<cfset modelComponentObject.updateorder("#ARGUMENTS.id#","#ARGUMENTS.orderid#")>
	</cffunction>


	<!--- 
	function name			 :	checkaddress
	description				 :	this function calls getdatabyid function in model and returns address details in array format.
	arguments description	 :	no arguments.
	return type 		  	 :	array
	--->
	<cffunction name="checkaddress" returnType="array" access="remote">
		<cfset checkaddress = modelComponentObject.checkaddress()>
		<cfset addressDetails = ArrayNew(1)>
		<cfif checkaddress.recordCount EQ 0>
			<cfset ArrayAppend(addressDetails, "No address found")>
		<cfelse>
			<cfset ArrayAppend(addressDetails, checkaddress.Name)>
			<cfset ArrayAppend(addressDetails, checkaddress.Address)>
			<cfset ArrayAppend(addressDetails, checkaddress.City)>
			<cfset ArrayAppend(addressDetails, checkaddress.State)>
			<cfset ArrayAppend(addressDetails, checkaddress.Zip)>
		</cfif>
		<cfreturn addressDetails>
	</cffunction>
	
	
	
</cfcomponent>