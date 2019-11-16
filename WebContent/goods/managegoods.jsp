<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.shop.goods.*,java.util.ArrayList,java.util.Iterator,com.shop.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品管理</title>
</head>
<body>
<style>
td{
	
	text-align:center;
}
</style>

<center>
<h1><a href="../index.jsp" style="text-decoration:none;">返回主页</a></h1>
<table  border="1" width="1000px" cellspacing="0">
	<tr>
			<td style="width:10px;height:10px;"><input id="pickAll" type="checkbox" >选择</td>
			<td>商品名称</td>
			<td style="width:150px;height:100px;">商品图片</td>
			<td>商品单价</td>
			<td>库存</td>
			<td>商品描述</td>
			<td>是否推荐商品</td>
			<td>商品生产商</td>
			<td>修改</td>
			<td>删除</td>
		</tr>
<%
ArrayList<Goods> goodslist=(ArrayList<Goods>)session.getAttribute("goodslist");
if(goodslist == null){
	return;
}
Iterator<Goods> it=goodslist.iterator();
while(it.hasNext()){
	Goods goods=it.next();
%>
	<tr>
			<td><input id="pickAll" type="checkbox" ></td>
			<td><span ><%=goods.getGood_name() %></span></td>
			<td ><img style="width:150px;height:100px;" src="../img/<%=goods.getGood_pic() %>"></td>
			<td><span><%=goods.getGood_price() %></span></td>
			<td><span><%=goods.getQty() %></span></td>
			<td><span><%=goods.getGood_desc() %></span></td>
			<%if(goods.getIspreferred() == 0){ %>
			<td><span>否</span></td>
			<%}else{ %>
			<td><span>是</span></td>
			<%} %>
			<td><span><%=goods.getSupplier() %></span></td>
			<td><a href="/shop/DeleteGoodsServlet?goods_id=<%=goods.getGood_id() %>" style="text-decoration:none;">修改</a></td>
			<td><a href="/shop/DeleteGoodsServlet?goods_id=<%=goods.getGood_id() %>" style="text-decoration:none;">删除</a></td>
			<%-- <td><input id="pickAll" type="checkbox" >选择</td>
			<td><input type="text" value="<%=goods.getGood_name() %>"></td>
			<td><img style="" src="../<%=goods.getGood_pic() %>"></td>
			<td><input type="text" value="<%=goods.getGood_price() %>"></td>
			<td><input type="text" value="<%=goods.getQty() %>"></td>
			<td><input type="text" value="<%=goods.getGood_desc() %>"></td>
			<td><input type="text" value="<%=goods.getIspreferred() %>"></td>
			<td><input type="text" value="<%=goods.getSupplier() %>"></td>
			<td><a href="/shop/DeleteGoodsServlet?goods_id=<%=goods.getGood_id() %>">修改</a></td>
			<td><a href="/shop/DeleteGoodsServlet?goods_id=<%=goods.getGood_id() %>">删除</a></td> --%>
	</tr>
	<%
}
%>
</table>

</center>
</body>
</html>