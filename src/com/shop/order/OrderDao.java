package com.shop.order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.shop.db.DB;
import com.shop.goods.Goods;
import com.shop.goods.GoodsDao;
import com.shop.user.User;
import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;

public class OrderDao {
	DB db = new DB();
	Goods good = new Goods();
	Order order = new Order();
	OrderDetail detail = new OrderDetail();

	public OrderDao() {

		// TODO Auto-generated constructor stub
	}

	public OrderDao(Order order) {
		this.order = order;
		// TODO Auto-generated constructor stub
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	/**
	 * 添加单商品订单方法
	 * 
	 * @param user_id,good_id
	 * @return int 小于0表示失败
	 */
	public int doAddOrder(int user_id, int good_id) {// 数据库表名字段用了关键字，导致错误
		int result = -1;
		String sql = "INSERT orders(user_id,orderDate,address,contactman,postcode,orderSum,statuss,note) ";
		sql += "values(" + user_id + ",'" + order.getOrderDate() + "','" + order.getAddress() + "','"
				+ order.getContactman() + "";
		sql += "','" + order.getPostcode() + "'," + order.getOrderSum() + ",'" + order.getStatus() + "','"
				+ order.getNote() + "');";
		// System.out.println(sql);
		int a = db.executeUpdate(sql);
		if (a > 0) {
			String sql2 = "select max(order_id) from orders";
			// System.out.println(sql2);
			ResultSet rs = db.executeQuery(sql2);
			try {
				while (rs.next()) {
					int max = rs.getInt(1);
					// 通过good_id查询出商品信息，为了获取商品价格
					GoodsDao gdao = new GoodsDao();
					Goods goods = gdao.doQueryGoodsById(good_id);
					float good_price = goods.getGood_price();
					OrderDetail detail = new OrderDetail();
					detail.setGood_id(good_id);
					detail.setGood_price(good_price);
					detail.setQty(1);

					String sql3 = "INSERT order_detail(order_id,good_id,good_price,qty) value(" + max + ","
							+ detail.getGood_id() + ",'" + detail.getGood_price() + "'," + detail.getQty() + ")";
					// System.out.println(sql3);
					result = db.executeUpdate(sql3);

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		db.close();
		return result;
	}

	/**
	 * 添加多商品的订单
	 * 
	 * @param user_id
	 * @param good_ids
	 * @return
	 */
	public int doAddMoreGoodsOrder(int user_id,String[] good_ids) {
		int result = -1;
		String sql = "INSERT orders(user_id,orderDate,address,contactman,postcode,orderSum,statuss,note) ";
		sql += "values(" + user_id + ",'" + order.getOrderDate() + "','" + order.getAddress() + "','"
				+ order.getContactman() + "";
		sql += "','" + order.getPostcode() + "'," + order.getOrderSum() + ",'" + order.getStatus() + "','"
				+ order.getNote() + "');";
		// System.out.println(sql);
		int a = db.executeUpdate(sql);
		if (a > 0) {
			String sql2 = "select max(order_id) from orders";
			// System.out.println(sql2);
			ResultSet rs = db.executeQuery(sql2);
			try {
				while (rs.next()) {
					int max = rs.getInt(1);
					// 通过good_id查询出商品信息，为了获取商品价格
					GoodsDao gdao = new GoodsDao();

					for (int i = 0; i < good_ids.length; i++) {
						//System.out.println("数组：" + good_ids[i]);
						Integer good_id = Integer.parseInt(good_ids[i].trim());// 循环查出商品id
						//System.out.println("数组转以后：" + good_id);
						Goods goods = gdao.doQueryGoodsById(good_id);
						float good_price = goods.getGood_price();
						OrderDetail detail = new OrderDetail();
						detail.setGood_id(good_id);
						detail.setGood_price(good_price);
						detail.setQty(1);
						String sql3 = "INSERT order_detail(order_id,good_id,good_price,qty) value(" + max + ","
								+ detail.getGood_id() + ",'" + detail.getGood_price() + "'," + detail.getQty() + ")";
						// System.out.println(sql3);
						result = db.executeUpdate(sql3);
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		db.close();
		return result;

	}

	/**
	 * 通过订单id查订单详情
	 * 
	 * @return ArrayList<OrderDetail>
	 */
	public ArrayList<OrderDetail> doQueryOrderDetByid(int order_id) {

		ArrayList<OrderDetail> detaillist = new ArrayList<OrderDetail>();
		String sql = "select * from order_detail where order_id="+order_id+"";
		//System.out.println(sql);
		ResultSet rs = db.executeQuery(sql);
		try {
			while (rs.next()) {
				detail = new OrderDetail();
				detail.setGood_id(rs.getInt("good_id"));
				detail.setOrder_id(rs.getInt("order_id"));
				detail.setGood_price(rs.getFloat("good_price"));
				detail.setQty(rs.getInt("qty"));
				detaillist.add(detail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return detaillist;
	}

	/**
	 * 查询所有订单
	 * 
	 * @return ArrayList<Order>
	 */
	public ArrayList<Order> doQueryAllOrder() {
		ArrayList<Order> orderlist = new ArrayList<Order>();
		String sql = "select * from orders o left join order_detail ol on ol.order_id = o.order_id";
		ResultSet rs = db.executeQuery(sql);
		try {
			while (rs.next()) {
				order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setAddress(rs.getString("address"));
				order.setContactman(rs.getString("contactman"));
				order.setPostcode(rs.getString("postcode"));
				order.setUser_id(rs.getInt("user_id"));
				order.setOrderSum(rs.getFloat("orderSum"));
				order.setStatus(rs.getString("statuss"));
				order.setDealDate(rs.getString("dealDate"));
				orderlist.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return orderlist;
	}
	/**
	 * 通过用户查询该用户的订单
	 * @param user_id
	 * @return
	 */
	public ArrayList<Order> doQueryOrderByUserid(int user_id){
		ArrayList<Order> orderlist=new ArrayList<Order>();
		String sql = "select * from orders where user_id="+user_id+" ";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				order = new Order();
				order.setOrder_id(rs.getInt("order_id"));
				order.setOrderDate(rs.getString("orderDate"));
				order.setAddress(rs.getString("address"));
				order.setContactman(rs.getString("contactman"));
				order.setPostcode(rs.getString("postcode"));
				order.setUser_id(rs.getInt("user_id"));
				order.setOrderSum(rs.getFloat("orderSum"));
				order.setStatus(rs.getString("statuss"));
				order.setDealDate(rs.getString("dealDate"));
				orderlist.add(order);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderlist;
	}
	/**
	 * 修改订单状态，为支付状态
	 * @param user_id
	 * @param order_id
	 * @return 小于0表失败
	 */
	public int doUpdateStatusById(int user_id,int order_id){
		int result=-1;
		String sql="update orders set statuss='已支付' where user_id="+user_id+" and order_id="+order_id+" ";
		System.out.println(sql);
		result=db.executeUpdate(sql);
		db.close();
		return result;
		
	}
	/**
	 * 返回当前最大id订单
	 * @return int最大值
	 */
	public int returnMaxOrder(){
		int maxo=1;
		String sql = "select max(order_id) from orders";
		ResultSet rs=db.executeQuery(sql);
		try {
			while(rs.next()){
				maxo=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return maxo;
		
	}
}
