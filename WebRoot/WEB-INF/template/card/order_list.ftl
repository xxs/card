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
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft" style="min-height:200px;">
		<#include "/WEB-INF/template/card/menu_order.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">订单列表</div>
			<div class="hei">
				<div class="memberCenter">
				<form action="order!search.action" method="post">
				<table class="stateTable">
					<tr>
						<th>订单编号</th>
						<td>
							<input type="text" name="order.orderSn" value="<#if order??>${order.orderSn!""}</#if>"/>
						</td>	
						<th>充值卡卡号</th>
						<td>
							<input type="text" name="order.cardNum" value="<#if order??>${order.cardNum!""}</#if>"/>
						</td>
					</tr>
					<tr>
						<th>充值卡品牌</th>
						<td>
							<select name="order.brandId">
								<option value="">请选择...</option>
								<#list allBrandList as brand>
									<option value="${brand.id}" <#if order??><#if brand.id == order.brandId> selected</#if></#if>>
										${brand.name}
									</option>
								</#list>
							</select>
						</td>	
						<th>单据通道</th>
						<td>
							<select name="order.paymentConfig.id">
								<option value="">请选择...</option>
								<#list allPaymentConfigList as paymentConfig>
									<option value="${paymentConfig.id}" <#if order??><#if paymentConfig == order.paymentConfig> selected</#if></#if>>
										${paymentConfig.name}
									</option>
								</#list>
							</select>
						</td>
					</tr>
					<tr>
						<th>单据状态</th>
						<td>
							<select name="order.orderStatus">
								<option value="">请选择...</option>
								<#list orderStatusList as orderStatus> 
									<option value="${orderStatus}" <#if order??><#if order.orderStatus == orderStatus>selected="selected"</#if></#if> >
										${action.getText("OrderStatus." + orderStatus)}
									</option>
								</#list>
							</select>
						</td>	
						<th>时间范围</th>
						<td >
							<input name="beginDate" onclick="WdatePicker()" value="<#if beginDate??>${beginDate}</#if>" />
							~
							<input name="endDate" onclick="WdatePicker()" value="<#if endDate??>${endDate}</#if>" />
						</td>
					</tr>	
					<tr>
						<td>
						</td>	
						<td colspan="3" align="center">
							<input type="submit" class="formButton" value="查询" />	
							<a href="#">今日订单</a>
							<a href="#">本周订单</a>
							<a href="#">本月订单</a>
							<a href="#">季度订单</a>
						</td>
					</tr>	
				</table>
				</form>
				</div>
			</div>
		</div>
	</div>
	<div class="memberCenter">
			<table class="listTable tabContent">
				<tr>
							<th>订单编号</th>
							<th>充值卡名称</th>
							<th>下单时间</th>
							<th>单据通道</th>
							<th>充值卡卡号</th>
							<th>订单金额</th>
							<th>订单状态</th>
							<th>状态</th>
						</tr>
						<#list pager.result as order>
							<tr>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td width="250">
									<a href="order!view.action?id=${order.id}">
										${order.productName}
									</a>
								</td>
								<td width="200">
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
								</td>
								<td>
									${order.paymentConfig.name}
								</td>
								<td>
									${order.cardNum}
								</td>
								<td>
									${order.amount?string(currencyFormat)}
								</td>
								<td class="steteText">
									<#if order.orderStatus == "paid">
										<span class="green">[${action.getText("OrderStatus." + order.orderStatus)}]</span>
									<#else>
										<span class="red"> [${action.getText("OrderStatus." + order.orderStatus)}] </span>
									</#if>
								</td>
								<td>
									<span title="${order.retCode}">
										${resultText(order.paymentConfig.paymentProductId,order.retCode)}
									</span>
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
<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>