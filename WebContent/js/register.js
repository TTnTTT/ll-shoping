/**
 * 注册的JavaScript
 */
var ok_btn=document.getElementById("ok_btn");//注册按钮

//alert(username);
//1、创建Ajax核心对象XMLHttpRequest
var xhr;
function createXMLHttpRequest() {
		//表示当前浏览器不是ie,如ns,firefox
		if(window.XMLHttpRequest) {
			xhr = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
function getBackInfo()
{
	var username_tip=document.getElementById("username_tip");
	var username=document.getElementById("username").value;
	//alert(username);//这里能获取到页面的，没乱码,应该是下面url传值乱码了
	createXMLHttpRequest();
    var url="../shop/RegisterResultServlet?username="+username+" ";//定义对应的URL，为了避免浏览器的缓存造成干扰，加上时间戳
    /**url传中文乱码解决：
     * 第一种，有点麻烦

JSP页面：var url ="AddPatrolAjax?domain="+domain.value;//domain.value含有中文

服务器端：String domain = new String(request.getParameter("domain").getBytes(        "ISO-8859-1"), "utf-8");

先获得byte[]，然后newString（byte[]，charset）

第二种，需要设置tomcat

tomcat的配置文件server.xml里这句：
<Connector URIEncoding="GB2312"
port="8080"   maxHttpHeaderSize="8192"
               maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
               enableLookups="false" redirectPort="8443" acceptCount="100"
               connectionTimeout="20000" disableUploadTimeout="true" />
 
加上这句：URIEncoding="UTF-8"

！！！！！！都不如用encodeURI(url)函数直接转码
     */
    xhr.onreadystatechange=disResult;//将方法地址复制给onreadystatechange属性,隐性的循环
    xhr.open("GET",encodeURI(url), true);//设置请求方式为GET，设置请求的URL，设置为异步提交，true为异步，false为同步
    xhr.send(null);	//将设置信息发送到Ajax引擎
}
//发送请求之后，返回的状体
function disResult()
{	var ok_btn=document.getElementById("ok_btn");//注册按钮
	var username=document.getElementById("username").value;
	var username_tip=document.getElementById("username_tip");
	alert(xhr.readyState);
    if(xhr.readyState == 4)//确定readyState是否等于4,Ajax引擎状态为成功，才能开始做下面的事，如果一直为1；可以试着把同步ture改为异步false
    {
        if(xhr.status == 200)//确定status是否等于200,HTTP协议状态为成功
        {
        
            //一切都OK了，那就该用Javascript去执行你想要的动作了。
        	//alert(xhr.responseText);
        if(username == undefined || username == null || username == ""){
		    //判断用户名是否为空
		    //alert("用户名不能为空！"); // 弹出警告信息
        	username_tip.innerHTML="用户名不能为空！";
		    ok_btn.disable=true;
		}
        else if(xhr.responseText === "true"){//xhr.responseText：服务器(out.write)返回的文本数据.//判断ajax从Servlet中返回的信息，即判断用户名是否存在。
        		username_tip.innerHTML="用户名已被注册！";
				//alert("用户名已被注册！")//弹出警告信息，告知不可适用该用户名    
			    ok_btn.disabled="true";
			}else{
				//alert("用户名合格！")
				username_tip.innerHTML="用户名合格";
				ok_btn.disabled="false";
			}
        }else{
        	alert("请求失败，错误码=" + xhr.status);//服务器返回的状态码，等于200表示一切正常。
        }
    	//alert(xhr.status);
    }
}


//验证两次密码一致性，离开光标事件
function same_password(){
	var ok_btn=document.getElementById("ok_btn");//注册按钮
	var password=document.getElementById("password").value;//第一次密码
	//alert(password);
	var password_sure=document.getElementById("password_sure").value;//确认密码
	//alert(password_sure);
	var password_tip=document.getElementById("password_tip")
	if(password_sure.trim()!= password.trim()){//最好都用.trim处理下
		password_tip.innerHTML="两次输入的新密码不一致！";
		//alert("两次输入的新密码不一致！");
		ok_btn.disabled=true;
	}else{
		password_tip.innerHTML="密码一致";
		ok_btn.disabled=false;
	}
}

//注册按钮，点击事件
function ok_onclick(){
	ok_btn.type="submit";
	//return true;
}
/*var httpRequest;
*//**
下面这个函数可以返回一个适合任何浏览器的httpRequest，步子如下：
1.试着创建一个XMLHttpRequest()示例，该示例可适合于除了微软以外的所有浏览器
2.增加错误判断，如果当前浏览器是微软的，那么就创建适用于微软的浏览器
3.但微软的浏览器又有两个版本之分，不过据说微软已经在7.0中增加对XMLHttpRequest()的支持
4.但这样也需要对原来的浏览器支持，否则你写出来的程序那些用老版本浏览器的用户就是看不
到效果的。
*//*
function createRequest()
{
    try{
        request=new XMLHttpRequest();
    }catch(trymicrosoft)
    {
        try{
            request=new ActiveXObject("Msxml2.XMLHTTP");
        }catch(othermicrosoft)
        {
            try{
                request=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(failed)
            {
                request=false;
            }
        }
    }
    if(!request)
    {
       alert("err Happend!");
       return null;
    }        
    return request;
}
*//**
这个函数就是用户的动作所有触发的函数，如下面的onblur()时，就会调用该函数
经过的步骤如下：
1.从HTML页面得到你需要的数据，可以采有document.getElementById("")方法。
2.建立需要的URL，该URL就和在FORM里面的method为get时并采用submit提交在地址栏
里面到的一样
3.打开与服务器的连接，这里面有三个必要的参数，虽然文档规定只有两个，但是我个
人觉得最好用三个，
第一个可以是GET,POST或者是POST，但常用的就是前面的两个，并且最好都用大写，因
为有些浏览器如FireFox可能会报错，
第二个就是打报的URL，这肯定你是必须的。
第三个就是下面的看到的true，这里可以是false。true表示同步处理，你提交后可以做
其它的事情，这就是AJAX里面的A，即asynchronous;如是false，那就得等到服务器的返
回才能够做其它的事情。
4.等到服务器完成，并且确定返回执行了正确执行的提示，我们就可以做下面我们想做的
事情。这些后面的事情就必须通过Javascript去完成了，因为XMLHttpRequest的唯一用途
就是发送请求及接收服务器的响应结果。
5.上面都完成了后，就可以采用send()方法向服务器发送你需要发送的信息了，它的参数
可以是任何类型，发送的数据格式必须为这样的格式：
name=value&anothername=othervalue&so=on，如果你想传送数据，你必须更改MIME类型：
httpRequest.setRequestHeader('Content-type','application/x-www-form-urnlencoded');
否则服务器将会丢弃发送的数据。
*//*
function getBackInfo()
{
    var username=document.getElementById("username").value;
    var url='checkUser.jsp?username='+username;
    request.open("GET",url,"true");
    //下面相当于是一个隐性的循环，在函数中规定只有都接收完毕数据后才做处理
    //onreadystatechange有5个值：
    // 0:未初始化
    // 1:初始化
    // 2:发送数据
    // 3:接收数据中
    // 4:数据接收完毕
    //另外还要注意就是在注册回调函数onreadystatechange时，后面的函数不能够带参数
    //如下disResult是一个函数，不能够带参。
    reqeust.onreadystatechange=disResult;//隐性的循环
    request.send(null);
}
function disResult()
{
*//**
1.一定要确定readystate==4的完成状态才做下面的事，否则会在建立连接即readystate==1的
时候就开始，然后会在readystate==2，readystate==3，readystate==4的时候都会执行，不信
你可以alert("")一个提示信息试试。
2.服务器通知完成了，并且还要保证是正确完成的，得到的是我们需要的结果才能够继续，这里
常用响应码有：
200:成功执行
401:未授权
403:禁止
404:没有找到文件
*//*
    if(request.readystate==4)
    {
        if(request.status==200)
        {
            //一切都OK了，那就该用Javascript去执行你想要的动作了。
            document.getElementById("disCheckResult").value=request.responseText;
            alert('done');
        }
        else
        {
            alert('Something Wrong has Happend!');
        }
    }
}*/