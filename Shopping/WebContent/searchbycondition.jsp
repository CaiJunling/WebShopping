<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>条件搜索</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
<!-- slide -->
<script src="js/responsiveslides.min.js"></script>
   <script>
    $(function () {
      $("#slider").responsiveSlides({
      	auto: true,
      	speed: 500,
        namespace: "callbacks",
        pager: true,
      });
    });
  </script>
</head>
<body>
<%@include file="top.jsp" %>>
<div class="account">
	<div class="container">
		<h1>条件搜索</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<!-- 条件搜索 -->		
				<form action="ClothesServlet">
				<input type="hidden"   name="method"  value="search"/>
				<!-- <input type="hidden" name="page" value="1" />
				<input type="hidden" name="count" value="8" /> -->
				<fieldset>
					<label >类别:</label>
					<input type="text"  name="clothes_class"/>

				</fieldset>
				<br/>
				<fieldset>
					<label >品牌:</label>
					<input type="text"  id="clothes_brand" name="clothes_brand"/>
				</fieldset>
				<br/>				
				<fieldset>
					<label >名称:</label>
					<input type="text"  id="clothes_name" name="clothes_name"/>
				</fieldset>
				<br/>
				<fieldset>
					<label >单价:</label>
					<input type="text"  id="clothes_minprice" name="clothes_minprice" style="width: 89px"/>-
					<input type="text"  id="clothes_maxprice" name="clothes_maxprice" style="width: 88.5px"/>
				</fieldset>	
				<br/>
				<button id="submitSearch"  type="submit" style="background-color:#52d0c4;color:white;border:0px;width:100px;height:34.78px;font-size:16px">搜索</button>
				</form>
			   </div>
			   
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>


<%@include file="foot.jsp" %>>
</body>
</html>