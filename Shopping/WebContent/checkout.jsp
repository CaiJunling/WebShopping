<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
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
</head>
<body>
<!--header-->
<%@include file="top.jsp" %>
<!--//header-->
<!---->
<div class="container">
	<div class="check-out">
		<h1>Checkout</h1>
    	    <table >
		  <tr>
			<th>Item</th>
			<th>Qty</th>		
			<th>Prices</th>
			<th>Delery Detials</th>
			<th>Subtotal</th>
		  </tr>
		  <tr>
			<td class="ring-in"><a href="single.html" class="at-in"><img src="images/ce.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>Sed ut perspiciatis unde</h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium) </p>
			
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>$100.00</td>
			<td>FREE SHIPPING</td>
			<td>$100.00</td>
		  </tr>
		  <tr>
		  <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ce1.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>Sed ut perspiciatis unde</h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium ) </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>$200.00</td>
			<td>FREE SHIPPING</td>
			<td>$200.00</td>
		  </tr>
		  <tr>
		  <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ce2.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>Sed ut perspiciatis unde</h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium) </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>$150.00</td>
			<td>FREE SHIPPING</td>
			<td>$150.00</td>
		  </tr>
	</table>
	<a href="#" class=" to-buy">PROCEED TO BUY</a>
	<div class="clearfix"> </div>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>