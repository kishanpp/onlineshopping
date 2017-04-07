<!--- 
filename 		: trending_products.cfm
function 		: This file displays the carasole and the marque containing some
					products in the index.cfm page.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->
<!DOCTYPE HTML>
<html lang="en-US">
	<head>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery.Marquee/1.3.94/jquery.marquee.js" type="text/javascript"></script>

		<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
		<link href="../assets/css/trendingproducts.css" rel="stylesheet">
	</head>
	<body>
		<cfset controllerObject = CreateObject("component","controller.trendingproductcontroller") />
		<div class=" container-area">
			<h4> TRENDING PRODUCTS</h4>
			<cfset newvar=arrayNew(1)>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data1())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data2())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data3())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data4())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data5())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data6())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data7())/>
			<cfset arrayAppend(newvar,controllerObject.retrieve_data8())/>
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!--- Indicators --->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
				</ol>
				<!--- Wrapper for slides --->
				<div class="carousel-inner" role="listbox" >
					<div class="item active">
						<cfoutput>
							<a href="view/product.cfm?id=13"><img src="data:image/jpg;base64,#toBase64(newvar[1].Photo)#"   /></a>
						</cfoutput>
						<div class="carousel-caption">
							<h3 class="info"><cfoutput>#newvar[1].ProductSubCategoryName#</cfoutput></h3>
				 		</div>
					</div>
					<cfloop from="2" to="4" index="products">
						<div class="item">				
							<cfoutput>
							<a href="view/product.cfm?id=#newvar[products].InventorySubCategoryId#"> <img src="data:image/jpg;base64,#toBase64(newvar[products].Photo)#"   /></a>
							</cfoutput>				
							<div class="carousel-caption info" >
								<h3 class="info"><cfoutput>#newvar[products].ProductSubCategoryName#</cfoutput></h3>
							</div>
						</div>		
					</cfloop>
				</div>
				<!--- Left and right controls --->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<cfoutput>
			<!--Item slider text-->
			<div class="containers">
				<div class="row" id="slider-text">
					<div class="col-md-6" >
						<h2>NEW COLLECTIONS</h2>
					</div>
				</div>
				<div class="slider">
					<ul class=" marque slideContainer list-inline list-unstyled " id="money_start" >
						<cfloop from="1" to="8" index="products">
							<li class="productbox slideItem">
								<a  href="view/product.cfm?id=#newvar[products].InventorySubCategoryId#">
									<img src="data:image/jpg;base64,#toBase64(newvar[products].Photo)#" class="img-responsive">
									<div class="detail">
										<span style="width:100% ;float:left;">#newvar[products].ProductSubCategoryName#</span> 
										<cfif #newvar[products].ProductDiscount# GT 0>
											<cfset discountedvalue = #newvar[products].ProductSubCategoryPrice#  - ((#newvar[products].ProductDiscount#)/100)*#newvar[products].ProductSubCategoryPrice#>
											<span class="productprice">&##8377 #discountedvalue#</span>
											<span class="oldprice"> &##8377 #newvar[products].ProductSubCategoryPrice#</span> 
											<span class="discount">#newvar[products].ProductDiscount#%off</span>	
										<cfelse>
											<span class="oldprice" style="font-weight:500;	font-size:16px;text-decoration:none;color:black;float:left;margin-left:0px; "> &##8377 #newvar[products].ProductSubCategoryPrice#</span> 
										</cfif>
									</div>	
								</a>
							</li>
						</cfloop>
					</ul>
				</div>
			</div>
		</cfoutput>
		<script src="assets/js/trendingproducts.js" language="javascript" type="text/javascript"></script>
	</body>
</html>



