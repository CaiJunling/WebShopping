<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Contact</title>
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
<%@include file="top.jsp" %>
<div class="contact">
			<div class="container">
				<h1>联系我们</h1>
				
				<div class="contact-grids">
					<div class="contact-form">
							<form>
								<div class="contact-bottom">
									<div class="col-md-4 in-contact">
										<span>姓名：</span>
										<input type="text" >
									</div>
									<div class="col-md-4 in-contact">
										<span>Email：</span>
										<input type="text" >
									</div>
									<div class="col-md-4 in-contact">
										<span>手机号码：</span>
										<input type="text">
									</div>
									<div class="clearfix"> </div>
								</div>
							
								<div class="contact-bottom-top">
									<span>留言：</span>
									<textarea > </textarea>								
									</div>
								<input type="submit" value="发送">
							</form>
						</div>
				<div class="address">
					<div class=" address-more">
						<h2>地址：</h2>
						<div class="col-md-4 address-grid">
							<i class="glyphicon glyphicon-map-marker"></i>
							<div class="address1">
								<p>湖北文理学院</p>
								<p>TL 88888-66666</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-phone"></i>
							<div class="address1">
								<p>+6688688</p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="col-md-4 address-grid ">
							<i class="glyphicon glyphicon-envelope"></i>
							<div class="address1">
								<p><a href="mailto:@example.com"> @huwen.com</a></p>
							</div>
							<div class="clearfix"> </div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--//content-->

<%@include file="foot.jsp" %>
</body>
</html>