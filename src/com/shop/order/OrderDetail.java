package com.shop.order;

public class OrderDetail {
	private int order_detail_id;//订单详情id
	private int order_id;//订单id
	private int good_id;//商品id
	private float good_price;//单商品总价格
	private int qty;//商品数量
	public OrderDetail() {
		super();
		
	}
	public OrderDetail(int order_detail_id, int order_id) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
	}
	public OrderDetail(int order_detail_id) {
		super();
		this.order_detail_id = order_detail_id;
	}
	public OrderDetail(int order_detail_id, int order_id, int good_id, float good_price, int qty) {
		super();
		this.order_detail_id = order_detail_id;
		this.order_id = order_id;
		this.good_id = good_id;
		this.good_price = good_price;
		this.qty = qty;
	}
	
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public float getGood_price() {
		return good_price;
	}
	public void setGood_price(float good_price) {
		this.good_price = good_price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
}
