/**
 * 购物车js
 */

$(document).ready(function(){
	//alert("ok")
	/**
	 * 全选
	 */
	$("#pickAll").click(function(){
		if($("#pickAll").prop('checked')){
			//alert("ok")
			$("input.ck").prop('checked',true);
		}else{
			$("input.ck").prop('checked',false);
		}
	})
	/**
	 * 数量加减
	 */
		/*进来即要算一次*/
		$('tr').each(function(){
				var goodscount=parseInt($(this).find('input.goodscount').val());
				var price=parseFloat($(this).find('input#price').val());
				var sum = $(this).find('input.sum');
				sum.val(goodscount*price);/*算每行总价*/
				
			})
			
		$('.plus').click(function(){
			var t = $(this).parent('div').find("input.goodscount");
			/*console.info(t.val());*/
			if(t.val()<parseInt($('.reservenum').val())){/* 数量最大不能超过商品库存量 */
				t.val(parseInt(t.val())+1);
			}else{
				t.val($('.reservenum').val());
				alert("超过库存量")
			}
			setsum();
			
		})
		$('.minus').click(function(){
			var t = $(this).parent('div').find("input.goodscount");
			/*console.info(t.val());*/
			t.val(parseInt(t.val())-1);
			if(parseInt(t.val()) <1 ){
				t.val(1);
				alert("最小加购数量为1一件")
			}
			setsum();
		})
		function setsum(){//出现错误主要是我用的每个tr遍历，而第一行和最后一行找不到里面的两个标签
		    var s=0;//定义
		    
			$('tr').each(function(){
			var goodscount=parseInt($(this).find('input.goodscount').val());//int类型
			if(isNaN(goodscount)){//判断，别忘
				goodscount=0;
			}
			var price=parseFloat($(this).find('input#price').val());//Float类型
			if(isNaN(price)){//判断，别忘
				price=0;
			}
			var sum = $(this).find('input.sum');
			sum.val(goodscount*price);//这个赋值出去正确
			//console.info(goodscount*price);
			s += goodscount*price;
			console.info(s);//这个控制台输出NAN
			})
			$('#allsum').val(s);//总价
		}
		setsum();//开始进页面即算价
		/*var t = $('.goodscount');  数量显示框
		var price=$('.price');单价
		var sum=$('.sum');总价
		sum.val(parseInt(price.val()) * parseInt(t.val()));
		$('.plus').click(function(){
			
			//alert(t);
			var a=parseInt(price.val());
			var b=parseInt(t.val());
			
			if(t.val()<parseInt($('.reservenum').val())){ 数量最大不能超过商品库存量 
				t.val(parseInt(t.val())+1);
			}else{
				t.val($('.reservenum').val());
			}
			sum.val(a*(b+1));
		})
		.css("background","red")
		$('.minus').click(function(){
			
			var a=parseInt(price.val());
			var b=parseInt(t.val());
			if(t.val()<=1){	数量最少为1  
				t.val(1)
			}else{
				t.val(parseInt(t.val())-1);
			}
			sum.val(a*(b-1));
		})
		
		*/
})
/*
 * 提交多选
 */
function rst()
{
//获取所有名字为ck的编号组件
	var ck = document.getElementsByName("ck");
	var rst_btn = document.getElementById("rst_btn");
//获取订单总价
	var allsum=document.getElementById("allsum").value;
	var qty=document.getElementById("qty").value;
//alert(allsum);
//ids字符串
	var s = ""; 
//循环ck数组
	for(var i = 0 ; i < ck.length ; i ++)
	{
//如果被选择的选中
		if(ck[i].checked)
		{
		//编号字符串累加
			s+=ck[i].value+" ";
		}	
	}
	if(s==""){
		alert("请选择要购买的商品");
	}else{
	//确认选项
		var ok = window.confirm("确定要购买["+s+"] 吗？");
	}	
//如果确认选择
	if(ok){
	//把ids以及订单总额传入后台调用servlet
		document.location = "../order/addOrder.jsp?ids="+s+" &&sum="+allsum+"&&qty="+qty+"&&type="+2+" ";
		//rst_btn.type="submit";
	}
}
