<component>
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />



<cffunction name="getcartdataid" returntype="query">
	<cfreturn modelComponentObject.getcartdataid()>
</cffunction>


<cffunction name="getcartdata" returntype="query">
<cfargument name="id" type="numeric">
	<cfreturn modelComponentObject.getcartdata(id = "#ARGUMENTS.id#")>
</cffunction>


<cffunction name="getcartitemstotalamount" returntype="numeric">
	<cfreturn modelComponentObject.getcartitemstotalamount()>
</cffunction>


</component>