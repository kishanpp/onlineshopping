<cfcomponent displayname="OnlineShopping" hint="Handles the Database connectivity for updateitem page">
	<cfset modelComponentObject = CreateObject("component","model.components") />
	<cfset loginObject = CreateObject("component","model.login") />

	
	
	<!--- 
	function name			 :	updatedata
	description				 :	this function calls the updatedata function in model.
	arguments description	 :	psubnameselect - product sub category name
								psubname - product sub category name
								qty - product sub category quantity.
								pprice - product sub category price
								pimg - product sub category image
								pdisc - product sub category discount
								desc - product sub category description.
	return type 		  	 :	void
	--->
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
	
	
	<!--- 
	function name			 :	updatedatawithoutimg
	description				 :	this function calls the updatedatawithoutimg function in model.
	arguments description	 :	psubnameselect - product sub category name
								psubname - product sub category name
								qty - product sub category quantity.
								pprice - product sub category price
								pdisc - product sub category discount
								desc - product sub category description.
	return type 		  	 :	void
	--->
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
	
</cfcomponent>