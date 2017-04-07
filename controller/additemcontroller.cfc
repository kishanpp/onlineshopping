<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for additem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	<!--- 
	function name			 :	adddata
	description				 :	this function calls getdatabyid function in model.
	arguments description	 :	id - product sub category id
								orderid - orderid of current transaction.
	return type 		  	 :	void
	--->	
	<cffunction name="adddata" returnType="void">
		<cfargument name="pcat" type="string" required="true" >
		<cfargument name="pname" type="string" required="true" >
		<cfargument name="qty" type="numeric" required="true" >
		<cfargument name="pprice" type="numeric" required="true" >
		<cfargument name="pimg" type="any" required="true" >
		<cfargument name="pdisc" type="numeric" required="true" >
		<cfargument name="desc" type="string" required="true" >
		<cfset adddata = modelComponentObject.adddata("#ARGUMENTS.pcat#",
														"#ARGUMENTS.pname#",
														#ARGUMENTS.qty#,
														ARGUMENTS.pprice,
														"#ARGUMENTS.pimg#",
														#ARGUMENTS.pdisc#,
														"#ARGUMENTS.desc#")>
	</cffunction>
	
	
</cfcomponent>