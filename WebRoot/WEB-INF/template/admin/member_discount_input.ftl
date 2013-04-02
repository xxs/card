<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑会员私有折扣 - XXS</title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"memberDiscount.name": {
				required: true,
				<#if isAddAction>
					remote: "member_discount!checkName.action"
				<#else>
					remote: "member_discount!checkName.action?oldValue=${memberDiscount.name?url}"
				</#if>
			},
			"memberDiscount.preferentialScale": {
				required: true,
				min: 0
			},
			"memberDiscount.score": {
				required: true,
				digits: true
			}
		},
		messages: {
			"memberDiscount.name": {
				required: "请填写银行卡名称",
				remote: "银行卡名称已存在"
			},
			"memberDiscount.preferentialScale": {
				required: "请填写优惠百分比",
				min: "优惠百分比必须为零或正数"
			},
			"memberDiscount.score": {
				required: "请填写所需积分",
				digits: "所需积分必须为零或正整数"
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
})
</script>
</head>
<body class="input">
	<div class="bar">
		<#if isAddAction>添加会员银行卡<#else>编辑会员银行卡</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>member_discount!save.action<#else>member_discount!update.action</#if>" method="post">
			<table class="inputTable">
				<input type="hidden" name="id" value="${id}" />
				<tr>
					<th>
						所属会员名: 
					</th>
					<td>
						<#if isAddAction>
							<input type="text" name="memberDiscount.member.username" class="formText" value="${(memberDiscount.member.username)!}" title="所属会员不能为空" />
							<label class="requireField">*</label>
						<#else>
							<input type="hidden" name="memberDiscount.member.username" value="${(memberDiscount.member.username)!}" />
							${(memberDiscount.member.username)!}
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						卡种品牌: 
					</th>
					<td>
						<#if isAddAction>
							<select name="memberDiscount.brand.id">
							<option value="">请选择卡种</option>
								<#list brandList as brand>
									<option value="${brand.id}" >
										${brand.name}
									</option>
								</#list>
							</select>
							<label class="requireField">*</label>
						<#else>
							<input type="hidden" name="memberDiscount.brand.id" value="${(memberDiscount.brand.id)!}" />
							${(memberDiscount.brand.name)!}
						</#if>
						
					</td>
				</tr>
				<tr>
					<th>
						折扣率: 
					</th>
					<td>
						<input type="text" name="memberDiscount.discount" class="formText" value="${(memberDiscount.discount)!}" title="" />
						<label class="requireField">*</label>
					</td>
				</tr>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus />&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus />
			</div>
		</form>
	</div>
</body>
</html>