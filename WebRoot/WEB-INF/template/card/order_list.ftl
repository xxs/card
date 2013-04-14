<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单列表<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<script type="text/javascript" src="${base}/template/common/datePicker/WdatePicker.js"></script>
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {
			var $queryForm = $("#queryForm");
			var $queryBtn = $("#queryBtn");
			$queryBtn.click( function() {
				$.ajax({
					url: "query!query.action",
					data: $queryForm.serialize(),
					type: "POST",
					dataType: "json",
					cache: false,
					beforeSend: function(data) {
						$queryBtn.attr("disabled", true);
					},
					success: function(data) {
						if (data.status == "success") {
							$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
						} else {
							$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
						}
						$queryBtn.attr("disabled", false);
					}
				});
				return false;
			});
		var $refForm = $("#refForm");
		var $refBtn = $("#refBtn");
		var $status = $(".state");
		var $recode = $(".recode");
	
		$refBtn.click( function() {
			$.ajax({
				url: "order!Lquery.action",
				data: $refForm.serialize(),
				type: "POST",
				dataType: "json",
				cache: false,
				beforeSend: function(data) {
					$recode.html('<span class="loadingIcon">&nbsp;</span>刷新中');
					//$status.html('<span class="loadingIcon">&nbsp;</span>刷新中');
					$refBtn.attr("disabled", true);
				},
				success: function(data) {
					if (data.status == "success") {
						var object = eval("("+data.message+")");
						$.each(object,function(index,item){
					      // alert(item.id+""+index);
					       //$("#ss"+item.id).text(item.orderStatus);
					       $("#rr"+item.id).text(item.retCode);
					    })
						//$status.text(data.message);
						//$.dialog({type: data.status, content: '刷新成功', modal: true, autoCloseTime: 3000});
					} else {
						$status.text("刷新失败");
						$recode.text("刷新失败");
						$.dialog({type: data.status, content: '刷新超时', modal: true, autoCloseTime: 3000});
					}
					$refBtn.attr("disabled", false);
				}
			});
			return false;
		});	
		$(".quickquery").click(function() {
			var newaction = $(this).attr("alt");
		  	thisform.action=newaction;
			thisform.submit();
		});		
		$(".query").click(function() {
		  	thisform.action="order!search.action";
			thisform.submit();
		});		
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<!-- common begin -->
		<div class="common">
			<form action="order!search.action" method="post" name="thisform">
			<div class="panel-left">
				<ul>
					<li><span>订单编号:</span><input type="text" name="order.orderSn" value="<#if order??>${order.orderSn!""}</#if>"/></li>
					<li><span>充值卡卡号:</span><input type="text" name="order.cardNum" value="<#if order??>${order.orderSn!""}</#if>"/></li>
					<li><span>充值卡品牌:</span><select name="order.brandId">
								<option value="">请选择...</option>
								<#list allBrandList as brand>
									<option value="${brand.id}" <#if order??><#if brand.id == order.brandId> selected</#if></#if>>
										${brand.name}
									</option>
								</#list>
							</select>
					</li>
					<li><span>充值通道:</span><select name="order.paymentConfig.id">
								<option value="">请选择...</option>
								<#list allPaymentConfigList as paymentConfig>
									<option value="${paymentConfig.id}" <#if order??><#if paymentConfig == order.paymentConfig> selected</#if></#if>>
										${paymentConfig.name}
									</option>
								</#list>
							</select>
					</li>
					<li><span>单据状态:</span><select name="order.orderStatus">
								<option value="">请选择...</option>
								<#list orderStatusList as orderStatus> 
									<option value="${orderStatus}" <#if order??><#if order.orderStatus == orderStatus>selected="selected"</#if></#if> >
										${action.getText("OrderStatus." + orderStatus)}
									</option>
								</#list>
							</select>
					</li>
					<li><span>时间范围:</span><input name="beginDate" readonly onclick="WdatePicker()" value="${tempBeginDate}" />
							~
							<input name="endDate" onclick="WdatePicker()" readonly value="${tempEndDate}"/>
					</li>
					<li><span>&nbsp;</span><input type="submit" class="formButton" value="查询" />
					</li>
				</ul>
			</div>
			</form>
			<div class="panel-right trade_info">
				<ul>
					<li>时间区间:<select name="dateScope">
								<option value="week">最近一周</option>
								<option value="month">最近一个月</option>
								<option value="quarter">最近三个月</option>
							</select>
					</li>
					<li>时间区间:<select name="dateScope">
								<option value="week">最近一周</option>
								<option value="month">最近一个月</option>
								<option value="quarter">最近三个月</option>
							</select>
					</li>
					<table style="margin-left:0px;margin-right:40px;width:400px;">
						<thead>
							<tr>
								<th >成功订单</th>
								<th >成功金额</th>
								<th >总订单数</th>
								<th >提现金额</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="null">14笔</td>
								<td class="null">￥2300元</td>
								<td class="null">￥4400元</td>
								<td class="null">￥200元</td>
							</tr>
						</tbody>
					</table>
				</ul>
			</div>
			<div class="clean"></div>
		</div>
		</div>
		<!-- common end-->
		<div class="common" style="margin-top:250px;">
		<div class="panel-1 trade_info">
				<h2>订单列表</h2>
				<form id="refForm" >
				<table style="margin-top:10px;">
					<thead>
							<tr>
								<th>订单编号</th>
								<th>充值卡名称</th>
								<th>下单时间</th>
								<th>单据通道</th>
								<th>充值卡卡号</th>
								<th>订单金额</th>
								<th>订单状态</th>
								<th><a class="red" id="refBtn" >点击刷新</a></th>
							</tr>
						</thead>
						<tbody>
							<#list pager.result as order>
							<tr>
								<td>
									${order.orderSn}
								</td>
								<td width="250">
										${order.productName}
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
								<td>
									<span class="state" id="ss${order.id}">
									<#if order.orderStatus == "paid">
										<span class="green">${action.getText("OrderStatus." + order.orderStatus)}</span>
									<#else>
										<span class="red"> ${action.getText("OrderStatus." + order.orderStatus)}</span>
									</#if>
									</span>
								</td>
								<td  width="250">
									<input type="hidden" name="ids" value="${order.id}"/>
									<span class="recode" id="rr${order.id}" title="${order.retCode}">
										<#if order.orderStatus == "paid">
											${resultText(order.paymentConfig.paymentProductId,"Ajax",order.retCode)}
										<#else>
											${resultText(order.paymentConfig.paymentProductId,order.retCode)}
										</#if>
									</span>
								</td>
							</tr>
						</#list>	
						</tbody>
					</table>
				</form>
				<@pagination pager=pager baseUrl="/card/order!list.action">
         			<#include "/WEB-INF/template/card/pager.ftl">
         		</@pagination>
			</div>
		</div>
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>