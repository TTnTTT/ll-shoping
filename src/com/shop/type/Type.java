package com.shop.type;

public class Type {
	
	private int type_id;//商品类型id
	private String type_name;//类型名
	private String type_desc;//类型描述
	public Type() {
		super();	
	}
	public Type(int type_id) {
		super();
		this.type_id = type_id;
	}
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getType_desc() {
		return type_desc;
	}
	public void setType_desc(String type_desc) {
		this.type_desc = type_desc;
	}
	
}
