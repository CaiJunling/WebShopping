<%@page import="com.oracle.shopping.model.bean.Clothes"%>
<%@page import="com.oracle.shopping.model.dao.ClothesDAOImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//在页面加载前，先把这个页面要显示的数据准备好
	ClothesDAOImp  dao=new ClothesDAOImp();

	Clothes clothesInfo=dao.getClothesInfoByClothesId(Integer.parseInt(request.getParameter("clothes_Id")));
	
%>


<!DOCTYPE html>
<html>
<head>
<title>Single</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />	
<!--//theme-style-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!---->
</head>
<body>

<%@include file="top.jsp" %>
<!---->
<div class="single">

<div class="container">
<div class="col-md-9">
	<div class="col-md-5 grid">		
		<div class="flexslider">
			  <ul class="slides">
			    <li data-thumb="<%=clothesInfo.getClothes_imgId()%>">
			        <div class="thumb-image"> <img src="<%=clothesInfo.getClothes_imgId()%>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb="<%=clothesInfo.getClothes_imgId()%>">
			         <div class="thumb-image"> <img src="<%=clothesInfo.getClothes_imgId()%>" data-imagezoom="true" class="img-responsive"> </div>
			    </li>
			    <li data-thumb="<%=clothesInfo.getClothes_imgId()%>">
			       <div class="thumb-image"> <img src="<%=clothesInfo.getClothes_imgId()%>" data-imagezoom="true" class="img-responsive"> </div>
			    </li> 
			  </ul>
		</div>
	</div>	
<div class="col-md-7 single-top-in">
						<div class="single-para simpleCart_shelfItem">
							<h1><%=clothesInfo.getClothes_class()%>&nbsp;<%=clothesInfo.getClothes_brand()%>&nbsp;<%=clothesInfo.getClothes_name()%></h1>
							<p><%=clothesInfo.getClothes_des() %></p>
							<!--  <div class="star-on">
								<ul>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
									<li><a href="#"><i class="glyphicon glyphicon-star"> </i></a></li>
								</ul>
								<div class="review">
									<a href="#"> 3 reviews </a>/
									<a href="#">  Write a review</a>
								</div>
							<div class="clearfix"> </div>
							</div>-->
							<div class="clearfix"> </div>
								<label  class="add-to item_price">￥<%=clothesInfo.getClothes_price() %></label>
							
							<div class="available">
								<h6>购买详情:</h6>
								<ul>
									
								<li>尺寸:<select>
									<option>S</option>
									<option>M</option>
									<option>L</option>
									<option>XL</option>
									<option>XXL</option>
								</select></li>
								<li>数量:
										<input type="text" value="0" style="width:60px">
										</li>
							</ul>
						</div>
								<a href="#" class="cart item_add">立即购买</a>
						</div>
					</div>
			<div class="clearfix"> </div>
			<div class="content-top1">
				<div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="images/pi6.png" alt="" />
						</a>
						<h3><a href="single.html">Jeans</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
					</div>
				</div>	
			<div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.html">
							<img class="img-responsive" src="images/pi7.png" alt="" />
						</a>
						<h3><a href="single.html">Tops</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			<div class="col-md-4 col-md3">
					<div class="col-md1 simpleCart_shelfItem">
						<a href="single.jsp">
							<img class="img-responsive" src="images/pi.png" alt="" />
						</a>
						<h3><a href="single.html">Tops</a></h3>
						<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"> </div>
						</div>
						
					</div>
				</div>	
			
			<div class="clearfix"> </div>
			</div>		
</div>
<!----->
<div class="col-md-3 product-bottom">
			<!--categories-->
				<div class=" rsidebar span_1_of_left">
						<h3 class="cate">种类</h3>
							 <ul class="menu-drop">
							<li class="item1"><a href="#">男装 </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">街头风 </a></li>
									<li class="subitem2"><a href="single.html">职场装 </a></li>
									<li class="subitem3"><a href="single.html">文艺风 </a></li>
								</ul>
							</li>
							<li class="item2"><a href="#">女装 </a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">复古风 </a></li>
									<li class="subitem2"><a href="single.html">白领  </a></li>
									<li class="subitem3"><a href="single.html">文艺风 </a></li>
								</ul>
							</li>
							<li class="item3"><a href="#">童装</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">田园风 </a></li>
									<li class="subitem2"><a href="single.html">简约 </a></li>
									<li class="subitem3"><a href="single.html">名族风</a></li>
								</ul>
							</li>
							<li class="item4"><a href="#">配饰</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">项链 </a></li>
									<li class="subitem2"><a href="single.html">皮带</a></li>
									<li class="subitem3"><a href="single.html">发带</a></li>
								</ul>
							</li>
									
							<li class="item4"><a href="#">鞋子</a>
								<ul class="cute">
									<li class="subitem1"><a href="single.html">皮鞋 </a></li>
									<li class="subitem2"><a href="single.html">运动鞋 </a></li>
									<li class="subitem3"><a href="single.html">帆布鞋</a></li>
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
						<h3 class="cate">热销</h3>
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
<%@include file="foot.jsp" %>
<!-- slide -->
<script src="js/jquery.min.js"></script>
<script src="js/imagezoom.js"></script>
<!-- start menu -->
<link href="css/memenu.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/memenu.js"></script>
<script>$(document).ready(function(){$(".memenu").memenu();});</script>
<script src="js/simpleCart.min.js"> </script>
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
						<!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
<!---pop-up-box---->
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					<!---//pop-up-box---->
					 <script>
						$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type: 'inline',
							fixedContentPos: false,
							fixedBgPos: true,
							overflowY: 'auto',
							closeBtnInside: true,
							preloader: false,
							midClick: true,
							removalDelay: 300,
							mainClass: 'my-mfp-zoom-in'
						});
																						
						});
				</script>	
</body>
</html>