<!--- 
filename 		: deleteitemcontroller.cfc
function 		: This file controls the deleteitem.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->



<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for deleteitem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	

	<!--- 
	function name			 :	inventorycategory
	description				 :	this function returns the product category names in array format.
	arguments description	 :	no arguments.
	return type 		  	 :	array
	--->
	<cffunction name = "inventorycategory" output = "true" returntype = "array" access = "remote" >
		<cfset LOCAL.inventorycategory = modelComponentObject.inventorycategory()>
		<cfset LOCAL.productnames = ArrayNew(1)>
		<cfloop query = "LOCAL.inventorycategory">
			<cfset ArrayAppend( LOCAL.productnames,ProductName)>
		</cfloop>
		<cfreturn LOCAL.productnames>
	</cffunction>
	
	
	<!--- 
	function name			 :	inventorysubcategory
	description				 :	this function returns names of product sub category names according to their product category name in array format.
	arguments description	 :	pname - product category name.
	return type 		  	 :	array
	--->
	<cffunction name = "inventorysubcategory" output = "true" returntype = "array" access = "remote" >
		<cfargument name = "pname" type = "string" required = "true" default = "">
		<cfset LOCAL.inventorysubcategory = modelComponentObject.inventorysubcategory (pname = "#ARGUMENTS.pname#")>
		<cfset LOCAL.productSubCategoryNamesArray = ArrayNew(1)>
		<cfloop query = "LOCAL.inventorysubcategory">
			<cfset ArrayAppend( LOCAL.productSubCategoryNamesArray,ProductSubCategoryName)>
		</cfloop>
		<cfreturn LOCAL.productSubCategoryNamesArray>
	</cffunction>
	
	
	<!--- 
	function name			 :	deletedata
	description				 :	this function calls the deletedata function in model.
	arguments description	 :	psubcat - product sub category name.
	return type 		  	 :	query
	--->
	<cffunction name = "deletedata" returnType = "void" access = "remote">
		<cfargument name = "psubcat" type = "string" required = "true" >
		<cfset LOCAL.deletedata = modelComponentObject.deletedata(psubcat = "#ARGUMENTS.psubcat#")>
	</cffunction>
	
	
</cfcomponent>