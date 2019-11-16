<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.shop.goods.*,java.util.ArrayList,java.util.Iterator,com.shop.user.*,com.shop.type.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="../css/public.css">
<!-- <link type="text/css" rel="stylesheet" href="../css/index.css"> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
ul li{
	float:left;
}
.wrap { width:960px; margin:0 auto; }
#header { overflow:hidden; padding-top:10px; }
#header #logo { float:left; width:120px; text-align:center; }
#header .help { float:right; }
#header .help a { margin:0 5px; }
#header .help a.shopping { padding-left:18px; background:url(../images/bg.png) left -69px no-repeat; }
#position { clear:both; margin-top:5px; color:#666; }
#footer { clear:both; line-height:30px; text-align:center; margin-top:20px; background:#fafafa; color:#666; border-top:1px solid #e0e0e0; }
.bg{
width:1200px; 
margin:0 auto;
}
li{
float:left;
list-style:none;
width:350px;
height:500px; 
letter-spacing:5px; 
overflow:hidden; 
margin-left:50px;
}
.btn{
	width:145px;
    height:34px;
    line-height:22px;
    font-size:22px;
    background:red;
    color:#fff;
    padding-bottom:4px
    -moz-border-radius: 15px;      /* Gecko browsers */
    -webkit-border-radius: 15px;   /* Webkit browsers */
    border-radius:10px;            /* W3C syntax */
}

</style>
<title>查询结果</title>
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><a href="../index.jsp"><img src="../images/logo.jpg" /></a></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></c:if><c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">购物车</a><c:if test="${name==null}"><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></c:if><c:if test="${name!=null}"><a href="zx">退出</a></c:if><a href="SelallServlet">留言</a><c:if test="${name.EU_STATUS==2}"></c:if></div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="../index.jsp">拼少少商城</a> &gt;搜索内容
</div>
<div class="bg">
	<ul style="width:1250px;height:1200px;">
	 <%
		User user=(User)session.getAttribute("user");
		ArrayList<Goods> goodslist=(ArrayList<Goods>)session.getAttribute("goodslists");
		if(goodslist == null){
			return;
		}
		Iterator<Goods> it=goodslist.iterator();
		while(it.hasNext()){
			Goods goods=it.next();
	%> 
		<li style="float:left;">
			<input name="goods_id" type="hidden" value=" <%=goods.getGood_id() %> ">
			<div class="shangpin1">
				<a href="/shop/DetailGoodsServlet?goods_id=<%=goods.getGood_id() %> ">
					<img alt="" src="../img/<%=goods.getGood_pic() %> ">
					 <%-- <input name="good_pic" type="image" value="<%=goods.getGood_pic() %>">  --%>
				</a>
			</div>
			<div class="mingcheng">
				商品名称:
				<input class="dis_input" disabled  name="good_name" size="10" style="border:0px;background-color:#fff;" type="text"  value=" <%=goods.getGood_name() %> ">
			</div>
			
			<div class="jiaqian">
				价格:
				<input class="dis_input" disabled  name="ood_price" size="6" style="border:0px;background-color:#fff;" type="text"  value="￥ <%=goods.getGood_price() %>">
			</div>
			<div class="shuliang">
				库存:
				<input class="dis_input" disabled  name="qty" size="5" style="border:0px;background-color:#fff;" type="text"  value=" <%=goods.getQty() %>件">
			</div>
			
			<%if(user != null){ %> <%--用户已登录点购物车进入购物车页面 --%>
			<div id="car" style="width:50px;height:40px" >
			<a href="/shop/AddCarServlet?good_id= <%=goods.getGood_id() %>>">
				 
				<span style="color:#f00;" ><input class="btn" type="button" value="加入购物车"></span>
			</a>
			<a href="../order/addOrder.jsp?good_id=<%=goods.getGood_id() %>&&sum=<%=goods.getGood_price() %>&&type=1">
				
				<span style="color:#f00;" ><input style="" class="btn" type="button" value="立即购买"></span>
			</a>
			 </div>
			<%}else{ %>
			<div id="car" style="width:50px;height:40px" >
			<a onclick="tip()">
				<span style="color:#f00;" ><input class="btn" type="button" value="加入购物车"></span>
			</a>
			</div>
			 <%} %> -
		 </li>
	<%} %> 
	</ul>
</div>
<div id="footer">
	Copyright &copy; 2019 拼少少商城 All Rights Reserved. 沪ICP备案000001号
</div>
</body>
</html>