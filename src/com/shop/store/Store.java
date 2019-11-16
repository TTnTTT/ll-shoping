package com.shop.store;

public class Store {
	
	public Store(String store_name, String store_desc) {
		super();
		this.store_name = store_name;
		this.store_desc = store_desc;
	}
	private int store_id;//商店id
	private String store_name;//商店名
	private String store_desc;//商店描述
	private int user_id;//开店用户id
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Store(int store_name) {
		super();
		this.store_id=store_name;
		// TODO Auto-generated constructor stub
	}
	public Store(int store_id, String store_name) {
		super();
		this.store_id = store_id;
		this.store_name = store_name;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getStore_desc() {
		return store_desc;
	}
	public void setStore_desc(String store_desc) {
		this.store_desc = store_desc;
	}
	
}
