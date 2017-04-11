<!--- 
filename 		: updateitemcontroller.cfc
function 		: This file controls the updateitem.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->



<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for updateitem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	

	
	<!--- 
	function name			 :	inventorycategory
	description				 :	this function returns the product category names in array format.
	arguments description	 :	no arguments.
	return type 		  	 :	array
	--->
	<cffunction name = "inventorycategory" output = "true" returntype = "array" access = "remote" >
		<cfset LOCAL.inventorycategory = modelComponentObject.inventorycategory ()>
		<cfset LOCAL.productnames = ArrayNew(1)>
		<cfloop query = "LOCAL.inventorycategory">
			<cfset ArrayAppend( LOCAL.productnames,ProductName)>
		</cfloop>
		<cfreturn LOCAL.productnames>
	</cffunction>
	
	
	<!--- 
	function name			 :	inventorysubcategory
	description				 :	this function returns names of product sub category names according to their product category name.
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
	function name			 :	inventorysubcategorydata
	description				 :	this function returns the details of the product sub category in array format.
	arguments description	 :	psubname - product sub category name.
	return type 		  	 :	array
	--->
	<cffunction name = "inventorysubcategorydata" output = "true" returntype = "array" access = "remote" >
		<cfargument name = "psubname" type = "string" required = "true" default = "">
		<cfset LOCAL.inventorysubcategorydata = modelComponentObject.inventorysubcategorydata (psubname = "#ARGUMENTS.psubname#")>
		<cfset LOCAL.productSubCategoryDetailsArray = ArrayNew(1)>
		<cfloop query = "LOCAL.inventorysubcategorydata">
			<cfset ArrayAppend( LOCAL.productSubCategoryDetailsArray ,ProductSubCategoryName)>
			<cfset ArrayAppend( LOCAL.productSubCategoryDetailsArray ,ProductSubCategoryQty)>
			<cfset ArrayAppend( LOCAL.productSubCategoryDetailsArray ,ProductSubCategoryPrice)>
			<cfset ArrayAppend( LOCAL.productSubCategoryDetailsArray ,ProductDescription)>
			<cfset ArrayAppend( LOCAL.productSubCategoryDetailsArray ,ProductDiscount)>
		</cfloop>
		<cfreturn LOCAL.productSubCategoryDetailsArray >
	</cffunction>
	
	
	<!--- 
	function name			 :	updatedata
	description				 :	this function calls the updatedata function in model.
	arguments description	 :	psubnameselect - product sub category name
								psubname - product sub category name
								qty - product sub category quantity.
								pprice - product sub category price
								pimg - product sub category image
								pdisc - product sub category discount
								desc - product sub category description.
	return type 		  	 :	void
	--->
	<cffunction name ="updatedata" returnType ="void">
		<cfargument name = "psubnameselect" type = "string" required = "true" >
		<cfargument name = "psubname" type = "string" required = "true" >
		<cfargument name = "qty" type = "numeric" required = "true" >
		<cfargument name = "pprice" type = "numeric" required = "true" >
		<cfargument name = "pimg" type = "any" required = "true" >
		<cfargument name = "pdisc" type ="numeric" required = "true" >
		<cfargument name = "desc" type = "string" required = "true" >
		<cfset LOCAL.adddata = modelComponentObject.updatedata(psubnameselect = "#ARGUMENTS.psubnameselect#",
													psubname = "#ARGUMENTS.psubname#",
													qty = "#ARGUMENTS.qty#",
													pprice = #ARGUMENTS.pprice#,
													pimg = "#ARGUMENTS.pimg#",
													pdisc = "#ARGUMENTS.pdisc#",
													desc = "#ARGUMENTS.desc#")>
	</cffunction>
	
	
	<!--- 
	function name			 :	updatedatawithoutimg
	description				 :	this function calls the updatedatawithoutimg function in model.
	arguments description	 :	psubnameselect - product sub category name
								psubname - product sub category name
								qty - product sub category quantity.
								pprice - product sub category price
								pdisc - product sub category discount
								desc - product sub category description.
	return type 		  	 :	void
	--->
	<cffunction name = "updatedatawithoutimg" returnType = "void">
		<cfargument name = "psubnameselect" type = "string" required = "true" >
		<cfargument name = "psubname" type = "string" required = "true" >
		<cfargument name = "qty" type = "numeric" required = "true" >
		<cfargument name = "pprice" type = "numeric" required = "true" >
		<cfargument name = "pdisc" type = "numeric" required = "true" >
		<cfargument name = "desc" type = "string" required = "true" >
		<cfset LOCAL.updatedata = modelComponentObject.updatedatawithoutimg(psubnameselect = "#ARGUMENTS.psubnameselect#",
													psubname = "#ARGUMENTS.psubname#",
													qty = "#ARGUMENTS.qty#",
													pprice = #ARGUMENTS.pprice#,													
													pdisc = "#ARGUMENTS.pdisc#",
													desc = "#ARGUMENTS.desc#")>
	</cffunction>
	
</cfcomponent>