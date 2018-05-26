<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--header-->
<%if(request.getSession().getAttribute("fenleiname")==null){
	request.getRequestDispatcher("ClothesServlet?method=fenlei").forward(request, response);
} %>
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
						<!-- 购物车总价 -->
							<span >￥
							<%if(session.getAttribute("total")==null||session.getAttribute("total").toString().equals(".00")){%>
								0.00
							<% }else{%>
							  <%=session.getAttribute("total") %> 
							<%} %>
							
							</span></div>
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
						<!-- 衣服分类 -->
						<div class="col1">
								<div class="h_nav">
									<h4>种类</h4>
									<ul>
									<%
					                     ArrayList<String>  clothesclass=(ArrayList<String> )request.getSession().getAttribute("fenleiclass");
			        
					                     for(String f:clothesclass) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_class=<%=f %>"><%=f %></a></li>
						                 
						                 <%} %> 
										
										
										
									</ul>	
								</div>							
							</div>
							<!-- 衣服分类 -->
							<div class="col1">
								<div class="h_nav">
									<h4>品牌</h4>
									<ul>
									<%
					                     ArrayList<String> fenleibrand=(ArrayList<String> )request.getSession().getAttribute("fenleibrand");
			        
					                     for(String n:fenleibrand) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_brand=<%=n %>"><%=n %></a></li>
						                 
						                 <%} %> 
										
									
									</ul>	
								</div>							
							</div>
							<!-- 衣服分类 -->
							 <div class="col1">
								<div class="h_nav">
									<h4>系列名</h4>
									<ul>
										<%
					                     ArrayList<String>  fenleiname=(ArrayList<String> )request.getSession().getAttribute("fenleiname");
			        
					                     for(String n:fenleiname) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_name=<%=n %>"><%=n %></a></li>
						                 
						                 <%} %> 
										
									</ul>	
								</div>							
							</div>
						<!-- 衣服分类 -->
						  </div>
						</div>
					</li>
				    <li class="grid"><a  href="#">女装</a>
					  	<div class="mepanel">
						<div class="row">
							<!-- 衣服分类 -->
						<div class="col1">
								<div class="h_nav">
									<h4>种类</h4>
									<ul>
										<%  for(String f:clothesclass) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_class=<%=f %>"><%=f %></a></li>
						                 
						                 <%} %>
										
									</ul>	
								</div>							
							</div>
							<!-- 衣服分类 -->
							<div class="col1">
								<div class="h_nav">
									<h4>品牌</h4>
									<ul>
										<%
					                     
					                     for(String n:fenleibrand) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_brand=<%=n %>"><%=n %></a></li>
						                 
						                 <%} %> 
									
									</ul>	
								</div>							
							</div>
							<!-- 衣服分类 -->
							 <div class="col1">
								<div class="h_nav">
									<h4>系列名</h4>
									<ul>
										<%
					                    
					                     for(String n:fenleiname) {
						                 %>
						                  <li><a href="ClothesServlet?method=search&clothes_name=<%=n %>"><%=n %></a></li>
						                 
						                 <%} %> 
										
									</ul>	
								</div>							
							</div>
						<!-- 衣服分类 -->
							
							
						  </div>
						</div>
			    </li>
				<li><a  href="myOrder.jsp">我的订单</a></li>				
				<li><a class="color6" href="contact.jsp">联系我们</a></li>
			  </ul> 
			</div>
				 <div class="col-sm-2 search">
					
			   	
			        <a class="play-icon popup-with-zoom-anim" href="#small-dialog">
			           <i class="glyphicon glyphicon-search" style="color:#52d0c4">搜索</i>
			        </a>
			        
		        </div>
		<div class="clearfix"> </div>
			<!---pop-up-box---->
					 
				<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all"/>
				<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
					
					
					<!---//pop-up-box 搜索栏---->
					
				<div id="small-dialog" class="mfp-hide">
			
				  <div class="search-top">
				
				    <!-- 模糊搜索 -->
					<form action="ClothesServlet" id="searchform" method="get">
				       <input type="hidden" name="method" value="searchAny"/>
				       <div class="search-top">
					      <div class="login">
					         <input type="submit" value=""> <input type="text"
							        value="请输入 . . ." name="key" onFocus="this.value = '';"
							        onBlur="if (this.value == '') {this.value = '';}">
					         </div>
					            <p></p><a href="searchbycondition.jsp">-->>选择条件搜索</a>
				       </div>
			        </form>
				 <!--模糊搜索 --> 
				
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