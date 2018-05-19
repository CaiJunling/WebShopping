package com.oracle.shopping.model.bean;


public class Clothes {
	private int   clothes_Id;
	private String  clothes_class;
	private String clothes_brand;
	private String  clothes_name;
	private float clothes_price;
	private int  clothes_store;
	private String clothes_des;
	private String clothes_imgId;
	private int clothes_person;
	
	public Clothes(int clothes_Id){
		super();
		this.clothes_Id = clothes_Id;
	}
	
	public Clothes(){
		super();
	}
	
	public int getClothes_Id() {
		return clothes_Id;
	}
	public void setClothes_Id(int clothes_Id) {
		this.clothes_Id = clothes_Id;
	}
	public String getClothes_class() {
		return clothes_class;
	}
	public void setClothes_class(String clothes_class) {
		this.clothes_class = clothes_class;
	}
	public String getClothes_brand() {
		return clothes_brand;
	}
	public void setClothes_brand(String clothes_brand) {
		this.clothes_brand = clothes_brand;
	}
	public String getClothes_name() {
		return clothes_name;
	}
	public void setClothes_name(String clothes_name) {
		this.clothes_name = clothes_name;
	}
	public float getClothes_price() {
		return clothes_price;
	}
	public void setClothes_price(float clothes_price) {
		this.clothes_price = clothes_price;
	}
	public int getClothes_store() {
		return clothes_store;
	}
	public void setClothes_store(int clothes_store) {
		this.clothes_store = clothes_store;
	}
	public String getClothes_des() {
		return clothes_des;
	}
	public void setClothes_des(String clothes_des) {
		this.clothes_des = clothes_des;
	}
	public String getClothes_imgId() {
		return clothes_imgId;
	}
	public void setClothes_imgId(String clothes_imgId) {
		this.clothes_imgId = clothes_imgId;
	}
	public int getClothes_person() {
		return clothes_person;
	}
	public void setClothes_person(int clothes_person) {
		this.clothes_person = clothes_person;
	}
	
	@Override
	public boolean equals(Object obj) {
		System.out.println("zheshi equals");
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Clothes other = (Clothes) obj;
		if (clothes_Id != other.clothes_Id)
			return false;
		System.out.println("end equals");
		return true;
	}
	
	@Override
	public String toString() {
		return "Clothes [clothes_Id=" + clothes_Id + ", clothes_class=" + clothes_class + ", clothes_brand="
				+ clothes_brand + ", clothes_name=" + clothes_name + ", clothes_price=" + clothes_price
				+ ", clothes_store=" + clothes_store + ", clothes_des=" + clothes_des + ", clothes_imgId="
				+ clothes_imgId + ", clothes_person=" + clothes_person + "]";
	}

}
