package com.shop.user;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.shop.db.DB;

/**
 * UserDao用户操作类
 * @author 陈艳
 * @date 2019-6-17
 *
 */
public class UserDao {
	private User user;//用户信息
	private DB db = new DB();
	
	public UserDao(){
		
	}
	
	public UserDao(User user){
		this.user = user;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	/**
	 * 登录验证
	 * @return
	 */
	public boolean isLogin(){
		boolean result = false;
		
		String sql = "select username from userinfo where username='";
		sql += user.getUsername() + "' and password='" + user.getPassword() + "';";
		ResultSet rs = db.executeQuery(sql);
		try {
			result = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			db.close();
		}
		
		return result;
	}
	
	public boolean isExitsByUserName(){
		return false;
	}
	
	/**
	 * 注册
	 * @return 大于等于0表成功
	 */
	public int doRegister(){
		int row = -1;
		
		String sql = "insert into userinfo(username,password,email,gender,realname,phone)values('" + user.getUsername();
		sql += "','" + user.getPassword() + "','" + user.getEmail() + "','" + user.getGender();
		sql += "','" + user.getRealname() + "','" + user.getPhone() + "');";
		System.out.println(sql);
		row = db.executeUpdate(sql);
		db.close();
		
		return row;
	}
	/**
	 * 根据用户名得到完整用户信息
	 * @param username 用户名
	 * @return 完整用户
	 */
	public User doSelectByUsername(String username){
		User user = null;
		String sql="select user_id,username,password,email,gender,realname,phone,user_type from userinfo where username='"+username+"';";
		ResultSet rs = db.executeQuery(sql);
		try {
			if(rs.next()){
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setRealname(rs.getString("realname"));
				user.setPhone(rs.getString("phone"));
				user.setUser_type(rs.getString("user_type"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return user;
	}
}

