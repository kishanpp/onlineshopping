<!--- 
filename 		: Application.cfc
function 		: This file is the application file of coldfusion.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->

<cfcomponent displayname = "ShopOnlineApplication" hint = "handle the Application file">
	<cfset 	this.datasource = "OnlineShopping">
	<cfset 	this.name = "shoponlineapplication" />
	<cfset	this.clientmanagement = true />
	<cfset	this.sessionmanagement = true /> 
	<cfset	this.setclientcookies = true />
	<cfset	this.sessiontimeout = "#createTimeSpan(0,0,5,10)#" />
	<cfset	this.applicationtimeout = "#createTimeSpan(0,0,10,10)#" />

	
	<!--- 
	function name			 :	onApplicationStart
	description				 :	this function executes on start of the application.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name = "onApplicationStart" returnType = "void" hint="Executes when the application is first created.">
		<cfset Application.currentUsers = "" />
	</cffunction>
	 
	 
	<!--- 
	function name			 :	onSessionStart
	description				 :	this function executes on start of a session.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name = "onSessionStart" returnType = "void" hint = "Executes when session is started">
		<cfset SESSION.isLogged = false />
		<cfset SESSION.CurrentTransaction = false />
		<cfset SESSION.userPhoneNumber = "" >	
		<cfset SESSION.admin = FALSE />
	 </cffunction>
	 
	 
	<!--- 
	function name			 :	onMissingTemplate
	description				 :	this function executes on access of invalid template.
	arguments description	 :	no arguments.
	return type 		  	 :	void
	--->
	<cffunction name = "onMissingTemplate" access = "public" returntype = "void" hint = "Executes when unavailable template is accessed.">
		<cflocation url = "../view/missingtemplate.cfm" addtoken = "false">
	</cffunction>

	
	<!--- 
	function name			 :	onError
	description				 :	this function executes on some unexpected error and handles only database error.
	arguments description	 :	Exception - exception type
								EventName - name of the event.
	return type 		  	 :	void
	--->
	<cffunction name = "onError" returnType = "void" hint = "Executes when there is some database error">
		<cfargument name = "Exception" required = true/>
		<cfargument name = "eventName" type = "String" required = true/>
		<cfif ARGUMENTS.Exception IS "database">
		  <cfinclude template = "../view/databaseErrorTemplate.cfm">
		</cfif>
		<cflog file = "onlineShoppingErrorLog" type = "error" text = "Event Name: #ARGUMENTS.eventName# ||	Message: #ARGUMENTS.Exception.message# || MessageDetails: #ARGUMENTS.Exception.detail# || Template: #arguments.exception.tagContext[1].template# || Line: #arguments.exception.tagContext[1].line# || Raw Trace: #arguments.exception.tagContext[1].raw_trace# ">
	</cffunction>
	
	<!--- 
	function name			 :	onSessionEnd
	description				 :	this function executes on end of a session and removes the currently logged user from the application array variable.
	arguments description	 :	SessionScope - provides scope of session variables
								ApplicationScope - provides scope of application variable.
	return type 		  	 :	void
	--->
	<cffunction name = "onSessionEnd"  returnType = "void" hint = "Executes when session is timeout">
		<cfargument name = "SessionScope" required = "true" >
		<cfargument name = "ApplicationScope" required = "true">
		<cfset ApplicationScope.currentUsers = listDeleteAt(ApplicationScope.currentUsers,listFind(ApplicationScope.currentUsers,#SessionScope.userPhoneNumber#) )>
		<cflocation url = "https://www.shoponline.com" addtoken = "false">
	</cffunction>

</cfcomponent>