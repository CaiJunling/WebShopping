package com.oracle.shopping.model.dao;

public interface BaseDAO {//提取父接口(父类应该干的事情，把一些公共的资源声明在这里
	public String  dirverClass="com.mysql.jdbc.Driver";
	public String  url="jdbc:mysql://localhost:3306/shopping";
	public String username="root";
	public String password="root";
	
	//添加
		public boolean add(Object o);
		
		public boolean  delete(Object id);
		
		public boolean update(Object  o);
		
		public Object    list();

}
