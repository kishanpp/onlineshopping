<!--- 
filename 		: updateitem.cfm
function 		: This file updates the products by the admin login.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<cfinclude template="admin.cfm">

<link href="../assets/css/updateitem.css" rel="stylesheet">

<cfif session.userPhoneNumber NEQ "">


<cfset controllerObject = CreateObject("component","controller.updateitemcontroller") />


<cfif structKeyExists(form,"updateitem")>

	<cfif #form.pimg# neq "">
		<cfset updatedata = controllerObject.updatedata(psubnameselect="#form.psubtype#",
														psubname="#form.pname#",
														qty="#form.pqty#",
														pprice="#form.pprice#",
														pimg="#form.pimg#",
														pdisc="#form.pdisc#",
														desc="#form.pdesc#")>  																	
	<cfelse>
		<cfset updatedata = controllerObject.updatedatawithoutimg(psubnameselect="#form.psubtype#",
																	psubname="#form.pname#",
																	qty="#form.pqty#",
																	pprice="#form.pprice#",
																	pdisc="#form.pdisc#",
																	desc="#form.pdesc#")> 
	</cfif>
	<script>alert("Updated Successfully");</script>
</cfif>

<div class="updateitem">
	<h3>UPDATE PRODUCT DESCRIPTIONS</h3>
	
	<cfform action="##" enctype="multipart/form-data">
	
	<div class="pcategory">
		<h6 style="margin:-8px 13px 10px 16px ;">Select Product category here</h6>
		<cfselect id="ptype" name="ptype">
			<option value="" selected disabled>Select Product category</option>
		</cfselect>
		<div id="ptypereq">
		<span>*Select Product Category </span>
		</div>
	</div>
	<div class="psubcategory">
		<h6 style="margin:-8px 14px 9px 26px ;">Select Product sub category here</h6>
		<cfselect id="psubtype" name="psubtype">
			<option value="" selected disabled>Select Product Sub Category</option>
		</cfselect>
		<div id="psubtypereq">
		<span >*Select Product Sub Category </span>
		</div>
		
	</div>
	
	
	
	
	
	
		<div class="inputdata">
			<label for="pname">Product Name</label>
		</div>
			<cfinput type="text" name="pname" id="pname" placeholder="Enter Product Name">
		
		<div class="inputdata">
			<label for="pqty">Product Quantity</label>
		</div>
			<cfinput type="text"  name="pqty" id="pqty" placeholder="Enter Product Quantity">
		
		<div class="inputdata">
			<label for="pprice">Product Price</label>
		</div>
			<cfinput type="text" name="pprice" id="pprice" placeholder="Enter Product Price">
		
		<div class="inputdata">
			<label for="pimg">Product Image</label>
		</div>
			<cfinput type="file" name="pimg" id="pimg" >
		
		<div class="inputdata">
			<label for="pdisc">Product Discount</label>
		</div>
		<cfinput type="text" name="pdisc" id="pdisc" maxlength="2" placeholder="Enter Product Discount" >		
		
		<div class="inputdata">
			<label for="pdesc">Product Description</label>
		</div>
			<cftextarea name="pdesc" id="desc" placeholder="Enter Product Description" />
		<div class="submit">
			<cfinput type="submit" name="updateitem" id="updateitem" value="Update Database">
		</div>
	</cfform>
	
</div>

<cfelse>
<cflocation url="/index.cfm">
</cfif>


<script src="../assets/js/updateitem.js"></script>


