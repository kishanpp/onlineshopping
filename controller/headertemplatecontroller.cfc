<!--- 
filename 		: headertemplatecontroller.cfc
function 		: This file controls the headertemplate.cfm page database request from model.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->



<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity of login/register of user and searching of products">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	<!--- 
	function name			 :	loginUser
	description				 :	this function validates the user while log-in process.
	arguments description	 :	phonenumber - user phone number
								password - user password
	return type 		  	 :	boolean
	--->
	<cffunction name = "loginUser" returnType = "boolean">
	<cfargument name = "phonenumber" type = "string" required = "true">
	<cfargument name = "password" type = "string" required = "true">

		<cfset LOCAL.login = loginObject.login(phone = "#ARGUMENTS.phonenumber#",password = "#ARGUMENTS.password#")>
		<cfif LOCAL.login.recordCount EQ 1>
			<cfif LOCAL.login.phoneNumber EQ "0000000000">
				<cfset SESSION.admin = TRUE />
			</cfif>
			<cfset SESSION.userPhoneNumber = #ARGUMENTS.phonenumber#>
			<cfif listFindNoCase(APPLICATION.currentUsers, #ARGUMENTS.phonenumber#)> 
				<cflocation url = "view/users.cfm">
			<cfelse>
				<cfset APPLICATION.currentUsers=listAppend(APPLICATION.currentUsers, #ARGUMENTS.phonenumber#)>
			</cfif>
			<cfset LOCAL.logged = true/>
			<cfset session.isLogged = true/>
			<cfset session.userName = LOCAL.login.UserId />
		<cfelse>
			<cfset LOCAL.logged = false>
		</cfif>
		
		<cfif LOCAL.logged EQ false>
				
		<cfelse>
				
			<cfif #SESSION.admin# EQ TRUE>
				<cflocation url="https://www.shoponline.com/view/admin.cfm">
			</cfif>
		</cfif>
		<cfreturn LOCAL.logged>
	</cffunction>


	<!--- 
	function name			 :	registerUser
	description				 :	this function calls the register method in model.
	arguments description	 :	username - user id
								phonenumber - user phone number
								password - user password
	return type 		  	 :	boolean
	--->
	<cffunction name = "registerUser" returntype = "boolean">
	<cfargument name = "username" type = "string" required = "true">
	<cfargument name = "password" type = "string" required = "true">
	<cfargument name = "phone" type = "string" required = "true">
		<cfset LOCAL.register = loginObject.register("#ARGUMENTS.username#","#ARGUMENTS.password#","#ARGUMENTS.phone#")>
		<cfreturn LOCAL.register>
	</cffunction>


	<!--- 
	function name			 :	logoutUser
	description				 :	this function calls the log out method in model.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name="logoutUser" returntype="void">
		<cfset LOCAL.logged = loginObject.logout()>	
	</cffunction>


	<!--- 
	function name			 :	getno
	description				 :	this function calls the getno method in model.
	arguments description	 :	no arguments.
	return type 		  	 :	numeric
	--->
	<cffunction name="getno" returntype="numeric">
		<cfset LOCAL.getno = modelComponentObject.getno() >
		<cfif LOCAL.getno.total GTE 0>
			<cfreturn LOCAL.getno.total>
		<cfelse>
			<cfreturn 0>
		</cfif>
	</cffunction>


	<!--- 
	function name			 :	getinventorycategory
	description				 :	this function calls the getinventorycategory method in model.
	arguments description	 :	no arguments.
	return type 		  	 :	query
	--->
	<cffunction name = "getinventorycategory" returntype = "query">
		<cfset LOCAL.getcategory = modelComponentObject.getinventorycategory()>
		<cfreturn LOCAL.getcategory>
	</cffunction>


	<!--- 
	function name			 :	getinventorysubcategory
	description				 :	this function calls the getinventorysubcategory method in model.
	arguments description	 :	arg - product category id.
	return type 		  	 :	query
	--->
	<cffunction name = "getinventorysubcategory" returntype = "query">
		<cfargument name = "arg" type = "numeric" required = "true" >
		<cfset LOCAL.getcategory = modelComponentObject.getinventorysubcategory(ARGUMENTS.arg)>
		<cfreturn LOCAL.getcategory>
	</cffunction>


</cfcomponent>