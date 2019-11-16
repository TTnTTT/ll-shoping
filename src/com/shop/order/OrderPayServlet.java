package com.shop.order;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.user.User;

/**
 * Servlet implementation class OrderPayServlet
 * 支付处理
 */
@WebServlet("/OrderPayServlet")
public class OrderPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderPayServlet() {
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
		User user=(User)session.getAttribute("user");
		int user_id=user.getUser_id();
		OrderDao dao=new OrderDao();
		//获取页面传来的flag
		int flag=0;
		String flags=request.getParameter("flag");
		if(flags != "1"){
			flag=2;	
		}else{//其他情况都为1
			flag=Integer.parseInt(flags);
		}
		int order_id=0;
		if(flag==1){//我的订单页面传来的
			order_id=Integer.parseInt(request.getParameter("order_id"));
			//System.out.println("78989");
		}else{//立即支付传来的
			order_id=dao.returnMaxOrder();
		}
		int a=dao.doUpdateStatusById(user_id,order_id);
		if(a>=0){
			response.sendRedirect("order/pay_ok.jsp");
			
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
