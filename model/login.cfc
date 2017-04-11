<!--- 
filename 		: login.cfc
function 		: This file controls the database request related to login and register.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->



<cfcomponent displayname = "OnlineShoppingDatabaseConnectivity" hint = "Handles the Database connectivity for login and registration" >


<!--- login code--->
<!--- 
function name			 :	login
description				 :	this function logs in the user with validation.
arguments description	 :	phone - user phone number
							password - user password
return type 		  	 :	boolean
--->
<cffunction name = "login" returnType = "query" output = "false" access = "public" hint = "checks wheather given phone and password is present in database or not and logs in the user">
	<cfargument name = "phone" type = "string" required = "true">
	<cfargument name = "password" type = "string" required = "true">
	<cfquery name = "loginquery"> 
		<cfset ARGUMENTS.password = HASH(#ARGUMENTS.password#)>
		SELECT UserId,phoneNumber , Password from UserAccount where phoneNumber LIKE <cfqueryparam value='#ARGUMENTS.phone#' cfsqltype="cf_sql_varchar"> 
		AND
		Password LIKE <cfqueryparam value = '#ARGUMENTS.password#' cfsqltype = "cf_sql_varchar"> 
	</cfquery>
	<cfreturn loginquery>
</cffunction>


<!--- Register code--->
<!--- 
function name			 :	register
description				 :	this function registers the user with validation.
arguments description	 :	username - user id
							phone - user phone number
							password - user password
return type 		  	 :	boolean
--->
<cffunction name = "register" returnType = "boolean" output = "false" access = "public" hint = "registers a new user and add the current user in an array">
	<cfargument name = "username" type = "string" required = "true">
	<cfargument name = "password" type = "string" required = "true">
	<cfargument name = "phone" type = "string" required = "true">

	<cfquery name = "loginquery" > 
		SELECT * FROM UserAccount WHERE phoneNumber LIKE <cfqueryparam value = '#ARGUMENTS.phone#' cfsqltype = "cf_sql_varchar"> 
	</cfquery>
	<cfif loginquery.recordCount EQ 0>
	<cfset APPLICATION.currentUsers = listAppend(APPLICATION.currentUsers, #ARGUMENTS.phone#)>
		<cfset ARGUMENTS.password = HASH(#ARGUMENTS.password#)>
		<cfquery > 														
			INSERT INTO dbo.UserAccount (UserId,Password,phoneNumber) VALUES (<cfqueryparam value = '#ARGUMENTS.username#' cfsqltype = "cf_sql_varchar">,
																			<cfqueryparam value = '#ARGUMENTS.password#' cfsqltype = "cf_sql_varchar">,
																			<cfqueryparam value = '#ARGUMENTS.phone#' cfsqltype = "cf_sql_varchar">)
		</cfquery>
		<cfset LOCAL.logged = true />
		<cfset SESSION.isLogged = true/>
		<cfset SESSION.userPhoneNumber = #ARGUMENTS.phone#>
		<cfset SESSION.userName = #ARGUMENTS.username# />
	<cfelse>
		<cfset LOCAL.logged = false />
	</cfif>
	<cfreturn LOCAL.logged>
</cffunction>


<!--- logout code--->
<!--- 
function name			 :	logout
description				 :	this function logs out the user.
arguments description	 :	no arguments.
return type 		  	 :	void
--->
<cffunction name = "logout" returnType = "void" output = "false" access = "public" hint = "clears the session variables and remove current user from array after logout">
	<cfset SESSION.isLogged = false />
	<cfset SESSION.userName = "" />
	<cfset application.currentUsers = listDeleteAt(APPLICATION.currentUsers,listFind(APPLICATION.currentUsers, SESSION.userPhoneNumber) )>
	<cfset SESSION.userPhoneNumber = "" />
	<cflocation url = "https://www.shoponline.com">
</cffunction>


</cfcomponent>