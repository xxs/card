<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {
	var $refOrder = $(".refOrder");
	alter("qqq");
	// 删除收藏
	$refOrder.click( function() {
		alert("qqq");
		var $this = $(this);
		var orderId = $this.attr("orderId");
		$.ajax({
				url: "/card/order!query.action",
				data: {id: orderId},
				type: "POST",
				dataType: "json",
				cache: false,
				success: function(data) {
					$.message({type: data.status, content: data.message});
					//$this.parent().parent().remove();
				}
			});
		}
		return false;
	});
	
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_order.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">订单列表</div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="memberCenter">
			<table class="listTable tabContent">
				<tr>
							<th>订单编号</th>
							<th>充值卡名称</th>
							<th>下单时间</th>
							<th>订单金额</th>
							<th>订单状态</th>
							<th>状态码</th>
							<th>支付结果</th>
							<th>操作</th>
						</tr>
						<#list pager.result as order>
							<tr>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td width="100">
									<a href="order!view.action?id=${order.id}">
										${order.productName}
									</a>
								</td>
								<td>
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
								</td>
								<td>
									${order.amount?string(currencyFormat)}
								</td>
								<td class="steteText">
									<span></span>
									<#if order.orderStatus != "completed" && order.orderStatus != "invalid">
										[${action.getText("PaymentStatus." + order.paymentStatus)}]
									<#else>
										[${action.getText("OrderStatus." + order.orderStatus)}]
									</#if>
								</td>
								<td>
									<#if order.retCode == "">
										${order.retCode}
									<#else>
										-
									</#if>
								</td>
								<td>
									<#if order.retMsg == "">
										${order.retMsg}
									<#else>
										-
									</#if>
								</td>
								<td>
									<!-- <span class="refOrder" orderId="${order.id}" >刷新</span> -->
									<input name="" type="button" class="chonx" value="按钮"/>
								</td>
							</tr>
						</#list>	
				</table>
				<@pagination pager=pager baseUrl="/card/order!list.action">
         			<#include "/WEB-INF/template/card/pager.ftl">
         		</@pagination>
			</div>
		</div>
	</div>
	</div>
</div>
<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>