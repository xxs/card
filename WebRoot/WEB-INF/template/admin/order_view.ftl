<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>查看订单 - XXS</title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
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
				<input type="button" value="订单日志" hidefocus />
			</li>
		</ul>
		<table class="inputTable tabContent">
			<tr>
				<th>
					订单编号: 
				</th>
				<td>
					${order.orderSn}
				</td>
				<th>
					支付方式: 
				</th>
				<td>
					${order.paymentConfigName}
				</td>
			</tr>
			<tr>	
				<th>
					下单时间: 
				</th>
				<td>
					${order.createDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
				<th>卡种：</th>
				<td>
					${order.productName}
				</td>
			</tr>
			<tr>
				<th>
					提交金额: 
				</th>
				<td>
					<span class="red">${order.amount?string(currencyFormat)}</span>
				</td>
				<th>
					订单流水号: 
				</th>
				<td>
					${order.paySn}
				</td>
			</tr>
			<tr>
				<th>卡号</th>
				<td>
					${order.cardNum}
				</td>
				<th>密码:</th>
				<td>
					${order.cardPwd}
				</td>
			</tr>
			<tr>
				<th>成功金额：</th>
				<td>
					${order.paidAmount?string(currencyFormat)}
				</td>
				<th>
					 交易时间：
				</th>
				<td>
					${order.modifyDate?string("yyyy-MM-dd HH:mm:ss")}
				</td>
			</tr>
			<tr>
				<th>
					 订单状态：
				</th>
				<td>
					<span class="red">
						${action.getText("OrderStatus." + order.orderStatus)}
					</span>
				</td>
				<th>
					 详细：
				</th>
				<td>
					<span class="red">
						${order.retMsg}
					</span>
				</td>
			</tr>
			<tr>
				<th>
					 兑换率：
				</th>
				<td>
					<span class="red">
						${order.cardDiscount*100}%
					</span>
				</td>
				<th>
					 结算货款：
				</th>
				<td>
					<span class="red">
						<#if order.paidAmount == 0>
							￥0.00元
						 <#else>
							￥${order.paidAmount*order.cardDiscount}元
						</#if>
					</span>
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