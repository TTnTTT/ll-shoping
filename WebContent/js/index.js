/**
 * 
 */
/* window.onload=function(){
		window.location="/shop/QueryAllGoodsServlet";
	} */
/*提示函数*/
function tip(){
		alert("您未登录，请登录")
	}
$(function(){
	$('#typelist li').click(function(){

		$(this).find('input').prop("checked","checked");/*添加属性，用attr不行，要用prpo,不能通过添加样式css时*/
		$(this).siblings().find('input').removeAttr("checked");
		$(this).removeClass('wxz');
		$(this).siblings().addClass('wxz');/*除选中元素之外的兄弟标签siblings()*/
		$(this).addClass('xz');
	})
})