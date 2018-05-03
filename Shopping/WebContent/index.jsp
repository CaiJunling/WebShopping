<%@page import="com.oracle.shopping.model.bean.Clothes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.shopping.model.dao.ClothesDAOImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 既然jsp一打开就要显示数据库里的车辆信息，也就是说我们这个首页里面应该有一些java代码去查询数据库 -->
<%
			//java code	
			//在jsp里面的java代码里面，你可以不用声明，就直接使用的java对象就是jsp的内置对象
			//内置对象是不用开发人员自己创建的一些java对象(web容器=tomcat)
			
			
			//out.write("hello world");
%>

<%
//在页面没有加载完之前，先把这个页面要显示的数据查出来，准备好，下面才可以用
ClothesDAOImp  dao=new ClothesDAOImp();
ArrayList<Clothes> allClothess=dao.listRecentClothessByCount(16);//这里应该调用查询N个车辆信息的方法，把需要显示在首页的车辆信息查询出来


%>


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
		<img class="img-responsive" src="images/7.png" alt="">
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
			int i=0;
			for(Clothes c:allClothess) 
			{
				
			%>
				<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.jsp?clothes_Id=<%=c.getClothes_Id() %>">
							<img class="img-responsive" src="<%=c.getClothes_imgId() %>" alt="" />
						</a>
						<h3><a href="single.jsp"><%=c.getClothes_class() %></a></h3>
						<div class="price">
								<h5 class="item_price">￥<%=c.getClothes_price() %></h5>
								<a href="#" class="item_add">加入购物车</a>
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
				
		</div>
	</div>
</div>
<!--//content-->
<%@include file="foot.jsp" %>
</body>
</html>