
<link rel="stylesheet" href="css/product.css">
<link rel="shortcut icon" href="css/favicon.ico" type="image/x-icon">
<body>
<cfinclude template="headertemplate.cfm">
<div class="product-area">

<cfquery name="getproduct" datasource="OnlineShopping" >
SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId = #URL.id#
</cfquery>
<cfif getproduct.recordCount GT 0>
	<cfset myobject=CreateObject("component","/cffiles/components") />
	<cfset newvar1=myobject.getdatabyid(getproductdetails="#URL.id#") />
	<cfset newvar2=myobject.getproductqty(id="#URL.id#") />
	<cfoutput>
	<img src="data:image/jpg;base64,#toBase64(newvar1.Photo)#"   />
	
	<div class="info-area">
		
		<h3 class="product-name">#newvar1.ProductSubCategoryName#</h3> <hr />
		<h4 class="product-price">&##8377 #newvar1.ProductSubCategoryPrice#</h4>
		<!--- <h4 class="product-qty">Total Quantity : #newvar1.ProductSubCategoryQty#</h4> --->
		<h5 class="product-price">#newvar1.ProductDescription#</h5>
		<h6 class="product-price">Returns: 14 days money back or replacement</h6>
		<h6 class="product-price">Guarantee: Get the item you ordered or get your money back.
								Covers your purchase price and original shipping.</h6>
		
		<cfif SESSION.isLogged EQ true>	
			<cfif #newvar1.ProductSubCategoryQty# GT 0>
				<cfif #newvar2# EQ TRUE>
					<cfform action="buyproduct.cfm?id=#URL.id#">
						<button class="btn btn-info" name="buy-product"><span class="glyphicon glyphicon-usd"> BUY NOW</span></button>
					</cfform>
					<button class="btn btn-info " id="add-to-cart" name="add-to-cart" style="display:block;"><span class="glyphicon glyphicon-usd"> ADD TO CART</span></button>
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
	</cfoutput>
	<cfelse>
		<div class="info-area">Invalid Product</div>
	</cfif>

</div>
	<cfinclude template="footer.cfm">
</body>
<script src="js/product.js"></script>