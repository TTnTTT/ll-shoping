
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css"  rel="stylesheet" href="/shop/css/public.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加订单</title>
<style>
.wrap { width:960px; margin:0 auto; }
#header { overflow:hidden; padding-top:10px; }
#header #logo { float:left; width:120px; text-align:center; }
#header .help { float:right; }
#header .help a { margin:0 5px; }
#header .help a.shopping { padding-left:18px; background:url(../images/bg.png) left -69px no-repeat; }
#position { clear:both; margin-top:5px; color:#666; }
#footer { clear:both; line-height:30px; text-align:center; margin-top:20px; background:#fafafa; color:#666; border-top:1px solid #e0e0e0; }
.input_control{
  width:360px;
  margin:20px auto;
}
li{
	margin:20px auto;
}
input[type="text"],#btn1,#btn2{
  box-sizing: border-box;
  text-align:center;
  font-size:1.4em;
  height:1.5em;
  border-radius:4px;
  border:1px solid #c8cccf;
  color:#6a6f77;
  -web-kit-appearance:none;
  -moz-appearance: none;
  display:block;
  outline:0;
  padding:0 1em;
  text-decoration:none;
  width:100%;
  
}
span{
	font-size:25px;
	color:#666;
	
}
input[type="text"]:focus{
  border:1px solid #ff7496;
}
textarea{
	border:0;
	border-radius:5px;
	background-color:rgba(241,241,241,.98);
	width: 350px;
	height: 100px;
	padding: 10px;resize: none;" 
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
</head>
<body>
<div id="header" class="wrap">
	<div id="logo"><a href="../index.jsp"><img src="../images/logo.jpg" /></a></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></c:if><c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">购物车</a><c:if test="${name==null}"><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></c:if><c:if test="${name!=null}"><a href="zx">退出</a></c:if><a href="SelallServlet">留言</a><c:if test="${name.EU_STATUS==2}"></c:if></div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="../index.jsp">拼少少商城</a>&gt;<a href="../goods/goods_detail.jsp">商品详情</a>&gt;购买商品
</div>
<center>
<form action="/shop/CreateOrderServlet">
<div class="input_control">
	<ul>
		<%
		//取类型
		String type=request.getParameter("type");
		//System.out.println("类型："+type);
		String good_id=request.getParameter("good_id"); 
		String sum=request.getParameter("sum"); 
		
		//获取商品id数组
		String good_ids = request.getParameter("ids");
		//System.out.println("第一次good_ids:"+good_ids);
		/* if(good_ids==null){ */
		%>
		<%-- <li><input type="hidden" name="good_ids" value=null ></li>
		<%}else{ %>
		<li><input type="hidden" name="good_ids" value="<%=good_ids %>" ></li>
		<%} %> --%>
		<li><input type="hidden" name="good_ids" value="<%=good_ids %>" ></li>
		<li><input type="hidden" name="type" value="<%=type %>" ></li>
		<li><input type="hidden" name="good_id" value="<%=good_id %>" ></li>
		
		<li><span>收货人：</span><input type="text" name="contactman"></li>
		<li><span>收货地址：</span><input type="text" name="address"></li>
		<li><span>邮政编码：</span><input type="text" name="postcode"></li>
		<li><span>订单总额：</span><input readonly="readonly" type="text" name="ordersum" value="<%=sum %>"></li>
		
		<li><span>备注</span><textarea rows="10" cols="20" name="note"></textarea></li>
		<li><input type="submit" class="btn" value="确认购买"><br><br><a href="javascript:history.back(-1)"><input type="button" class="btn" value="返回"></a></li>
	</ul>
</div>
</form>
</center>
<div id="footer">
	Copyright &copy; 2019 拼少少商城 All Rights Reserved. 沪ICP备案000001号
</div>
</body>
</html>
