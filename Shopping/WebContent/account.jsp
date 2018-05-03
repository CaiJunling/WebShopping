<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Account</title>
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
<div class="account">
	<div class="container">
		<h1>登录</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<form>

					<span>手机号码</span>
					<input type="text"> 
				
					<span>密码</span>
					<input type="text"> 
					<div class="word-in">
				  		<a class="forgot" href="#">忘记密码？</a>
				 		 <input type="submit" value="登录">
				  	</div>
			    </form>
			   </div>	
			    <div class="col-md-6 login-left">
			  	 <h4>新用户？</h4>
				 <p>通过在我们的商店中创建一个帐户，您将能够更快地通过结帐过程，存储多个送货地址，查看和跟踪您的帐户和更多的订单。</p>
				 <a class="acount-btn" href="register.jsp">创建一个新账户</a>
			   </div>
			   <div class="clearfix"> </div>
			 </div>
	</div>
</div>

<!--footer-->
<%@include file="foot.jsp" %>

<!--//footer-->
</body>
</html>