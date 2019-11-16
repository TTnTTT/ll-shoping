package com.shop.shopcar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.goods.Goods;
import com.shop.goods.GoodsDao;
import com.shop.user.User;

/**
 * Servlet implementation class MyShopCarServlet
 */
@WebServlet("/MyShopCarServlet")
public class MyShopCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyShopCarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//获取点击我的购物车的用户
		User user=(User)session.getAttribute("user");
		int user_id=user.getUser_id();
		
		CarDao dao=new CarDao();
		GoodsDao gdao = new GoodsDao();
		//查询出购物车表中所有记录
		ArrayList<ShopCar> carlist=dao.doQueryCarById(user_id);
		//session.setAttribute("carlist", carlist);
		Iterator<ShopCar> it=carlist.iterator();
		ArrayList<Goods> goodslist = new ArrayList<Goods>();
		
		while(it.hasNext()){
			ShopCar car=it.next();
			int good_id=car.getGood_id();
			
			Goods goods=gdao.doQueryGoodsById(good_id);
			
			//System.out.println(goods);
			goodslist.add(goods);
		}
		//存session数量也要单独存
			session.setAttribute("goodslist", goodslist);
			session.setAttribute("carlist", carlist);
		//c处理结果
			if (carlist != null) {
				response.sendRedirect("goods/shopcar.jsp");
				// request.getRequestDispatcher("goods/shopcar.jsp").forward(request,response);
			}
		
		/*int good_id = Integer.parseInt(request.getParameter("good_id"));
		GoodsDao dao = new GoodsDao();
		Goods goods = dao.doQueryGoodsById(good_id);
		ArrayList<Goods> goodslist = null;
		if ((goodslist = (ArrayList<Goods>) session.getAttribute("goodslist")) == null) {
			goodslist = new ArrayList<Goods>();// 把每次点击添加购物车请求的商品都存进来
		}
		goodslist.add(goods);
		session.setAttribute("goodslist", goodslist);
		if (goods != null) {
			response.sendRedirect("goods/shopcar.jsp");
			// request.getRequestDispatcher("goods/shopcar.jsp").forward(request,response);
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
