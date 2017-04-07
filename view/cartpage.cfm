<!--- 
filename 		: cartpage.cfm
function 		: This file displays the list of products added to the cart by the respective users.
date created 	: ‎Friday, ‎03 ‎March, ‎2017, ‏‎2:10:49 PM

--->

<html lang="en-US">
<head>
	<link rel="stylesheet" href="../assets/css/cartpage.css">
	<cfinclude template="headertemplate.cfm">
</head>
<body>
	<cfset controllerObject = CreateObject("component","controller.cartpagecontroller") />
	<div class="cart-products-area">
		<cfset getcart = controllerObject.getcartdataid()>		
		<cfoutput>
		<cfif #SESSION.userPhoneNumber# EQ "">
			<div class="products">
				<strong> LOG IN TO SEE YOUR CART </strong>
			</div>
		<cfelse>
			<cfif #getcart.recordcount# EQ 0>
				<div class="products">
					<strong>NO ITEMS IN THE CART</strong>
				</div>
			<cfelse>
				<cfset totalamount = 0 />
				<cfloop query="getcart">
					<div class="products">
						<cfset getcarts = controllerObject.getcartdata(id=#getcart.InventorySubCategoryId#)>
						<img src="data:image/jpg;base64,#toBase64(getcarts.Photo)#"   />
						<div >
							<span class="pname" >#getcarts.ProductSubCategoryName#</span>
							<cfif #getcarts.ProductDiscount# GT 0>
								<cfset discountedvalue = #getcarts.ProductSubCategoryPrice#  - ((#getcarts.ProductDiscount#)/100)*#getcarts.ProductSubCategoryPrice#>
								<span class="discountedprice">&##8377 #discountedvalue#</span>
								<span class="pprice">&##8377 #getcarts.ProductSubCategoryPrice#</span>
								<span class="discount"> #getcarts.ProductDiscount#% off</span>
								<span class="pqty">Qty :<b>#getcart.OrderQty#</b></span>
							<cfelse>
								<span class="discountedprice">&##8377 #getcarts.ProductSubCategoryPrice#</span>
								<span class="pqty">Qty :<b>#getcart.OrderQty#</b></span>
							</cfif>
						</div>
						<input type="text" id="id" value="#getcarts.InventorySubCategoryId#"  style="display:none;">
						<button class="btn btn-info glyphicon glyphicon-remove-sign" id="remove-from-cart" name="remove-from-cart" ></button>
					</div>
				</cfloop>
				<span id="date" style="display:none;">#DateFormat(Now(),"mm/dd/yy")#</span> 
				<div class="paymentdetails">
					<span class="pricedetails">PRICE DETAILS</span><hr />
					<span class="deleverycharges">DELEVERY CHARGES</span> <span class="free">FREE</span><hr />
					<cfset getamount = controllerObject.getcartitemstotalamount()>
					<span class="amountpayable">AMOUNT PAYABLE</span><span class="totalamount">#getamount#</span>
				</div>	
				<cfform action="buyproduct.cfm" method="POST">
					<button class="btn btn-info btn-lg" id="buy-all-product" name="buy-all-product">
						&##8377 BUY ALL
					</button>
				</cfform>
			</cfif>
		</cfif>		
		</cfoutput>
	</div>		
	<cfinclude template="footer.cfm">
	<script src="../assets/js/cartpage.js"></script>
</body>
</html>