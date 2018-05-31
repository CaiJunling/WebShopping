<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>注册</title>
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
		  	  <form method="post"  action="UserServlet"> 
		  	  <input type="hidden" name="method" value="register"/>
				 <div class="col-md-6  register-top-grid">
					
					<div class="mation">
					    <span>手机号码</span>
						<input type="text" id="telnumber" name="tel" > 
						<span id="userExtist"></span>
						<span>姓名</span>
						<input type="text" name="userName"> 
					
						<span>昵称</span>
						<input type="text" id="nicheng" name="nickName"> 
					 
					</div>
					 
					 </div>
				     <div class=" col-md-6 register-bottom-grid">
						   
							<div class="mation">
								<span>密码</span>
								<input type="password" id="mima" name="password" style="border: 1px solid #EEE;outline-color:#52D0C4;width: 100%;font-size: 1em;padding: 0.5em;margin: 0.5em 0;">
								<span id="usermima"></span>
								<span>确认密码</span>
								<input type="password" id="querenmima"  name="confirmpassword" style="border: 1px solid #EEE;outline-color:#52D0C4;width: 100%;font-size: 1em;padding: 0.5em;margin: 0.5em 0;">
							    <span id="userconfpassword"></span>
							</div>
					 </div>
					 <div class="clearfix"> </div>
					   <input type="submit" value="提交" style="background:#52D0C4;color: #FFF;font-size:1em;padding: 0.4em 1em;transition: 0.5s all;-webkit-transition: 0.5s all;-moz-transition: 0.5s all;-o-transition: 0.5s all;display: inline-block;border:none;outline:none;">
				     
				</form>
				
				
		   </div>
</div>

<!--footer-->
<%@include file="foot.jsp" %>

<!--//footer-->
</body>
<script>
  /* function telyanzheng(){
	  var telnumber=document.getElementById("telnumber").value;
	  if(telnumber==""){
		  alert("温馨提示:\r\n手机号不能为空!");
		}else if(telnumber.length!=11){
			alert("温馨提示:\r\n手机号格式不正确!");
		}
  } 
  function getpassword(){
	  var mima=document.getElementById("mima").value;
	  if(mima==""){
		  alert("温馨提示:\r\n密码不能为空!");
		}
  }
  function confpassword(){
	  var mima=document.getElementById("mima").value;
	  var querenmima=document.getElementById("querenmima").value;
	  if(mima!=querenmima){
		  alert("温馨提示:\r\n密码不一致!");
		  alert("昵称："+document.getElementById("nicheng").value);
		}
  }*/


</script>
<!-- 验证表单是否为空，用户手机号或密码或确认密码为空不一致 -->
<%  if(request.getAttribute("loginResultMessage")!=null&&request.getAttribute("loginResultMessage").toString().equals("registerError")) {%>
	<script type="text/javascript">
	alert("温馨提示:\r\n手机号或密码填写错误!");
	</script>
	<%} %> 
	
		
<script type="text/javascript">	
$(document).ready(function(){
	
	/**
	注册用户手机号检测是否正确的ajax代码
	**/
	$(" [name='tel'] ").blur(function(){
		var telnumber=document.getElementById("telnumber").value;
		  if(telnumber==""){
			  $("#userExtist").html("<b style='color:red'>手机号不能为空</b>");
			  $(" [name='tel'] ").focus();
			}else if(telnumber.length!=11){
				$("#userExtist").html("<b style='color:red'>手机号格式不正确</b>");
				$(" [name='tel'] ").focus();
			}else{
				$.get("UserServlet?method=checkUserExists&tel="+$(this).val(),function(data,status){
					if(data=='false'){
						$("#userExtist").html("<b style='color:green'>√</b>");
					}else
					{
						$("#userExtist").html("<b style='color:red'>该用户已存在</b>");
						$(" [name='tel'] ").focus();
					}
				});
			}
	});
	
	/**
	注册用户密码检测是否正确的ajax代码
	**/
	$(" [name='password'] ").blur(function(){
		var mima=document.getElementById("mima").value;
		  if(mima==""){
			  $("#usermima").html("<b style='color:red'>密码不能为空</b>");
			  $(" [name='password'] ").focus();
			}else{
				  $("#usermima").html("<b style='color:green'>√</b>");
				}
	});
	
	$(" [name='confirmpassword'] ").blur(function(){
		var mima=document.getElementById("mima").value;
		  var querenmima=document.getElementById("querenmima").value;
		  if(mima!=querenmima){
			  $("#userconfpassword").html("<b style='color:red'>密码不一致</b>");
			  $(" [name='confirmpassword'] ").focus();
			}else{
			  $("#userconfpassword").html("<b style='color:green'>√</b>");
			}
	});
	
	
});
</script>
</html>
