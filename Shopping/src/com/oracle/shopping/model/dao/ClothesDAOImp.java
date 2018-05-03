package com.oracle.shopping.model.dao;

import java.sql.ResultSet;
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
	

}
