<%@page import="com.oracle.shopping.model.bean.Clothes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.shopping.model.dao.ClothesDAOImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//jsp如果充当是后台组件，那么应该吧所有的html标签删除

//1.获取用户从上一个页面提交时输入的数据
String  clothes_class=new String(request.getParameter("clothes_class").getBytes("ISO-8859-1"),"UTF-8");//种类
String  clothes_brand=request.getParameter("clothes_brand");//品牌
String clothes_name=request.getParameter("clothes_name");//名称
String  clothes_minprice=request.getParameter("clothes_minprice");//最低单价
String  clothes_maxprice=request.getParameter("clothes_maxprice");//最高单价

//2.根据数据查询数据库，找到对应的车辆信息
ClothesDAOImp  dao=new ClothesDAOImp();
ArrayList<Clothes>  searchedClothess=dao.searchClothessByCondition(clothes_class, clothes_brand, clothes_name, clothes_minprice, clothes_maxprice);
request.setAttribute("clothess", searchedClothess);//这里是将查询出来的集合存储到request，然后通过转发传递到下一个jsp中显示出来

//3.当数据准备完毕之后，应该跳转到下一个页面(jsp)
request.getRequestDispatcher("products.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面
// response.sendRedirect("all-listings.jsp");//response对象的这个方法是重定向，它也会让当前jsp跳转到下一个制定的jsp
%>