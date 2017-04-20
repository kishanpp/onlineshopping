<!--- 
filename 		: additemcontroller.cfc
function 		: This file controls the additem.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->


<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for additem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	
	
	<!--- 
	function name			 :	inventorycategory
	description				 :	this function returns the product category names in array format.
	arguments description	 :	no arguments.
	return type 		  	 :	array
	--->
	<cffunction name = "inventorycategory" output = "true" returntype = "array" access = "remote" hint = "calls the inventorycategory function in model and creates array of product names" >
		<cfset LOCAL.inventorycategory = modelComponentObject.inventorycategory ()>
		<cfset LOCAL.productnames = ArrayNew(1)>
		<cfloop query = "LOCAL.inventorycategory">
			<cfset ArrayAppend( LOCAL.productnames,ProductName)>
		</cfloop>
		<cfreturn LOCAL.productnames>
	</cffunction>
	
	
	<!--- 
	function name			 :	adddata
	description				 :	this function calls getdatabyid function in model.
	arguments description	 :	id - product sub category id
								orderid - orderid of current transaction.
	return type 		  	 :	boolean
	--->	
	<cffunction name = "adddata" returnType = "boolean" access = "public" hint = "call the adddata function in model to store new product sub category">
		<cfargument name = "pcat" type = "string" required = "true" >
		<cfargument name = "pname" type = "string" required = "true" >
		<cfargument name = "qty" type = "numeric" required = "true" >
		<cfargument name = "pprice" type = "numeric" required = "true" >
		<cfargument name = "pimg" type = "any" required = "true" >
		<cfargument name = "pdisc" type = "numeric" required = "true" >
		<cfargument name = "desc" type = "string" required = "true" >
		<cfset LOCAL.adddata = modelComponentObject.adddata("#ARGUMENTS.pcat#",
														"#ARGUMENTS.pname#",
														#ARGUMENTS.qty#,
														ARGUMENTS.pprice,
														"#ARGUMENTS.pimg#",
														#ARGUMENTS.pdisc#,
														"#ARGUMENTS.desc#")>
		<cfreturn #LOCAL.adddata#>
	</cffunction>
	
	
</cfcomponent>