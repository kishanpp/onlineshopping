<cfcomponent displayname="OnlineShoppingDatabaseConnectivity" hint="Handles the Database connectivity">
 
<!--- 
function name			 :	getinventorycategory
description				 :	this functions retrieves the inventory category details.
arguments description	 :	no arguments
return type 		  	 :	query
--->
<cffunction name="getinventorycategory" output="true" returntype="query" access="public" hint="get product category to display in index.cfm left pane" >
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductCategory
	</cfquery>
	<cfreturn resultset1>
</cffunction>
  
  
<cffunction name="getinventorysubcategory" output="true" returntype="query" access="public" hint="get product sub category to display in index.cfm left pane">
	<cfargument name="arg" type="numeric" required="true" >
	<cfquery name="resultset2" >
		SELECT * FROM dbo.ProductSubCategory 
		INNER JOIN dbo.ProductCategory
		ON dbo.ProductSubCategory.InventoryCategoryId =dbo.ProductCategory.InventoryCategoryId
		WHERE dbo.ProductCategory.InventoryCategoryId = #arg#
	</cfquery>
	<cfreturn resultset2>
</cffunction>	
  
  
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
  
  
<cffunction name="retrieve_data1" output="true" returntype="query" access="public">
	<cfquery name="grab_image"  >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=13
	</cfquery>
	<cfreturn grab_image>
</cffunction>
 
 
<cffunction name="retrieve_data2" output="true" returntype="query" access="public">
	<cfquery name="grab_image"  >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=15
	</cfquery>
	<cfreturn grab_image>
</cffunction>
 
 
<cffunction name="retrieve_data3" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
	SELECT *
	FROM dbo.ProductSubCategory
	WHERE InventorySubCategoryId=17
	</cfquery>
	<cfreturn grab_image>
</cffunction>
 
 
<cffunction name="retrieve_data4" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=23
	</cfquery>
	<cfreturn grab_image>
</cffunction>
 

<cffunction name="retrieve_data5" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=14
	</cfquery>
	<cfreturn grab_image>
</cffunction>


<cffunction name="retrieve_data6" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=16
	</cfquery>
	<cfreturn grab_image>
</cffunction>


<cffunction name="retrieve_data7" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=18
	</cfquery>
	<cfreturn grab_image>
</cffunction>
 
 
<cffunction name="retrieve_data8" output="true" returntype="query" access="public">
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=24
	</cfquery>
	<cfreturn grab_image>
</cffunction>


<cffunction name="getdatabyid" output="true" returntype="query" access="public">
	<cfargument name="getproductdetails" type="any" required="true" >
	<cfquery name="grab_image" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=#getproductdetails#
	</cfquery>
	<cfreturn grab_image>
</cffunction>


