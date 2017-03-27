<link rel="stylesheet" href="css/cartpage.css">
<cfinclude template="headertemplate.cfm">

<div class="cart-products-area">
	<cfset getcart = createObject("component","cffiles.components").getcartdataid()>
		
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
						
						<cfset getcarts = createObject("component","cffiles.components").getcartdata(id=#getcart.InventorySubCategoryId#)>
						<img src="data:image/jpg;base64,#toBase64(getcarts.Photo)#"   />
						<span >#getcarts.ProductSubCategoryName#</span>
						<span >Qty :<b>#getcart.OrderQty#</b></span>
						<span >&##8377 #getcarts.ProductSubCategoryPrice#</span>
						
						<input type="text" id="id" value="#getcarts.InventorySubCategoryId#"  style="display:none;">
						<button class="btn btn-info" id="remove-from-cart" name="remove-from-cart" ><span class="glyphicon glyphicon-remove-sign"> REMOVE FROM CART </span></button>
										
					</div>
				</cfloop>
				<span id="date" style="display:none;">#DateFormat(Now(),"mm/dd/yy")#</span> 
				<div class="paymentdetails">
				<span class="pricedetails">PRICE DETAILS</span><hr />
				<span class="deleverycharges">DELEVERY CHARGES</span> <span class="free">FREE</span><hr />
				<cfset getamount = createObject("component","cffiles.components").getcartitemstotalamount()>
				<span class="amountpayable">AMOUNT PAYABLE</span><span class="totalamount">#getamount#</span>
				</div>
				
				<cfform action="buyproduct.cfm" method="POST">
				<button class="btn btn-info " id="buy-all-product" name="buy-all-product"><span class="glyphicon glyphicon-usd"> BUY ALL</span></button>
				</cfform>
				
				
				
			</cfif>
		</cfif>
			
		</cfoutput>
</div>
			
			
			
			
<cfinclude template="footer.cfm">
<script src="js/cartpage.js"></script>