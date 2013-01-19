<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>账户列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {

	var $tab = $("#tab");
	
	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $passwordForm = $("#passwordForm");

	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	// 表单验证
	$passwordForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"oldPassword": {
				requiredTo: "#password"
			},
			"member.password": {
				minlength: 4,
				maxlength: 20,
				requiredTo: "#oldPassword"
			},
			"rePassword": {
				equalTo: "#password"
			},
			"member.safeQuestion": {
				requiredTo: "#memberSafeAnswer"
			},
			"member.safeAnswer": {
				requiredTo: "#memberSafeQuestion"
			}
		},
		messages: {
			"oldPassword": {
				requiredTo: "请填写旧密码"
			},
			"member.password": {
				minlength: "密码长度必须大于等于4",
				maxlength: "密码长度必须小于等于20",
				requiredTo: "请填写新密码"
			},
			"rePassword": {
				equalTo: "两次密码输入不一致"
			},
			"member.safeQuestion": {
				requiredTo: "请填写安全问题"
			},
			"member.safeAnswer": {
				requiredTo: "请填写安全答案"
			}
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
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">账户列表 </div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">可在<a href="bank!add.action">添加账户</a>页面添加</div>
			<div class="memberCenter">
			<table class="listTable">
				<tr>
					<th>账号	</th>
					<th>开户名</th>
					<th>开户银行</th>
					<th>开户城市</th>
					<th>支行明细</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
					<#list member.memberBankSet as memberBank>
						<tr>
							<td>
								${memberBank.banknum}
							</td>
							<td>
								${memberBank.openname}
							</td>
							<td>
								${memberBank.bankname}
							</td>
							<td>
								${memberBank.bankcity}
							</td>
							<td>
								${memberBank.bankdetail}
							</td>
							<td>
								${memberBank.isDefault?string('是','否')}
							</td>
							<td>
								<a href="bank!check.action?id=${memberBank.id}">[默认]</a>
								<a href="bank!edit.action?id=${memberBank.id}">[修改]</a>
							</td>
						</tr>
					</#list>		
				</table>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>