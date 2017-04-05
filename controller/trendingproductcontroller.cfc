<component>
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />

	<cffunction name="retrieve_data1" returntype="query">
		<cfreturn modelComponentObject.retrieve_data1()>
	</cffunction>


	<cffunction name="retrieve_data2" returntype="query">
		<cfreturn modelComponentObject.retrieve_data2()>
	</cffunction>

	<cffunction name="retrieve_data3" returntype="query">
		<cfreturn modelComponentObject.retrieve_data3()>
	</cffunction>

	<cffunction name="retrieve_data4" returntype="query">
		<cfreturn modelComponentObject.retrieve_data4()>
	</cffunction>

	<cffunction name="retrieve_data5" returntype="query">
		<cfreturn modelComponentObject.retrieve_data5()>
	</cffunction>

	<cffunction name="retrieve_data6" returntype="query">
		<cfreturn modelComponentObject.retrieve_data6()>
	</cffunction>

	<cffunction name="retrieve_data7" returntype="query">
		<cfreturn modelComponentObject.retrieve_data7()>
	</cffunction>


	<cffunction name="retrieve_data8" returntype="query">
		<cfreturn modelComponentObject.retrieve_data8()>
	</cffunction>
	
	
</component>