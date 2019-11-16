package com.shop.shopcar;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.db.DB;
import com.shop.goods.Goods;

public class CarDao {
	public CarDao() {
		super();	
	}
	public CarDao(ShopCar car) {
		super();
		this.car = car;
	}
	private DB db=new DB();
	private ShopCar car=new ShopCar();
	
	public ShopCar getCar() {
		return car;
	}
	public void setCar(ShopCar car) {
		this.car = car;
	} 
	/**
	 * 添加购物车
	 * @param user_id
	 * @param good_id
	 * @param count
	 * @return
	 */
	public int addCar(int user_id,int good_id,int count){
		int result=-1;
		String sql="insert shopcar(user_id,good_id,counts) values("+user_id+","+good_id+","+count+")";
		result=db.executeUpdate(sql);
		db.close();
		return result;
		
	}
	/**
	 * 通过用户id查购物车
	 * @param user_id
	 * @return ArrayList
	 */
	public ArrayList<ShopCar> doQueryCarById(int user_id){
		ArrayList<ShopCar> carlist = new ArrayList<ShopCar>();
		String sql="select * from shopcar where user_id="+user_id+";";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				car=new ShopCar(rs.getInt("car_id"),rs.getInt("user_id"),rs.getInt("good_id"),rs.getInt("counts"));
				carlist.add(car);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return carlist;
		
	}
	/**
	 * 通过商品id查商品
	 * @param good_id
	 * @return
	 */
	public ShopCar doQueryCarByGoodId(int good_id,int user_id){
		String sql="select * from shopcar where good_id="+good_id+" and user_id="+user_id+";";
		//System.out.println(sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
			car=new ShopCar(rs.getInt("car_id"),rs.getInt("user_id"),rs.getInt("good_id"),rs.getInt("counts"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return car;
	}
	/**
	 * 通过商品id改商品数量
	 * @param good_id
	 * @return
	 */
	public int doAddCountByGoodid(int good_id){
		int a=-1;
		String sql="update shopcar SET counts=counts+1 where good_id="+good_id+" ";
		a=db.executeUpdate(sql);
		db.close();
		
		return a;
		
	}
	/**
	 * 删除用户通过商品id
	 * @param good_id
	 * @return
	 */
	public int doDelGoodById(int good_id){
		int result=-1;
		String sql="delete from shopcar where good_id="+good_id+";";
		result=db.executeUpdate(sql);
		db.close();
		return result;
		
	}
}
