package com.shop.store;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.user.User;

/**
 * Servlet implementation class AddStoreServlet
 */
@WebServlet("/AddStoreServlet")
public class AddStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStoreServlet() {
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
		String store_name=request.getParameter("store_name");
		String store_desc=request.getParameter("store_desc");
		Store store=new Store(store_name,store_desc);
		StoreDao dao=new StoreDao(store);
		int a=dao.doAddStore(user_id);
		if(a>=0){
			response.sendRedirect("user/add_ok.jsp");
		}else{
			response.sendRedirect("user/add_false.jsp");
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
