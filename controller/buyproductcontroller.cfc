<component>
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />




	<cffunction name="updateorder" returnType="void">
		<cfargument name="id" type="numeric">
		<cfargument name="orderid" type="numeric">
		<cfset modelComponentObject.updateorder("#ARGUMENTS.id#","#ARGUMENTS.orderid#")>
	</cffunction>


	<cffunction name="checkaddress" returnType="query">
		<cfreturn modelComponentObject.checkaddress()>
	</cffunction>
	
	
	
</component>