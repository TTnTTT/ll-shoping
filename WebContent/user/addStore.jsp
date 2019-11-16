<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="../css/public.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>申请店铺</title>
</head>
<body>
<form action="/shop/AddStoreServlet">
<center>
	<span>店铺名称:</span><input type="text" name="store_name">
	<span>店铺描述:</span><textarea rows="10" cols="20" name="store_desc"></textarea>
	<input class="btn" type="submit" value="申请"><a href="javascript:history.back(-1)"><input class="btn" type="button" value="返回"></a>
</center>
</form>
</body>
</html>