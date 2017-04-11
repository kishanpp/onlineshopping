<!--- 
filename 		: finalcontroller.cfc
function 		: This file controls the final.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->



<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for final page">
	<cfset modelComponentObject = CreateObject("component","model.components") />



	<!--- 
	function name			 :	buyallfromcart
	description				 :	this function calls buyallfromcart function in model.
	arguments description	 :	date - current date / order date.
	return type 		  	 :	numeric
	--->
	<cffunction name = "buyallfromcart" returnType = "numeric">
		<cfargument name = "date" type = "date" required = "true" >
		<cfreturn modelComponentObject.buyallfromcart("#ARGUMENTS.date#")>
	</cffunction>


	<!--- 
	function name			 :	addorder
	description				 :	this function calls addorder function in model.
	arguments description	 :	id - product sub category id
								date - current date / order date.
	return type 		  	 :	void
	--->
	<cffunction name = "addorder" returnType = "void">
		<cfargument name = "id" type = "numeric" required = "true" >
		<cfargument name = "date" type = "date" required = "true" >
		<cfset LOCAL.addorder = modelComponentObject.addorder(id = ARGUMENTS.id,date = "#ARGUMENTS.date#")>
	</cffunction>


	<!--- 
	function name			 :	gettotalamount
	description				 :	this function calls gettotalamount function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "gettotalamount" returnType = "query">
		<cfreturn modelComponentObject.gettotalamount()>
	</cffunction>


	<!--- 
	function name			 :	getitems
	description				 :	this function calls getitems function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getitems" returnType = "query">
		<cfreturn modelComponentObject.getitems()>
	</cffunction>


	<!--- 
	function name			 :	getaddress
	description				 :	this function calls getaddress function in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getaddress" returnType = "query">
		<cfreturn modelComponentObject.getaddress()>
	</cffunction>


	<!--- 
	function name			 :	paymentdetails
	description				 :	this function calls the paymentdetails function in model .
	arguments description	 :	ccnumber - credit card number of the buyer
								holdername - name of the buyer
								expdate - expiry date of the credit card
								cvvnumber - the CVV number of the credit card.
	return type 		  	 :	void
	--->
	<cffunction name = "paymentdetails" output = "true" returntype = "void" access = "public">
		<cfargument name = "ccnumber" type = "string" required = "true">
		<cfargument name = "holdername" type = "string" required = "true">
		<cfargument name = "expdate" type = "date" required ="true">
		<cfargument name = "cvvnumber" type = "numeric" required = "true">
		<cfset LOCAL.paymentdetails = modelComponentObject.paymentdetails(ccnumber = "#ARGUMENTS.ccnumber#",
																			holdername = "#ARGUMENTS.holdername#",
																			expdate = "#ARGUMENTS.expdate#",
																			cvvnumber = "#ARGUMENTS.cvvnumber#")>
	</cffunction>

</cfcomponent>