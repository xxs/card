<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑商品类型 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");

	var $tab = $("#tab");
	var $cardsAttributeTable = $("#cardsAttributeTable");
	var $addCardsAttributeButton = $("#addCardsAttributeButton");
	var $cardsParameterTable = $("#cardsParameterTable");
	var $addCardsParameterButton = $("#addCardsParameterButton");
	
	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	// 增加商品属性
	var cardsAttributeIndex = ${(cardsType.cardsAttributeSet?size)!0};
	$addCardsAttributeButton.click( function() {
	
		<@compress single_line = true>
			var cardsAttributeTrHtml = 
			'<tr class="cardsAttributeTr">
				<td>
					<input type="text" name="cardsAttributeList[' + cardsAttributeIndex + '].name" class="formText cardsAttributeListName" />
				</td>
				<td>
					<select name="cardsAttributeList[' + cardsAttributeIndex + '].attributeType" class="attributeType">
						<#list attributeTypeList as attributeType>
							<option value="${attributeType}">
								${action.getText("AttributeType." + attributeType)}
							</option>
						</#list>
					</select>
				</td>
				<td>
					<input type="text" name="cardsAttributeList[' + cardsAttributeIndex + '].optionText" class="formText optionText cardsAttributeListOptionText" title="多个可选值.请使用“,”分隔" />
				</td>
				<td>
					<input type="text" name="cardsAttributeList[' + cardsAttributeIndex + '].orderList" class="formText cardsAttributeListOrderList" style="width: 30px;" />
				</td>
				<td>
					<span class="deleteIcon deleteCardsAttributeIcon" title="删 除">&nbsp;</span>
				</td>
			</tr>';
		</@compress>
		
		if ($cardsAttributeTable.find(".cardsAttributeTr").length >= 20) {
			$.dialog({type: "warn", content: "商品属性个数超出限制!", modal: true, autoCloseTime: 3000});
		} else {
			$cardsAttributeTable.append(cardsAttributeTrHtml);
			cardsAttributeIndex ++;
		}
	});
	
	// 修改商品属性类型
	$("#cardsAttributeTable .attributeType").live("click", function() {
		var $this = $(this);
		var $optionText = $this.parent().parent().find(".optionText")
		if ($this.val() == "filter") {
			$optionText.attr("disabled", false).show();
		} else {
			$optionText.attr("disabled", true).hide();
		}
	});
	
	// 删除商品属性
	$("#cardsAttributeTable .deleteCardsAttributeIcon").live("click", function() {
		$(this).parent().parent().remove();
	});
	
	// 增加商品参数
	var cardsParameterIndex = ${(cardsType.cardsParameterList?size)!0};
	$addCardsParameterButton.click( function() {
		
		<@compress single_line = true>
			var cardsParameterTrHtml = 
			'<tr class="cardsParameterTr">
				<td>
					<input type="text" name="cardsParameterList[' + cardsParameterIndex + '].name" class="formText cardsParameterListName" />
				</td>
				<td>
					<input type="text" name="cardsParameterList[' + cardsParameterIndex + '].orderList" class="formText cardsParameterListOrderList" style="width: 30px;" />
				</td>
				<td>
					<span class="deleteIcon deleteCardsParameterIcon" title="删 除">&nbsp;</span>
				</td>
			</tr>';
		</@compress>
		
		$cardsParameterTable.append(cardsParameterTrHtml);
		cardsParameterIndex ++;
	});
	
	// 删除商品参数
	$("#cardsParameterTable .deleteCardsParameterIcon").live("click", function() {
		var $this = $(this);
		$this.parent().parent().remove();
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"cardsType.name": {
				required: true
			}
		},
		messages: {
			"cardsType.name": {
				required: "请填写类型名称"
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
	$.validator.addMethod("cardsAttributeListNameRequired", $.validator.methods.required, "请填写商品属性名称");
	$.validator.addMethod("cardsAttributeListOptionTextRequired", $.validator.methods.required, "请填写商品属性可选项");
	$.validator.addMethod("cardsAttributeListOrderListDigits", $.validator.methods.digits, "商品属性排序必须为零或正整数");
	$.validator.addMethod("cardsParameterListNameRequired", $.validator.methods.required, "请填写商品参数名称");
	$.validator.addMethod("cardsParameterListOrderListDigits", $.validator.methods.digits, "商品参数排序必须为零或正整数");
	
	$.validator.addClassRules("cardsAttributeListName", {
		cardsAttributeListNameRequired: true
	});
	$.validator.addClassRules("cardsAttributeListOptionText", {
		cardsAttributeListOptionTextRequired: true
	});
	$.validator.addClassRules("cardsAttributeListOrderList", {
		cardsAttributeListOrderListDigits: true
	});
	$.validator.addClassRules("cardsParameterListName", {
		cardsParameterListNameRequired: true
	});
	$.validator.addClassRules("cardsParameterListOrderList", {
		cardsParameterListOrderListDigits: true
	});

})
</script>
</head>
<body class="input cardsType">
	<div class="bar">
		<#if isAddAction>添加商品类型<#else>编辑商品类型</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>cards_type!save.action<#else>cards_type!update.action</#if>" method="post">
			<input type="hidden" name="id" value="${id}" />
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus />
				</li>
				<li>
					<input type="button" value="商品品牌" hidefocus />
				</li>
				<li>
					<input type="button" value="商品属性" hidefocus />
				</li>
				<li>
					<input type="button" value="商品参数" hidefocus />
				</li>
			</ul>
			<table class="inputTable tabContent">
				<tr>
					<th>
						类型名称: 
					</th>
					<td>
						<input type="text" name="cardsType.name" class="formText" value="${(cardsType.name)!}" />
						<label class="requireField">*</label>
					</td>
				</tr>
			</table>
			<table class="inputTable tabContent">
				<tr class="noneHover">
					<th>
						商品品牌: 
					</th>
					<td>
						<div class="brandSelect">
							<ul>
								<#list allBrandList as brand>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="${brand.id}"<#if (cardsType.brandSet.contains(brand))!> checked</#if> />${brand.name}
										</label>
									</li>
								</#list>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<span class="warnInfo"><span class="icon">&nbsp;</span>未选择的商品品牌前台页面无法进行品牌筛选</span>
					</td>
				</tr>
			</table>
			<table id="cardsAttributeTable" class="inputTable tabContent">
				<tr class="noneHover">
					<td colspan="5">
						<input type="button" id="addCardsAttributeButton" class="formButton" value="增加属性" hidefocus />
					</td>
				</tr>
				<tr class="title">
					<th>
						属性名称
					</th>
					<th>
						属性类型
					</th>
					<th>
						可选项
					</th>
					<th>
						排序
					</th>
					<th>
						删除
					</th>
				</tr>
				<#list (cardsType.cardsAttributeSet)! as cardsAttribute>
					<tr class="cardsAttributeTr">
						<td>
							<input type="hidden" name="cardsAttributeList[${cardsAttribute_index}].id" value="${cardsAttribute.id}" />
							<input type="hidden" name="cardsAttributeList[${cardsAttribute_index}].propertyIndex" value="${cardsAttribute.propertyIndex}" />
							<input type="text" name="cardsAttributeList[${cardsAttribute_index}].name" class="formText cardsAttributeListName" value="${cardsAttribute.name}" />
						</td>
						<td>
							<select name="cardsAttributeList[${cardsAttribute_index}].attributeType" class="attributeType">
								<#list attributeTypeList as attributeType>
									<option value="${attributeType}"<#if (attributeType == cardsAttribute.attributeType)!> selected</#if>>
										${action.getText("AttributeType." + attributeType)}
									</option>
								</#list>
							</select>
						</td>
						<td>
							<#if cardsAttribute.attributeType == "filter">
								<input type="text" name="cardsAttributeList[${cardsAttribute_index}].optionText" class="formText optionText cardsAttributeListOptionText" value="${cardsAttribute.optionText}" title="多个可选值请使用“,”分隔" />
							<#else>
								<input type="text" name="cardsAttributeList[${cardsAttribute_index}].optionText" class="formText hidden optionText cardsAttributeListOptionText" title="多个可选值请使用“,”分隔" disabled />
							</#if>
						</td>
						<td>
							<input type="text" name="cardsAttributeList[${cardsAttribute_index}].orderList" class="formText cardsAttributeListOrderList" value="${cardsAttribute.orderList}" style="width: 30px;" />
						</td>
						<td>
							<span class="deleteIcon deleteCardsAttributeIcon" title="删 除">&nbsp;</span>
						</td>
					</tr>
				</#list>
			</table>
			<table id="cardsParameterTable" class="inputTable tabContent">
				<tr class="noneHover">
					<td colspan="3">
						<input type="button" id="addCardsParameterButton" class="formButton" value="增加参数" hidefocus />
					</td>
				</tr>
				<tr class="title">
					<th>
						参数名称
					</th>
					<th>
						排序
					</th>
					<th>
						删除
					</th>
				</tr>
				<#list (cardsType.cardsParameterList)! as cardsParameter>
					<tr class="cardsParameterTr">
						<td>
							<input type="hidden" name="cardsParameterList[${cardsParameter_index}].id" value="${cardsParameter.id}" />
							<input type="text" name="cardsParameterList[${cardsParameter_index}].name" class="formText cardsParameterListName" value="${cardsParameter.name}" />
						</td>
						<td>
							<input type="text" name="cardsParameterList[${cardsParameter_index}].orderList" class="formText cardsParameterListOrderList" value="${cardsParameter.orderList}" style="width: 30px;" />
						</td>
						<td>
							<span class="deleteIcon deleteCardsParameterIcon" title="删 除">&nbsp;</span>
						</td>
					</tr>
				</#list>
			</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus />
				&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus />
			</div>
		</form>
	</div>
</body>
</html>