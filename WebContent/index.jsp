<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.shop.goods.*,java.util.ArrayList,java.util.Iterator,com.shop.user.*,com.shop.type.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>网络购物系统</title>
<link type="text/css" rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>

<%
//获取用户是否登录
	User user =(User)session.getAttribute("user");
%>
<div class="top">
<div class="daoyu">
	<marquee behavior="alternate">您的满意 我们的幸福</marquee>
</div>
<!-- 显示用户是否登录 -->
<div class="login">
	
	<%if(user != null){ %>
	<p style="font-size:30px;color:#fff;">
		<%=user.getUsername()%>|您好!
		<div style="font-size:20px;color:#fff;width: 220px;">欢迎来到拼少少
		<%if(user != null){ %>
		<div style="float:right;"><a href="../shop/exitjavabean.jsp"><input class="btn" type="button" value="退出登录"></a></div>
		<%} %>
		</div>
	</p>
	<%} %>
		
	<%if(user == null){ %>
	<div style="text-align:center;color:#fff;">
	<p style="text-align:center;">您未登录</p>
	<a href="user/login.jsp"><input class="btn" size="50" value="登录" type="button"></a>
	<a href="user/register.jsp"><input class="btn" value="注册" type="button"></a>
	</div>
	<%} %>
</div>
<!-- 显示用户是否登录 end -->

</div>
<%
//商品类型全获取
	TypeDao tdao=new TypeDao();
	ArrayList<Type> typelist=tdao.doQueryAllGoodsType();
	if(typelist == null){
		return;
	}
	Iterator<Type> it1=typelist.iterator();//注意尖括号写类型
%>
<div class="logo">
<form action="/shop/QueryGoodBynameServlet">
	<img src="images/pss.jpg" alt="">
	<ul style="width:1050px;height:100px;" id="typelist">
		<li class="wxz"><input checked="checked" name="type" type="radio" value="0">全部</li>
	<%
		while(it1.hasNext()){ 
		Type type=it1.next();
	%>
		<li class="wxz"><input name="type"  type="radio" value="<%=type.getType_id() %>"><%=type.getType_name() %></li>
		<%} %>
		
		
	</ul>
	
		<input name="good_name" placeholder="请输入要搜索商品名称" type="text" size="100" style="width:800px; height:40px;margin-top:10px;">
		<input type="submit" id="button" value="搜索" style="width:70px; height:40px;color:red;font-size: 15px;margin-top:10px;">
</form>
</div>
<div class="fudong">
<marquee behavior="" direction="right" width="130" height="30">拼少少欢迎您</marquee>
</div>

<!-- 装所有商品盒子 -->
<div class="shangpin">
	<ul>
	<%
		GoodsDao dao=new GoodsDao();
		ArrayList<Goods> goodslist=dao.doQueryAllGoods();
		if(goodslist == null){
			return;
		}
		Iterator<Goods> it=goodslist.iterator();
		while(it.hasNext()){
			Goods goods=it.next();
	%>
		<li>
			<input name="goods_id" type="hidden" value="<%=goods.getGood_id() %>">
			<div class="shangpin1">
				<a href="/shop/DetailGoodsServlet?goods_id=<%=goods.getGood_id() %>">
					<img alt="" src="/shop/img/<%=goods.getGood_pic() %>">
					<%-- <input name="good_pic" type="image" value="<%=goods.getGood_pic() %>"> --%>
				</a>
			</div>
			<div class="mingcheng">
				<span style="float:left;">商品名称:</span>
				<input class="dis_input" disabled  name="good_name" size="10" style="" type="text"  value="<%=goods.getGood_name() %>">
			</div>
			
			<div class="jiaqian">
				<span style="float:left;">价格:</span>
				<input class="dis_input" disabled="disabled"  name="good_price" size="6" style="" type="text"  value="￥<%=goods.getGood_price() %>">
			</div>
			<div class="shuliang">
				<span style="float:left;">库存:</span>
				<input class="dis_input" disabled  name="qty" size="5" style="" type="text"  value="<%=goods.getQty() %>件">
			</div>
			
			<%if(user != null){ %><%--用户已登录点购物车进入购物车页面 --%>
			<div id="car" style="width:50px;height:40px" >
			<a href="/shop/AddCarServlet?good_id=<%=goods.getGood_id() %>">
				
				<span style="color:#f00;" ><input class="btn" type="button" value="加入购物车"></span>
			</a>
			<a href="order/addOrder.jsp?good_id=<%=goods.getGood_id() %>&&sum=<%=goods.getGood_price() %>&&type=1 ">
				
				<span style="color:#f00;" ><input style="margin-left:10px;" class="btn" type="button" value="立即购买"></span>
			</a>
			</div>
			<%}else{ %>
			<div id="car" style="width:50px;height:40px" >
			<a onclick="tip()">
				<span style="color:#f00;" ><input class="btn" type="button" value="加入购物车"></span>
			</a>
			</div>
			<%} %>
		 </li>
	<%} %>
	</ul>
	<div class="navlist">
<ul>
	<li><a href="" style="background:#f00;width:150px;height:50px;">首页</a></li>	
	<!-- 我的购物车如果用户登录则显示上面个否则要登录 -->
	<%
	 if(user != null){
	%>
		 <li><a href="/shop/MyShopCarServlet?user_id=<%=user.getUser_id() %>">我的购物车</a></li>
		 <li><a href="/shop/MyOrderServlet?user_id=<%=user.getUser_id() %>">我的订单</a></li>
		<li><a href="user/addStore.jsp">申请开店</a></li>
		<li><a href="">个人信息</a></li>
		 
	<% 
	 }else{
	%>
	
	<li><a href="user/login.jsp">我的购物车</a></li>
	<%
	}
	%>
	<%
	//System.out.print(user.getUser_type());
	if(user != null){
		//System.out.print(user.getUser_type());
	if(Integer.parseInt(user.getUser_type()) == 1){	
	%>
	<li id="fenge">店家权限</li>
	<li><a href="/shop/AddGoodsServlet?user_id=<%=user.getUser_id() %>&&flag=1">添加商品</a></li>
	<%} %>
	<%if(Integer.parseInt(user.getUser_type()) == 2){	 %>
	<li id="fenge">管理员权限</li>
	<li><a href="/shop/ManageGoodsServlet?user_id=<%=user.getUser_id() %>">商品管理</a></li>
	<li><a href="user/manageuser.jsp">用户管理</a></li>
	<li><a href="/shop/ManageOrdersServlet">订单管理</a></li>
	<%
	}
	%>
	
	<%
	}
	%>
	
</ul>
</div>
</div>
<!-- 装所有商品盒子 end-->

<!-- <div class="bottom">
	<img src="images/bottom.jpg" alt="">
</div> -->
</body></html>