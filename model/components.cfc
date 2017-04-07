<cfcomponent displayname="OnlineShoppingDatabaseConnectivity" hint="Handles the Database connectivity">
 
<!--- 
function name			 :	getinventorycategory
description				 :	this function retrieves the inventory category details.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="getinventorycategory" output="true" returntype="query" access="public" hint="get product category to display in index.cfm left pane" >
	<cfquery name="productCategoryDetails" >
		SELECT * FROM dbo.ProductCategory
	</cfquery>
	<cfreturn productCategoryDetails>
</cffunction>


<!--- 
function name			 :	getinventorysubcategory
description				 :	this function retrieves the inventory sub category details.
arguments description	 :	arg - id of product category.
return type 		  	 :	query
--->
<cffunction name="getinventorysubcategory" output="true" returntype="query" access="public" hint="get product sub category to display in index.cfm left pane">
	<cfargument name="arg" type="numeric" required="true" >
	<cfquery name="productSubCategoryDetails" >
		SELECT * FROM dbo.ProductSubCategory 
		INNER JOIN dbo.ProductCategory
		ON dbo.ProductSubCategory.InventoryCategoryId = dbo.ProductCategory.InventoryCategoryId
		WHERE dbo.ProductCategory.InventoryCategoryId = #ARGUMENTS.arg#
	</cfquery>
	<cfreturn productSubCategoryDetails>
</cffunction>	
  

<!--- 
function name			 :	getproductbyname
description				 :	this function retrieves name of product sub category and matches with argument 'value' and returns its id.
arguments description	 :	value - product sub category name.
return type 		  	 :	numeric
--->
<cffunction name="getproductbyname" output="true" returntype="numeric" access="remote">
	<cfparam name="value" type="string">
	<cfquery name="result" >
		SELECT * FROM dbo.ProductSubCategory WHERE ProductSubCategoryName = '#value#'
	</cfquery>
	<cfif result.recordCount EQ 1>
		<cfreturn  result.InventorySubCategoryId>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>	
  

<!--- 
function name			 :	retrieve_data1
description				 :	this function retrieves the product sub category details of id 13.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data1" output="true" returntype="query" access="public">
	<cfquery name="product_details"  >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=13
	</cfquery>
	<cfreturn product_details>
</cffunction>
 

<!--- 
function name			 :	retrieve_data2
description				 :	this function retrieves the product sub category details of id 15.
arguments description	 :	no arguments
return type 		  	 :	query
---> 
<cffunction name="retrieve_data2" output="true" returntype="query" access="public">
	<cfquery name="product_details"  >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=15
	</cfquery>
	<cfreturn product_details>
</cffunction>
 

<!--- 
function name			 :	retrieve_data3
description				 :	this function retrieves the product sub category details of id 17.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data3" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
	SELECT *
	FROM dbo.ProductSubCategory
	WHERE InventorySubCategoryId=17
	</cfquery>
	<cfreturn product_details>
</cffunction>
 

<!--- 
function name			 :	retrieve_data4
description				 :	this function retrieves the product sub category details of id 23.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data4" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=23
	</cfquery>
	<cfreturn product_details>
</cffunction>
 

<!--- 
function name			 :	retrieve_data5
description				 :	this function retrieves the product sub category details of id 14.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data5" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=14
	</cfquery>
	<cfreturn product_details>
</cffunction>


<!--- 
function name			 :	retrieve_data6
description				 :	this function retrieves the product sub category details of id 16.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data6" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=16
	</cfquery>
	<cfreturn product_details>
</cffunction>


<!--- 
function name			 :	retrieve_data7
description				 :	this function retrieves the product sub category details of id 18.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data7" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=18
	</cfquery>
	<cfreturn product_details>
</cffunction>
 

<!--- 
function name			 :	retrieve_data1
description				 :	this function retrieves the product sub category details of id 24.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="retrieve_data8" output="true" returntype="query" access="public">
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=24
	</cfquery>
	<cfreturn product_details>
</cffunction>


