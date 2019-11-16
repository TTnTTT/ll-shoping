package com.shop.shopcar;

public class ShopCar {
	public ShopCar(int car_id, int user_id, int good_id, int count) {
		super();
		this.car_id = car_id;
		this.user_id = user_id;
		this.good_id = good_id;
		this.count = count;
	}
	public ShopCar() {
		super();
	}
	private int car_id;
	private int user_id;
	private int good_id;
	private int count;
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
