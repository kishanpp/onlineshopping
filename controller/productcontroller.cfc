<component>
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />


<cffunction name="getdatabyid" returnType="query">
	<cfargument name="getproductdetails" type="string">
	<cfreturn modelComponentObject.getdatabyid(getproductdetails="#id#")>
</cffunction>


<cffunction name="getproductqty" returnType="boolean">
	<cfargument name="id" type="numeric">
	<cfreturn modelComponentObject.getproductqty(id="#id#")>
</cffunction>



<cffunction name="getproducts" returnType="query">
	<cfargument name="id" type="numeric">
	<cfreturn modelComponentObject.getproduct(id="#id#")>
</cffunction>


</component>