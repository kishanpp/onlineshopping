<component>
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	<cffunction name="addressstore" returnType="void">
		<cfargument name="name" type="string">
		<cfargument name="address" type="string">
		<cfargument name="city" type="string">
		<cfargument name="state" type="string">
		<cfargument name="zip" type="numeric">
		<cfset storeaddress = modelComponentObject.addressstore(name = "#ARGUMENTS.name#",address = "#ARGUMENTS.address#",city = "#ARGUMENTS.city#",state = "#ARGUMENTS.state#",zip = #ARGUMENTS.zip#)>
	</cffunction>
	
	
	<cffunction name="updateaddress" returnType="void">
		<cfargument name="name" type="string">
		<cfargument name="address" type="string">
		<cfargument name="city" type="string">
		<cfargument name="state" type="string">
		<cfargument name="zip" type="numeric">
		<cfset updateaddress = modelComponentObject.updateaddress(name = "#ARGUMENTS.name#",address = "#ARGUMENTS.address#",city = "#ARGUMENTS.city#",state = "#ARGUMENTS.state#",zip = #ARGUMENTS.zip#)>
	</cffunction>
	
</component>