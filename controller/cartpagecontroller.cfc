<!--- 
filename 		: cartpagecontroller.cfc
function 		: This file controls the cartpage.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->


<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for cart page">
<cfset modelComponentObject = CreateObject("component","model.components") />



	<!--- 
	function name			 :	getcartdataid
	description				 :	this function calls getcartdataid function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getcartdataid" returnType = "query">
		<cfreturn modelComponentObject.getcartdataid()>
	</cffunction>


	
	<!--- 
	function name			 :	getcartdata
	description				 :	this function calls getcartdata function in model.
	arguments description	 :	id - product sub category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getcartdata" returnType = "query">
	<cfargument name = "id" type = "numeric">
		<cfreturn modelComponentObject.getcartdata(id = "#ARGUMENTS.id#")>
	</cffunction>


	<!--- 
	function name			 :	getcartitemstotalamount
	description				 :	this function calls getcartitemstotalamount function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name = "getcartitemstotalamount" returnType = "numeric">
		<cfreturn modelComponentObject.getcartitemstotalamount()>
	</cffunction>


</cfcomponent>