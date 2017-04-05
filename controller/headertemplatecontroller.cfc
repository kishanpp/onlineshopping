<component>
<cfset modelComponentObject = CreateObject("component","model.components") />
<cfset loginObject = CreateObject("component","model.login") />


<cffunction name="loginUser" returnType="boolean">
<cfargument name="phonenumber" type="string">
<cfargument name="password" type="string">

	<cfset LOCAL.logged = loginObject.login(phone="#phonenumber#",password="#password#")>
		<cfif LOCAL.logged EQ false>
			
		<cfelse>
			
			<cfif #SESSION.admin# EQ TRUE>
				<cflocation url="https://www.shoponline.com/view/admin.cfm">
			</cfif>
		</cfif>
	<cfreturn LOCAL.logged>
</cffunction>



<cffunction name="registerUser" returntype="void">
<cfparam name="username" type="string">
<cfparam name="password" type="string">
<cfparam name="phone" type="string">
	<cfset logged = loginObject.register("#arguments.username#","#arguments.password#","#arguments.phonenumber#")>
	<cfif logged EQ false>
		<script>alert("Phonenumber already taken..");</script>
	</cfif>
</cffunction>

<cffunction name="logoutUser" returntype="void">
	<cfset logged = loginObject.logout()>	
</cffunction>



<cffunction name="getno" returntype="numeric">
	<cfreturn modelComponentObject.getno()>
</cffunction>


<cffunction name="getinventorycategory" returntype="query">
	<cfset getcategory = modelComponentObject.getinventorycategory()>
	<cfreturn getcategory>
</cffunction>


<cffunction name="getinventorysubcategory" returntype="query">
	<cfargument name="arg" type="numeric" required="true" >
	<cfset getcategory = modelComponentObject.getinventorysubcategory(arguments.arg)>
	<cfreturn getcategory>
</cffunction>











</component>