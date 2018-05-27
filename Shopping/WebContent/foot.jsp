<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--footer-->
<div class="footer">
	<div class="container">
		<div class="footer-top">
			<div class="col-md-4 top-footer1">
				<h2>End</h2>
					<form>
						<input type="text" value="" onFocus="this.value='';" onBlur="if (this.value == '') {this.value ='';}">
						<input type="submit" value="SUBSCRIBE">
					</form>
			</div>
			<div class="clearfix"> </div>	
		</div>	
	</div>
	<div class="footer-bottom">
		<div class="container">
				<div class="col-sm-3 footer-bottom-cate">
					<h6>消费者保障</h6>
					<ul>
						<li><a href="#">保障范围</a></li>
						<li><a href="#">退换货流程</a></li>
						<li><a href="#">服务中心</a></li>
						<li><a href="#">特色服务</a></li>
						<li><a href="#">更多</a></li>
						
					</ul>
				</div>
				<div class="col-sm-3 footer-bottom-cate">
					<h6>新手上路</h6>
					<ul>
						<li><a href="#">新手专区</a></li>
						<li><a href="#">消费警示</a></li>
						<li><a href="#">交易安全</a></li>
						<li><a href="#">在线帮助</a></li>
						<li><a href="#">免费开店</a></li>
						
					</ul>
				</div>
				<div class="col-sm-3 footer-bottom-cate">
					<h6>付款方式</h6>
					<ul>
						<li><a href="#">快捷支付</a></li>
						<li><a href="#">信用卡</a></li>
						<li><a href="#">货到付款</a></li>
						<li><a href="#">支付宝</a></li>
						<li><a href="#">微信支付</a></li>
						
					</ul>
				</div>
				<div class="col-sm-3 footer-bottom-cate cate-bottom">
					<h6>地址：</h6>
					<ul>
						<li>湖北省 </li>
						<li>襄阳市</li>
						<li> 湖北文理学院</li>
						<li class="phone">Tel:88888-66666</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
				<p class="footer-class">Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
			</div>
	</div>
</div>


<script type="text/javascript">
$(document).ready(function(){
		/**
		搜索框模糊匹配ajax代码
		**/
	   $("#s").keyup(function(){
		
		  $.post("ClothesServlet",
					{
						"key":$(this).val(),
						"method":"mohuSearch"
					},
					function(data,status){
						var   allPipeis=data.getElementsByTagName("title");
						if(allPipeis.length>0){
							$("#allPipei").css("display","block");
							
							  for (var i=0;i<document.getElementById("allPipei").rows.length;i++)
							     {
								  document.getElementById("allPipei").deleteRow(i);
							     }
							//document.getElementById("allPipei").rows.length=0;//清空表格之前的所有航
							for(var  n=0;n<allPipeis.length;n++)
							{
								var  tr=document.getElementById("allPipei").insertRow();
								tr.style.width="100%";
								tr.style.cursor="pointer";
								
								var  td=tr.insertCell();
								td.innerHTML=allPipeis[n].childNodes[0].nodeValue;
								td.style.textAlign="left";
								td.style.width="600px";
								td.style.cursor="pointer";
								td.onclick=function(){
									$("#s").val(this.innerHTML);
									$("#allPipei").css("display","none");
								}
								tr.onmouseover=function(){
									this.style.backgroundColor='#faffbd';
								}
								tr.onmouseout=function(){
									this.style.backgroundColor='';
								}
							}
						}
				   })
	   });
	
	
	
});

</script>
<!--//footer-->