<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for deleteitem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	<!--- 
	function name			 :	deletedata
	description				 :	this function calls the deletedata function in model.
	arguments description	 :	psubcat - product sub category name.
	return type 		  	 :	query
	--->
	<cffunction name="deletedata" returnType="void">
		<cfargument name="psubcat" type="string" required="true" >
		<cfset deletedata = modelComponentObject.deletedata(psubcat = "#ARGUMENTS.psubcat#")>
	</cffunction>
	
	
</cfcomponent>