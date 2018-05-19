<%@page import="com.oracle.shopping.model.bean.Clothes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.shopping.model.dao.ClothesDAOImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>> -->
<%  if(request.getAttribute("allClothess")==null){
		request.getRequestDispatcher("ClothesServlet?method=index").forward(request, response);
} %>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
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
<%@include file="top.jsp" %>
<!--banner-->
<div class="banner">
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive"	src="images/1.png" alt="">
	</div>
	<div class="col-sm-6 matter-banner">
	 	<div class="slider">
	    	<div class="callbacks_container">
	      		<ul class="rslides" id="slider">
	        		<li>
	          			<img src="images/1.jpg" alt="">
	       			 </li>
			 		 <li>
	          			<img src="images/2.jpg" alt="">   
	       			 </li>
					 <li>
	          			<img src="images/1.jpg" alt="">
	        		</li>	
	      		</ul>
	 	 	</div>
		</div>
	</div>
	<div class="col-sm-3 banner-mat">
		<img class="img-responsive" src="images/1.png" alt="">
	</div>
	<div class="clearfix"> </div>
</div>
<!--//banner-->
<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >ææºç½ç«æ¨¡æ¿</a></div>
<!--content-->
<div class="content">
	<div class="container">
		<div class="content-top">
			<h1>最热商品</h1>
			<div class="content-top1">
			<!-- 一个商品显示 -->
			<%
			ArrayList<Clothes>  allClothess =(ArrayList<Clothes>)request.getAttribute("allClothess");
			int i=0;
			for(Clothes c:allClothess) 
			{
				
			%>
				<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="ClothesServlet?method=single&clothes_Id=<%=c.getClothes_Id() %>">
							<img class="img-responsive" src="<%=c.getClothes_imgId() %>" alt="" />
						</a>
						<h3><a href="ClothesServlet?method=single&clothes_Id=<%=c.getClothes_Id() %>"><%=c.getClothes_class() %></a></h3>
						<div class="price">
								<h5 class="item_price">￥<%=c.getClothes_price() %></h5>
								<a href="ShoppingCarServlet?method=add&clothes_Id=<%=c.getClothes_Id() %>" class="item_add">加入购物车</a>
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>	
			<%
			i++;
			if(i%4==0){
				%>
				<div class="clearfix"> </div>
				<div class="content-top1">
				<%
			}
			
			
			} %>
			
			</div>	
			<a href="ClothesServlet?method=listClothesByPage&page=1&count=8">查看更多</a>
				
		</div>
	</div>
</div>
<!--//content-->
<%@include file="foot.jsp" %>

</body>
</html>