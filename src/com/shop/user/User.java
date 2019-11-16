package com.shop.user;
/**
 * 用户信息类
 * @author 陈艳
 * @data 2019-6-17
 *
 */
public class User {
	private int user_id;//用户ID
	private String username;//用户名
	private String password;//密码
	private String email;//邮件
	private String gender;//性别
	private String realname;//真实名称
	private String phone;//电话
	private String user_type;//用户类型
	public User(){
		
	}
	public User(int id) {
		super();
		this.user_id = id;
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
}
