<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
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
<div class="container">
	<div class="register">
		<h1>注册</h1>
		  	  <form> 
				 <div class="col-md-6  register-top-grid">
					
					<div class="mation">
						<span>姓名</span>
						<input type="text"> 
					
						<span>昵称</span>
						<input type="text"> 
					 
						 <span>手机号码</span>
						 <input type="text"> 
					</div>
					 <div class="clearfix"> </div>
					   <a class="news-letter" href="#">
						 <label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>记住密码</label>
					   </a>
					 </div>
				     <div class=" col-md-6 register-bottom-grid">
						   
							<div class="mation">
								<span>密码</span>
								<input type="text">
								<span>确认密码</span>
								<input type="text">
							</div>
					 </div>
					 <div class="clearfix"> </div>
				</form>
				
				<div class="register-but">
				   <form>
					   <input type="submit" value="提交">
					   <div class="clearfix"> </div>
				   </form>
				</div>
		   </div>
</div>

<!--footer-->
<%@include file="foot.jsp" %>

<!--//footer-->
</body>
</html>