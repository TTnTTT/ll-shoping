/**
 *  JavaScript Document
 */
//此处不需要函数，加载页面就需要执行的直接用window.onload函数，写了函数要通过页面操作调用
	//alert("1");
var code;
window.onload =function(){
		//alert("1");
	code = "";
	var codeLength = 4;//验证码的长度
	var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
	for(var i=0;i<codeLength;i++) {
	   var charIndex = Math.floor(Math.random()*32);
	   code +=selectChar[charIndex];
	}
	document.getElementById("yzm").value=code;
}
function denglu_click(){
	var yzm=document.getElementById("yzm").value;//系统给出验证码
	var yzmInput=document.getElementById("yzmInput").value;//用户输入验证码
	
	var denglu=document.getElementById("denglu");//登录按钮
	if(yzmInput == code){
		denglu.type="submit";
		//return true;	
	}else{
		denglu.type="submit";
		alert("验证码输入错误")
	}
}
function chick(){
	window.location.reload();
}
	

