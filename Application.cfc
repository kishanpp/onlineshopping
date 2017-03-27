<cfcomponent>

<cfset 	this.name="shoponlineapplication" />
<cfset	this.clientmanagement=true />
<cfset	this.sessionmanagement=true /> 
<cfset	this.setclientcookies=true />
<cfset	this.sessiontimeout="#createTimeSpan(0,0,5,20)#" />
<cfset	this.applicationtimeout="#createTimeSpan(0,0,10,10)#" />
 

 
 
 <cffunction name="onSessionStart" >
	<cfset SESSION.isLogged = false />
	<cfset SESSION.CurrentTransaction= false />
	<cfset SESSION.userPhoneNumber = "" >	
	<cfset SESSION.admin = FALSE />
 </cffunction>
 
 <cffunction name="onMissingTemplate" access="public" returntype="boolean" output="true">
 <cflocation url="missingtemplate.cfm">
 </cffunction>



</cfcomponent>