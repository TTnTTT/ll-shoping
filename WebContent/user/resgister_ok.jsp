<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
var i = 2 ;
var Interval = setInterval(function() {
document.getElementById("s2").innerHTML = i +"";
i--;
if (i==-1) {
	window.location="http://localhost:8080/shop/user/login.jsp"; 
}
},1000);
</script>
</head>
<body>
<center>
<h3>
	<a href="login.jsp">立即跳转</a><br/> 
	<span style="background: #0ee;font-size: 20px;" id="s2">3</span>秒后自动跳转到登录页面
</h3>
</center>
</body>
</html>