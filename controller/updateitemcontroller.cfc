<component>
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	
	<cffunction name="updatedata" returnType="void">
		<cfargument name="psubnameselect" type="string" required="true" >
		<cfargument name="psubname" type="string" required="true" >
		<cfargument name="qty" type="numeric" required="true" >
		<cfargument name="pprice" type="numeric" required="true" >
		<cfargument name="pimg" type="any" required="true" >
		<cfargument name="pdisc" type="numeric" required="true" >
		<cfargument name="desc" type="string" required="true" >
		<cfset adddata = modelComponentObject.updatedata(psubnameselect = "#ARGUMENTS.psubnameselect#",
													psubname = "#ARGUMENTS.psubname#",
													qty = "#ARGUMENTS.qty#",
													pprice = #ARGUMENTS.pprice#,
													pimg = "#ARGUMENTS.pimg#",
													pdisc = "#ARGUMENTS.pdisc#",
													desc = "#ARGUMENTS.desc#")>
	</cffunction>
	
	
	<cffunction name="updatedatawithoutimg" returnType="void">
		<cfargument name="psubnameselect" type="string" required="true" >
		<cfargument name="psubname" type="string" required="true" >
		<cfargument name="qty" type="numeric" required="true" >
		<cfargument name="pprice" type="numeric" required="true" >
		<cfargument name="pdisc" type="numeric" required="true" >
		<cfargument name="desc" type="string" required="true" >
		<cfset updatedata = modelComponentObject.updatedatawithoutimg(psubnameselect = "#ARGUMENTS.psubnameselect#",
													psubname = "#ARGUMENTS.psubname#",
													qty = "#ARGUMENTS.qty#",
													pprice = #ARGUMENTS.pprice#,													
													pdisc = "#ARGUMENTS.pdisc#",
													desc = "#ARGUMENTS.desc#")>
	</cffunction>
	
</component>