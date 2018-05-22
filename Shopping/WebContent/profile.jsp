<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>个人中心</title>
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
		<h1>个人中心</h1>
		<div class="account_grid">
			   <div class="col-md-6 login-right">
				<form action="UserServlet" method="post"  enctype="multipart/form-data">
					<input  type="hidden"  name="userID"  value="${user.userID }"/>
					<header class="header">
						<h2 class="title"><span class="description">账号：${user.userName }</span></h2>
						<input type="hidden" name="userName" value="${user.userName }" /> 

					</header><!--/ .header -->
					
					<div class="heading">
						
						<img src="${user.imageId }"   width="200" height="200"  style="border:1px solid gray;border-radius: 100px;"/>
						<input type="hidden" name="imageId" value="${user.imageId }" />
						<input type="file"  name="ImageId" />
<!-- 						<dl> -->
<!-- 							<dt><span class="currency">$</span></dt> -->
<!-- 							<dd><span class="int">25</span></dd> -->
<!-- 							<dd><span class="sup" data-month="p/m">99</span></dd> -->
<!-- 						</dl> -->
						
					</div><!--/ .price-->
                    
					<ul class="features">
					    <br/>
						<li><h3><span>昵称：<input   name="nickName"  value="${user.nickName }"/></span></h3></li>
						<br/>
						<li><h3><span>性别：
							<c:choose>
								<c:when test="${user.sex eq 1 }">
									<input type="radio" name="sex" value="1" checked="checked"/>男
									<input type="radio" name="sex" value="0" />女
								</c:when>
								<c:otherwise>
										<input type="radio" name="sex" value="1" />男
									<input type="radio" name="sex" value="0"checked="checked" />女
								</c:otherwise>
							</c:choose>
						</span></h3></li>
						<br/>
						<li><h3><span>年龄：
						<select name="birthday">
							<c:forEach var="birthday" begin="1" end="100">
								<c:if test="${birthday eq user.birthday }">
										<option selected="selected" value="${birthday}">${birthday }</option>
								</c:if>
								<c:if test="${birthday ne user.birthday }">
										<option value="${birthday}">${birthday }</option>
								</c:if>
							</c:forEach>
						</select>
						</span></h3></li>
						<br/>
						<li><h3><span>电话：<input   name="tel"  value="${user.tel }"/></span></h3></li>
						
					</ul><!--/ .features -->

					<footer class="footer">
					    <br/>
						<input type="submit" value="修改" style="font-size: 16px"/>&nbsp;&nbsp;<input type="reset" value="清空" style="background-color:#52d0c4;color:white;border:0px;width:64px;height:34.78px;font-size:16px"/>
					</footer><!--/.footer -->
					</form>
			   </div>
			   
			   
			   	
			 </div>
	</div>
</div>

<%@include file="foot.jsp" %>>
</body>
</html>