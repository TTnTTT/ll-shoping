package com.shop.test;


import java.util.ArrayList;
import java.util.Iterator;

import com.shop.db.DB;
import com.shop.goods.Goods;
import com.shop.goods.GoodsDao;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DB db=new DB();
		GoodsDao dao=new GoodsDao();
		/**
		 * 测试加入goods表
		 * sql=SET FOREIGN_KEY_CHECKS=0;insert goods(good_name,type_id,good_price,good_discount,good_desc,supplier,qty,ispreferred,good_pic,order_detail_id) VALUES ('aa',1,1,1,'good','aa',1,1,'sds',1);
		 */
		/*String sql="SET FOREIGN_KEY_CHECKS=0;";
		db.executeUpdate(sql);*/
		/*String sql="insert goods(good_name,type_id,good_price,good_discount,good_desc,supplier,qty,ispreferred,good_pic,order_detail_id) VALUES ('ba',1,1,1,'good','bb',1,1,'sds',2);";
		int a=db.executeUpdate(sql);
		if(a>=0){
			System.out.println("成功");
		}*/
	//测查询所有商品
		ArrayList<Goods> goodslist=dao.doQueryAllGoods();
		if(goodslist == null){
			return;
		}
		Iterator<Goods> it=goodslist.iterator();
		while(it.hasNext()){
			Goods goods=it.next();
			System.out.println(goods);//测试成功
		}
	}

}
