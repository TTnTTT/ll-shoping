package com.shop.order;
/**
 * 订单类
 * @author 田
 *
 */
public class Order {
	
	private int order_id;//订单id
	private int user_id;//用户id
	private String orderDate;//订单日期
	private String address;//收货地址
	private String contactman;//收货人
	private String postcode;//邮政编码
	private float orderSum;//订单总额
	private String dealDate;//订单处理日期
	private String status;//订单状态
	private String note;//备注
	private String user_name;//下单人
	public Order(){
		super();
	}
	public Order(int order_id){
		super();
		this.order_id=order_id;
	}
	public Order(String contactman, String user_name) {
		super();
		this.contactman = contactman;
		this.user_name = user_name;
	}
	public Order(int user_id, String orderDate, String address, String contactman, String postcode,float orderSum, String dealDate, String status, String note) {
		super();
		
		this.user_id = user_id;
		this.orderDate = orderDate;
		this.address = address;
		this.contactman = contactman;
		this.postcode = postcode;
		this.orderSum = orderSum;
		this.dealDate = dealDate;
		this.status = status;
		this.note = note;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContactman() {
		return contactman;
	}
	public void setContactman(String contactman) {
		this.contactman = contactman;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public float getOrderSum() {
		return orderSum;
	}
	public void setOrderSum(float orderSum) {
		this.orderSum = orderSum;
	}
	public String getDealDate() {
		return dealDate;
	}
	public void setDealDate(String dealDate) {
		this.dealDate = dealDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
}
