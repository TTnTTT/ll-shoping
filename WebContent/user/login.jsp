<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="../css/public.css">
<link rel="stylesheet" href="../css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>拼少少购物系统>>用户登录</title>
<script type="text/javascript" src="../js/yanzhenma.js"></script>

</head>
<body>

<div class="nav">									
	<div class="nav_content">
		<div class="logo">
		    <a href="../index.jsp" title="返回网站首页">
			    <img src="../images/logo.jpg" alt="">
			</a>
		</div>
		<div class="nav1">
			
			<a href="#" class="welcome1">登陆页面，调查问卷</a>
		</div>
	</div>
</div>
<div class="class2">
	<a href="#" class="woning">依据《网络安全法》，为保障您的账户安全和正常使用，请尽快完成手机号验证！ 新版《京东隐私政策》已上线，将更有利于保护您的个人隐私。</a>
</div>
<div class="bonden">
     <div class="tuwen">
     	<div class="top">
   	        <a href="#" class="top_content">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;少少不会以任何理由要求您转账汇款，谨防诈骗</a>
     	</div>
     	<div class="tuwen2">
     				<a href="#" class="kaitou">扫码登陆&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 账户登陆</a>
     	</div>
     <form action="/shop/LoginResultServlet" method="post">
     	<div class="denglu">
     	  	<div class="login-input-box">
            <span class="icon icon-user"></span>
            <input type="text" placeholder="请输入用户的账号" name="username" >
      	  </div>
        <div class="login-input-box">
            <span class="icon icon-password"></span>
            <input type="password" placeholder="请输入您的密码" name="password">
        </div>
        
          <div class="login-input-yzm">
           <input id="yzmInput" type="text" value=""/>
				<input style="width:50px; background-color:#c4e4ff; color:blue" type="text" id="yzm" value="" disabled="disabled"/>
				<a href="" onclick="chick()" >看不清,换一张</a>
        </div>
        
     	</div>
     	 <div class="login-button-box">
        	<input style="width:70px;height:30px;" type="button" value="登录" onclick="denglu_click()" id="denglu" >
        	<a href="../user/register.jsp"><input style="width:70px;height:30px;" type="button" value="注册"></a>
    	</div>
    </form>
     </div>
     
     
     <div class="login_content">
     </div>
     
	<img src="../images/logo2.jpg" alt="" class="xiugai">
</div>



<div class="last">
	<a href="#" class="last_content">关于我们 &nbsp;&nbsp;| &nbsp;&nbsp;联系我们&nbsp;&nbsp; | &nbsp;&nbsp;人才招聘&nbsp;&nbsp; | &nbsp;&nbsp;商家入住&nbsp;&nbsp; | &nbsp;&nbsp;广告服务&nbsp;&nbsp; | &nbsp;&nbsp;手机少少&nbsp;&nbsp; | &nbsp;&nbsp;友情链接&nbsp;&nbsp; | &nbsp;&nbsp;销售联盟&nbsp;&nbsp; | &nbsp;&nbsp;少少社区&nbsp;&nbsp; | &nbsp;&nbsp;ENGLISH STILE</a>
	<a href="#" class="mowei">Copyright ? 2004-2019  少少SS.com 版权所有</a>
	
</div>


</body>
</html>