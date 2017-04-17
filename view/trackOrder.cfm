<!--- 
filename 		: trackOrder.cfm
function 		: This file display the orders done till date by the customer.
date created 	: Friday, ?03 ?March, ?2017, ??2:10:49 PM

--->

<html lang = "en-US">
	<head>
		<link rel = "stylesheet"  href = "../assets/css/trackOrder.css"> 
	</head>
	<body>
		<cfinclude template = "headertemplate.cfm">
		<cfset controllerObject = CreateObject("component","controller.trackordercontroller") />
		
		
		
		<cfset VARIABLES.getOrders = controllerObject.getOrder()>
		<cfoutput>
		<cfif VARIABLES.getOrders.recordCount NEQ 0>
			<cfloop query = "VARIABLES.getOrders">
				<div class = "Orders">
					<div class = "orderidarea">
						<span class = "orderid">ORDER ID : #VARIABLES.getOrders.OrderId#</span> 
					</div>
					<cfset VARIABLES.getOrderDetails = controllerObject.getOrderDetails(orderId = #VARIABLES.getOrders.OrderId#)>
					<cfloop query = "VARIABLES.getOrderDetails">
						<div class = "OrderDetails">
							<cfset VARIABLES.getProductDetails = controllerObject.getProductDetails(productId = #VARIABLES.getOrderDetails.InventorySubCategoryId#)>
							<div class = "productimagearea">
								<img src = "data:image/jpg;base64,#toBase64(VARIABLES.getProductDetails.Photo)#"   />
							</div>
							<div class = "productdetails">
								<span>#VARIABLES.getProductDetails.ProductSubCategoryName#</span><br />
								Qty <span>#VARIABLES.getOrderDetails.OrderQty#</span>
							</div>
							<div class = "productdetails">								
								<span class = "productprice">&##8377 #VARIABLES.getOrderDetails.ProductSubCategoryPrice#</span>
							</div>
						</div><hr />
					</cfloop>
					<div class = "footerdetails">
						<div class = "orderdate"><span class = "textdesign">Order On</span>  #DateFormat(VARIABLES.getOrders.OrderDate)#</div>
						<div class = "ordertotal"><span class = "textdesign">Order Total &##8377</span>  #VARIABLES.getOrders.TotalAmount#</div>
					</div>
				</div>
			</cfloop>
		<cfelse>
			<div class = "Orders orderidarea ">
				No transactions yet
			</div>
		</cfif>
		</cfoutput>
	</body>
	<script src = "../assets/js/trackOrder.js"></script>
</html>