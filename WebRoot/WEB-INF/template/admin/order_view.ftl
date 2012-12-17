<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看订单 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready( function() {

	var $tab = $("#tab");
	
	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});

});
</script>
</head>
<body class="input">
	<div class="bar">
		查看订单
	</div>
	<div class="body">
		<ul id="tab" class="tab" style="padding-left: 80px;">
			<li>
				<input type="button" value="订单信息" hidefocus />
			</li>
			<li>
				<input type="button" value="充值卡信息" hidefocus />
			</li>
			<li>
				<input type="button" value="收款记录" hidefocus />
			</li>
			<li>
				<input type="button" value="订单日志" hidefocus />
			</li>
		</ul>
		<table class="inputTable tabContent">
			<tr>
				<th>
					订单状态: 
				</th>
				<td colspan="3">
					<span class="red">
						[${action.getText("OrderStatus." + order.orderStatus)}]
						[${action.getText("PaymentStatus." + order.paymentStatus)}]
						[${action.getText("ShippingStatus." + order.shippingStatus)}]
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<th>
					订单编号: 
				</th>
				<td>
					${order.orderSn}
				</td>
				<th>
					下单时间: 
				</th>
				<td>
					${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th>
					充值卡总金额: 
				</th>
				<td>
					<span class="red">${order.totalProductPrice?string(currencyFormat)}</span>
				</td>
				<th>
					订单总金额: 
				</th>
				<td>
					<span class="red">${order.totalAmount?string(currencyFormat)}</span>&nbsp;&nbsp;
					<strong class="red">[已付金额: ${order.paidAmount?string(currencyFormat)}]</strong>
				</td>
			</tr>
			<tr>
				<th>
					支付方式: 
				</th>
				<td>
					${order.paymentConfigName}
				</td>
				<th>
					附言: 
				</th>
				<td>
					${(order.memo)!}
				</td>
			</tr>
			<tr>
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="4">
					&nbsp;
				</td>
			</tr>
			<#if order.member??>
				<#assign member = order.member />
				<tr>
					<th>
						用户名: 
					</th>
					<td>
						${member.username}
					</td>
					<th>
						会员等级: 
					</th>
					<td>
						${member.memberRank.name}
						<#if member.memberRank.preferentialScale != 100>
							<span class="red">[优惠百分比: ${member.memberRank.preferentialScale}%]</span>
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						E-mail: 
					</th>
					<td>
						${member.email}
					</td>
					<th>
						最后登录IP: 
					</th>
					<td>
						${member.loginIp}
					</td>
				</tr>
				<tr>
					<th>
						预存款余额: 
					</th>
					<td>
						${member.deposit?string(currencyFormat)}
					</td>
					<th>
						积分: 
					</th>
					<td>
						${member.score}
					</td>
				</tr>
			<#else>
				<tr>
					<th>
						会员状态: 
					</th>
					<td colspan="3">
						<span class="red">会员不存在</span>
					</td>
				</tr>
			</#if>
		</table>
		<table class="inputTable tabContent">
			<tr class="title">
				<th>货号</th>
				<th>充值卡名称</th>
				<th>价格</th>
				<th>购买数量</th>
			</tr>
			<#list order.orderItemSet as orderItem>
				<tr>
					<td>
						<a href="${base}${orderItem.cardsHtmlPath}" target="_blank">
							${orderItem.productSn}
						</a>
					</td>
					<td>
						<a href="${base}${orderItem.cardsHtmlPath}" target="_blank">
							${orderItem.productName}
						</a>
					</td>
					<td>
						${orderItem.productPrice?string(currencyFormat)}
					</td>
					<td>
						${orderItem.productQuantity}
					</td>
				</tr>
			</#list>
		</table>
		<table class="inputTable tabContent">
			<tr class="title">
				<th>序号</th>
				<th>支付编号</th>
				<th>支付类型</th>
				<th>支付方式</th>
				<th>支付金额</th>
				<th>支付手续费</th>
				<th>付款人</th>
				<th>支付状态</th>
				<th>支付时间</th>
			</tr>
			<#list order.paymentSet as payment>
				<tr>
					<td>${payment_index + 1}</td>
					<td>
						<a href="payment!view.action?id=${payment.id}">
							${payment.paymentSn}
						</a>
					</td>
					<td>
						${action.getText("PaymentType." + payment.paymentType)}
					</td>
					<td>
						${payment.paymentConfigName}
					</td>
					<td>
						${payment.totalAmount?string(currencyFormat)}
					</td>
					<td>
						${payment.paymentFee?string(currencyFormat)}
					</td>
					<td>
						${payment.payer}
					</td>
					<td>
						${action.getText("PaymentStatus." + payment.paymentStatus)}
					</td>
					<td>
						<span title="${payment.createDate?string("yyyy-MM-dd HH:mm:ss")}">${payment.createDate}</span>
					</td>
				</tr>
			</#list>
		</table>
		<table class="inputTable tabContent">
			<tr class="title">
				<th>序号</th>
				<th>日志类型</th>
				<th>操作员</th>
				<th>日志信息</th>
				<th>操作日间</th>
			</tr>
			<#list order.orderLogSet as orderLog>
				<tr>
					<td>${orderLog_index + 1}</td>
					<td>
						${action.getText("OrderLogType." + orderLog.orderLogType)}
					</td>
					<td>
						${orderLog.operator!"[用户]"}
					</td>
					<td>
						${orderLog.info!"-"}
					</td>
					<td>
						<span title="${orderLog.createDate?string("yyyy-MM-dd HH:mm:ss")}">${orderLog.createDate}</span>
					</td>
				</tr>
			</#list>
		</table>
		<div class="buttonArea">
			<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus />
		</div>
	</div>
</body>
</html>