<!--- 
filename 		: additem.cfm
function 		: This file adds new products on the product category by the admin login.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<cfinclude template="admin.cfm">
<link href="../assets/css/additem.css" rel="stylesheet">

<cfif session.userPhoneNumber NEQ "">

<cfset controllerObject = CreateObject("component","controller.additemcontroller") />
<cfif structKeyExists(form,"additem")>
<script>alert("Added successfully to Database");</script>
	 <cfset insertdata = controllerObject.adddata(pcat="#form.ptype#",
													pname="#form.pname#",
													qty="#form.pqty#",
													pprice="#form.pprice#",
													pimg="#form.pimg#",
													pdisc="#form.pdisc#",
													desc="#form.pdesc#")>  
</cfif>

<div class="additem">
	<h3>ENTER PRODUCT DESCRIPTIONS</h3>
	
	
	<cfform action="##" enctype="multipart/form-data">
	
	<div class="pcategory">
		<h6> &nbspSelect Product category here</h6>
		<cfselect id="ptype" name="ptype">
			<option value="" selected disabled>Select Product category</option>
		</cfselect>
		<span id="ptypereq" >*Select Product Category </span>
	</div>	
	
	<div class="inputdata">
		<label for="pname">Product Name</label>
	</div>
			<cfinput type="text" name="pname" id="pname" placeholder="Enter Product Name">
		
		<div class="inputdata">
			<label for="pqty">Product Quantity</label>
		</div>
			<cfinput type="text" name="pqty" id="pqty" placeholder="Enter Product Quantity">
		
		<div class="inputdata">
			<label for="pprice">Product Price</label>
		</div>
			<cfinput type="text" name="pprice" id="pprice" placeholder="Enter Product Price">
		
		<div class="inputdata">
			<label for="pimg">Product Image</label>
		</div>
			<cfinput type="file" name="pimg" id="pimg" placeholder="Enter Image Path">
		
		<div class="inputdata">
			<label for="pdisc">Product Discount</label>
		</div>
		<cfinput type="text" name="pdisc" id="pdisc" maxlength="2" placeholder="Enter Product Discount" >
		
		
		<div class="inputdata">
			<label for="pdesc">Product Description</label>
		</div>
			<cftextarea name="pdesc" id="desc" placeholder="Enter Product Description" />
			
		
		
		<div class="submit">
			<cfinput type="submit" name="additem" id="additem" value="Add To Database">
		</div>
	</cfform>
	
</div>

<cfelse>
<cflocation url="/index.cfm">
</cfif>

<script src="../assets/js/additem.js"></script>