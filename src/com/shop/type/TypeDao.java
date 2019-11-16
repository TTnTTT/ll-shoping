package com.shop.type;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.db.DB;

public class TypeDao {
	DB db=new DB();
	Type type=new Type();
	public TypeDao() {
		//super();
		// TODO Auto-generated constructor stub
	}
	public TypeDao(Type type) {
		this.type=type;
		// TODO Auto-generated constructor stub
	}
	
	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}
	/**
	 * 添加商品类型
	 * @return int 
	 * 小于0失败
	 */
	public int doAddGoodsType(){
		int result=-1;
		String sql="insert goods_type(type_name,type_desc) values('"+type.getType_name()+"','"+type.getType_desc()+"')";
		result=db.executeUpdate(sql);
		return result;
	}
	/**
	 * 查询所有商品类型，有多条需要存入一个集合
	 * @return Type
	 * 
	 */
	public ArrayList<Type> doQueryAllGoodsType(){
		ArrayList<Type> typelist=new ArrayList<Type>();
		String sql="select * from goods_type;";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				type=new Type();
				type.setType_id(rs.getInt("type_id"));
				type.setType_name(rs.getString("type_name"));
				type.setType_desc(rs.getString("type_desc"));
				typelist.add(type);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return typelist;
		
	}
	/**
	 * 通过商品类型id查找商品类型名，即只要一条，无需ArrayLIst
	 * @return
	 */
	public Type doQueryGoodsTypeById(int type_id){
		String sql="select * from goods_type where type_id="+type_id+"";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				type=new Type();
				type.setType_id(rs.getInt("type_id"));
				type.setType_name(rs.getString("type_name"));
				type.setType_desc(rs.getString("type_desc"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return type;
		
	}
}
