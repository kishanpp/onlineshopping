<link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400,700&subset=latin-ext" rel="stylesheet">
<link href="/css/trendingproducts.css" rel="stylesheet">

<div class=" container-area">
	
			<h4  > TRENDING PRODUCTS</h4>
			
			<cfset newvar1=myobject.retrieve_data1() />
			<cfset newvar2=myobject.retrieve_data2() />
			<cfset newvar3=myobject.retrieve_data3() />
			<cfset newvar4=myobject.retrieve_data4() />
			<cfset newvar5=myobject.retrieve_data5() />
			<cfset newvar6=myobject.retrieve_data6() />
			<cfset newvar7=myobject.retrieve_data7() />
			<cfset newvar8=myobject.retrieve_data8() />
			
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
					<a href="product.cfm?id=13"><img src="data:image/jpg;base64,#toBase64(newvar1.Photo)#"   /></a>
				</cfoutput>
        <div class="carousel-caption">
          <h3 class="info"><cfoutput>#newvar1.ProductSubCategoryName#</cfoutput></h3>
          <p class="info"><cfoutput>&##8377 #newvar1.ProductSubCategoryPrice# /- </cfoutput></p>
        </div>
   </div>

      <div class="item">
				
				<cfoutput>
					<a href="product.cfm?id=15"> <img src="data:image/jpg;base64,#toBase64(newvar2.Photo)#"   /></a>
				</cfoutput>
				
        <div class="carousel-caption info" >
          <h3 class="info"><cfoutput>#newvar2.ProductSubCategoryName#</cfoutput></h3>
          <p class="info"><cfoutput>&##8377 #newvar2.ProductSubCategoryPrice# /-</cfoutput></p>
        </div>
      </div>
		
      <div class="item">
				
				<cfoutput>
					<a href="product.cfm?id=17">
						<img src="data:image/jpg;base64,#toBase64(newvar3.Photo)#"></a>
				</cfoutput>
				
				
        <div class="carousel-caption">
          <h3 class="info"><cfoutput>#newvar3.ProductSubCategoryName#</cfoutput></h3>
          <p class="info"><cfoutput>&##8377 #newvar3.ProductSubCategoryPrice# /-</cfoutput></p>
        </div>
      </div>
		
      <div class="item">
        
		
				<cfoutput>
					<a href="product.cfm?id=23"><img src="data:image/jpg;base64,#toBase64(newvar4.Photo)#"   /> </a>
				</cfoutput>
				
				
        <div class="carousel-caption">
          <h3 class="info"><cfoutput>#newvar4.ProductSubCategoryName#</cfoutput></h3>
          <p class="info"><cfoutput>&##8377 #newvar4.ProductSubCategoryPrice# /-</cfoutput></p>
        </div>
      </div>
  
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
<ul class=" slideContainer list-inline list-unstyled " id="money_start" >


<li class="productbox slideItem">
<a  href="product.cfm?id=13">
    <img src="data:image/jpg;base64,#toBase64(newvar1.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle"> #newvar1.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 8000</span> 
	<div class="producttitle"> &nbsp  &nbsp  &##8377 #newvar1.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>



<li class="productbox slideItem">
<a href="product.cfm?id=15">
    <img src="data:image/jpg;base64,#toBase64(newvar2.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle"> #newvar2.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 1256</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar2.ProductSubCategoryPrice#</div>
	</div>
</a>
</li> 



<li class="productbox slideItem">
<a href="product.cfm?id=17">
    <img src="data:image/jpg;base64,#toBase64(newvar3.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle"> #newvar3.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 376</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar3.ProductSubCategoryPrice#</div> 
	</div>
</a>
</li>



<li class="productbox slideItem">
<a href="product.cfm?id=23">
    <img src="data:image/jpg;base64,#toBase64(newvar4.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle">#newvar4.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 8945</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar4.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>




<li class="productbox slideItem">
<a href="product.cfm?id=14">
    <img src="data:image/jpg;base64,#toBase64(newvar5.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle">#newvar5.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 18453</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar5.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>



<li class="productbox slideItem">
<a href="product.cfm?id=16">
    <img src="data:image/jpg;base64,#toBase64(newvar6.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle">#newvar6.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 1567</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar6.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>




<li class="productbox slideItem">
<a href="product.cfm?id=18">
    <img src="data:image/jpg;base64,#toBase64(newvar7.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle">#newvar7.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 547</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar7.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>




<li class="productbox slideItem">
<a href="product.cfm?id=24">
    <img src="data:image/jpg;base64,#toBase64(newvar8.Photo)#" class="img-responsive">
    <div class="detail">
	<div class="producttitle">#newvar8.ProductSubCategoryName#</div> 
	<span class="oldprice"> &##8377 3876</span> 
	<div class="producttitle"> &nbsp  &nbsp &##8377 #newvar8.ProductSubCategoryPrice#</div>
	</div>
</a>
</li>




</ul>
</div>

</cfoutput>
</div>
 

<script src="/js/trendingproducts.js" language="javascript" type="text/javascript"></script>





