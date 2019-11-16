package com.shop.goods;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QueryGoodBynameServlet
 */
@WebServlet("/QueryGoodBynameServlet")
public class QueryGoodBynameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryGoodBynameServlet() {
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
		String type_ids=request.getParameter("type");
		//System.out.println(type_ids);
		int type_id=0;
		if(type_ids != null){
			type_id=Integer.parseInt(type_ids);
		}
		String good_name=request.getParameter("good_name");
		GoodsDao dao=new GoodsDao();
		ArrayList<Goods> goodslists=dao.doQueryGoodsByName(type_id,good_name);
		
		if(goodslists==null){
			return;
		}else{
			session.setAttribute("goodslists", goodslists);
			response.sendRedirect("goods/queryGoodsResult.jsp");
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
