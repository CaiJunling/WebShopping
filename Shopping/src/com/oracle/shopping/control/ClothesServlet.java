package com.oracle.shopping.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shopping.model.bean.Clothes;
import com.oracle.shopping.model.bean.PageBean;
import com.oracle.shopping.model.dao.ClothesDAOImp;

/**
 * Servlet implementation class ClothesServlet
 */
@WebServlet("/ClothesServlet")
public class ClothesServlet extends HttpServlet {
	
	private ClothesDAOImp dao;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClothesServlet() {
    	super();
    	dao=new ClothesDAOImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String methodName=request.getParameter("method");//通过前端传过来的method参数来识别用户是要调用哪个方法
		switch(methodName) {
		case "index":
		{
			index(request,response);
			break;
		}
		case "single":
		{
			single(request,response);
			break;
		}
		case "search":
		{
			search(request,response);
			break;
		}
		case "listClothesByPage":
		{
			listClothesByPage(request,response);
			break;
		}
		default:
			break;
		}
	}
	/**
	 * 定义一个方法，这个方法是为首页准备数据的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入后台来准备给数据了");
		//在页面没有加载完之前，先把这个页面要显示的数据查出来，准备好，下面才可以用
		
		ArrayList<Clothes> allClothess=dao.listRecentClothessByCount(16);//这里应该调用查询N个车辆信息的方法，把需要显示在首页的车辆信息查询出来
		request.setAttribute("allClothess", allClothess);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	/**
	 * 定义一个方法，这个方法是为商品详情准备数据的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void single(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入了的加载详细信息的方法");
		//在页面加载前，先把这个页面要显示的数据准备好
		Clothes clothesInfo=dao.getClothesInfoByClothesId(Integer.parseInt(request.getParameter("clothes_Id")));
        System.out.println(clothesInfo);
		request.setAttribute("clothes", clothesInfo);
		request.getRequestDispatcher("single.jsp").forward(request, response);
	}
	
	/**
	 * 定义一个方法，这个方法是查找商品准备数据的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到查找商品界面");
		System.out.println(request.getParameter("clothes_class"));
		//1.获取用户从上一个页面提交时输入的数据
		String  clothes_class=null;//种类是字符串，要先把种类设为空，在判断获取的字符串是否为空，不是空在获取该字符串
		if(request.getParameter("clothes_class")!=null)
		    clothes_class=new String(request.getParameter("clothes_class"));//种类
		String  clothes_brand=null;
		if(request.getParameter("clothes_brand")!=null)
			clothes_brand=new String(request.getParameter("clothes_brand"));//品牌
		String clothes_name=null;
		if(request.getParameter("clothes_name")!=null)
			clothes_name=new String(request.getParameter("clothes_name"));//名称
		String  clothes_minprice=request.getParameter("clothes_minprice");//最低单价
		String  clothes_maxprice=request.getParameter("clothes_maxprice");//最高单价

		//2.根据数据查询数据库，找到对应的车辆信息
		ArrayList<Clothes>  searchedClothess=dao.searchClothessByCondition(clothes_class, clothes_brand, clothes_name, clothes_minprice, clothes_maxprice);
		request.setAttribute("clothess", searchedClothess);//这里是将查询出来的集合存储到request，然后通过转发传递到下一个jsp中显示出来

		//3.当数据准备完毕之后，应该跳转到下一个页面(jsp)
		request.getRequestDispatcher("products.jsp").forward(request, response); //request对象负责让这个jsp跳转到下一个页面
		// response.sendRedirect("all-listings.jsp");//response对象的这个方法是重定向，它也会让当前jsp跳转到下一个制定的jsp
	}
	/**
	 * 这个方法是处理分页显示衣服信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listClothesByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入分页");
		String  page=request.getParameter("page");
		String count=request.getParameter("count");
		ArrayList<Clothes>  clothess=dao.listClothesByPage(Integer.parseInt(page),Integer.parseInt(count));
		
		/**
		 * 通过计算将分页中所有要用到的数字全部算出来
		 */
		int nowPage=Integer.parseInt(page);//当前页
		int allCount=dao.getAllCountOfClothess();//因为分页在页面上要知道最大页，所以，我们要调用dao中查询所有条数的方法，获得car有多少条
		int pageOfCount=Integer.parseInt(count);
		int allPages=(allCount%pageOfCount==0)?allCount/pageOfCount:(allCount/pageOfCount+1);//求总页数
		int perviousPage=nowPage<=1?1:(nowPage-1);
		int nextPage=nowPage>=allPages?allPages:(nowPage+1);
		
		/**
		 * 将所有的分页 中的属性封装成一个分页bean，将一个对象整体保存传到页面上
		 */
		PageBean  pageBean=new PageBean();
		pageBean.setNowPage(nowPage);
		pageBean.setPreviousPage(perviousPage);
		pageBean.setNextPage(nextPage);
		pageBean.setAllCount(allCount);
		pageBean.setAllPages(allPages);
		pageBean.setEverPageCount(pageOfCount);
		
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("clothess", clothess);
		request.getRequestDispatcher("products.jsp").forward(request, response);

	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
