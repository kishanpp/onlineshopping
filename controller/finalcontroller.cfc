<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for final page">
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />


<!--- 
function name			 :	buyallfromcart
description				 :	this function calls buyallfromcart function in model.
arguments description	 :	date - current date / order date.
return type 		  	 :	numeric
--->
<cffunction name="buyallfromcart" returnType="numeric">
	<cfargument name="date" type="date" required="true" >
	<cfreturn modelComponentObject.buyallfromcart("#ARGUMENTS.date#")>
</cffunction>


<!--- 
function name			 :	addorder
description				 :	this function calls addorder function in model.
arguments description	 :	id - product sub category id
							date - current date / order date.
return type 		  	 :	void
--->
<cffunction name="addorder" returnType="void">
	<cfargument name="id" type="numeric" required="true" >
	<cfargument name="date" type="date" required="true" >
	<cfset addorder = modelComponentObject.addorder(id = ARGUMENTS.id,date = "#ARGUMENTS.date#")>
</cffunction>


<!--- 
function name			 :	gettotalamount
description				 :	this function calls gettotalamount function in model.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="gettotalamount" returnType="query">
	<cfreturn modelComponentObject.gettotalamount()>
</cffunction>


<!--- 
function name			 :	getitems
description				 :	this function calls getitems function in model.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getitems" returnType="query">
	<cfreturn modelComponentObject.getitems()>
</cffunction>


<!--- 
function name			 :	getaddress
description				 :	this function calls getaddress function in model.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getaddress" returnType="query">
	<cfreturn modelComponentObject.getaddress()>
</cffunction>


</cfcomponent>