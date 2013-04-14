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
			if($.trim($("#withdrawpwd").val()) == ""){
					$.dialog({type: "warn", content: "请输入提现密码", modal: true, autoCloseTime: 3000});
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
	<!-- common begin -->
		<div class="common">
			<div class="panel-1">
				<h2>申请提现</h2>
				<div class="account_info">
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
									提现密码: 
								</th>
								<td>
									
									<#if loginMember.withdrawPwd != "">
										<input type="password" id="withdrawpwd" name="withdrawpwd" class="formText" /><label class="requireField">*</label>
									<#else>
										系统检测到您尚未设置提现密码，<a href="password!withdrawPwd.action" class="red">点击设置提现密码！</a>
									</#if>
									
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
		<!-- common end-->
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>