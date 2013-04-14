<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>预存款提现<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript">
$().ready( function() {
	
	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $withdrawRechargeForm = $("#withdrawRechargeForm");
	
	// 表单验证
	$withdrawRechargeForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"rechargeAmount": {
				required: true,
				positive: true
			},
			"paymentConfig.id": "required"
		},
		messages: {
			"rechargeAmount": {
				required: "请填写充值金额",
				positive: "充值金额必须为正数"
			},
			"paymentConfig.id": "请选择支付方式"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="common">
		<div class="panel-1 trade_info">
				<h2>提现账户<a class="formButton red" href="withdraw!apply.action">立即提现</a></h2>
				<form id="refForm" >
				<table style="margin-top:10px;">
					<thead>
							<tr>
								<th>用户名</th>
								<th>提现金额</th>
								<th>实发金额</th>
								<th>收款账号</th>
								<th>银行名称</th>
								<th>申请日期</th>
								<th>状态</th>
							</tr>
						</thead>
						<tbody>
							<#list pager.result as withdraw>
							<tr>
								<td>
										${withdraw.member.username}
								</td>
								<td>
										${withdraw.money?string(currencyFormat)}
								</td>
								<td>
										${withdraw.totalMoney?string(currencyFormat)}
								</td>
								<td>
										${withdraw.memberBank.banknum}
								</td>
								<td>
										${withdraw.memberBank.bankname}
								</td>
								<td>
									<span title="${withdraw.createDate?string("yyyy-MM-dd HH:mm:ss")}">${withdraw.createDate}</span>
								</td>
								<td>
									${action.getText("WithdrawStatus." + withdraw.withdrawStatus)}
								</td>
							</tr>
						</#list>
						</tbody>
					</table>
					<@pagination pager=pager baseUrl="/card/withdraw!list.action">
         				<#include "/WEB-INF/template/card/pager.ftl">
         			</@pagination>
			</div>
		</div>
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>