<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
	$().ready(function() {
	
		var $refForm = $("#refForm");
		var $refBtn = $("#refBtn");
		var $status = $(".state");
	
		$refBtn.click( function() {
			$.ajax({
				url: "order!query.action",
				data: $refForm.serialize(),
				type: "POST",
				dataType: "json",
				cache: false,
				beforeSend: function(data) {
					$status.html('<span class="loadingIcon">&nbsp;</span>刷新中');
					$refBtn.attr("disabled", true);
				},
				success: function(data) {
					if (data.status == "success") {
						$status.text(data.message);
						$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
					} else {
						$status.text(data.message);
						$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
					}
					$refBtn.attr("disabled", false);
				}
			});
			return false;
		});
	})
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
				<table class="stateTable">
						<tr>
							<td colspan="4">
								您目前是[${loginMember.memberRank.name}],目前等级享受的提现手续费率为：${(1-loginMember.memberRank.lossrate)*100}%&nbsp;!
								下一等级将享受的提现手续费率为：${(1-loginMember.memberRank.lossrate)*100}%
							</td>
						</tr>
						<tr>
							<th>帐户总积分</th>
							<td>${loginMember.score}</td>
							<th>订单总数量</th>
							<td>
								${loginMember.orderSet?size}&nbsp;&nbsp;
								<a href="order!list.action">[查看订单列表]</a>
							</td>
						</tr>
						<tr>
							<th>预存款余额</th>
							<td>${loginMember.deposit?string(currencyFormat)}&nbsp;&nbsp;<a href="deposit!list.action">[预存款明细]</a></td>
							<th>未读消息数</th>
							<td>
								${unreadMessageCount}&nbsp;&nbsp;
								<a href="message!inbox.action">[查看收件箱]</a>
							</td>
						</tr>
						<tr>
							<th>注册日期</th>
							<td>${loginMember.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
							<th>最后登录IP</th>
							<td>${loginMember.loginIp}</td>
						</tr>
					</table>
					<div class="blank"></div>
					<form id="refForm" >
					<table class="listTable">
						<tr>
							<th>充值卡名称</th>
							<th>订单编号</th>
							<th>下单时间</th>
							<th>订单金额</th>
							<th>订单状态</th>
							<th><input class="formButton red" id="refBtn" type="button" value="刷新订单"/></th>
						</tr>
						<#list loginMember.orderSet as order>
							<tr>
								<td width="170">
									<a href="order!view.action?id=${order.id}">
										${order.productName}
									</a>
								</td>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td>
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
								</td>
								<td>
									${order.amount?string(currencyFormat)}
								</td>
								<td>
									<span class="state">
										<#if order.orderStatus == "paid">
											<span class="green">[${action.getText("OrderStatus." + order.orderStatus)}]</span>
										<#else>
											<span class="red"> [${action.getText("OrderStatus." + order.orderStatus)}] </span>
										</#if>
									</span>
								</td>
								<td>
									<input type="hidden" name="ids" value="${order.id}"/>
									<span class="state">
										<span title="${order.retMsg}">${order.retCode}</span>
									</span>
								</td>
							</tr>
							<#if (order_index + 1 > 10)>
								<#break />
							</#if>
						</#list>
						<tr>
							<td colspan="5">
								<a href="order!list.action">更多订单>></a>
							</td>
							<td colspan="1">
								
							</td>
						</tr>
					</table>
					</form>
					<#include "/WEB-INF/template/card/pager.ftl">
		</div>
	</div>
</div>
<div class="blank"></div>
<#include "/WEB-INF/template/card/member_footer.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
</body>
</html>