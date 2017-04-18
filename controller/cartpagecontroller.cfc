<!--- 
filename 		: cartpagecontroller.cfc
function 		: This file controls the cartpage.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->


<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for cart page">
<cfset modelComponentObject = CreateObject("component","model.components") />



	<!--- 
	function name			 :	removefromcart
	description				 :	this function calls removefromcart function in model to remove product from cart.
	arguments description	 :	productId.
	return type 		  	 :	any
	--->
	<cffunction name = "removefromcart" returnType = "any" access = "remote">
		<cfargument name = "productId" type = "numeric" required = "true">
		<cfreturn modelComponentObject.removefromcart(productId = #ARGUMENTS.productId#)>
	</cffunction>
	
	

	<!--- 
	function name			 :	getcartdataid
	description				 :	this function calls getcartdataid function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getcartdataid" returnType = "query" access = "public">
		<cfreturn modelComponentObject.getcartdataid()>
	</cffunction>


	
	<!--- 
	function name			 :	getcartdata
	description				 :	this function calls getcartdata function in model.
	arguments description	 :	id - product sub category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getcartdata" returnType = "query" access = "public">
	<cfargument name = "id" type = "numeric">
		<cfreturn modelComponentObject.getcartdata(id = "#ARGUMENTS.id#")>
	</cffunction>


	<!--- 
	function name			 :	getcartitemstotalamount
	description				 :	this function calls getcartitemstotalamount function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name = "getcartitemstotalamount" returnType = "numeric" access = "public">
		<cfreturn modelComponentObject.getcartitemstotalamount()>
	</cffunction>


</cfcomponent>