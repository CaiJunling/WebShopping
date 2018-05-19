<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--header-->
<div class="header">
	<div class="header-top">
		<div class="container">
		<div class="col-sm-4 world">
					<ul >
						<li>
						<select class="in-drop">
							  <option>湖北省</option>
							  <option>湖南省</option>
							  <option>河北省</option>
							</select></li>
						<li><select class="in-drop1">
							  <option>武汉市</option>
							  <option>襄阳市</option>
							  <option>随州市</option>
							</select>
						</li>
					</ul>
				</div>
				<div class="col-sm-4 logo">
					<a href="index.html"><img src="images/logo.png" alt=""></a>	
				</div>
		
			<div class="col-sm-4 header-left">
					<input  id="method" type="hidden" name="method" value="login"/>
					
		           <c:if test="${not empty sessionScope.loginedUser }">
			            <span  >
			            <a  href="UserServlet?method=loadProfile&userID=${sessionScope.loginedUser.userID }" title="个人中心" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='' ">
			            <img src="${sessionScope.loginedUser.imageId }" style="width: 40px;height: 40px;border-radius: 10px;"/>
			            <span style="position: relative;top: 2px;color:#52d0c4;'">${sessionScope.loginedUser.nickName }</span>
			            </a><br/>
			            <a  href="UserServlet?method=logoff" style="position: relative;left:8px;color:#b5b3b3;font-size:14px">安全退出</a>
			            </span>
		           </c:if>
		           <c:if test="${empty sessionScope.loginedUser }">
		                  <p class="log"><a href="account.jsp"  >登录</a>
						<span>\</span><a  href="register.jsp"  >注册</a></p>
		           </c:if>
		           <!-- 购物车 -->
					<div class="cart box_1">
						<a href="ShoppingCarServlet?method=listAllCars">
						<h3> <div class="total">
							<span class="simpleCart_total"></span></div>
							<img src="images/cart.png" alt=""/></h3>
						</a>
						<p><a href="javascript:deleteAll()" class="simpleCart_empty">清空购物车</a></p>
					</div>
					
					<div class="clearfix"> </div>
			</div>
				<div class="clearfix"> </div>
		</div>
		</div>
		<div class="container">
			<div class="head-top">
				<div class="col-sm-2 number">
					<span><i class="glyphicon glyphicon-phone"></i>085 596 234</span>
				</div>
		 <div class="col-sm-8 h_menu4">
				<ul class="memenu skyblue">
					  <li class=" grid"><a  href="index.jsp">首页</a></li>	
				      <li><a  href="#">男装</a>
				      	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>所有的衣服</h4>
									<ul>
										<li><a href="products.html">T恤</a></li>
										<li><a href="products.html">衬衫</a></li>
										<li><a href="products.html">风衣</a></li>
										<li><a href="products.html">牛仔外套</a></li>
										<li><a href="products.html">背心</a></li>
										<li><a href="products.html">运动裤</a></li>
										<li><a href="products.html">长袖T恤</a></li>
										<li><a href="products.html">卫衣</a></li>
										<li><a href="products.html">夹克</a></li>
										<li><a href="products.html">休闲裤</a></li>
										<li><a href="products.html">羽绒服</a></li>
										
					
									</ul>	
								</div>							
							</div>
						
						  </div>
						</div>
					</li>
				    <li class="grid"><a  href="#">女装</a>
					  	<div class="mepanel">
						<div class="row">
							<div class="col1">
								<div class="h_nav">
									<h4>所有的衣服</h4>
									<ul>
										<li><a href="products.html">T恤</a></li>
										<li><a href="products.html">衬衫</a></li>
										<li><a href="products.html">风衣</a></li>
										<li><a href="products.html">牛仔外套</a></li>
										<li><a href="products.html">背心</a></li>
										<li><a href="products.html">运动裤</a></li>
										<li><a href="products.html">长袖T恤</a></li>
										<li><a href="products.html">卫衣</a></li>
										<li><a href="products.html">夹克</a></li>
										<li><a href="products.html">休闲裤</a></li>
										<li><a href="products.html">羽绒服</a></li>
										
					
									</ul>	
								</div>							
							</div>
							
							
						  </div>
						</div>
			    </li>
				<li><a  href="myOrder.jsp">我的订单</a></li>				
				<li><a class="color6" href="contact.jsp">联系我们</a></li>
			  </ul> 
			</div>
				<div class="col-sm-2 search">		
			        <a class="play-icon popup-with-zoom-anim" href="#small-dialog">
			           <i class="glyphicon glyphicon-search"> </i>
			        </a>
		        </div>
		<div class="clearfix"> </div>
			<!---pop-up-box---->
					 
					<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
					<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					
					
					<!---//pop-up-box 搜索栏---->
				<div id="small-dialog" class="mfp-hide">
				<div class="search-top">
						
				<form action="ClothesServlet">
				<input type="hidden"   name="method"  value="search"/>
				<fieldset>
					<label >类别:</label>
					<input type="text"  name="clothes_class"/>

				</fieldset>
				<br/>
				<fieldset>
					<label >品牌:</label>
					<input type="text"  id="clothes_brand" name="clothes_brand"/>
				</fieldset>
				<br/>				
				<fieldset>
					<label >名称:</label>
					<input type="text"  id="clothes_name" name="clothes_name"/>
				</fieldset>
				<br/>
				<fieldset>
					<label >单价:</label>
					<input type="text"  id="clothes_minprice" name="clothes_minprice" style="width: 89px"/>-
					<input type="text"  id="clothes_maxprice" name="clothes_maxprice" style="width: 88.5px"/>
				</fieldset>	
				<br/>	
				<button id="submitSearch"  type="submit" style="width:120px">查找</button>
				</form>
					</div>				
				</div>
				
				
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
						function deleteAll(){
							var  userChoice=window.confirm("您真的要删除所有的商品吗?");
							if(userChoice)
							{
								location.href='ShoppingCarServlet?method=deleteAll';
							}
						}
				</script>			
	<!---->		
		</div>
	</div>
</div>