package com.shop.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.type.Type;
import com.shop.type.TypeDao;

/**
 * Servlet implementation class AddGoodsServlet
 */
@WebServlet("/AddGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddGoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session=request.getSession();
	//主页进来,需要获取商品类型并传出
		int flag=Integer.parseInt(request.getParameter("flag"));
		if(flag==1){
			//System.out.println(flag);
			TypeDao dao=new TypeDao();
			ArrayList<Type> typelist=dao.doQueryAllGoodsType();
			if(typelist != null){
			session.setAttribute("typelist", typelist);
			response.sendRedirect("goods/addGoods.jsp");
			}else{
				response.sendRedirect("false.jap");
			}
		}
		
	//增加商品页面进来
		flag=Integer.parseInt(request.getParameter("flag"));
		if(flag==2){
		//获取页面内容
		int store_id=Integer.parseInt(request.getParameter("store_id"));
		System.out.println("店家"+store_id);
		int type_id=Integer.parseInt(request.getParameter("type_id"));
		System.out.println("商品类型"+type_id);
		String good_name=request.getParameter("good_name");
		float good_price=Float.parseFloat(request.getParameter("good_price"));
		int qty=Integer.parseInt(request.getParameter("qty"));
		float good_discount=Float.parseFloat(request.getParameter("good_discount"));
		String good_desc=request.getParameter("good_desc");
		String supplier=request.getParameter("supplier");
		//商品图片
		String good_pic=request.getParameter("good_pic");
		//System.out.println(good_pic);
	//设入goods对象
		Goods goods=new Goods();
		goods.setGood_name(good_name);
		goods.setGood_price(good_price);
		goods.setQty(qty);
		goods.setGood_discount(good_discount);
		goods.setGood_desc(good_desc);
		goods.setSupplier(supplier);
		goods.setGood_pic(good_pic);
		goods.setType_id(type_id);//设置商品类型id的类型
		
		goods.setStore_id(store_id);//设置店家id
		
	//调用dao类方法
		GoodsDao dao=new GoodsDao(goods);
		int a=dao.doAddGoods();
		if(a>=0){
			//成功
			response.sendRedirect("goods/add_ok.jsp");
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
