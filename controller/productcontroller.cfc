<!--- 
filename 		: productcontroller.cfc
function 		: This file controls the product.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->


<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for product page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	
	
	<!--- 
	function name			 :	getdatabyid
	description				 :	this function calls getdatabyid function in model.
	arguments description	 :	productId - product sub category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getdatabyid" returnType = "query" access = "public">
		<cfargument name = "productId" type = "string" required = "true">
		<cfreturn modelComponentObject.getdatabyid(#ARGUMENTS.productId#)>
	</cffunction>


	<!--- 
	function name			 :	getproductqty
	description				 :	this function calls the getproductqty function in model.
	arguments description	 :	productId - product sub category id.
	return type 		  	 :	boolean
	--->
	<cffunction name = "getproductqty" returnType = "boolean" access = "public">
		<cfargument name = "productId" type = "numeric" required = "true">
		<cfreturn modelComponentObject.getproductqty(id = "#ARGUMENTS.productId#")>
	</cffunction>


	<!--- 
	function name			 :	getproducts
	description				 :	this function call the getproduct function in model.
	arguments description	 :	id - product sub category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getproducts" returnType = "query" access = "public">
		<cfargument name = "id" type = "numeric" required = "true">
		<cfreturn modelComponentObject.getproduct(id = "#ARGUMENTS.id#")>
	</cffunction>


</cfcomponent>