package com.oracle.shopping.model.dao;

import java.util.ArrayList;

import com.oracle.shopping.model.bean.Clothes;

public interface ClothesDAO extends BaseDAO {
	/*
	 * 设计一个可以根据用户传入的数量查询显示出最近发布的二手车信息
	 */
	public ArrayList<Clothes>  listRecentClothessByCount(int count);
	
	
	/**
	 * 定义一个查询需要推广显示到滚动区域二手车信息的方法
	 */
	public  ArrayList<Clothes>  getAllClothesByTuiguang();

	/**
	 * 
	 * @param carId 要查询的车辆ID
	 * @return  一个查询并封装好的Car对象
	 */
	public Clothes  getClothesInfoByClothesId(int clothesId);
	
	
	/**
	 * 分页查询车辆信息的方法
	 * @param page   传入的页面
	 * @param count  传入的每页查看多少条数据
	 * @return   返回这一页的count条车辆信息
	 */
		public ArrayList<Clothes>  listClothesByPage(int page,int count);


		public int getAllCountOfClothess();
		
		/**
		 * 获取衣服分类
		 * @return
		 */
		public  ArrayList<String>  getfenleiname();
		public ArrayList<String> getfenleiclass(); 
		public ArrayList<String> getfenleibrand(); 
		
		/**
		 * 根据模糊关键字查询所有的内容
		 * @param key
		 * @return
		 */
		public  abstract ArrayList<Clothes>  searchAllByKey(String key);
		
		/**
		 * 模糊搜索返回值
		 * @param key
		 * @return
		 */
		public  ArrayList<String>  mohuSearch(String key);
		
	/** 
	 * 定义一个搜索栏
	 * 目前不需要
	 */
	//public    ArrayList<Clothes>  searchCarsByCondition(String pinpai,String minPrice,String maxPrice,String minMile,String maxMile);
	}

