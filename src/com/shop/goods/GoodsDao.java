package com.shop.goods;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.db.DB;
/**
 * 商品业务处理类
 * @author 田
 *
 */
public class GoodsDao {
	private DB db=new DB();
	private Goods goods=new Goods();
	
	public GoodsDao(){
		
	}
	public GoodsDao(Goods goods){
		this.goods=goods;
	}
	
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	/**
	 * 添加商品方法
	 * @return -1失败，>=0成功
	 */
	public int doAddGoods(){
		int result=-1;
		String sql="";
		/*String sql="SET FOREIGN_KEY_CHECKS=0;";
		db.executeUpdate(sql);*/
		sql="insert goods(good_name,type_id,good_price,store_id,good_discount,good_desc,supplier,qty,ispreferred,good_pic)";
		sql+="VALUES ('"+goods.getGood_name()+"',"+goods.getType_id()+","+goods.getGood_price()+",'"+goods.getStore_id()+"',"+goods.getGood_discount()+",'";
		sql+= ""+goods.getGood_desc()+"','"+goods.getSupplier()+"',"+goods.getQty()+",0,'"+goods.getGood_pic()+"');";
		int a=db.executeUpdate(sql);
		if(a>=0){
			result=0;
			//System.out.println("成功");
		}
		return result;
	}
	/**
	 * 查询所有商品所有信息
	 * @return ArrayList
	 */
	public ArrayList<Goods> doQueryAllGoods(){
		String sql="select * FROM goods as g left join goods_type as gt on g.type_id = gt.type_id left join store as s on g.store_id = s.store_id;";
		ResultSet rs=db.executeQuery(sql);
		ArrayList<Goods> goodslist = new ArrayList<Goods>();
		try {
			while(rs.next()){
				goods=new Goods();
				goods.setGood_id(rs.getInt("good_id"));
				goods.setGood_name(rs.getString("good_name"));
				goods.setType_id(rs.getInt("type_id"));
				goods.setGood_price(rs.getFloat("good_price"));
				goods.setGood_discount(rs.getFloat("good_discount"));
				goods.setGood_pic(rs.getString("good_pic"));//图片
				goods.setGood_desc(rs.getString("good_desc"));
				
				goods.setSupplier(rs.getString("supplier"));
				goods.setQty(rs.getInt("qty"));
				goods.setIspreferred(rs.getInt("ispreferred"));
				
				
				goodslist.add(goods);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return goodslist;
	}
	/**
	 * 通过商品id查找商品所有信息
	 * @param good_id 
	 * @return Goods
	 */
	public Goods doQueryGoodsById(int good_id){
		String sql="select * FROM goods as g left join goods_type as gt on g.type_id = gt.type_id left join store as s on g.store_id = s.store_id where 1=1";
		sql+=" and good_id="+good_id+"";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				goods=new Goods();
				goods.setGood_id(rs.getInt("good_id"));
				goods.setGood_name(rs.getString("good_name"));
				goods.setType_id(rs.getInt("type_id"));
				goods.setGood_price(rs.getFloat("good_price"));
				goods.setGood_discount(rs.getFloat("good_discount"));
				goods.setGood_pic(rs.getString("good_pic"));//图片
				goods.setGood_desc(rs.getString("good_desc"));
				
				goods.setSupplier(rs.getString("supplier"));
				goods.setQty(rs.getInt("qty"));
				goods.setIspreferred(rs.getInt("ispreferred"));
				goods.setStore_name(rs.getString("store_name"));
				goods.setType_name(rs.getString("type_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return goods;
	}
	
	/**
	 * 删除商品通过id
	 * @param good_id
	 * @return
	 */
	public int doDeleteGoodsById(int good_id){
		int result=-1;
		String sql="SET FOREIGN_KEY_CHECKS=0;";
		db.executeUpdate(sql);
		sql="delete from goods where good_id="+good_id+"";
		result=db.executeUpdate(sql);
		db.close();
		return result;
		
	}
	/**
	 * 通过商品类型id或商品名称查找商品
	 * @param type_id
	 * @param good_name
	 * @return ArrayList<Goods>
	 */
	public ArrayList<Goods> doQueryGoodsByName(int type_id,String good_name){
		ArrayList<Goods> goodslist = new ArrayList<Goods>();
		String sql="select * FROM goods as g left join goods_type as gt on g.type_id = gt.type_id left join store as s on g.store_id = s.store_id where 1=1";
		if(type_id != 0){
			sql+=" and gt.type_id = "+type_id+"";//注意“=”连接的两边不要与等号连在一起
		}
		if(good_name != null){
			sql+=" and good_name like'%"+good_name+"%'";
		}
		//System.out.println(sql);
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				goods=new Goods();
				goods.setGood_id(rs.getInt("good_id"));
				goods.setGood_name(rs.getString("good_name"));
				goods.setType_id(rs.getInt("type_id"));
				goods.setGood_price(rs.getFloat("good_price"));
				goods.setGood_discount(rs.getFloat("good_discount"));
				goods.setGood_pic(rs.getString("good_pic"));//图片
				goods.setGood_desc(rs.getString("good_desc"));
				
				goods.setSupplier(rs.getString("supplier"));
				goods.setQty(rs.getInt("qty"));
				goods.setIspreferred(rs.getInt("ispreferred"));
				goods.setStore_name(rs.getString("store_name"));
				goods.setType_name(rs.getString("type_name"));
				goodslist.add(goods);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodslist;
	}
}
