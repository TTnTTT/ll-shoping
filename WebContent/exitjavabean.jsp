<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--退出处理页面 --%>
<%
session.setAttribute("user", null);
response.sendRedirect("index.jsp");
//request.getRequestDispatcher("../goods/goods_detail.jsp").forward(request,response);//清空后返回登录页面
%>
</body>
</html>