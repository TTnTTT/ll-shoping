package com.shop.user;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.MD5;

/**
 * Servlet implementation class LoginResultServlet
 */
@WebServlet("/LoginResultServlet")
public class LoginResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
 // 获取请求参数
        
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		MD5 md=new MD5();
		try {
			password=md.toMD5(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(password);
        HttpSession session = request.getSession();
		ServletContext application = getServletContext();
        //System.out.println(password);
		User user = new User(username,password);//构造用户
		//System.out.println(user);
		UserDao dao = new UserDao(user);
		//user = dao.doSelectByUsername(userName);
		//三、处理结果
		boolean result = dao.isLogin();
		if(result){
			//根据用户名得到完整用户
			//User user1 = dao.doSelectByUsername("001");
			//out.print(user.getType());
			//上线
			user = dao.doSelectByUsername(username);
			session.setAttribute("user", user);//把用户保存到session变量中
			response.sendRedirect("index.jsp");//跳转到系统的主页去
		} else {
			//跳转到登陆失败的页面
			//response.sendRedirect("login.jsp");//直接跳登陆页面不友好
			response.sendRedirect("user/login_error.jsp");
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
