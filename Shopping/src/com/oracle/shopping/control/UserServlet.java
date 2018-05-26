package com.oracle.shopping.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.oracle.shopping.model.bean.User;
import com.oracle.shopping.model.dao.UserDaoImp;
import com.oracle.shopping.util.MD5;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  ServletConfig  config;
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
	}
	private UserDaoImp dao;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        dao = new UserDaoImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入userservlet");
		if(request.getParameter("method")==null) {//如果是上传文件的方法，则会进入到这个分支
			updateUserInfo(request,response);
		}else
		{
		  String methodName = request.getParameter("method");
		  switch (methodName) {
		  case "login": {
			  login(request, response);
			  break;
		  }case "loadProfile": {
		  	loadProfile(request, response);
			  break;
		  }case "logoff": {
			  logoff(request, response);
			  break;
		  }case "register": {
				register(request, response);
				break;
		  }case "checkUserExists": {
				checkUserExists(request, response);
				break;
			}default:
			  break;
		  }
		}
	
	}
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入登录后台了");
		//下面代码是判断验证码的业务代码
			
			//1.先去除用户输入的验证码
			String  code=request.getParameter("code");
			System.out.println("您在网页上输入的验证码："+code);
			//2.取出系统生成的验证码值
			String  systemCode=request.getSession().getAttribute("generateCode").toString();
			if(!code.equalsIgnoreCase(systemCode)) {//equlas会比较内容和大小写，   equalsingonrecase
				System.out.println("验证码验证失败了，立马调到前台页面");
				request.setAttribute("loginResultMessage", "codeError");
				request.getRequestDispatcher("account.jsp").forward(request, response);
				//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
					return ;
			}
			
			String tel = request.getParameter("tel");
			String password = request.getParameter("password");
			
		

			// 查询数据库（略）
			System.out.println("验证码验证通过了，开始i验证用户名和密码");
			User user = dao.login(tel, MD5.MD5(password));
			System.out.println(user);
			if(user==null)
			{
				request.setAttribute("loginResultMessage", "userError");
				request.getRequestDispatcher("account.jsp").forward(request, response);
				return ;
			}else//如果登陆成功，进入到这个else分支
		{
				String  rememberMe=	request.getParameter("rememberMe");
				Cookie   usernameCookie=new Cookie("tel", tel);
				Cookie   passwordCookie=new Cookie("password", password);
				if(rememberMe!=null) {//说明用户勾选了，保存用户名和密码的选项
					System.out.println("进来存储cookie了");
				
					usernameCookie.setMaxAge(1000*60*60*24*3);
//					usernameCookie.setDomain("www.ershouche.com");
					passwordCookie.setMaxAge(1000*60*60*24*3);
//					passwordCookie.setDomain("www.ershouche.com");
				}else {
					usernameCookie.setMaxAge(0);
//					usernameCookie.setDomain("www.ershouche.com");
					passwordCookie.setMaxAge(0);
//					passwordCookie.setDomain("www.ershouche.com");
					
				}
				response.addCookie(usernameCookie);//讲cookie存起来
     			response.addCookie(passwordCookie);//讲cookie存起来
		}
			System.out.println("登录成功了");
			request.getSession().setAttribute("loginedUser", user);// 回话范围内存储用户资料，这样能保证用户在一次绘画中可以保留用户登录的信息
			response.sendRedirect("index.jsp");
		
		
		
	}
	/**
	 * 个人中心，加载个人资料
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void loadProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid=request.getParameter("userID");
		User user=dao.getUserInfoByUserId(Integer.parseInt(userid));
		request.setAttribute("user", user);
		request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	
	/**
	 * 退出登陆的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void logoff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("loginedUser");
		response.sendRedirect("index.jsp");
	}
	
	/**
	 * 这是修改更新个人信息的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void updateUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//用smartUpload来读取表单上传的文件和表单中的数据
				SmartUpload su = new SmartUpload();//创建一个smartUpload上传插件的对象
				// 上传初始化
				su.initialize(config,request,response);//,读取request，response中的数据到smartupload插件中
				try {
					su.upload();//把这个表单提交的数据读取到upload插件里
					su.save("/images");
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
				
				Request  re=su.getRequest();//如果要读取表单中的文本数据，必须要使用的smartUplod里面的request
				String sex=	re.getParameter("sex");
				String  nickName=re.getParameter("nickName");
				String birthday=re.getParameter("birthday");
				String tel=re.getParameter("tel");
				String userID=re.getParameter("userID");
				String userName=re.getParameter("userName");
				String imageId=re.getParameter("imageId");
				/**
				 * 将表单取到的数据封装成一个user对象
				 */
				User user=new User();
				user.setUserName(userName);
				user.setUserID(Integer.parseInt(userID));
				user.setSex(Integer.parseInt(sex));
				user.setBirthday(Integer.parseInt(birthday));
				user.setNickName(nickName);
				user.setTel(tel);
				
				File  uploadFile=su.getFiles().getFile(0);//从smartupload插件中读取出页面上传的多个文件对象
				System.out.println(uploadFile.getFileName());
				System.out.println("图片长度："+uploadFile.getSize());
				
					
				try {
					if(uploadFile.getSize()>0){
						System.out.println("进入更改图片路径了");
				   
					  System.out.println(request.getRealPath("/images/uploadFiles/"));
				//	  UUID //javaUUID ,算法，生成同一空间同一时间下绝不重复的字符串 36 
					  String  uuidName=UUID.randomUUID().toString();
					  java.io.File    destFile=new java.io.File(request.getRealPath("/images/uploadFiles/"));
					  String childPath="";
					  for(int n=0;n<uuidName.length()-20;n++)
					  {
						  childPath+=uuidName.charAt(n)+"/";
					  }
					  java.io.File  f=new java.io.File(destFile,childPath);
					  f.mkdirs();
					  java.io.File  file=new java.io.File(f,uuidName+"."+uploadFile.getFileExt());
					
					  uploadFile.saveAs(file.getAbsolutePath());
					  String  urlPath=file.getAbsolutePath().substring(file.getAbsolutePath().indexOf("images"),file.getAbsolutePath().length());
					  System.out.println("图片路径"+urlPath);
					  boolean url;
				   
					
					  user.setImageId(urlPath);//将新上传的图片的路径设置到user对象中，传到dao里面修改新的头像地址
					}else{
						System.out.println("保留原图片:"+imageId);
						
						 user.setImageId(imageId);
					}
					
					
					boolean result=dao.update(user);
					System.out.println(result);
					if(result){
						request.getSession().setAttribute("loginedUser", user);// 回话范围内存储用户资料，这样能保证用户在一次绘画中可以保留用户登录的信息
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}else{
						System.out.println("更新失败！");
					}
				} catch (SmartUploadException e) {
					e.printStackTrace();
				}
				
	}
	/**
	 * 处理注册用户的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到注册的servlet");
		//1.先获取注册的表单信息
		String userName = new String(request.getParameter("userName").getBytes("ISO-8859-1"), "UTF-8");
		String nickName = new String(request.getParameter("nickName").getBytes("ISO-8859-1"), "UTF-8");
		String tel = request.getParameter("tel");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		System.out.println("密码："+password+"   "+"确认："+confirmpassword);
		System.out.println("昵称："+nickName);
		//判断表单是否为空
		if(tel==""||password==""||!confirmpassword.equals(password)){
			System.out.println("手机号是否为空："+tel=="");
			System.out.println("密码是否为空："+password=="");
			System.out.println("验证是否一致："+confirmpassword.equals(password));
			request.setAttribute("loginResultMessage", "registerError");
			request.getRequestDispatcher("register.jsp").forward(request, response);
			return ;
		}else{
		     User user=new User(); 
		     user.setTel(tel);
		     user.setPassword(MD5.MD5(password));//在将表单提交过来的密码风涨到user对象前，先用md5算法把密码加密
		     user.setUserName(userName);
		     user.setNickName(nickName);
		     boolean  result=dao.add(user);
		     if(result) {
		         request.setAttribute("loginResultMessage", "registerSuccess");
		         }else
		             {
		             request.setAttribute("loginResultMessage", "registerFail");
		             }
		     request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}
	
	/**
	 * 登录时检测用户是否存在的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void checkUserExists(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("检测用户是否存在的方法");
		String  tel=request.getParameter("tel");
		boolean result=dao.checkUserExsit(tel);//调用dao方法判断该用户名是否存在
		//悄悄把数据会给他
		//用response（响应）对象中的输出流将处理好的结果输出给ajax请求对象
		response.setContentType("text/html;charset=UTF-8");//  text/html     ,text/xml    ,text/json
		PrintWriter  out=response.getWriter();//获取响应对象中的输出流
		out.write(result+"");
		out.flush();
		out.close();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
