<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.shop.order.*,com.shop.goods.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css"  rel="stylesheet" href="../css/public.css" charset="utf-8"/>
<link type="text/css"  rel="stylesheet" href="../css/shopcar.css">
<title>拼少少商城-购物车</title>
<script src="/shop/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/shop/js/shopcar.js"></script>

<style>
.wrap { width:960px; margin:0 auto; }
#header { overflow:hidden; padding-top:10px; }
#header #logo { float:left; width:120px; text-align:center; }
#header .help { float:right; }
#header .help a { margin:0 5px; }
#header .help a.shopping { padding-left:18px; background:url(../images/bg.png) left -69px no-repeat; }
#position { clear:both; margin-top:5px; color:#666; }
#footer { clear:both; line-height:30px; text-align:center; margin-top:20px; background:#fafafa; color:#666; border-top:1px solid #e0e0e0; }
th{border:solid #add9c0; border-width:1px 1px 1px 1px;}
td{border:solid #add9c0; border-width:1px 1px 1px 1px;}
</style>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><a href="../index.jsp"><img src="../images/logo.jpg" /></a></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></c:if><c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">购物车</a><c:if test="${name==null}"><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></c:if><c:if test="${name!=null}"><a href="zx">退出</a></c:if><a href="SelallServlet">留言</a><c:if test="${name.EU_STATUS==2}"></c:if></div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="../index.jsp">拼少少商城</a> &gt; 我的订单
</div>
<form action="">
<center>
	<table  class="tab"  cellspacing="0" style="border:1px solid #c3c3c3; ">
		<tr>
	<th>订单编号</th>
	<th>1</th>
	<th>包含商品</th>
	<th>订单总额</th>
	<th>购买日期</th>
	<th>订单状态</th>
	<th>立即支付</th>
		</tr>
		 <%
		 List<Order> orderlist=(List<Order>)session.getAttribute("orderlist");
			Iterator<Order> it=orderlist.iterator();
			while(it.hasNext()){
				Order orders=it.next();
		%> 
		
		<tr class="show">
			<td><%=orders.getOrder_id() %></td>
			<td>1</td>
			<td>
			<%
			OrderDao dao=new OrderDao();
			//System.out.println(","+orders.getOrder_id());
			ArrayList<OrderDetail> detaillist=dao.doQueryOrderDetByid(orders.getOrder_id());
			Iterator<OrderDetail> dit=detaillist.iterator();
			while(dit.hasNext()){
				OrderDetail detail=dit.next();
				int good_id=detail.getGood_id();
				GoodsDao gdao=new GoodsDao();
				Goods good=gdao.doQueryGoodsById(good_id);
				
			%>
			<input size="10" value="【<%=good.getGood_name() %>】">
			<%} %>
			</td>
			<td>￥<%=orders.getOrderSum() %></td>
			<td><%=orders.getOrderDate() %></td>
			<td><%=orders.getStatus() %></td>
			<%if(orders.getStatus().equals("未支付")){%>
			<td><a href="/shop/OrderPayServlet?order_id=<%=orders.getOrder_id() %>&&flag=1">立即支付</a></td>
			<%} %>
		</tr>
		 <%} %> 
		
	</table>
</center>
</form>
<div id="footer">
	Copyright &copy; 2019 拼少少商城 All Rights Reserved. 沪ICP备案000001号
</div>
</body>
</html>
<%-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
</head>
<body>
<center>
<table class="tab"  cellspacing="1" style="border:1px solid #c3c3c3; ">
	<tr>
	<th>订单编号</th>
	<th>订单总额</th>
	<th>订单状态</th>
	<th>购买商品</th>
	<th>订单总额</th>
	<th>购买日期</th>
	<th>订单状态</th>
	</tr>
	<%
	List<Order> orderlist=(List<Order>)session.getAttribute("orderlist");
	Iterator<Order> it=orderlist.iterator();
	while(it.hasNext()){
		Order orders=it.next();
	%>
	<tr>
	<td><%=orders.getOrder_id() %></td>
	</tr>
	<%} %>
</table>
</center>
</body>
</html> --%>