<cfcomponent>


<!--- login code--->
<cffunction name="login" returnType="boolean" output="false" access="public">
	<cfargument name="phone" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfquery name="loginquery" datasource="OnlineShopping"> 
	<cfset arguments.password = HASH(#arguments.password#)>
	select UserId,phoneNumber , Password from UserAccount where phoneNumber LIKE <cfqueryparam value='#phone#' cfsqltype="cf_sql_varchar"> 
	AND
	Password LIKE <cfqueryparam value='#arguments.password#' cfsqltype="cf_sql_varchar"> 
	</cfquery>
	<cfif loginquery.recordCount EQ 1>
		<cfif loginquery.phoneNumber EQ "0000000000">
			<cfset SESSION.admin = TRUE />
		</cfif>
		<cfset session.userPhoneNumber=#arguments.phone#>
		<cfif listFindNoCase(application.currentUsers, #arguments.phone#)> 
			<cflocation url = "view/users.cfm">
		<cfelse>
			<cfset application.currentUsers=listAppend(application.currentUsers, #arguments.phone#)>
		</cfif>
		<cfset logged=true/>
		<cfset session.isLogged = true/>
		<cfset session.userName = loginquery.UserId />
	<cfelse>
		<cfset logged=false>
	</cfif>
	<cfreturn logged>
</cffunction>




<!--- Register code--->
<cffunction name="register" returnType="boolean" output="false" access="public">
	<cfargument name="username" type="string" required="true">
	<cfargument name="password" type="string" required="true">
	<cfargument name="phone" type="string" required="true">

	<cfquery name="loginquery" > 
		select * from UserAccount where phoneNumber LIKE <cfqueryparam value='#phone#' cfsqltype="cf_sql_varchar"> 
	</cfquery>
	<cfif loginquery.recordCount EQ 0>
	<cfset application.currentUsers=listAppend(application.currentUsers, #arguments.phone#)>
		<cfset arguments.password = HASH(#arguments.password#)>
		<cfquery > 
			INSERT INTO dbo.UserAccount (UserId,Password,phoneNumber) VALUES ('#arguments.username#','#arguments.password#','#arguments.phone#')
		</cfquery>
		<cfset logged = true />
		<cfset session.isLogged = true/>
		<cfset session.userPhoneNumber=#arguments.phone#>
		<cfset session.userName = #arguments.username# />
	<cfelse>
		<cfset logged = false />
	</cfif>
	<cfreturn logged>
</cffunction>


<!--- logout code--->
<cffunction name="logout" returnType="void" output="false" access="public">
<cfset session.isLogged = false />

<cfset session.userName = "" />
<cfset application.currentUsers = listDeleteAt(application.currentUsers,listFind(application.currentUsers, session.userPhoneNumber) )>
<cfset session.userPhoneNumber="" />
<cflocation url="https://www.shoponline.com">
</cffunction>


</cfcomponent>