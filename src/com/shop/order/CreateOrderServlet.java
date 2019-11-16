package com.shop.order;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.goods.Goods;
import com.shop.goods.GoodsDao;
import com.shop.user.User;
import com.shop.user.UserDao;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	//session中获取用户，request获取提交页面传来的id
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		int user_id=user.getUser_id();
		//System.out.println(user);
		//获取类型
		
		int type=Integer.parseInt(request.getParameter("type"));
		//System.out.println(type);
		//单个商品，立即购买来
		int good_id=0;
		if(type==1){
			good_id=Integer.parseInt(request.getParameter("good_id"));
		}
		/*String gs=request.getParameter("good_id");
		System.out.println("但商品"+gs+gs.length());
		int good_id=0;
		if(gs != null){//不为空才执行
			good_id=Integer.parseInt(gs.trim());
		}*/
		//多个商品的id，购物车页面来的，若为空则执行单添加方法
		String[] good_ids=null;
		if(type==2){
			//System.out.println("---"+request.getParameter("good_ids"));
			good_ids=request.getParameter("good_ids").split("\\s+");//此处用正则表达式去空格
			//System.out.println("长度:"+good_ids.length);
			//System.out.println("项:"+good_ids[0]);
		}
		//System.out.println("多商品："+good_ids);
		/*String gss=request.getParameter("good_ids");
		String[] good_ids=null;
		System.out.println("控制器good_ids:"+gss);
		if(gss != null){
			good_ids=gss.split(";");
		}*/
		String contactman=request.getParameter("contactman");
		String address=request.getParameter("address");
		String postcode=request.getParameter("postcode");
		//System.out.println("价格"+request.getParameter("ordersum"));
		float ordersum=Float.parseFloat(request.getParameter("ordersum"));
		
		String note=request.getParameter("note");
		
	//获取时间
		Calendar today=Calendar.getInstance();
		int year=today.get(Calendar.YEAR);
		int month=today.get(Calendar.MONTH)+1;
		int day=today.get(Calendar.DAY_OF_MONTH);
		int hour=today.get(Calendar.HOUR_OF_DAY);
		int minute=today.get(Calendar.MINUTE);
		int second=today.get(Calendar.SECOND);
		String orderDate=year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second;
		
	
	//内容设入Order对象
		Order order=new Order(user_id,orderDate,address,contactman,postcode,ordersum,"111","未支付", note);
	//调用OrderDao方法
		OrderDao odao=new OrderDao(order);
		if(type==2){//1、当是多商品传来时
			int result=odao.doAddMoreGoodsOrder(user_id,good_ids);
			if(result>=0){
				response.sendRedirect("order/pay.jsp");
			}else{
				response.sendRedirect("order/false.jsp");
			}
		}else{//2、当是单商品传来时
			int result=odao.doAddOrder(user_id,good_id);
			if(result>=0){
				response.sendRedirect("order/pay.jsp");
			}else{
				response.sendRedirect("order/false.jsp");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
