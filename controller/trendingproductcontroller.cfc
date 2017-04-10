<cfcomponent displayname = "OnlineShopping" hint = "Handles the Database connectivity for trendingproducts page">
<cfset modelComponentObject = CreateObject("component","model.components") />


	<!--- 
	function name			 :	retrieve_data1
	description				 :	this function calls retrieve_data1 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data1" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data1()>
	</cffunction>


	<!--- 
	function name			 :	retrieve_data2
	description				 :	this function calls retrieve_data2 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data2" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data2()>
	</cffunction>

	
	<!--- 
	function name			 :	retrieve_data3
	description				 :	this function calls retrieve_data3 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data3" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data3()>
	</cffunction>

	
	<!--- 
	function name			 :	retrieve_data4
	description				 :	this function calls retrieve_data4 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data4" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data4()>
	</cffunction>

	
	<!--- 
	function name			 :	retrieve_data5
	description				 :	this function calls retrieve_data5 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data5" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data5()>
	</cffunction>

	
	<!--- 
	function name			 :	retrieve_data6
	description				 :	this function calls retrieve_data6 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data6" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data6()>
	</cffunction>

	
	<!--- 
	function name			 :	retrieve_data7
	description				 :	this function calls retrieve_data7 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data7" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data7()>
	</cffunction>


	
	<!--- 
	function name			 :	retrieve_data8
	description				 :	this function calls retrieve_data8 function in model.
	arguments description	 :	no arguments
	return type 		  	 :	query
	---> 
	<cffunction name = "retrieve_data8" returntype = "query">
		<cfreturn modelComponentObject.retrieve_data8()>
	</cffunction>
	
	
</cfcomponent>