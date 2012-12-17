<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑商品分类 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.translate.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready( function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	
	var $validateForm = $("#validateForm");
	var $cardsCategoryName = $("#cardsCategoryName");
	var $cardsCategorySign = $("#cardsCategorySign");
	var $cardsCategorySignLoadingIcon = $("#cardsCategorySignLoadingIcon");

	$cardsCategoryName.change( function() {
		var $this = $(this);
		$this.translate("zh", "en", {
			data: true,
			replace: false,
			start: function() {
				$cardsCategorySignLoadingIcon.show();
			},
			complete: function() {
				var cardsCategorySignValue = $.trim($this.data("translation").en.value.toLowerCase()).replace(/\s+/g, "_").replace(/[^\w]+/g, "");
				$cardsCategorySign.val(cardsCategorySignValue);
				$cardsCategorySignLoadingIcon.hide();
			},
			error: function() {
				$cardsCategorySignLoadingIcon.hide();
			}
		});

	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"cardsCategory.name": "required",
			"cardsCategory.sign": {
				required: true,
				alphanumeric: true,
				<#if isAddAction>
					remote: "cards_category!checkSign.action"
				<#else>
					remote: "cards_category!checkSign.action?oldValue=${cardsCategory.sign?url}"
				</#if>
			},
			"cardsCategory.orderList": "digits"
		},
		messages: {
			"cardsCategory.name": "请填写分类名称",
			"cardsCategory.sign": {
				required: "请填写标识",
				alphanumeric: "标识只允许包含英文、数字和下划线",
				remote: "标识已存在"
			},
			"cardsCategory.orderList": "排序必须为零或正整数"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});

});
</script>
</head>
<body class="input">
	<div class="bar">
		<#if isAddAction>添加商品分类<#else>编辑商品分类</#if>
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="<#if isAddAction>cards_category!save.action<#else>cards_category!update.action</#if>" method="post">
			<input type="hidden" name="id" value="${id}" />
			<table class="inputTable">
				<tr>
					<th>
						分类名称: 
					</th>
					<td>
						<input type="text" id="cardsCategoryName" name="cardsCategory.name" class="formText" value="${(cardsCategory.name)!}" />
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						上级分类: 
					</th>
					<td>
						<#if isAddAction>
							<select name="parentId">
								<option value="">顶级分类</option>
								<#list cardsCategoryTreeList as cardsCategoryTree>
									<option value="${cardsCategoryTree.id}">
										<#if cardsCategoryTree.grade != 0>
											<#list 1..cardsCategoryTree.grade as i>
												&nbsp;&nbsp;
											</#list>
										</#if>
										${cardsCategoryTree.name}
									</option>
								</#list>
							</select>
						<#else>
							${(cardsCategory.parent.name)!'顶级分类'}
						</#if>
					</td>
				</tr>
				<tr>
					<th>
						商品类型: 
					</th>
					<td>
						<select name="cardsCategory.cardsType.id">
							<option value="">通用商品类型</option>
							<#list allCardsTypeList as cardsType>
								<option value="${cardsType.id}"<#if (cardsType == cardsCategory.cardsType)!> selected</#if>>
									${cardsType.name}
								</option>
							</#list>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						标识: 
					</th>
					<td>
						<input type="text" id="cardsCategorySign" name="cardsCategory.sign" class="formText" value="${(cardsCategory.sign)!}" title="该分类的唯一标识,用于分类路径和模板标识" />
						<label class="requireField">*</label>
						<span id="cardsCategorySignLoadingIcon" class="loadingIcon hidden">&nbsp;</span>
					</td>
				</tr>
				<tr>
					<th>
						排序: 
					</th>
					<td>
						<input type="text" name="cardsCategory.orderList" class="formText" value="${(cardsCategory.orderList)!}" title="只允许输入零或正整数" />
					</td>
				</tr>
				<tr>
					<th>
						页面关键词: 
					</th>
					<td>
						<input type="text" name="cardsCategory.metaKeywords" class="formText" value="${(cardsCategory.metaKeywords)!}" />
					</td>
				</tr>
				<tr>
					<th>
						页面描述: 
					</th>
					<td>
						<textarea name="cardsCategory.metaDescription" class="formTextarea">${(cardsCategory.metaDescription)!}</textarea>
					</td>
				</tr>
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<span class="warnInfo"><span class="icon">&nbsp;</span>页面关键词、页面描述可以更好的使用户通过搜索引擎搜索到站点</span>
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