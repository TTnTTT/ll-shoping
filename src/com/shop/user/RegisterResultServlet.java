package com.shop.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.db.DB;

import com.shop.common.MD5;
import com.shop.user.*;

/**
 * Servlet implementation class RegisterResultServlet
 */
@WebServlet("/RegisterResultServlet")
public class RegisterResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
		// 获取请求参数
		String username=new String(request.getParameter("username").trim());//.getBytes("ISO-8859-1"),"utf-8")注意注意！！！trim()的作用是去掉字符串两端的多余的空格，注意，是两端的空格，且无论两端的空格有多少个都会去掉，当然
		//后台验证用户名存在否
				User user=new User();
				user.setUsername(username);
				UserDao dao=new UserDao(user);
				boolean a=dao.isExitsByUserName();//存在的话a为true
				System.out.println("页面获取的："+username);//没问题
				//System.out.println("自己定义的："+a);//没问题
				if(a){ //单纯测试，不进行连接数据库，，相同返回true ，此句有问题！！
		            out.write("true");
		        }else {
		            //不同返回false; 
		        	//System.out.println(username);没问题
		            out.write("false");
		        }
				String password = request.getParameter("password");//获取密码并进行加密
				if(password!=null){
					try {
						password=MD5.toMD5(password);
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			String realname = request.getParameter("realname");
			String phone = request.getParameter("phone");
			//System.out.println(password);
	        /*HttpSession session = request.getSession();
			ServletContext application = getServletContext();
	        */
			user = new User(username,password);//构造用户
			user.setEmail(email);
			user.setGender(gender);
			user.setRealname(realname);
			user.setPhone(phone);
			//System.out.println(user);
			dao = new UserDao(user);
			//user = dao.doSelectByUsername(userName);
			//三、处理结果
			try {
				int row = dao.doRegister();
				if(row>=0) {
					response.sendRedirect("../shop/user/resgister_ok.jsp");
				}else {
					response.sendRedirect("../shop/user/register_error.jsp");
				} 
			}catch (Exception e) {
				e.printStackTrace();
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
