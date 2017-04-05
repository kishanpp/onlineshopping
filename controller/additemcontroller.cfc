<component>
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	
	<cffunction name="adddata" returnType="void">
		<cfargument name="pcat" type="string" required="true" >
		<cfargument name="pname" type="string" required="true" >
		<cfargument name="qty" type="numeric" required="true" >
		<cfargument name="pprice" type="numeric" required="true" >
		<cfargument name="pimg" type="any" required="true" >
		<cfargument name="pdisc" type="numeric" required="true" >
		<cfargument name="desc" type="string" required="true" >
		<cfset adddata = modelComponentObject.adddata("#ARGUMENTS.pcat#","#ARGUMENTS.pname#",#ARGUMENTS.qty#,ARGUMENTS.pprice,"#ARGUMENTS.pimg#",#ARGUMENTS.pdisc#,"#ARGUMENTS.desc#")>
	</cffunction>
	
	
</component>