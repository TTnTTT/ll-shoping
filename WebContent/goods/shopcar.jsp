<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<%@ page import="com.shop.goods.*,java.util.Iterator,java.util.ArrayList,com.shop.shopcar.*" %>
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
	您现在的位置：<a href="../index.jsp">拼少少商城</a> &gt; 购物车
</div>
<form action="">
<center>
	<table  class="tab"  cellspacing="0" style="border:1px solid #c3c3c3; ">
		<tr>
			<th><input id="pickAll" type="checkbox" >选择</th>
			<th>商品名称</th>
			<th>商品图片</th>
			<th>单价</th>
			
			<th>数量</th>
			<th>金额</th>
			<th>删除</th>
		</tr>
		 <%
			ArrayList<ShopCar> carlist=(ArrayList<ShopCar>)session.getAttribute("carlist");
			Iterator<ShopCar> itc=carlist.iterator();
			ArrayList<Goods> goodslist=(ArrayList<Goods>)session.getAttribute("goodslist");//获取提交的商品
			Iterator<Goods> it=goodslist.iterator();
			while(it.hasNext() && itc.hasNext()){
				Goods goods=it.next();
				ShopCar car=itc.next();
		%> 
		<tr class="show">
			<td><input type="checkbox" name="ck" class="ck" value="<%=goods.getGood_id() %> "></td>
			<td><input style="color:#000;" class="dis_input" disabled="disabled" size="10" value="<%=goods.getGood_name() %> "></td>
			<td class="imgtd"><img  style="transform: scale(0.8);width:150px;height:100px;" alt="" src="../img/<%=goods.getGood_pic() %> "></td>
			<td ><input style="color:#000;" class="price dis_input" readonly="readonly" id="price" size="5"  value="<%=goods.getGood_price() %> "></td>
			<input type="hidden" class="reservenum" size="5" value="<%=goods.getQty() %>">
			<td style="width: 120px;" class="shuliang">
				<div>
					<label class="minus cdd" >-</label>
					<input id="qty" class="goodscount num" size="1" value=" <%=car.getCount() %> " >
					<label class="plus add" >+</label>
				</div>
			</td>
			<td><input style="color:#000;" class="dis_input sum" readonly="readonly" size="5" value=""></td>
			<td><a href="/shop/MyShopCarDelGood?good_id=<%=goods.getGood_id() %>">删除</a></td>
		</tr>
		
		 <%} %> 
		<tr>
			<td colspan="3" style="color:#f00;">总价:<input id="allsum" name="sum" class="dis_input" readonly="readonly"></td>
			<td colspan="3"><a href="../index.jsp"><input class="btn" value="继续购物" type="button"></a></td>
			<td colspan="2"><input type="button" class="btn"  value="立即购买" id="rst_btn" onclick="rst()"></td>
		</tr>
	</table>
</center>
</form>
<div id="footer">
	Copyright &copy; 2019 拼少少商城 All Rights Reserved. 沪ICP备案000001号
</div>
</body>
</html>