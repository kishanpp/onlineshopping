<link href="css/updateitem.css" rel="stylesheet">



<cfif session.userPhoneNumber NEQ "">

<cfinclude template="admin.cfm">


<cfif structKeyExists(form,"updateitem")>
	 <cfset updatedata = createObject("component","cffiles.components").updatedata(psubnameselect="#form.psubtype#",
																				psubname="#form.pname#",
																				qty="#form.pqty#",
																				pprice="#form.pprice#",
																				
																				desc="#form.pdesc#")>  
	
</cfif>

<div class="updateitem">
	<h3>UPDATE PRODUCT DESCRIPTIONS</h3>
	
	<cfform action="##">
	
	<div class="pcategory">
		<cfselect id="ptype" name="ptype">
			<option value="" selected disabled>Select Product category</option>
		</cfselect>
		<div id="ptypereq">
		<span>*Select Product Category </span>
		</div>
	</div>
	<div class="psubcategory">
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
			<cfinput type="text" name="pimg" size="20" id="pimg" placeholder="Enter Image Path">
			
		
		<div class="inputdata">
			<label for="pdesc">Product Description</label>
		</div>
			<!---<cfinput type="text" name="pdesc" id="desc" placeholder="Enter Product Description" >--->
			<cftextarea name="pdesc" id="desc" placeholder="Enter Product Description" />
		<div class="submit">
			<cfinput type="submit" name="updateitem" id="updateitem" value="Update Database">
		</div>
	</cfform>
	
</div>

<cfelse>
<cflocation url="/index.cfm">
</cfif>





<script src="/js/updateitem.js"></script>