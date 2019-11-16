<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/shop/css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>

</head>
<body>
<!-- SELECT id,username,password,sex,profession,favourite,note,type from user; type默认为0，用户无法自行更改-->
<form action="/shop/RegisterResultServlet" method="post">
<table border="1" cellspacing="0" align="center">
<tr>
<td>用户名</td>
<td colspan="3">
<input type="text" id="username" name="username" style="width: 99%; height: 99%"  onblur="getBackInfo()" placeholder="请输入用户名">
<div  style="font-size: 10px;color: #FF00FF" id="username_tip"></div>
</td>
</tr>

<tr>
<td>密码</td>
<td>
<input type="password" id="password" name="password" style="width: 97%; height: 97%" >
</td>
<td>确认密码</td>
<td>
<input type="password" id="password_sure" name="password_sure" style="width: 97%;height: 97%" onblur="same_password()">
<div style="font-size: 10px;color: #FF00FF" id="password_tip"></div>
</td>
</tr>
<tr>
<td>性别</td>
<td  id="sex">
<input type="radio" name="gender" value="0">男
<input type="radio" name="gender" value="1">女<!-- 注意value的值为数据库定义的 -->
</td>
<td>邮件</td>
<td>
<input name="email" type="text" onblur="validateEmail(this);">
</td>
</tr>

<tr>
<td>真实姓名</td>
<td colspan="3">
<input name="realname" type="text" onblur="validateNull(this);"><br>
</td>
</tr>

<tr>
<td>电话</td>
<td colspan="3">
<input name="phone" type="text" onblur="validatePhone(this);">
</td>
</tr>

<tr align="center">
<td colspan="4" >
<input type="submit" value="注册" id="ok_btn" onclick="ok_onclick()" >
<input type="reset" value="重置">
<a href="login.jsp"><button type="button">返回登录</button></a><!-- 表单中的button不设置type点击会自动提交表单 -->
</td>
</tr>
</table>
</form>
<!-- <script type="text/javascript" src="../js/register.js"></script> -->
</body>
</html>