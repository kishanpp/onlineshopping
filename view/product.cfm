<!--- 
filename 		: products.cfm
function 		: This file displays particular product page with related information.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->


<link rel="stylesheet" href="../assets/css/product.css">
<link rel="shortcut icon" href="../assets/css/favicon.ico" type="image/x-icon">
<body>
	<cfinclude template="../view/headertemplate.cfm">
	<cfset controllerObject = CreateObject("component","controller.productcontroller") />

	<div class="product-area">
	<cfoutput>
		<cfif IsDefined("URL.id") AND IsNumeric(#URL.id#)>
	
	<cfset getproducts = controllerObject.getproducts(id="#URL.id#") >

	<cfif getproducts.recordCount GT 0>
		<cfset newvar1 = controllerObject.getdatabyid(getproductdetails="#URL.id#") />
		<cfset newvar2 = controllerObject.getproductqty(id="#URL.id#") />
		
		<img src="data:image/jpg;base64,#toBase64(newvar1.Photo)#"   />
		
		<div class="info-area">
			
			<h3 class="product-name">#newvar1.ProductSubCategoryName#</h3> <hr />
			<cfif #newvar1.ProductDiscount# EQ 0>
				<span style="font-size: 28px;	font-weight:500;">&##8377 #newvar1.ProductSubCategoryPrice#</span>
			<cfelse>
			<cfset discountedvalue = #newvar1.ProductSubCategoryPrice#  - ((#newvar1.ProductDiscount#)/100)*#newvar1.ProductSubCategoryPrice#>
				<span class="discounted-price">&##8377 #discountedvalue#</span>
				<span class="product-price">&##8377 #newvar1.ProductSubCategoryPrice#</span>
				<span class="discount"> #newvar1.ProductDiscount#% off</span>
			</cfif>
			
			<h5 class="product-description">#newvar1.ProductDescription#</h5>
			<h6 class="product-replacement">Returns: 14 days money back or replacement</h6>
			<h6 class="product-replacement">Guarantee: Get the item you ordered or get your money back.
									Covers your purchase price and original shipping.</h6>
			
			<cfif SESSION.isLogged EQ true>	
				<cfif #newvar1.ProductSubCategoryQty# GT 0>
					<cfif #newvar2# EQ TRUE>
						<cfform action="buyproduct.cfm?id=#URL.id#">
							<button class="btn btn-info btn-lg" name="buy-product">
								&##8377 BUY NOW
							</button>
						</cfform>
						<button class="btn btn-info btn-lg " id="add-to-cart" name="add-to-cart" style="display:block;">
							&##8377 ADD TO CART
						</button>
						<span id="added" style="display:none;">#URL.id#</span>
					<cfelse>
						<span>*You can't add more in Cart</span>
					</cfif>
				<cfelse>
					<span>*Out Of Stock</span>
				</cfif>
			<cfelse>
				<span>*Please log in to purchase</span>
			</cfif>
			
				
				
		</div>
		
		<cfelse>
			<div class="info-area">Invalid Product</div>
		</cfif>

	
	<cfelse>
		<div class="info-area">Invalid Product</div>
	</cfif>
	</div>
	</cfoutput>
		<cfinclude template="../view/footer.cfm">
</body>
<script src="../assets/js/product.js"></script>