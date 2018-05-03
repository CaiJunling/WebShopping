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
	 * 定义一个搜索栏
	 * 目前不需要
	 */
	//public    ArrayList<Clothes>  searchCarsByCondition(String pinpai,String minPrice,String maxPrice,String minMile,String maxMile);
	}

