<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>预存款提现<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript">
$().ready( function() {
	var $subbtn = $("#subbtn");
	var $withdrawForm = $("#withdrawForm");
	
	// 表单验证
		$withdrawForm.submit( function() {
			if($.trim($("input[class='banklist']:checked").val()) == ""){
					$.dialog({type: "warn", content: "提现账户为必选项", modal: true, autoCloseTime: 3000});
					return false;
				}
			if ($.trim($("#withdrawmoney").val()) == "") {
				$.dialog({type: "warn", content: "请输入提现金额!", modal: true, autoCloseTime: 3000});
				return false;
			}
			$subbtn.attr("disabled", false);
			$subbtn.removeAttr("button_click");
			$subbtn.attr("class", "button");
		});
	
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_deposit.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">提现申请</a></div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="memberCenter">
			<form id="withdrawForm" action="withdraw!save.action" method="post">
						<input type="hidden" name="paymentType" value="recharge" />
						<table class="inputTable">
							<tr>
								<th>
									当前金额: 
								</th>
								<td>
									${loginMember.deposit?string(currencyFormat)}
								</td>
							</tr>
							<tr>
								<th>
									提现账户: 
								</th>
								<td>
										<#list loginMember.memberBankSet as memberBank>
											<#if memberBank.isDefault >
												<input type="radio" class="banklist" name="memberBank.id" value="${memberBank.id}" <#if memberBank.isDefault >checked="checked"</#if> />${memberBank.banknum}(开户名：${memberBank.openname},开户银行:${memberBank.bankname})<br />
											</#if>
										</#list>
										<div class="hei"><a href="bank!list.action?redirectUrl=withdraw!apply.action">点击设置默认账户！</a>(最多添加5个账户，请谨慎操作)</div>
								</td>
							</tr>
							<tr>
								<th>
									提现金额: 
								</th>
								<td>
									<input type="text" id="withdrawmoney" name="withdraw.money" class="formText" />
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" id="subbtn" class="button" value="申  请" hidefocus />
								</td>
							</tr>
						</table>
					</form>
				</div>
		</div>
	</div>
	</div>
</div>
<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>