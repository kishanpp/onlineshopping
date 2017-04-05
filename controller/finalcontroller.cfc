<component>
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />



<cffunction name="buyallfromcart" returnType="numeric">
	<cfargument name="date" type="date" required="true" >
	<cfreturn modelComponentObject.buyallfromcart("#ARGUMENTS.date#")>
</cffunction>


<cffunction name="addorder" returnType="void">
	<cfargument name="id" type="numeric" required="true" >
	<cfargument name="date" type="date" required="true" >
	<cfset addorder = modelComponentObject.addorder(id = ARGUMENTS.id,date = "#ARGUMENTS.date#")>
</cffunction>


<cffunction name="gettotalamount" returnType="query">
	<cfreturn modelComponentObject.gettotalamount()>
</cffunction>

<cffunction name="getitems" returnType="query">
	<cfreturn modelComponentObject.getitems()>
</cffunction>


<cffunction name="getaddress" returnType="query">
	<cfreturn modelComponentObject.getaddress()>
</cffunction>


</component>