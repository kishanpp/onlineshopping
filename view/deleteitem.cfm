<!--- 
filename 		: deleteitem.cfm
function 		: This file display list of products and its sub categories to be deleted by the admin.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->

<html lang = "en-US">
<head>
	<link href = "../assets/css/deleteitem.css" rel = "stylesheet">
</head>
<body>
	<cfinclude template = "admin.cfm">
	<cfif SESSION.userPhoneNumber NEQ "">
		<cfset controllerObject = CreateObject("component","controller.deleteitemcontroller") />
		<cfif structKeyExists(form,"deleteitem")>
			<cfset VARIABLES.deleteProduct = controllerObject.deletedata(psubcat="#form.psubtype#")>  
			<span class = "updatesuccesfully">Succesfully Deleted</span>
		</cfif>
		<div class = "deleteitem">
			<h3>SELECT PRODUCT TO DELETE</h3>
			<cfform action="##">	
				<div class = "pcategory">
					<h5 style = "margin:0px 50px -5px -48px ;">Select Product category here</h5>
					<cfselect id = "ptype" name = "ptype">
						<option value = "" selected disabled>Select Product category</option>
					</cfselect>
					<span id = "ptypereq" >*Select Product Category </span>
				</div>
				<div class = "psubcategory">
					<h5 style = "margin:-15px 0px 15px 50px ;" >Select Product sub category here</h5>
					<cfselect id = "psubtype" name = "psubtype">
						<option value = "" selected disabled>Select Product Sub Category</option>
					</cfselect>
					<span id = "psubtypereq" >*Select Product Sub Category </span>
				</div>			
				<div class = "submit">
					<button type = "submit" name = "deleteitem" id = "deleteitem" class = "btn btn-danger">
						<span class = "glyphicon glyphicon-trash"></span> Delete
					</button>
				</div>
			</cfform>
		</div>
	<cfelse>
		<cflocation url = "/index.cfm" addtoken = "false">
	</cfif>
	<script src = "../assets/js/deleteitem.js"></script>
</body>
</html>