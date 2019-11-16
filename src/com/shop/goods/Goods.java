package com.shop.goods;
/**
 * 商品类
 * @author 田
 *
 */
public class Goods {
	private int good_id;//商品id
	private String good_name;//商品名称
	private int store_id;//店家id
	private float good_price;//商品价格
	private int qty;//库存数量
	private String good_pic;//商品图片
	private int order_detail_id;//商品详情
	private int type_id;//类型id
	private float good_discount;//商品折扣
	private String good_desc;//商品描述
	private String supplier;//商品生产商
	private int ispreferred;//是否推荐商品
	
	private String store_name;//店家名称
	private String type_name;//商品类型名称
	
	public Goods(){
		super();
	}
	public Goods(int good_id){
		this.good_id=good_id;
	}
	public Goods(String good_name, String type_name) {
		super();
		this.good_name = good_name;
		this.type_name = type_name;
	}
	public Goods(String good_name) {
		super();
		this.good_name = good_name;
	}
	public Goods(String good_name, int store_id, float good_price, int qty, String good_pic,
			int type_id, float good_discount, String good_desc, String supplier, int ispreferred, String store_name) {
		super();
		this.good_name = good_name;
		this.store_id = store_id;
		this.good_price = good_price;
		this.qty = qty;
		this.good_pic = good_pic;
		
		this.type_id = type_id;
		this.good_discount = good_discount;
		this.good_desc = good_desc;
		this.supplier = supplier;
		this.ispreferred = ispreferred;
		this.store_name = store_name;
	}
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public int getOrder_detail_id() {
		return order_detail_id;
	}
	public void setOrder_detail_id(int order_detail_id) {
		this.order_detail_id = order_detail_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public float getGood_price() {
		return good_price;
	}
	public void setGood_price(float good_price) {
		this.good_price = good_price;
	}
	public float getGood_discount() {
		return good_discount;
	}
	public void setGood_discount(float good_discount) {
		this.good_discount = good_discount;
	}
	public String getGood_desc() {
		return good_desc;
	}
	public void setGood_desc(String good_desc) {
		this.good_desc = good_desc;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getIspreferred() {
		return ispreferred;
	}
	public void setIspreferred(int ispreferred) {
		this.ispreferred = ispreferred;
	}
	public String getGood_pic() {
		return good_pic;
	}
	public void setGood_pic(String good_pic) {
		this.good_pic = good_pic;
	}
	public int getStore_id() {
		return store_id;
	}
	public void setStore_id(int store_name) {
		this.store_id = store_name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
}
