<cfcomponent displayname="ShopOnlineApplication" hint="handle the application file">

	<cfset 	this.datasource="OnlineShopping">
	<cfset 	this.name="shoponlineapplication" />
	<cfset	this.clientmanagement=true />
	<cfset	this.sessionmanagement=true /> 
	<cfset	this.setclientcookies=true />
	<cfset	this.sessiontimeout="#createTimeSpan(0,0,5,20)#" />
	<cfset	this.applicationtimeout="#createTimeSpan(0,0,10,10)#" />

	<cffunction name="onApplicationStart" hint="Executes when the application is first created.">
		<cfset Application.currentUsers = "" />
	</cffunction>
	 
	<cffunction name="onSessionStart" >
		<cfset SESSION.isLogged = false />
		<cfset SESSION.CurrentTransaction= false />
		<cfset SESSION.userPhoneNumber = "" >	
		<cfset SESSION.admin = FALSE />
	 </cffunction>
	 
	<cffunction name="onMissingTemplate" access="public" returntype="void" output="true">
		<cflocation url="../view/missingtemplate.cfm">
	</cffunction>

	<cffunction name="onSessionEnd">
		<cfargument name="SessionScope" required="true">
		<cfargument name="ApplicationScope" required="true">
		<cfset Arguments.ApplicationScope.currentUsers = listDeleteAt(Arguments.ApplicationScope.currentUsers,listFind(Arguments.ApplicationScope.currentUsers,#Arguments.SessionScope.userPhoneNumber#) )>
		<cflocation url="https://www.shoponline.com">
	</cffunction>

</cfcomponent>