<link href="css/deleteitem.css" rel="stylesheet">

<cfif session.userPhoneNumber NEQ "">

<cfinclude template="admin.cfm">


<cfif structKeyExists(form,"deleteitem")>
	<cfset insertdata = createObject("component","cffiles.components").deletedata(psubcat="#form.psubtype#")>  
</cfif>

<div class="deleteitem">
	<h3>SELECT PRODUCT TO DELETE</h3>
	
	<cfform action="##">
	
	<div class="pcategory">
		<cfselect id="ptype" name="ptype">
			<option value="" selected disabled>Select Product category</option>
		</cfselect>
		<span id="ptypereq" >*Select Product Category </span>
	</div>
	<div class = "psubcategory">
		
		<cfselect id="psubtype" name="psubtype">
			<option value="" selected disabled>Select Product Sub Category</option>
		</cfselect>
		<span id="psubtypereq" >*Select Product Sub Category </span>
	</div>
	
	
		
		<div class="submit">
			<cfinput type="submit" name="deleteitem" id="deleteitem" value="Delete From Database">
			
		</div>
	</cfform>
	
</div>

<cfelse>
<cflocation url="/index.cfm">
</cfif>

<script src="/js/deleteitem.js"></script>