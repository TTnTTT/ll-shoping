package com.shop.shopcar;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.user.User;
import com.shop.user.UserDao;

/**
 * Servlet implementation class AddCarServlet
 */
@WebServlet("/AddCarServlet")
public class AddCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCarServlet() {
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
		
		PrintWriter out=response.getWriter();
		//页面传来要加购的商品id
		int good_id=Integer.parseInt(request.getParameter("good_id")) ;
		//session中取user信息
		User user=(User)session.getAttribute("user");
		int user_id=user.getUser_id();
		
		CarDao dao=new CarDao();
		ShopCar car=dao.doQueryCarByGoodId(good_id,user_id);
		//System.out.println(car);
		//System.out.println(car.getCar_id());
		if(car.getCar_id() != 0){
			int a=dao.doAddCountByGoodid(good_id);
			if(a>=0){
				out.print("<script language =javascript> window.confirm('ok ok');location.href='index.jsp';</script>");
				
			}else{
				 
			}
		}else{
		int b=dao.addCar(user_id, good_id,1);
		if(b>=0){
			out.print("<script language =javascript> window.confirm('OK');location.href='index.jsp';</script>");
			
		}else{
			 
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
