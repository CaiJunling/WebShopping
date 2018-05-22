<%@page import="com.oracle.shopping.model.bean.Clothes"%>
<%@page import="com.oracle.shopping.model.bean.PageBean"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Products</title>
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
<!--content-->
<div class="products">
	<div class="container">
		<h1>所有商品</h1>
		<div class="col-md-9">
			<div class="content-top1">
			<%
					ArrayList<Clothes>  clothess=(ArrayList<Clothes> )request.getAttribute("clothess");
			        
					for(Clothes  c:clothess) {
						%>
				
				<div class="col-md-3 col-md2">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="ClothesServlet?method=single&clothes_Id=<%=c.getClothes_Id() %>">
							<img class="img-responsive" src="<%=c.getClothes_imgId() %>" alt="" />
						</a>
						<h3><a "ClothesServlet?method=single&clothes_Id=<%=c.getClothes_Id() %>"><%=c.getClothes_class() %>&nbsp;<%=c.getClothes_brand() %></a></h3>
						<div class="price">
								<h5 class="item_price">￥<%=c.getClothes_price() %></h5>
								<a href="ShoppingCarServlet?method=add&clothes_Id=<%=c.getClothes_Id() %>" class="item_add">加入购物车</a>
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>
				<%
					}%>
					</br>
					<!-- 分页代码 -->	
			<div style="width: 100%;margin: auto;text-align:center;">
		<%if(request.getAttribute("pageBean")!=null){ %>
						<a  href="ClothesServlet?method=listClothesByPage&page=1&count=8" >首页</a>
						<a  href="ClothesServlet?method=listClothesByPage&page=<%=((PageBean)request.getAttribute("pageBean")).getPreviousPage()%>&count=8">上一页</a>
						<a  href="ClothesServlet?method=listClothesByPage&page=<%=((PageBean)request.getAttribute("pageBean")).getNextPage()%>&count=8">下一页</a>
						<a  href="ClothesServlet?method=listClothesByPage&page=<%=((PageBean)request.getAttribute("pageBean")).getAllPages()%>&count=8">尾页</a>
						
						当前第<%=((PageBean)request.getAttribute("pageBean")).getNowPage()%>页/总共<%=((PageBean)request.getAttribute("pageBean")).getAllPages()%>页，
						每页<%=((PageBean)request.getAttribute("pageBean")).getEverPageCount()%>条/总共<%=((PageBean)request.getAttribute("pageBean")).getAllCount()%>条,
						跳到第
						
						<select  id="goto"  style="width: 20px;height: 16px; position: relative;top: 6px;"  class="">
						<%
							for(int n=1;n<=((PageBean)request.getAttribute("pageBean")).getAllPages();n++)
							{
								%>
								<option value="<%=n%>"><%=n %></option>
								<%
							}
						%>
						
						</select>页
						<%} %>
						</div>
						<!-- 分页结束 -->
			</div>
				
		</div>
		
		
		
		<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">Categories</h3>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">Men </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.html">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">Women </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.html">Automatic Fails </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">Kids</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.html">Automatic Fails</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">Accesories</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="single.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="single.html">Automatic Fails</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">Shoes</a>
								<ul class="cute">
									<li class="subitem1"><a href="product.html">Cute Kittens </a></li>
									<li class="subitem2"><a href="product.html">Strange Stuff </a></li>
									<li class="subitem3"><a href="product.html">Automatic Fails </a></li>
								</ul>
							</li>
						</ul>
					</div>
				<!--initiate accordion-->
						<script type="text/javascript">
							$(function() {
							    var menu_ul = $('.menu-drop > li > ul'),
							           menu_a  = $('.menu-drop > li > a');
							    menu_ul.hide();
							    menu_a.click(function(e) {
							        e.preventDefault();
							        if(!$(this).hasClass('active')) {
							            menu_a.removeClass('active');
							            menu_ul.filter(':visible').slideUp('normal');
							            $(this).addClass('active').next().stop(true,true).slideDown('normal');
							        } else {
							            $(this).removeClass('active');
							            $(this).next().stop(true,true).slideUp('normal');
							        }
							    });
							
							});
						</script>
<!--//menu-->
<!--seller-->
				<div class="product-bottom">
						<h3 class="cate">Best Sellers</h3>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.html"><img class="img-responsive " src="images/pr.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.html" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.html"><img class="img-responsive " src="images/pr1.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.html" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.html"><img class="img-responsive " src="images/pr2.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.html" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>	
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="single.html"><img class="img-responsive " src="images/pr3.jpg" alt=""></a>	
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2"><a href="single.html" >Lorem ipsum dolor sitamet consectetuer  </a></h6>
							<span class=" price-in1"> $40.00</span>
						</div>	
						<div class="clearfix"> </div>
					</div>		
				</div>

<!--//seller-->
<!--tag-->
				<div class="tag">	
						<h3 class="cate">Tags</h3>
					<div class="tags">
						<ul>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">dress</a></li>
							<li><a href="#">design</a></li>
							<li><a href="#">fashion</a></li>
							<li><a href="#">lorem</a></li>
							<li><a href="#">dress</a></li>
						<div class="clearfix"> </div>
						</ul>
				</div>					
			</div>
		</div>
		<div class="clearfix"> </div>
	</div>
</div>
<!--//content-->
<!--footer-->
<%@include file="foot.jsp" %>
<script type="text/javascript">
			$(document).ready(function(){
				$("#goto").change(function(){
					location.href='ClothesServlet?method=listClothesByPage&page='+$(this).val()+'&count=8';//用js发起请求
				})
			})
		</script>
<!--//footer-->
</body>
</html>