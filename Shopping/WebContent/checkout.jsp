<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>购物车</title>
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
<c:import url="top.jsp"></c:import>
<!--//header-->
<!---->
<div class="container">
	<div class="check-out">
		<h1>购物车</h1>
    	    <table >
		         <tr>
			        <th>商品信息</th>
			        <th>数量</th>		
			        <th>单价</th>
			        <th>总计</th>
			        <th>操作</th>
		         </tr>
		         <c:if test="${empty  sessionScope.clothess  }">
					<tr><td colspan="5">购物车里什么都没有呢，去首页逛逛吧~&nbsp;&nbsp;<a href="index.jsp">GO</a></td></tr>
				 </c:if>
				<!-- 购物商品列表-->
				<c:forEach var="s"  items="${sessionScope.clothess }">
		        <tr>
			        <td class="ring-in"><a href="single.jsp" class="at-in">
			           <img src="${s.key.clothes_imgId}" class="img-responsive" alt=""></a>
			           <div class="sed">
				       <h5>${s.key.clothes_class}&nbsp;${s.key.clothes_brand}&nbsp;${s.key.clothes_name}</h5>
				       <p>${s.key.clothes_des}</p>
			
			           </div>
			           <div class="clearfix"> </div>
			        </td>
			        <td class="check">
			              <input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			        <td>${s.key.clothes_price}</td>
			        <td>${s.key.clothes_price}</td>
			        <td>
			            <a  href="javascript:deleteCarFromGouwuche('ShoppingCarServlet?method=deleteCar&clothes_Id=${s.key.clothes_Id }')">
			                                      删除</td>
		        </tr>
		        </c:forEach>
		        
		        
		  
		 <!-- <tr>
		  <td class="ring-in"><a href="single.html" class="at-in"><img src="images/ce2.jpg" class="img-responsive" alt=""></a>
			<div class="sed">
				<h5>Sed ut perspiciatis unde</h5>
				<p>(At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium) </p>
			</div>
			<div class="clearfix"> </div></td>
			<td class="check"><input type="text" value="1" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='';}"></td>		
			<td>$150.00</td>
			<td>$150.00</td>
			<td>删除</td>
		  </tr> -->
	</table>
	<a href="#" class=" to-buy">结算</a>
	<a href="javascript:deleteAll()" class="to-buy simpleCart_empty">清空购物车</a>
	<div class="clearfix"> </div>
    </div>
</div>
<%@include file="foot.jsp" %>
</body>
</html>

<script>
	function deleteCarFromGouwuche(url){
		//ShoppingCarServlet?method=deleteCar&carid=${s.key.carId }
		var  userChoice=window.confirm("您确认要删除这个商品吗?");
		if(userChoice)
		{
			location.href=url;
		}
	}
	function deleteAll(){
		var  userChoice=window.confirm("您真的要删除所有的商品吗?");
		if(userChoice)
		{
			location.href='ShoppingCarServlet?method=deleteAll';
		}
	}
	
</script>