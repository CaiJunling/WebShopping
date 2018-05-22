package com.oracle.shopping.control;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.shopping.model.bean.Clothes;
import com.oracle.shopping.model.dao.ClothesDAOImp;

/**
 * Servlet implementation class ShoppingCarServlet
 */
@WebServlet("/ShoppingCarServlet")
public class ShoppingCarServlet extends HttpServlet {
	private ClothesDAOImp  dao;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCarServlet() {
    	dao=new ClothesDAOImp();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch (method) {
		case "add":
		{	
			add(request, response);
			break;
		}case "listAllCars":
		{	
			listAllCars(request, response);
			break;
		}case "deleteCar"://判断用户请求的参数中，告诉我们是进入哪个后台业务方法
		{	
			deleteCar(request, response);
			break;
		}case "deleteAll":
		{	
			deleteAll(request, response);
			break;
		}
		case "reduceOne":
		{	
			reduceOne(request, response);
			break;
		}
		case "addOne":
		{	
			addOne(request, response);
			break;
		}
		default:
			break;
		}
	
	}
	
	/**
	 * 添加商品到购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入添加商品进入购物车功能");
		//1.先获取前端页面点击'添加到购物车'按钮时传过来的商品ID
				String  clothes_Id=request.getParameter("clothes_Id");
				//2.将这个车辆id存储到  ‘购物车’   里面
				//先判断session中有没有存储购物车集合，如果有，说明之前已经买过东西，如果没有说明没买过东西
				if(request.getSession().getAttribute("clothess")==null)
				{
						HashMap<Clothes, Integer>  shoppingcars=new HashMap<>();
						//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
						System.out.println("添加商品的ID："+clothes_Id);
						System.out.println("添加商品信息："+dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id)));
						shoppingcars.put(dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id)), 1);//将页面中添加的商品id和数量存储到购物车里
						System.out.println("shoppingcars里面的值"+shoppingcars);
						//3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
						
						//计算购物车的总价格
						float total=0.00f;
						for(Clothes  c:shoppingcars.keySet()) {
							total+=(c.getClothes_price()*shoppingcars.get(c));
						}
						DecimalFormat fnum=new DecimalFormat("#.00");
						String total1=fnum.format(total);
						request.getSession().setAttribute("total", total1);
						
						request.getSession().setAttribute("clothess", shoppingcars);
				}else {
					System.out.println("购物车有商品进入这里");
					HashMap<Clothes, Integer>  shoppingcars=(	HashMap<Clothes, Integer> )request.getSession().getAttribute("clothess");
					//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
					
					//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
					//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
					System.out.println("加入一件商品："+shoppingcars);
					System.out.println("Map中的key值："+shoppingcars.keySet());
					System.out.println(clothes_Id);
					if(shoppingcars.containsKey(new Clothes(Integer.parseInt(clothes_Id))))
					{
						System.out.println("商品数量加1");
						Clothes  c=dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id));
						int  nowCount=shoppingcars.get(c)+1;
						shoppingcars.put(c, nowCount);
					}
					else {
						System.out.println("新商品");
							shoppingcars.put(dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id)),  1);//将页面中添加的商品id和数量存储到购物车里
					}
//					3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
					
					request.getSession().setAttribute("clothess", shoppingcars);
					
					//4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
					
					for(Clothes  cc:shoppingcars.keySet()) {
						Cookie  r=new Cookie("clothes"+cc.getClothes_Id(), cc.getClothes_Id()+","+shoppingcars.get(cc));
						r.setMaxAge(1000*60*60*24*15);
						response.addCookie(r);
					}
					//计算购物车的总价格
					float total=0.00f;
					for(Clothes  c:shoppingcars.keySet()) {
						total+=(c.getClothes_price()*shoppingcars.get(c));
					}
					DecimalFormat fnum=new DecimalFormat("#.00");
					String total1=fnum.format(total);
					request.getSession().setAttribute("total", total1);
				}
				
				
				
				
				response.sendRedirect("checkout.jsp");//当数据添加到购物车之后，直接跳转到购物车页面，让用户看一下购物车的信息
	}
	
	/**
	 * 进入购物车，把购物车中的商品列出来
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void listAllCars(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 调用这个方法，说明是要查看购物车，我们直接读取cookie中存储的商品信息，然后将cookie中读取的商品信息查出来然后存起来，显示在页面上
		 */
		HashMap<Clothes, Integer>  shoppingcars=new HashMap<>();
		Cookie[]  cs=request.getCookies();
		if(cs!=null)
		{
			for(Cookie c:cs) {
				if(c.getName().startsWith("clothes")) {
					String[] kv=c.getValue().replaceAll("\"", "").split(",");
					shoppingcars.put(dao.getClothesInfoByClothesId(Integer.parseInt(kv[0])), Integer.parseInt(kv[1]));
				}
			}
		}
		request.getSession().setAttribute("clothess", shoppingcars);
		//计算购物车的总价格
		float total=0.00f;
		for(Clothes  c:shoppingcars.keySet()) {
			total+=(c.getClothes_price()*shoppingcars.get(c));
		}
		DecimalFormat fnum=new DecimalFormat("#.00");
		String total1=fnum.format(total);
		request.getSession().setAttribute("total", total1);
		
		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}
	
	/**
	 * 删除购物车选中商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.获取要删除的衣服id
				String id=request.getParameter("clothes_Id");
				//2.从session里面取出购物车集合
				HashMap<Clothes, Integer>  shoppingcars=(	HashMap<Clothes, Integer> )request.getSession().getAttribute("clothess");
				for(Clothes c:shoppingcars.keySet()) {
					if(c.getClothes_Id()==Integer.parseInt(id)) {
						shoppingcars.remove(c);
						Cookie[] cs=request.getCookies();
						for(Cookie css:cs) {
							if(css.getName().equals("clothes"+id)) {
								css.setMaxAge(0);
								response.addCookie(css);
								break;
							}
						}
						break;
					}
				}
				
				//计算购物车价格
				float total=0.00f;
				for(Clothes c:shoppingcars.keySet()) {
					total+=(c.getClothes_price()*shoppingcars.get(c));
				}
				DecimalFormat fnum=new DecimalFormat("#.00");
				String total1=fnum.format(total);
				request.getSession().setAttribute("total", total1);
				//3.档购物车的商品删除成功后，跳转到购物车页面
				response.sendRedirect("checkout.jsp");
	}
	/**
	 * 清空购物车的功能
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("clothess");
		request.getSession().removeAttribute("total");

		response.sendRedirect("checkout.jsp");
	}
	
	/**
	 * 这是商品数量减一的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void reduceOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  clothes_Id=request.getParameter("clothes_Id");
		HashMap<Clothes, Integer>  shoppingcars=(	HashMap<Clothes, Integer> )request.getSession().getAttribute("clothess");
		//创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
		
		//因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
		//如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
		
		Clothes  c=dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id));
		if(shoppingcars.get(c)==1)
		{
			System.out.println("商品数量为1");
			request.setAttribute("reduceErrorMessage", "reduceError");
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
			//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
				return ;
		}
		else {
			int  nowCount=shoppingcars.get(c)-1;
			shoppingcars.put(c, nowCount);
		}
//		3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
		request.getSession().setAttribute("clothess", shoppingcars);
		
		//4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
		
		for(Clothes  cc:shoppingcars.keySet()) {
			Cookie  r=new Cookie("clothes"+cc.getClothes_Id(), cc.getClothes_Id()+","+shoppingcars.get(cc));
			r.setMaxAge(1000*60*60*24*15);
			response.addCookie(r);
		}
		//计算购物车的总价格
		float total=0.00f;
		for(Clothes  cs:shoppingcars.keySet()) {
			total+=(cs.getClothes_price()*shoppingcars.get(cs));
		}
		DecimalFormat fnum=new DecimalFormat("#.00");
		String total1=fnum.format(total);
		request.getSession().setAttribute("total", total1);
		
	  response.sendRedirect("checkout.jsp");
	}

    /**
     * 这是商品数量加一的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void addOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String  clothes_Id=request.getParameter("clothes_Id");
	    HashMap<Clothes, Integer>  shoppingcars=(	HashMap<Clothes, Integer> )request.getSession().getAttribute("clothess");
	    //创建一个map集合，这个集合就是‘购物车’，这里面存用户添加了哪些商品以及对应的数量
	
	    //因为session中已经存过购物车集合，说明之前买过东西，此时在添加新商品的时候应该先判断之前买过这个商品吗
	    //如果买过，应该是在原来的数量上加现在的数量，如果没买过就直接将这个商品添加到集合中
	
	     System.out.println("商品数量加1");
		 Clothes  c=dao.getClothesInfoByClothesId(Integer.parseInt(clothes_Id));
		 int  nowCount=shoppingcars.get(c)+1;
		 shoppingcars.put(c, nowCount);
	   
        //	3.为了保证购物车能够在多次操作后依然能读取里面的数据，我们需要用session来存储购物车的数据
	    request.getSession().setAttribute("clothess", shoppingcars);
	
	    //4.为了提升用户体验度，我们除了讲用户购物车的数据放入session，同时再存入cookie，方便用户关闭页面时再打开能看到之前的购物车商品
	
	    for(Clothes  cc:shoppingcars.keySet()) {
		    Cookie  r=new Cookie("clothes"+cc.getClothes_Id(), cc.getClothes_Id()+","+shoppingcars.get(cc));
		    r.setMaxAge(1000*60*60*24*15);
		    response.addCookie(r);
	    }
	    
	  //计算购物车的总价格
		float total=0.00f;
		for(Clothes cs:shoppingcars.keySet()) {
			total+=(cs.getClothes_price()*shoppingcars.get(cs));
		}
		DecimalFormat fnum=new DecimalFormat("#.00");
		String total1=fnum.format(total);
		request.getSession().setAttribute("total", total1);
        response.sendRedirect("checkout.jsp");
    }

    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