<!--- 
function name			 :	getdatabyid
description				 :	this function retrieves the product sub category details by id.
arguments description	 :	productId - id of the product sub category.
return type 		  	 :	query
--->
<cffunction name="getdatabyid" output="true" returntype="query" access="public">
	<cfargument name="productId" type="any" required="true" >
	<cfquery name="product_details" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=#ARGUMENTS.productId#
	</cfquery>
	<cfreturn product_details>
</cffunction>


<!--- 
function name			 :	getproductqty
description				 :	this function retrieves the product sub category quantity of the argument id.
arguments description	 :	id - id of the product sub category.
return type 		  	 :	boolean
--->
<cffunction name="getproductqty" output="true" returntype="boolean" access="public">
	<cfargument name="id" type="any" required="true" >
	<cfquery name="getqtyfromProductSubCategory" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=#ARGUMENTS.id#
	</cfquery>

	<cfquery name="getqtyfromCart">
		SELECT *
		FROM dbo.Cart
		WHERE (InventorySubCategoryId=#ARGUMENTS.id# AND phoneNumber='#SESSION.userPhoneNumber#')
	</cfquery>

	<cfif getqtyfromCart.OrderQty LT getqtyfromProductSubCategory.ProductSubCategoryQty>
		<cfreturn TRUE>
	<cfelse>
		<cfreturn FALSE>
	</cfif>
</cffunction>


<!--- 
function name			 :	addressstore
description				 :	this function stores the address.
arguments description	 :	name - name of the buyer
							address - full address of the buyer	
							city - city of the buyer
							state - state of the buyer
							zip - zip of the buyer.
return type 		  	 :	void
--->
<cffunction name="addressstore" output="true" returntype="void" access="public" >
	<cfargument name="name" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	<cfargument name="city" type="string" required="true">
	<cfargument name="state" type="string" required="true">
	<cfargument name="zip" type="numeric" required="true">
	<cfquery>
		INSERT INTO dbo.Address (Name,Address,City,State,Zip,PhoneNumber)
							VALUES ('#ARGUMENTS.name#',
									'#ARGUMENTS.address#',
									'#ARGUMENTS.city#',
									'#ARGUMENTS.state#',
									#ARGUMENTS.zip#,
									'#session.userPhoneNumber#')
	</cfquery>
</cffunction>


<!--- 
function name			 :	updateaddress
description				 :	this function updates the address of the buyer.
arguments description	 :	name - name of the buyer
							address - full address of the buyer	
							city - city of the buyer
							state - state of the buyer
							zip - zip of the buyer.
return type 		  	 :	void
--->
<cffunction name="updateaddress" output="true" returntype="void" access="public" >
	<cfargument name="name" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	<cfargument name="city" type="string" required="true">
	<cfargument name="state" type="string" required="true">
	<cfargument name="zip" type="numeric" required="true">
	<cfquery>
		UPDATE dbo.Address SET Name='#ARGUMENTS.name#',
								Address='#ARGUMENTS.address#',
								City='#ARGUMENTS.city#',
								State='#ARGUMENTS.state#',
								Zip=#ARGUMENTS.zip# 
								WHERE PhoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
 </cffunction>
 

<!--- 
function name			 :	addorder
description				 :	this function adds new order to the order table, and also to order details table .
arguments description	 :	id - id of the product sub category.
							date - current date / order date.
return type 		  	 :	void
--->
<cffunction name="addorder" output="true" returntype="void" access="public" >
	<cfargument name="id" type="numeric" required="true">
	<cfargument name="date" type="date" required="true"> 
	
	<cfquery name="resultset2" >
		SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#id#
	</cfquery> 
	<cfset discountedvalue = #resultset2.ProductSubCategoryPrice#  - ((#resultset2.ProductDiscount#)/100)*#resultset2.ProductSubCategoryPrice#>
	<cfquery result="result">   
		INSERT INTO dbo.Orders
		(OrderDate,TotalAmount,State,PhoneNumber)
		VALUES 
		('#date#',#discountedvalue#,'OrderPlaced','#session.userPhoneNumber#')
	</cfquery>	
	<cfquery name="resultset1" >
		SELECT TOP 1 * FROM dbo.Orders ORDER BY OrderId DESC
	</cfquery>
	<cfset SESSION.OrderId = resultset1.OrderId>
		
	<cfquery name="resultset3" >
		SELECT ProductSubCategoryQty FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#id#
	</cfquery>
		
	<cfset productqty = resultset3.ProductSubCategoryQty>
	<cfquery name="resultset4" >
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryQty=#productqty#-1 WHERE InventorySubCategoryId=#id#
	</cfquery>
		
	<cfquery name="resultset5" >
		SELECT * FROM dbo.OrderItem WHERE OrderId=#SESSION.OrderId# AND InventorySubCategoryId=#id#
	</cfquery>
		
	<cfif resultset5.RecordCount EQ 0>	
		<cfquery name="orderitem1" >
			INSERT INTO dbo.OrderItem (OrderQty,OrderId,InventorySubCategoryId) 
			VALUES(1,#SESSION.OrderId#,#id#)
		</cfquery>
	<cfelse>
		<cfquery name="orderitem2" >
			UPDATE dbo.OrderItem SET OrderQty=OrderQty+1 WHERE (OrderId=#SESSION.OrderId# AND InventorySubCategoryId=#id#)
		</cfquery>
	</cfif>
</cffunction>
  

<!--- 
function name			 :	getproductqty
description				 :	this function retrieves the product sub category quantity of the argument id.
arguments description	 :	id - id of the product sub category.
return type 		  	 :	boolean

<cffunction name="updateorder" output="false" returntype="void" access="public">
	<cfargument name="id" type="numeric" required="true">
	<cfargument name="orderid" type="numeric" required="true">
	<cfquery name="resultset1" datasource="OnlineShopping">
		<cfquery name="resultset2" >
			SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#id#
		</cfquery>
		<cfquery name="resultset3" >
			SELECT * FROM dbo.Orders WHERE OrderId=#orderid#
		</cfquery>
		<cfset price=#resultset3.TotalAmount# + #resultset2.ProductSubCategoryPrice# >
		UPDATE dbo.Orders SET TotalAmount=#price# WHERE OrderId=#resultset3.OrderId#
	</cfquery>
	<cfquery name="resultset3" >
		SELECT ProductSubCategoryQty FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#id#
	</cfquery>
	<cfset productqty = resultset3.ProductSubCategoryQty>
	<cfquery name="resultset4" >
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryQty=#productqty#-1 WHERE InventorySubCategoryId=#id#
	</cfquery>
	
	<cfquery name="resultset5" >
		SELECT * FROM dbo.OrderItem WHERE OrderId=#SESSION.OrderId# AND InventorySubCategoryId=#id#
	</cfquery>
	<cfif resultset5.RecordCount EQ 0>	
		<cfquery name="orderitem1" >
			INSERT INTO dbo.OrderItem (OrderQty,OrderId,InventorySubCategoryId) 
			VALUES(1,#SESSION.OrderId#,#id#)
		</cfquery>
	<cfelse>
		<cfquery name="orderitem2" >
			UPDATE dbo.OrderItem SET OrderQty=OrderQty+1 WHERE (OrderId=#SESSION.OrderId# AND InventorySubCategoryId=#id#)
		</cfquery>
	</cfif>

</cffunction>
---> 


<!--- 
function name			 :	paymentdetails
description				 :	this function inserts payment details to CreditCardDetails table.
arguments description	 :	ccnumber - credit card number of the buyer
							holdername - name of the buyer
							expdate - expiry date of the credit card
							cvvnumber - the CVV number of the credit card.
return type 		  	 :	void
--->
<cffunction name="paymentdetails" output="true" returntype="void" access="public">
	<cfargument name="ccnumber" type="string" required="true">
	<cfargument name="holdername" type="string" required="true">
	<cfargument name="expdate" type="date" required="true">
	<cfargument name="cvvnumber" type="string" required="true">

	<cfquery name="resultset1" >
		INSERT INTO dbo.CreditCardDetails
		(CCNumber,HolderName,ExpiryDate,CVVNumber,OrderId)
		VALUES
		('#ccnumber#','#holdername#','#expdate#',#cvvnumber#,#SESSION.OrderId#)
	</cfquery>
</cffunction>


<!--- 
function name			 :	gettotalamount
description				 :	this function retrieves the current order details.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="gettotalamount" output="true" returntype="query" access="public">
	<cfquery name="resultset1">
		SELECT * FROM dbo.Orders WHERE OrderId = #SESSION.OrderId#
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<!--- 
function name			 :	getitem
description				 :	this function retrieves the product details of the current order.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getitems" output="true" returntype="query" access="public">
	<cfquery name="currentOrderDetails">
		SELECT * FROM dbo.ProductSubCategory INNER JOIN dbo.OrderItem
					ON dbo.OrderItem.InventorySubCategoryId=dbo.ProductSubCategory.InventorySubCategoryId
					WHERE OrderId = #SESSION.OrderId#
	</cfquery>
	<cfreturn currentOrderDetails>
</cffunction>


<!--- 
function name			 :	getaddress
description				 :	this functions retrieves the address of the buyer.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getaddress" output="true" returntype="query" access="public">
	<cfquery name="userAddress" >
		SELECT * FROM dbo.Address WHERE PhoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfreturn userAddress>
</cffunction>


<!--- 
function name			 :	updatecart
description				 :	this function inserts the cart details if product not present else updates the quantity in the cart.It returns the number of items in cart.
arguments description	 :	value - product sub category id.
return type 		  	 :	numeric
--->
<cffunction name="updatecart" output="true" returntype="numeric" access="remote">
	<cfargument name="value" type="numeric" required="true">
	<cfquery name="resultset3" >
		SELECT * FROM dbo.Cart WHERE (phoneNumber='#SESSION.userPhoneNumber#' AND InventorySubCategoryId=#value#)
	</cfquery>
	<cfif resultset3.recordCount EQ 0>
		<cfquery name="resultset1" >
			INSERT INTO dbo.Cart (phoneNumber,InventorySubCategoryId,OrderQty) VALUES ('#SESSION.userPhoneNumber#',#value#,1)
		</cfquery>
	<cfelse>
		<cfquery name="resultset4" >
			UPDATE dbo.Cart SET OrderQty=OrderQty+1 WHERE (phoneNumber='#SESSION.userPhoneNumber#' AND InventorySubCategoryId=#value#)
		</cfquery>
	</cfif>
	<cfquery name="resultset2" >
		SELECT SUM(OrderQty) AS total FROM dbo.Cart WHERE phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfif resultset2.total GTE 0>
		<cfreturn resultset2.total>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>


<!--- 
function name			 :	getcartdataid
description				 :	this function retrieves and returns the product sub category id and order qty from cart table.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getcartdataid" output="true" returntype="query" access="remote">
	<cfquery name="cartDetails" >
		SELECT InventorySubCategoryId,OrderQty FROM dbo.Cart WHERE phoneNumber= '#SESSION.userPhoneNumber#'
	</cfquery>

	<!---
	<cfset response = [] />
	<cfoutput query = "resultset1">
		<cfset obj = {
						"id" = InventorySubCategoryId
					} />
		<cfset arrayAppend(response,obj) />
	</cfoutput>
	<!--- <cfprocessingdirective suppresswhitespace="Yes">
		<cfoutput>
			#SerializeJSON(response)#
		</cfoutput>
		</cfprocessingdirective> --->
		<cfsetting enablecfoutputonly="No" showdebugoutput="No">
	<cfreturn response> --->

	<cfreturn cartDetails>
</cffunction>


<!--- 
function name			 :	getcartdata
description				 :	this function retrieves and returns the product sub category details.
arguments description	 :	id - product sub category id.
return type 		  	 :	query
--->
<cffunction name = "getcartdata" output = "true" returntype = "query" access = "public">
	<cfargument name=id type="numeric" required="true">
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId = #id#
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<!--- 
function name			 :	getno
description				 :	this function counts and returns product quantity in the cart.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="getno" output="true" returnType="query" access="public">
	<cfquery name="totalCartQuantity" >
		SELECT SUM(OrderQty) AS total FROM dbo.Cart WHERE phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfreturn totalCartQuantity>
</cffunction>


<!--- 
function name			 :	removefromcart
description				 :	this function removes product from cart table and returns total cost of the products in cart and quantity of products in cart.
arguments description	 :	value - product sub category id.
return type 		  	 :	JSON
--->
<cffunction name="removefromcart" output="true" returntype="any" access="remote">
	<cfargument name="value" type="numeric" required="true">
	<cfquery>
		DELETE FROM dbo.Cart
		WHERE (phoneNumber='#SESSION.userPhoneNumber#' AND InventorySubCategoryId=#value#)
	</cfquery>

	<cfquery name="resultset1" >
		SELECT * FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#' 
	</cfquery>
	<cfset total = 0 />
	<cfloop query="resultset1">
		<cfloop from=1 to=#resultset1.OrderQty# index="i">
			<cfquery name="resultset2" >
				SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#resultset1.InventorySubCategoryId#
			</cfquery>
			
			<cfif #resultset2.ProductDiscount# EQ 0>
				<cfset total = total  + resultset2.ProductSubCategoryPrice>
			<cfelse>
				<cfset discountedvalue = #resultset2.ProductSubCategoryPrice#  - ((#resultset2.ProductDiscount#)/100)*#resultset2.ProductSubCategoryPrice#>
				<cfset total = total  + #discountedvalue#>
			</cfif>
		</cfloop>
	</cfloop>
	<cfquery name="resultset2" >
		SELECT SUM(OrderQty) AS total FROM dbo.Cart WHERE phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfif resultset2.total GTE 0>
		<cfset cartvalue=resultset2.total>
	<cfelse>
		<cfset cartvalue=0>
	</cfif>
	<cfset response={totalamount = total, cart=cartvalue } />
	<cfreturn serializeJSON(response)>
</cffunction>


<!--- 
function name			 :	buyallfromcart
description				 :	this function insert new order to order table when purchased from cart and returns quantity of products in cart.
arguments description	 :	date - current data / order date.
return type 		  	 :	numeric
--->
<cffunction name="buyallfromcart" output="true" returntype="numeric" access="remote">
	<cfargument name="date" type="date" required="true"> 
	
	<cfquery name="productSubCategoryDetails" >
		SELECT * FROM dbo.ProductSubCategory
		INNER JOIN dbo.Cart
		ON dbo.ProductSubCategory.InventorySubCategoryId = dbo.Cart.InventorySubCategoryId
		WHERE dbo.Cart.phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfset LOCAL.total = 0>
		<cfloop query="productSubCategoryDetails">
			<cfloop from = 1 to = #productSubCategoryDetails.OrderQty# index = "i">
				<cfif #productSubCategoryDetails.ProductDiscount# EQ 0>
					<cfset LOCAL.total = #LOCAL.total# + #productSubCategoryDetails.ProductSubCategoryPrice#>
				<cfelse>
					<cfset LOCAL.discountedvalue = #productSubCategoryDetails.ProductSubCategoryPrice#  - ((#productSubCategoryDetails.ProductDiscount#)/100)*#productSubCategoryDetails.ProductSubCategoryPrice#>
					<cfset LOCAL.total = #LOCAL.total# + #LOCAL.discountedvalue#>
				</cfif>	
			</cfloop>
		</cfloop>
	<cfquery>
		INSERT INTO dbo.Orders (OrderDate,TotalAmount,State,PhoneNumber) VALUES('#ARGUMENTS.date#',#LOCAL.total#,'OrderPlaced','#SESSION.userPhoneNumber#')
	</cfquery>
	<cfquery name="OrderDetails" >
		SELECT TOP 1 * FROM dbo.Orders ORDER BY OrderId DESC
	</cfquery>
		
	<cfquery name="cartDetails" >
		SELECT * FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
	<cfset SESSION.OrderId = #OrderDetails.OrderId# >
	<cfloop query = "cartDetails">
		<cfquery>
			INSERT INTO dbo.OrderItem (OrderQty,OrderId,InventorySubCategoryId) VALUES (#cartDetails.OrderQty#,#SESSION.OrderId#,#cartDetails.InventorySubCategoryId#)
		</cfquery>
	</cfloop>

	<cfquery>
		DELETE FROM dbo.Cart WHERE phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>

	<cfloop query = "productSubCategoryDetails">
		<cfquery name = "orderQuantity" >
			SELECT OrderQty FROM dbo.OrderItem WHERE (InventorySubCategoryId = #productSubCategoryDetails.InventorySubCategoryId# AND OrderId = #SESSION.OrderId#)
		</cfquery>
		<cfset LOCAL.productqty = orderQuantity.OrderQty>
		<cfquery >
			UPDATE dbo.ProductSubCategory SET ProductSubCategoryQty = (ProductSubCategoryQty-#LOCAL.productqty#) WHERE InventorySubCategoryId = #productSubCategoryDetails.InventorySubCategoryId#
		</cfquery>
	</cfloop>

	<cfquery name="cartQuantity" >
		SELECT COUNT(*) AS total FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>

	<cfif cartQuantity.total GTE 0>
		<cfreturn cartQuantity.total>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>


<!--- 
function name			 :	getcartitemstotalamount
description				 :	this function calculates total cost of products in cart and returns it.
arguments description	 :	no arguments.
return type 		  	 :	numeric
--->
<cffunction name="getcartitemstotalamount" output="true" returntype="numeric" access="public">
	<cfquery name="cartDetails" >
		SELECT * FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#' 
	</cfquery>
	<cfset total = 0 />
	<cfloop query="cartDetails">
		<cfloop from=1 to=#cartDetails.OrderQty# index="i">
			<cfquery name="productSubCategoryDetails" >
				SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId=#cartDetails.InventorySubCategoryId#
			</cfquery>
			
			<cfif #productSubCategoryDetails.ProductDiscount# EQ 0>
				<cfset total = total + #productSubCategoryDetails.ProductSubCategoryPrice#>
			<cfelse>
				<cfset discountedvalue = #productSubCategoryDetails.ProductSubCategoryPrice#  - ((#productSubCategoryDetails.ProductDiscount#)/100)*#productSubCategoryDetails.ProductSubCategoryPrice#>
				<cfset total = total + #discountedvalue#>
			</cfif>			
		</cfloop>
	</cfloop>
	<cfreturn total>
</cffunction>


<!--- 
function name			 :	productname
description				 :	this function returns all the products name matching with search argument.
arguments description	 :	search - product sub category name.
return type 		  	 :	array
--->
<cffunction name="productname" access="remote" returntype="array">
	<cfargument name="search" type="string" required="true" default="">
	<!--- Define variables --->
	<cfset var productsname="">
	<cfset var result=ArrayNew(1)>
	<!--- Do search --->
	<cfquery  name="productsname">
		SELECT ProductSubCategoryName
		FROM dbo.ProductSubCategory
		WHERE UPPER(ProductSubCategoryName) LIKE UPPER('%#ARGUMENTS.search#%')
		ORDER BY ProductSubCategoryName
	</cfquery>

	<!--- Build result array --->
	<cfloop query="productsname">
		<cfset ArrayAppend(result, ProductSubCategoryName)>
	</cfloop>

	<cfif productsname.RecordCount EQ 0 >
		<cfset ArrayAppend(result, "No result found")>
		<cfreturn result>
	<cfelse>
		<!--- And return it --->
		<cfreturn result>
	</cfif>
</cffunction>


<!--- 
function name			 :	inventorycategory
description				 :	this function returns the product category names.
arguments description	 :	no arguments.
return type 		  	 :	array
--->
<cffunction name="inventorycategory" output="true" returntype="array" access="remote" >
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductCategory
	</cfquery>
	<cfset var result=ArrayNew(1)>
	<cfloop query="resultset1">
		<cfset ArrayAppend(result,ProductName)>
	</cfloop>
	<cfreturn result>
</cffunction>
 

<!--- 
function name			 :	adddata
description				 :	this function adds new product sub category by admin.
arguments description	 :	pcat - product category name
							pname - product sub category name
							qty - product sub category quantity
							pprice - product sub category price
							pimg - product sub category image
							pdisc - product sub category discount
							desc - product sub category description.
return type 		  	 :	void
--->
<cffunction name="adddata" output="true" returntype="void" access="public" >
	<cfargument name="pcat" type="string" required="true" default="">
	<cfargument name="pname" type="string" required="true" default="">
	<cfargument name="qty" type="numeric" required="true" default="">
	<cfargument name="pprice" type="numeric" required="true" default="">
	<cfargument name="pimg" type="any" required="true" default="">
	<cfargument name="pdisc" type="numeric" required="true" default="">
	<cfargument name="desc" type="string" required="true" default="">

	<cfquery name="resultset1">
		SELECT * FROM dbo.ProductCategory WHERE ProductName = '#ARGUMENTS.pcat#'
	</cfquery>
	<cfquery  >
		INSERT INTO dbo.ProductSubCategory 
		(InventoryCategoryId,ProductSubCategoryName,ProductSubCategoryQty,ProductSubCategoryPrice,ProductDescription,ProductDiscount,Photo) 
		SELECT
		#resultset1.InventoryCategoryId#,
		'#ARGUMENTS.pname#',
		#ARGUMENTS.qty#,
		#ARGUMENTS.pprice#,
		'#ARGUMENTS.desc#',
		#ARGUMENTS.pdisc#,
		bulkcolumn from openrowset (bulk '#ARGUMENTS.pimg#',single_blob) as BLOB 
	</cfquery>
</cffunction>
 

<!--- 
function name			 :	inventorysubcategory
description				 :	this function returns names of product sub category names according to their product category name.
arguments description	 :	pname - product category name.
return type 		  	 :	array
--->
<cffunction name="inventorysubcategory" output="true" returntype="array" access="remote" >
	<cfargument name="pname" type="string" required="true" default="">
	 
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductCategory WHERE ProductName = '#ARGUMENTS.pname#'
	</cfquery>

	<cfquery name="resultset2" >
		SELECT * FROM dbo.ProductSubCategory WHERE InventoryCategoryId = #resultset1.InventoryCategoryId#
	</cfquery>

	<cfset var result=ArrayNew(1)>
	<cfloop query="resultset2">
		<cfset ArrayAppend(result,ProductSubCategoryName)>
	</cfloop>
	<cfreturn result>
</cffunction>
 

<!--- 
function name			 :	deletedata
description				 :	this function deletes the product sub category data from the database.
arguments description	 :	psubcat - product sub category name.
return type 		  	 :	void
--->
<cffunction name="deletedata" output="true" returntype="void" access="public" >
	<cfargument name="psubcat" type="string" required="true" default="">
	<cfquery >
		DELETE FROM dbo.ProductSubCategory WHERE ProductSubCategoryName = '#ARGUMENTS.psubcat#'
	</cfquery>
</cffunction>


<!--- 
function name			 :	inventorysubcategorydata
description				 :	this function returns the details of the product sub category.
arguments description	 :	psubname - product sub category name.
return type 		  	 :	array
--->
<cffunction name="inventorysubcategorydata" output="true" returntype="array" access="remote" >
	<cfargument name="psubname" type="string" required="true" default="">
	 
	<cfquery name="productSubCategoryDetails" >
		SELECT * FROM dbo.ProductSubCategory WHERE ProductSubCategoryName = '#ARGUMENTS.psubname#'
	</cfquery>

	<cfset var result=ArrayNew(1)>
	<cfloop query="productSubCategoryDetails">
		<cfset ArrayAppend(result,ProductSubCategoryName)>
		<cfset ArrayAppend(result,ProductSubCategoryQty)>
		<cfset ArrayAppend(result,ProductSubCategoryPrice)>
		<cfset ArrayAppend(result,ProductDescription)>
		<cfset ArrayAppend(result,ProductDiscount)>
	</cfloop>
	<cfreturn result>
</cffunction>
 

<!--- 
function name			 :	updatedata
description				 :	this function updates product sub category details by admin including image.
arguments description	 :	psubnameselect - product sub category name 
							psubname - product subb category name
							qty - product sub category qyantity
							pprice - product sub category price
							pdisc - product sub category discount
							desc - product sub category description
							pimg - product sub category image.
return type 		  	 :	void
--->
<cffunction name="updatedata" output="true" returntype="void" access="public" >
	<cfargument name="psubnameselect" type="string" required="true" default="">
	<cfargument name="psubname" type="string" required="true" default="">
	<cfargument name="qty" type="numeric" required="true" default="">
	<cfargument name="pprice" type="numeric" required="true" default="">
	<cfargument name="desc" type="string" required="true" default="">
	<cfargument name="pimg" type="any" required="true" default="">
	<cfquery>
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryName='#ARGUMENTS.psubname#',
											ProductSubCategoryQty= #ARGUMENTS.qty# ,
											ProductSubCategoryPrice= #ARGUMENTS.pprice#,
											ProductDescription='#ARGUMENTS.desc#',
											ProductDiscount=#ARGUMENTS.pdisc#,
											Photo = bulkcolumn from openrowset (bulk '#ARGUMENTS.pimg#',single_blob) as BLOB
											WHERE ProductSubCategoryName = '#ARGUMENTS.psubnameselect#'
	</cfquery>
</cffunction>
 
 
<!--- 
function name			 :	updatedatawithoutimg
description				 :	this function updates product sub category details by admin except the image.
arguments description	 :	psubnameselect - product sub category name 
							psubname - product subb category name
							qty - product sub category qyantity
							pprice - product sub category price
							pdisc - product sub category discount
							desc - product sub category description.
return type 		  	 :	void
--->
<cffunction name="updatedatawithoutimg" output="true" returntype="void" access="public" >
	<cfargument name="psubnameselect" type="string" required="true" default="">
	<cfargument name="psubname" type="string" required="true" default="">
	<cfargument name="qty" type="numeric" required="true" default="">
	<cfargument name="pprice" type="numeric" required="true" default="">
	<cfargument name="pdisc" type="numeric" required="true" default="">
	<cfargument name="desc" type="string" required="true" default="">
	<cfquery >
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryName='#ARGUMENTS.psubname#',
											ProductSubCategoryQty= #ARGUMENTS.qty# ,
											ProductSubCategoryPrice= #ARGUMENTS.pprice#,
											ProductDiscount=#ARGUMENTS.pdisc#,
											ProductDescription='#ARGUMENTS.desc#'
											WHERE ProductSubCategoryName = '#ARGUMENTS.psubnameselect#'
	</cfquery>
</cffunction>


<!--- 
function name			 :	checkaddress
description				 :	this function retrieves and returns the buyers address.
arguments description	 :	no arguments.
return type 		  	 :	query
--->
<cffunction name="checkaddress" returnType="query" access="public">
	<cfquery name="retrieveAddress" >
		SELECT * FROM dbo.ADDRESS WHERE PhoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
	<cfreturn retrieveAddress>
</cffunction>


<!--- 
function name			 :	getproduct
description				 :	this function retrieves and returns the product sub category details.
arguments description	 :	id - product sub category id.
return type 		  	 :	query
--->
<cffunction name="getproduct" returnType="query">
<cfargument name="id" type="numeric">
	<cfquery name="getproduct"  >
		SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId = #ARGUMENTS.id#
	</cfquery>
	<cfreturn getproduct>
</cffunction>



</cfcomponent>
