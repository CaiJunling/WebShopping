package com.oracle.shopping.model.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import com.oracle.shopping.model.bean.Clothes;

public class ClothesDAOImp extends BaseDAOImp implements ClothesDAO {

	@Override
	public boolean add(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据传入的数量查询出最近的指定数量的二手车信息
	 */
	@Override
	public ArrayList<Clothes> listRecentClothessByCount(int count) {
		ArrayList<Clothes>  Clothess=new  ArrayList<Clothes>();//定义一个集合存储查询出来的所有车辆信息
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery("select *  from  clothes order by  clothes_Id desc  limit "+count);
		
		while(rs.next())
		{
			Clothes  c=new Clothes();
			c.setClothes_Id(rs.getInt("clothes_Id"));
			c.setClothes_class(rs.getString("clothes_class"));
			c.setClothes_brand(rs.getString("clothes_brand"));
			c.setClothes_name(rs.getString("clothes_name"));
			c.setClothes_price(rs.getFloat("clothes_price"));
			c.setClothes_store(rs.getInt("clothes_store"));
			c.setClothes_des(rs.getString("clothes_des"));
			c.setClothes_imgId(rs.getString("clothes_imgId"));
			c.setClothes_person(rs.getInt("clothes_person"));
			Clothess.add(c);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return  Clothess;
	
	}

	@Override
	public ArrayList<Clothes> getAllClothesByTuiguang() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Clothes getClothesInfoByClothesId(int clothesId) {
		Clothes  c=null;
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery("select *  from  clothes  where clothes_Id="+clothesId);
		
		while(rs.next())
		{
			  c=new Clothes();
			c.setClothes_Id(rs.getInt("clothes_Id"));
			c.setClothes_class(rs.getString("clothes_class"));
			c.setClothes_brand(rs.getString("clothes_brand"));
			c.setClothes_name(rs.getString("clothes_name"));
			c.setClothes_price(rs.getFloat("clothes_price"));
			c.setClothes_store(rs.getInt("clothes_store"));
			c.setClothes_des(rs.getString("clothes_des"));
			c.setClothes_imgId(rs.getString("clothes_imgId"));
			c.setClothes_person(rs.getInt("clothes_person"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return  c;
	
	}
	
	public ArrayList<Clothes> searchClothessByCondition(String clothes_class, String clothes_brand, String clothes_name, String clothes_minprice,
			String clothes_maxprice) {
		/**
		 * 条件有很多种不同，那么sql语句就应该有对应的变动
		 */
		System.out.println(clothes_class);
		String SQL="select *  from  clothes  where  1=1";
		if(clothes_class!=null&&!clothes_class.equals("")) {
			SQL+="   and  clothes_class='" +clothes_class+"'";
		}
		if(clothes_brand!=null&&!clothes_brand.equals("")) {
			SQL+="   and  clothes_brand='"+clothes_brand+"'";
		}
		if(clothes_name!=null&&!clothes_name.equals("")) {
			SQL+="   and  clothes_name='"+clothes_name+"'";
		}
		if(clothes_minprice!=null&&!clothes_minprice.equals("")) {
			SQL+="   and  clothes_price>="+clothes_minprice;
		}
		if(clothes_maxprice!=null&&!clothes_maxprice.equals("")) {
			SQL+="  and  clothes_price<="+clothes_maxprice;
		}
		
		System.out.println(SQL);
		
		ArrayList<Clothes>  Clothess=new  ArrayList<Clothes>();//定义一个集合存储查询出来的所有车辆信息
		ResultSet rs=null;
	try {
		rs=getSta().executeQuery(SQL);
		while(rs.next())
		{
			Clothes  c=new Clothes();
			c.setClothes_Id(rs.getInt("clothes_Id"));
			c.setClothes_class(rs.getString("clothes_class"));
			c.setClothes_brand(rs.getString("clothes_brand"));
			c.setClothes_name(rs.getString("clothes_name"));
			c.setClothes_price(rs.getFloat("clothes_price"));
			c.setClothes_store(rs.getInt("clothes_store"));
			c.setClothes_des(rs.getString("clothes_des"));
			c.setClothes_imgId(rs.getString("clothes_imgId"));
			c.setClothes_person(rs.getInt("clothes_person"));
			Clothess.add(c);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	disposeResource(getSta(), rs, getCon());
		return Clothess;
	}
	
	public Clothes parsetResultToClothes(ResultSet rs) {
		Clothes c = null;
		try {
			c = new Clothes();
			c.setClothes_Id(rs.getInt("clothes_Id"));
			c.setClothes_class(rs.getString("clothes_class"));
			c.setClothes_brand(rs.getString("clothes_brand"));
			c.setClothes_name(rs.getString("clothes_name"));
			c.setClothes_price(rs.getFloat("clothes_price"));
			c.setClothes_store(rs.getInt("clothes_store"));
			c.setClothes_des(rs.getString("clothes_des"));
			c.setClothes_imgId(rs.getString("clothes_imgId"));
			c.setClothes_person(rs.getInt("clothes_person"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return c;
	}
	@Override
	public ArrayList<Clothes> listClothesByPage(int page, int count) {
		ArrayList<Clothes> clothess = new ArrayList<Clothes>();// 定义一个集合存储查询出来的所有车辆信息
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select *  from  clothes    limit  "+(page-1)*count+" ,"+count);
			while (rs.next()) {

				clothess.add(parsetResultToClothes(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return clothess;
	}
	@Override
	public int getAllCountOfClothess() {
		int  n=0;
		ResultSet  rs=null;
		try {
			  rs=getSta().executeQuery("select count(clothes_Id)  from  clothes");
			  rs.next();
			  n=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public ArrayList<String> getfenleiname() {
		ArrayList<String> name = new ArrayList<String>();// 定义一个集合存储查询出来的所有车辆信息
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("SELECT DISTINCT clothes_name FROM clothes;");
			while (rs.next()) {
				name.add(rs.getString("clothes_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(name);
		return name;
	}
	@Override
	public ArrayList<String> getfenleiclass() {
		ArrayList<String> class1 = new ArrayList<String>();// 定义一个集合存储查询出来的所有车辆信息
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("SELECT DISTINCT clothes_class FROM clothes;");
			while (rs.next()) {
				class1.add(rs.getString("clothes_class"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(class1);
		return class1;
	}
	@Override
	public ArrayList<String> getfenleibrand() {
		ArrayList<String> brand = new ArrayList<String>();// 定义一个集合存储查询出来的所有车辆信息
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("SELECT DISTINCT clothes_brand FROM clothes;");
			while (rs.next()) {
				brand.add(rs.getString("clothes_brand"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(brand);
		return brand;
	}
	/**
	 * 模糊搜索
	 */
	@Override
	public ArrayList<Clothes> searchAllByKey(String key) {
		//根据给定的正则表达式拆分字符串
		String [] keys=key.split("\\s+");
		System.out.println("模糊数据："+keys);
		ArrayList<Clothes> clothess=new ArrayList<Clothes>();
		ResultSet res=null;
		try {
			res=getSta().executeQuery("select * from clothes limit 1");
			ResultSetMetaData data=res.getMetaData();
			String sql="select * from clothes where 1=0 or ";
			String[] columnName=new String [data.getColumnCount()];
			for(int n=1;n<=data.getColumnCount();n++) 
			{
				columnName[n-1]=data.getColumnLabel(n);
			}
			for(String k:keys) {
				if(k.equals("男")) {
					sql+=" ( 1=0";
					for(String column:columnName) {
						sql+=" or  "+column+" like '0' ";
					}
					sql+=") and";
				}else if(k.equals("女")) {
					sql+=" ( 1=0";
					for(String column:columnName) {
						sql+=" or  "+column+" like '1' ";
					}
					sql+=") and";
				}else {
				sql+=" ( 1=0";
				for(String column:columnName) {
					sql+=" or  "+column+" like '%"+k+"%' ";
				}
				sql+=") and";
				}
			}
			//去掉结尾的and
			sql=sql.substring(0,sql.length()-3);
			System.out.println("模糊查询sql:"+sql);
			res=getSta().executeQuery(sql);
			while(res.next()) 
			{
				Clothes g=new Clothes();
				g.setClothes_Id(res.getInt("clothes_Id"));
				g.setClothes_class(res.getString("clothes_class"));
				g.setClothes_brand(res.getString("clothes_brand"));
				g.setClothes_name(res.getString("clothes_name"));
				g.setClothes_price(res.getFloat("clothes_price"));
				g.setClothes_store(res.getInt("clothes_store"));
				g.setClothes_des(res.getString("clothes_des"));
				g.setClothes_imgId(res.getString("clothes_imgId"));
				g.setClothes_person(res.getInt("clothes_person"));
				clothess.add(g);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		disposeResource(getSta(),res, getCon());
		return clothess;
	}

	@Override
	public ArrayList<String> mohuSearch(String key) {
		ArrayList<String> titles = new ArrayList<String>();
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select  clothes_class  from  clothes  where clothes_class  like '%"+key+"%'  limit 5");
			while (rs.next()) {
					titles.add(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return titles;
	}
	

}
