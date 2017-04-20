<!--- 
filename 		: products.cfm
function 		: This file displays particular product page with related information.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->


<html lang="en-US">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name = "viewport" content="width=device-width, initial-scale=1">
	
	<link rel = "stylesheet" href = "../assets/css/product.css">
</head>
<body>
	<cfinclude template = "../view/headertemplate.cfm">
	<cfset controllerObject = CreateObject("component","controller.productcontroller") />
	<div class = "product-area">
		<cfoutput>
			<cfif IsDefined("URL.id") AND IsNumeric(#URL.id#)>
				<cfset getproducts = controllerObject.getproducts(id = "#URL.id#") >
				<cfif getproducts.recordCount GT 0>
					<cfset VARIABLES.getProductDetails = controllerObject.getdatabyid(productId = "#URL.id#") />
					<cfset VARIABLES.productQuantity = controllerObject.getproductqty(productId = "#URL.id#") />
					<div class = "images">
						<img src = "data:image/jpg;base64,#toBase64(VARIABLES.getProductDetails.Photo)#"   />
						<cfif SESSION.isLogged EQ true>	
							<cfif #VARIABLES.getProductDetails.ProductSubCategoryQty# GT 0>
								<cfif #VARIABLES.productQuantity# EQ TRUE>
									<cfform action = "buyproduct.cfm?id=#URL.id#">
										<button class = "btn btn-info btn-lg" name = "buy-product">
											&##8377 BUY NOW
										</button>
									</cfform>
									<button class = "btn btn-info btn-lg " id = "add-to-cart" name = "add-to-cart" style = "display:block;">
										<span class = "glyphicon glyphicon-shopping-cart"> </span> ADD TO CART
									</button>
								</cfif>
							</cfif>
						</cfif>
					</div>
					<div class = "info-area">	
						<h3 class = "product-name">#VARIABLES.getProductDetails.ProductSubCategoryName#</h3> <hr />
						<cfif #VARIABLES.getProductDetails.ProductDiscount# EQ 0>
							<span class = "discounted-price-symbol" >&##8377</span>
							<span class = "discounted-price" >#VARIABLES.getProductDetails.ProductSubCategoryPrice#</span>
						<cfelse>
							<cfset discountedvalue = round (#VARIABLES.getProductDetails.ProductSubCategoryPrice#  - ((#VARIABLES.getProductDetails.ProductDiscount#)/100)*#VARIABLES.getProductDetails.ProductSubCategoryPrice# )>
							<span class = "discounted-price-symbol">&##8377
								<span class = "discounted-price">#discountedvalue#</span>
							</span>
							<span class = "product-price-symbol" >&##8377
								<span class = "product-price">#VARIABLES.getProductDetails.ProductSubCategoryPrice#</span>
							</span>
							<span class = "discount"> #VARIABLES.getProductDetails.ProductDiscount#% off</span>
						</cfif>
						<h5 class = "product-description">#VARIABLES.getProductDetails.ProductDescription#</h5>
						<h6 class = "product-replacement">Returns: 14 days money back or replacement</h6>
						<h6 class = "product-replacement">Guarantee: Get the item you ordered or get your money back.
												Covers your purchase price and original shipping.
						</h6>
						<cfif SESSION.isLogged EQ true>	
							<cfif #VARIABLES.getProductDetails.ProductSubCategoryQty# GT 0>
								<cfif #VARIABLES.productQuantity# EQ TRUE>
									<span id = "added" style = "display:none;"></span>
									<span id = "productId" style = "display:none;">#URL.id#</span>
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
					<div class = "info-area" style = "border-left : none;margin : 0% 2% 9% 15%;">
						<img src = "../assets/images/error-no-search-results.png">
						<span class = "invalidproduct">
							Sorry, no results found!
							<p>Please check the spelling or try searching for something else</p>
						</span>
					</div>
				</cfif>
			<cfelse>
				<div class = "info-area" style = "border-left : none;margin : 0% 2% 9% 15%;">
					<img src = "../assets/images/error-no-search-results.png">
						<span class = "invalidproduct">
							Sorry, no results found!
							<p>Please check the spelling or try searching for something else</p>
						</span>
				</div>
			</cfif>
		</cfoutput>
	</div>
	<cfinclude template = "../view/footer.cfm">
</body>
<script src = "../assets/js/product.js"></script>
<script src = "../assets/js/jquery.elevatezoom.js"></script>
</html>