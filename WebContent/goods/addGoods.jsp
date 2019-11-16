<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Iterator,com.shop.type.*,java.util.ArrayList,com.shop.user.*,com.shop.store.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/public.css">
<link rel="stylesheet" type="text/css" href="../css/goods.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加商品</title>
</head>
<body>
<%
ArrayList<Type> typelist=(ArrayList<Type>)session.getAttribute("typelist");
Iterator<Type> it=typelist.iterator();

//System.out.print(type_name);
%>
<form action="/shop/AddGoodsServlet?flag=2" method="post" >
<center>
	<div style="width: 400px;height: 400px;background-color:#c4e4ff;magin-top: 50px;">
 		<ul id="add_list">
 			<li>商品名称：<input size="40" name="good_name"></li>
 			<li>商品类型：
 				<select  name="type_id">
 				<!-- 此次需要通过商品类型id查找商品类型名 -->
 					<%
 					while(it.hasNext()){
 						Type goods_type=it.next();
 						String type_name=goods_type.getType_name();
 						int type_id=goods_type.getType_id();
 					%>
  					<option name="type_id" value ="<%=type_id %>"><%=type_name %></option>
  					<%} %>
				</select>
				商品价格：<input size="10" placehold="请输入数字" name="good_price">
			</li>
 			<li>店家名称：<select  name="store_id">
 				<!-- 此次需要通过商品类型id查找商品类型名 -->
 					<%
 					User user=(User)session.getAttribute("user");
 					int user_id=user.getUser_id();
 					StoreDao dao=new StoreDao();
 					ArrayList<Store> storelist=dao.doQueryStoreByUid(user_id);
 					Iterator<Store> st=storelist.iterator();
 					while(st.hasNext()){
 						Store store=st.next();
 						
 					%>
  					<option name="store_id" value ="<%=store.getStore_id() %>"><%=store.getStore_name() %></option>
  					<%} %>
				</select></li> 
 			<li>库存数量：<input size="10" name="qty"></li>
 			<li>商品折扣：<input size="10" name="good_discount"></li>
 			<li>商品描述：<input size="40" name="good_desc"></li>
 			<li>生产商：<input size="40" name="supplier"></li>
 			<li>商品图片：<input size="30" type="file" name="good_pic"></li>
 			<li><input class="btn" type="submit" value="确认添加"> <a href="../index.jsp"><input class="btn" size="15" type="button" value="返回"></a></li>
 		</ul>
	</div>
</center>
</form>
</body>
</html>