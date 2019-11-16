<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.shop.order.*,com.shop.goods.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单管理</title>
</head>
<body>
<style>
td{
	
	text-align:center;
}
</style>

<center>
<h1><a href="../index.jsp">返回主页</a></h1>
<table  border="1" width="" cellspacing="0">
	<tr>
			<td style="width:10px;height:10px;"><input id="pickAll" type="checkbox" >选择</td>
			<td>订单编号</td>
			<td>下单用户</td>
			<td>购买商品</td>
			<td>订单日期</td>
			<td>收货地址</td>
			<td>收货人</td>
			<td>订单总额</td>
			<td>订单状态</td>
			<td>处理日期</td>
			<td>修改</td>
		</tr>
<%
 List<Order> orderlist=(ArrayList<Order>)session.getAttribute("orderlist");
if(orderlist == null){
	return;
}
Iterator<Order> it=orderlist.iterator();
while(it.hasNext()){
	Order order=it.next(); 
%>
	 <tr>
			<td><input id="pickAll" type="checkbox" ></td>
			<td><span ><%=order.getOrder_id() %></span></td>
			<td ><span><%=order.getUser_id() %></span></td>
			<td>
			<% 
			OrderDao dao=new OrderDao();
			
			ArrayList<OrderDetail> detaillist=dao.doQueryOrderDetByid(order.getOrder_id());
			Iterator<OrderDetail> dit=detaillist.iterator();
			while(dit.hasNext()){
				OrderDetail detail=dit.next();
			%>
			<span>[<%=detail.getGood_id() %>]</span>
			<%} %>
			</td>
			<td><span><%=order.getOrderDate() %></span></td>
			<td><span><%=order.getAddress() %></span></td>
			<td><span><%=order.getContactman() %></span></td>
			<td><span><%=order.getOrderSum() %></span></td>
			<td><span><%=order.getStatus() %></span></td>
			<td><span><%=order.getDealDate() %></span></td>
			<td><a href="">修改</a></td>
			
			
	</tr>
	<%
}
%> 
</table>

</center>
</body>
</html>