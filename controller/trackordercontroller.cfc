<!--- 
filename 		: trackordercontroller.cfc
function 		: This file controls the trackOrder.cfm page database request from model.
date created 	: Friday, ?03 ?March, ?2017, ??2:10:49 PM
--->


<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for trackOrder page">
	<cfset modelComponentObject = CreateObject("component","model.components") />

	
	<!--- 
	function name			 :	getOrder
	description				 :	this function calls the getOrder function in  model to retrieve orders of customer.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getOrder" returnType = "query" access = "public">
		<cfreturn modelComponentObject.getOrder() >	
	</cffunction>
	
	
	<!--- 
	function name			 :	getOrderDetails
	description				 :	this function calls the getOrderDetails function in  model to retrieve orders details of customer.
	arguments description	 :	orderId : order id of current user.
	return type 		  	 :	query
	--->
	<cffunction name = "getOrderDetails" returnType = "query" access = "public">
		<cfargument name = "orderId" type = "numeric">
		<cfreturn modelComponentObject.getOrderDetails(orderId = #ARGUMENTS.orderId#) >	
	</cffunction>
	
	
	<!--- 
	function name			 :	getProductDetails
	description				 :	this function calls the getProductDetails function in model to fetch product details.
	arguments description	 :	productId : product sub category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getProductDetails" returnType = "query" access = "public">
		<cfargument name = "productId" type = "numeric">
		<cfreturn modelComponentObject.getProductDetails(productId = #ARGUMENTS.productId#) >	
	</cffunction>
	
	
</cfcomponent>