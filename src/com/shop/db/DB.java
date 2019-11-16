package com.shop.db;
import java.sql.*;

/**
 * 数据库操作工具类
 * @author 田何理
 *@date 2018-04-02
 */
public class DB {
	Connection conn=null;//数据库连接对象
	Statement stmt=null;//发送sql命令的对象
	ResultSet rs = null;//查询结果集
	/**
	 *一、 构造方法的时候加载数据库驱动程序
	 */
	public DB(){
		try {
			Class.forName("com.mysql.jdbc.Driver");//new时即完成驱动
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			//System.out.println("数据库驱动失败");
			e.printStackTrace();
		}
	}
	/**
	 *二、 连接数据库
	 * @return
	 */
	public Connection getConn(){
		String url="jdbc:mysql://localhost:3306/maildb?characterEncoding=utf-8";
		String user="root";
		String pass="root";
		try {
			conn=DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;//返回
	}
	/**
	 * 三、构造发送sql命令的Statement对象
	 * @return
	 */
	public Statement getStmt(){
		try {
			if(conn==null){
				conn=getConn();
			}
			stmt=conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
	}
	/**
	 * 构造SQL(查询-select)命令并发送
	 * @return ResultSet
	 */
	public ResultSet executeQuery(String sql){
		try {
			if(stmt==null){
				stmt=getStmt();
			}
			rs=stmt.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	/**
	 * 构造SQL(修改-insert，update，delete)命令并发送
	 * @return 大于0表成功，小于等于0表失败
	 */
	public int executeUpdate(String sql){
		//4、构造SQL命令并发送到数据库执行
		int row=-1;
		try {
			if(stmt==null){
				stmt=getStmt();
			}
			row=stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}
	/**
	 * 关闭数据库
	 */
	public void close(){
		//6\关闭数据库
		try{
			if(rs != null){
				rs.close();
				rs=null;
			}
			if(stmt != null){
				stmt.close();
				stmt=null;
			}
			if(conn != null){
				conn.close();
				conn=null;
			}
		}catch(SQLException e){
			
		}
	}
	
}

