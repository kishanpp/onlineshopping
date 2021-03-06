<!--- 
filename 		: additem.cfm
function 		: This file adds new products on the product category by the admin login.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM
--->

<html lang = "en-US">
<head>
	<link href = "../assets/css/additem.css" rel="stylesheet">
</head>
<body>
	<cfinclude template = "admin.cfm">
	<cfif SESSION.userPhoneNumber NEQ "">
		<cfset controllerObject = CreateObject("component","controller.additemcontroller") />
		<cfif structKeyExists(form,"additem")>
			<cfset VARIABLES.insertdata = controllerObject.adddata(pcat = "#form.ptype#",
														pname = "#form.pname#",
														qty = "#form.pqty#",
														pprice = "#form.pprice#",
														pimg = "#form.pimg#",
														pdisc = "#form.pdisc#",
														desc = "#form.pdesc#")>  
			<cfoutput>
				<cfif #VARIABLES.insertdata# EQ TRUE >
					<span class = "updatesuccesfully">Product Already Exists</span>
				<cfelse>
					<span class = "updatesuccesfully">Succesfully Added</span>
				</cfif>
			</cfoutput>
		</cfif>

		<div class = "additem">
			<h3>ENTER PRODUCT DESCRIPTIONS</h3>
			<cfform action = "##" enctype = "multipart/form-data">
				<div class = "pcategory">
					<h6> &nbspSelect Product category here</h6>
					<cfselect id = "ptype" name = "ptype">
						<option value = "" selected disabled>Select Product category</option>
					</cfselect>
					<span id = "ptypereq" >*Select Product Category </span>
				</div>	
				<div class = "inputdata">
					<label for = "pname">Product Name</label>
				</div>
				<cfinput type = "text" name = "pname" id = "pname" placeholder = "Enter Product Name">
				<div class = "inputdata">
					<label for = "pqty">Product Quantity</label>
				</div>
				<cfinput type = "text" name = "pqty" id = "pqty" maxlength = "3" placeholder = "Enter Product Quantity">
				<div class = "inputdata">
					<label for = "pprice">Product Price</label>
				</div>
				<cfinput type = "text" name = "pprice" id = "pprice" maxlength = "5" placeholder = "Enter Product Price">
				<div class = "inputdata">
					<label for = "pimg">Product Image</label>
				</div>
				<cfinput type = "file" name = "pimg" id = "pimg" placeholder = "Enter Image Path">
				<div class = "inputdata">
					<label for = "pdisc">Product Discount</label>
				</div>
				<cfinput type =  "text" name = "pdisc" id = "pdisc" maxlength = "2" placeholder = "Enter Product Discount" >
				<div class = "inputdata">
					<label for = "pdesc">Product Description</label>
				</div>
				<cftextarea name = "pdesc" id = "desc" rows = "5" placeholder = "Enter Product Description" />
				<div class = "submit">
					<button type = "submit" name = "additem" id = "additem" class = "btn btn-primary">
						<span class = "glyphicon glyphicon-plus"></span> Add
					</button>
				</div>
			</cfform>
		</div>
	<cfelse>
		<cflocation url = "/index.cfm" addtoken = "false">
	</cfif>
	<script src = "../assets/js/additem.js"></script>
</body>
</html>