package com.shop.store;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.db.DB;
public class StoreDao {
	DB db=new DB();
	Store store=new Store();
	public StoreDao() {
		//super();
		// TODO Auto-generated constructor stub
	}
	public StoreDao(Store store) {
		this.store=store;
		// TODO Auto-generated constructor stub
	}
	
	public Store getStore() {
		return store;
	}

	public void setType(Store store) {
		this.store = store;
	}
	/**
	 * 添加店家
	 * @return int 
	 * 小于0失败
	 */
	public int doAddStore(int user_id){
		int result=-1;
		String sql="insert store(store_name,store_desc,user_id) values('"+store.getStore_name()+"','"+store.getStore_desc()+"',"+user_id+")";
		result=db.executeUpdate(sql);
		return result;
	}
	/**
	 * 通过店家id查找店名
	 * @return
	 */
	public Store doQueryStoreById(int store_id){
		String sql="select * from store where store_id="+store_id+"";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				store=new Store();
				store.setStore_id(rs.getInt("store_id"));
				store.setStore_name(rs.getString("store_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return store;
		
	}
	/**
	 * 通过用户id查用户所有的店
	 * @param user_id
	 * @return
	 */
	public ArrayList<Store> doQueryStoreByUid(int user_id){
		ArrayList<Store> storelist=new ArrayList<Store>();
		String sql="select * from store where user_id="+user_id+"";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				store=new Store();
				store.setStore_id(rs.getInt("store_id"));
				store.setStore_name(rs.getString("store_name"));
				store.setUser_id(rs.getInt("user_id"));
				store.setStore_desc(rs.getString("store_desc"));
				storelist.add(store);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return storelist;
		
	}
}
