<component>
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	
	<cffunction name="deletedata" returnType="void">
		<cfargument name="psubcat" type="string" required="true" >
		<cfset deletedata = modelComponentObject.deletedata(psubcat = "#ARGUMENTS.psubcat#")>
		
	</cffunction>
	
	
</component>