<cffunction name="getproductqty" output="true" returntype="boolean" access="public">
	<cfargument name="id" type="any" required="true" >
	<cfquery name="getqtyfromProductSubCategory" >
		SELECT *
		FROM dbo.ProductSubCategory
		WHERE InventorySubCategoryId=#id#
	</cfquery>

	<cfquery name="getqtyfromCart"  datasource="OnlineShopping" >
		SELECT *
		FROM dbo.Cart
		WHERE (InventorySubCategoryId=#id# AND phoneNumber='#SESSION.userPhoneNumber#')
	</cfquery>

	<cfif getqtyfromCart.OrderQty LT getqtyfromProductSubCategory.ProductSubCategoryQty>
		<cfreturn TRUE>
	<cfelse>
		<cfreturn FALSE>
	</cfif>
</cffunction>


<cffunction name="addressstore" output="true" returntype="void" access="public" >
	<cfargument name="name" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	<cfargument name="city" type="string" required="true">
	<cfargument name="state" type="string" required="true">
	<cfargument name="zip" type="numeric" required="true">
	<cfquery  >
		INSERT INTO dbo.Address (Name,Address,City,State,Zip,PhoneNumber) VALUES ('#name#','#address#','#city#','#state#',#zip#,'#session.userPhoneNumber#')
	</cfquery>
</cffunction>

 
<cffunction name="updateaddress" output="true" returntype="void" access="public" >
	<cfargument name="name" type="string" required="true">
	<cfargument name="address" type="string" required="true">
	<cfargument name="city" type="string" required="true">
	<cfargument name="state" type="string" required="true">
	<cfargument name="zip" type="numeric" required="true">
	<cfquery name="resultset1" >
		UPDATE dbo.Address SET Name='#name#',Address='#address#',City='#city#',State='#state#',Zip=#zip# WHERE PhoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
 </cffunction>
 
 
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


<cffunction name="gettotalamount" output="true" returntype="query" access="public">
	<cfquery name="resultset1">
		SELECT * FROM dbo.Orders WHERE OrderId = #SESSION.OrderId#
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<cffunction name="getitems" output="true" returntype="query" access="public">
	<cfquery name="resultset1">
		SELECT * FROM dbo.ProductSubCategory INNER JOIN dbo.OrderItem
					ON dbo.OrderItem.InventorySubCategoryId=dbo.ProductSubCategory.InventorySubCategoryId
					WHERE OrderId = #SESSION.OrderId#
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<cffunction name="getaddress" output="true" returntype="query" access="public">
	<cfquery name="resultset1" >
		SELECT * FROM dbo.Address WHERE PhoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfreturn resultset1>
</cffunction>


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


<cffunction name="getcartdataid" output="true" returntype="query" access="remote">
	<cfquery name="resultset1" >
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

	<cfreturn resultset1>
</cffunction>


<cffunction name = "getcartdata" output = "true" returntype = "query" access = "public">
	<cfargument name=id type="numeric" required="true">
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId = #id#
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<cffunction name="getno" output="true" returntype="numeric" access="public">
	<cfquery name="resultset2" >
		SELECT SUM(OrderQty) AS total FROM dbo.Cart WHERE phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfif resultset2.total GTE 0>
		<cfreturn resultset2.total>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>


<cffunction name="removefromcart" output="true" returntype="any" access="remote">
	<cfargument name="value" type="numeric" required="true">
	<cfquery name="resultset1">
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


<cffunction name="buyallfromcart" output="true" returntype="numeric" access="remote">
	<cfargument name="date" type="date" required="true"> 
	
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductSubCategory
		INNER JOIN dbo.Cart
		ON dbo.ProductSubCategory.InventorySubCategoryId=dbo.Cart.InventorySubCategoryId
		WHERE dbo.Cart.phoneNumber = '#SESSION.userPhoneNumber#'
	</cfquery>
	<cfset total = 0>
		<cfloop query="resultset1">
			<cfif #resultset1.ProductDiscount# EQ 0>
				<cfset total = total + #resultset1.ProductSubCategoryPrice#>
			<cfelse>
				<cfset discountedvalue = #resultset1.ProductSubCategoryPrice#  - ((#resultset1.ProductDiscount#)/100)*#resultset1.ProductSubCategoryPrice#>
				<cfset total = total + #discountedvalue#>
			</cfif>	
		</cfloop>
	<cfquery name="resultset3" >
		INSERT INTO dbo.Orders (OrderDate,TotalAmount,State,PhoneNumber) VALUES('#date#',#total#,'OrderPlaced','#SESSION.userPhoneNumber#')
	</cfquery>
	<cfquery name="resultset2" >
		SELECT TOP 1 * FROM dbo.Orders ORDER BY OrderId DESC
	</cfquery>
		
	<cfquery name="resultset4" >
		SELECT * FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
	<cfset SESSION.OrderId = #resultset2.OrderId# >
	<cfloop query="resultset4">
		<cfquery name="resultset5" >
			INSERT INTO dbo.OrderItem (OrderQty,OrderId,InventorySubCategoryId) VALUES (#resultset4.OrderQty#,#SESSION.OrderId#,#resultset4.InventorySubCategoryId#)
		</cfquery>
	</cfloop>

	<cfquery>
		DELETE FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>

	<cfloop query="resultset1">
		<cfquery name="resultset8" >
			SELECT OrderQty FROM dbo.OrderItem WHERE (InventorySubCategoryId=#resultset1.InventorySubCategoryId# AND OrderId=#SESSION.OrderId#)
		</cfquery>
		<cfset productqty = resultset8.OrderQty>
		<cfquery >
			UPDATE dbo.ProductSubCategory SET ProductSubCategoryQty=(ProductSubCategoryQty-#productqty#) WHERE InventorySubCategoryId=#resultset1.InventorySubCategoryId#
		</cfquery>
	</cfloop>

	<cfquery name="resultset7" >
		SELECT COUNT(*) AS total FROM dbo.Cart WHERE phoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>

	<cfif resultset7.total GTE 0>
		<cfreturn resultset7.total>
	<cfelse>
		<cfreturn 0>
	</cfif>
</cffunction>


<cffunction name="getcartitemstotalamount" output="true" returntype="numeric" access="public">
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
				<cfset total = total + #resultset2.ProductSubCategoryPrice#>
			<cfelse>
				<cfset discountedvalue = #resultset2.ProductSubCategoryPrice#  - ((#resultset2.ProductDiscount#)/100)*#resultset2.ProductSubCategoryPrice#>
				<cfset total = total + #discountedvalue#>
			</cfif>			
		</cfloop>
	</cfloop>
	<cfreturn total>
</cffunction>


<cffunction name="productname" access="remote" returntype="array">
	<cfargument name="search" type="any" required="false" default="">
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
 
 
<cffunction name="adddata" output="true" returntype="void" access="public" >
	<cfargument name="pcat" type="any" required="false" default="">
	<cfargument name="pname" type="any" required="false" default="">
	<cfargument name="qty" type="any" required="false" default="">
	<cfargument name="pprice" type="any" required="false" default="">
	<cfargument name="pimg" type="any" required="false" default="">
	<cfargument name="pdisc" type="any" required="false" default="">
	<cfargument name="desc" type="any" required="false" default="">

	<cfquery name="resultset1">
		SELECT * FROM dbo.ProductCategory WHERE ProductName = '#arguments.pcat#'
	</cfquery>
	<cfquery  >
		INSERT INTO dbo.ProductSubCategory 
		(InventoryCategoryId,ProductSubCategoryName,ProductSubCategoryQty,ProductSubCategoryPrice,ProductDescription,ProductDiscount,Photo) SELECT
		#resultset1.InventoryCategoryId#,'#arguments.pname#',#arguments.qty#,#arguments.pprice#,'#arguments.desc#',#arguments.pdisc#,bulkcolumn from openrowset (bulk '#arguments.pimg#',single_blob) as BLOB 
	</cfquery>
</cffunction>
 
 
<cffunction name="inventorysubcategory" output="true" returntype="array" access="remote" >
	<cfargument name="pname" type="any" required="false" default="">
	 
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductCategory WHERE ProductName = '#arguments.pname#'
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
 
 
<cffunction name="deletedata" output="true" returntype="void" access="public" >
	<cfargument name="psubcat" type="any" required="false" default="">
	<cfquery >
		DELETE FROM dbo.ProductSubCategory WHERE ProductSubCategoryName = '#arguments.psubcat#'
	</cfquery>
</cffunction>

 
 
<cffunction name="inventorysubcategorydata" output="true" returntype="array" access="remote" >
	<cfargument name="psubname" type="any" required="false" default="">
	 
	<cfquery name="resultset1" >
		SELECT * FROM dbo.ProductSubCategory WHERE ProductSubCategoryName = '#arguments.psubname#'
	</cfquery>

	<cfset var result=ArrayNew(1)>
	<cfloop query="resultset1">
		<cfset ArrayAppend(result,ProductSubCategoryName)>
		<cfset ArrayAppend(result,ProductSubCategoryQty)>
		<cfset ArrayAppend(result,ProductSubCategoryPrice)>
		<cfset ArrayAppend(result,ProductDescription)>
		<cfset ArrayAppend(result,ProductDiscount)>
	</cfloop>
	<cfreturn result>
</cffunction>
 
 
<cffunction name="updatedata" output="true" returntype="void" access="public" >
	<cfargument name="psubnameselect" type="any" required="false" default="">
	<cfargument name="psubname" type="any" required="false" default="">
	<cfargument name="qty" type="any" required="false" default="">
	<cfargument name="pprice" type="any" required="false" default="">
	<cfargument name="desc" type="any" required="false" default="">
	<cfargument name="pdisc" type="any" required="false" default="">
	<cfargument name="pimg" type="any" required="false" default="">
	<cfquery>
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryName='#arguments.psubname#',
											ProductSubCategoryQty= #arguments.qty# ,
											ProductSubCategoryPrice= #arguments.pprice#,
											ProductDescription='#arguments.desc#',
											ProductDiscount=#arguments.pdisc#,
											Photo = bulkcolumn from openrowset (bulk '#arguments.pimg#',single_blob) as BLOB
											WHERE ProductSubCategoryName = '#arguments.psubnameselect#'
	</cfquery>
</cffunction>
 
 
 
<cffunction name="updatedatawithoutimg" output="true" returntype="void" access="public" >
	<cfargument name="psubnameselect" type="any" required="false" default="">
	<cfargument name="psubname" type="any" required="false" default="">
	<cfargument name="qty" type="any" required="false" default="">
	<cfargument name="pprice" type="any" required="false" default="">
	<cfargument name="pdisc" type="any" required="false" default="">
	<cfargument name="desc" type="any" required="false" default="">
	<cfquery >
		UPDATE dbo.ProductSubCategory SET ProductSubCategoryName='#arguments.psubname#',
											ProductSubCategoryQty= #arguments.qty# ,
											ProductSubCategoryPrice= #arguments.pprice#,
											ProductDiscount=#arguments.pdisc#,
											ProductDescription='#arguments.desc#'
											WHERE ProductSubCategoryName = '#arguments.psubnameselect#'
	</cfquery>
</cffunction>

<cffunction name="checkaddress" returnType="query" access="public">
	<cfquery name="resultset1" datasource="OnlineShopping">
		SELECT * FROM dbo.ADDRESS WHERE PhoneNumber='#SESSION.userPhoneNumber#'
	</cfquery>
	<cfreturn resultset1>
</cffunction>


<cffunction name="getproduct" returnType="query">
<cfargument name="id" type="numeric">
	<cfquery name="getproduct" datasource="OnlineShopping" >
		SELECT * FROM dbo.ProductSubCategory WHERE InventorySubCategoryId = #ARGUMENTS.id#
	</cfquery>
	<cfreturn getproduct>
</cffunction>



</cfcomponent>
