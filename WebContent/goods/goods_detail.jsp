<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.shop.goods.*,com.shop.type.*,com.shop.user.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情</title>
<script type="text/javascript" src="../js/function.js"></script>

<style type="text/css">
#magnifier{
	width:300px;
	height:300px;
	position:absolute;
	/*top:200px;
	left:400px;*/
	font-size:0;
	border:1px solid #000;
}
#img{
	width:300px;
	height:300px;
}
#Browser{
	border:1px solid #000;
	z-index:100;
	position:absolute;
	background:#555;
}
#mag{
	border:1px solid #000;
	overflow:hidden;
	z-index:100;
}
</style>
<script type="text/javascript">
function searchHot(name){
	location.href='selectProductList?name='+name;
}
function getEventObject(W3CEvent) {//事件标准化函数
	return W3CEvent || window.event;
}
function getPointerPosition(e) {//兼容浏览器的鼠标x,y获得函数
	e = e || getEventObject(e);
	var x = e.pageX || (e.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
	var y = e.pageY || (e.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
	
	return { 'x':x,'y':y };
}
function setOpacity(elem,level) {//兼容浏览器设置透明值
	if(elem.filters) {
		elem.style.filter = 'alpha(opacity=' + level * 100 + ')';
	} else {
		elem.style.opacity = level;
	}
}
function css(elem,prop) {	//css设置函数,可以方便设置css值,并且兼容设置透明值
	for(var i in prop) {
		if(i == 'opacity') {
			setOpacity(elem,prop[i]);
		} else {
			elem.style[i] = prop[i];
		}
	}
	return elem;
}
var magnifier = {
	m : null,
	
	init:function(magni){
		var m = this.m = magni || {
			cont : null,	//装载原始图像的div
			img : null,	//放大的图像
			mag : null,	//放大框
			scale : 20	//比例值,设置的值越大放大越大,但是这里有个问题就是如果不可以整除时,会产生些很小的白边,目前不知道如何解决
		}
		
		css(m.img,{	
			'position' : 'absolute',
			'width' : (m.cont.clientWidth * m.scale) + 'px',				//原始图像的宽*比例值	
			'height' : (m.cont.clientHeight * m.scale) + 'px'				//原始图像的高*比例值
			})
		
		css(m.mag,{
			'display' : 'none',
			'width' : m.cont.clientWidth + 'px',	//m.cont为原始图像,与原始图像等宽
			'height' : m.cont.clientHeight + 'px',
			'position' : 'absolute',
			'left' : m.cont.offsetLeft + m.cont.offsetWidth + 10 + 'px',//放大框的位置为原始图像的右方远10px
			'top' : m.cont.offsetTop + 'px'
			})
		
		var borderWid = m.cont.getElementsByTagName('div')[0].offsetWidth - m.cont.getElementsByTagName('div')[0].clientWidth;		//获取border的宽
		
		css(m.cont.getElementsByTagName('div')[0],{			//m.cont.getElementsByTagName('div')[0]为浏览框
			'display' : 'none',								//开始设置为不可见
			'width' : m.cont.clientWidth / m.scale - borderWid + 'px',			//原始图片的宽/比例值 - border的宽度
			'height' : m.cont.clientHeight / m.scale - borderWid + 'px',//原始图片的高/比例值 - border的宽度
			'opacity' : 0.5//设置透明度
			})
		
		m.img.src = m.cont.getElementsByTagName('img')[0].src;//让原始图像的src值给予放大图像
		m.cont.style.cursor = 'crosshair';
		
		m.cont.onmouseover = magnifier.start;
		
	},
	
	start:function(e){
		
		if(document.all){//只在IE下执行,主要避免IE6的select无法覆盖
			magnifier.createIframe(magnifier.m.img);
		}
		
		this.onmousemove = magnifier.move;//this指向m.cont
		this.onmouseout = magnifier.end;
	},
	
	move:function(e){
		var pos = getPointerPosition(e);		//事件标准化
		
		this.getElementsByTagName('div')[0].style.display = '';
		
		css(this.getElementsByTagName('div')[0],{
			'top' : Math.min(Math.max(pos.y - this.offsetTop - parseInt(this.getElementsByTagName('div')[0].style.height) / 2,0),this.clientHeight - this.getElementsByTagName('div')[0].offsetHeight) + 'px',
			'left' : Math.min(Math.max(pos.x - this.offsetLeft - parseInt(this.getElementsByTagName('div')[0].style.width) / 2,0),this.clientWidth - this.getElementsByTagName('div')[0].offsetWidth) + 'px'			//left=鼠标x - this.offsetLeft - 浏览框宽/2,Math.max和Math.min让浏览框不会超出图像
			})
		
		magnifier.m.mag.style.display = '';
		
		css(magnifier.m.img,{
			'top' : - (parseInt(this.getElementsByTagName('div')[0].style.top) * magnifier.m.scale) + 'px',
			'left' : - (parseInt(this.getElementsByTagName('div')[0].style.left) * magnifier.m.scale) + 'px'
			})
		
	},
	
	end:function(e){
		this.getElementsByTagName('div')[0].style.display = 'none';
		magnifier.removeIframe(magnifier.m.img);		//销毁iframe
		
		magnifier.m.mag.style.display = 'none';
	},
	
	createIframe:function(elem){
		var layer = document.createElement('iframe');
		layer.tabIndex = '-1';
		layer.src = 'javascript:false;';
		elem.parentNode.appendChild(layer);
		
		layer.style.width = elem.offsetWidth + 'px';
		layer.style.height = elem.offsetHeight + 'px';
	},
	
	removeIframe:function(elem){
		var layers = elem.parentNode.getElementsByTagName('iframe');
		while(layers.length >0){
			layers[0].parentNode.removeChild(layers[0]);
		}
	}
}
window.onload = function(){
	magnifier.init({
				   cont : document.getElementById('magnifier'),
				   img : document.getElementById('magnifierImg'),
				   mag : document.getElementById('mag'),
				   scale : 3
				   });
}
	function jian(){
		var count = parseInt(document.getElementById("count").value);
		if(count>0){
			count--;
		}
		if(count==0){
			count=1;
		}
		document.getElementById("count").value = count;
	}
	function jia(){
		var count = parseInt(document.getElementById("count").value);
		var stock = parseInt(document.getElementById("stock").innerHTML);
		if(count<stock){
			count++;
		}
		document.getElementById("count").value = count;
	}
	function checkcount(){
		var count = parseInt(document.getElementById("count").value);
		var stock = parseInt(document.getElementById("stock").innerHTML);
		if(count>stock){
			alert('库存不足');
			document.getElementById("count").value = stock;
		}
		if(count==0){
			alert('购买数量不能小于1哦,亲');
			document.getElementById("count").value = 1;
		}
		if(count<0){
			alert('数量非法');
			document.getElementById("count").value = 1;
		}
	}
	function shopAdd(idd){
		var id = idd;
		var count = parseInt(document.getElementById("count").value);
		location.href='shopAdd?id='+id+'&count='+count;
	}
	function shopAdd2(idd){
		var id = idd;
		var count = parseInt(document.getElementById("count").value);
		location.href='shopAdd2?id='+id+'&count='+count;
	}
</script>
<script type="text/javascript">
function selectname(){
	  var name = document.getElementById("selectname").value;
	  location.href='selectProductList?name='+name;
}
</script>
</head>
<body>
<script type="text/javascript">
function clicks1(){
	/* window.open ("../tip.jsp","_blank","height=300,width=500,scrollbars=no,location=no")  */	
}
</script>
<%
Goods goods=(Goods)session.getAttribute("goods");
User user=(User)session.getAttribute("user");
int good_id=goods.getGood_id();
%>
		<input  type="hidden" name="good_id" value="<%=good_id %>">
		<%if(user != null){ %>
		<input type="hidden" name="user_id" value="<%=user.getUser_id() %>">
		<%} %>
		<div id="header" class="wrap">
	<div id="logo"><a href="../index.jsp"><img src="../images/logo.jpg" /></a></div>
	<div class="help"><c:if test="${name!=null}"><a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a></c:if><c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if><a href="ShopSelect" class="shopping">购物车</a><c:if test="${name==null}"><a href="login.jsp">登录</a>|<a href="register.jsp">注册</a></c:if><c:if test="${name!=null}"><a href="zx">退出</a></c:if><a href="SelallServlet">留言</a><c:if test="${name.EU_STATUS==2}"></c:if></div>
</div>
<div id="position" class="wrap">
	您现在的位置：<a href="../index.jsp">拼少少商城</a> &gt; <a href="">商品详情</a> &gt; ${title }
</div>
<div id="main" class="wrap">
	<div id="product" class="main">
		<h1>${p.EP_NAME }</h1>
		<div class="infos">
		<div id="magnifier">
			<img src="../img/<%=goods.getGood_pic() %>" id="img" />
			<div id="Browser"></div>
		</div>
		<div id="mag"><img id="magnifierImg" /></div>

			 
			<div class="buy">
				<p>店家名称:<span class="price"><%=goods.getStore_name() %></span></p>
				<p>商品名称:<span class="price"><%=goods.getGood_name() %></span></p>
				<p>价格：<span class="price">￥<%=goods.getGood_price() %></span></p>
				<p>类型：<span class="price"><%=goods.getType_name() %></span></p>
				<p>折扣：<span class="price"><%=goods.getGood_discount() %></span></p>
				<p>商品生产商:：<span class="price"><%=goods.getSupplier() %></span></p>
				<p>购买数量：<input type="button" value="  -  " onclick="jian()"/>
				<input align="middle" type="text" value="1" id="count" name="count" onblur="checkcount()"/>
				<input type="button" value="  +  " onclick="jia()"/></p>
				<div class="button">
					<a href="../order/addOrder.jsp?good_id=<%=goods.getGood_id() %>&&sum=<%=goods.getGood_price() %>&&type=1"><input value="" type="button" name="button"></a>
					<a href="/shop/AddCarServlet?good_id=<%=goods.getGood_id() %>""><input value="加入购物车" type="button" style="border:0; margin:0 10px; background:red; left -176px; height:35px; width:144px; cursor:pointer;  border-radius:5px; color: white;font-size：60px;"></a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品描述</strong></h2>
			<div class="text">
				${p.EP_DESCRIPTION }<br />
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2019 拼少少商城  All Rights Reserved. 沪ICP备案000001号
</div>
<%-- <center>
<div>
	<ul>
	
		<li><span>店家名称:</span><span><%=goods.getStore_name() %></span></li>
		<li style="line-height:200px"><span>商品图片:</span><img alt="" src="../img/<%=goods.getGood_pic() %>"></li>
		<li><span>商品名称:</span><span><%=goods.getGood_name() %></span></li>
		<li><span>商品类型:</span><span><%=goods.getType_name() %></span></li>
		<li><span>商品价格:</span><span><%=goods.getGood_price() %></span></li>
		<li><span>商品折扣:</span><span><%=goods.getGood_discount() %></span></li>
		<li><span>商品描述:</span><span><%=goods.getGood_desc() %></span></li>
		<li><span>商品生产商:</span><span><%=goods.getSupplier() %></span></li>
		<li>
			<%if(user != null){ %>
			<a href="../order/addOrder.jsp?good_id=<%=good_id %>"><input value="立即购买" class="btn" type="button"></a>
			<%}else{ %>
			<input class="btn" value="立即购买" type="button" onclick="return window.confirm('您未登录，请先登录')">
			<%} %>
			<a href="/shop/ShopCarServlet?good_id=<%=good_id %>"><input  class="btn"  value="加入购物车" type="button"></a>
			<a href="javascript:history.back(-1)"><input  class="btn"  value="返回主页" type="button"></a>
		</li>
	</ul>
</div>
</center> --%>
</body>
</html>