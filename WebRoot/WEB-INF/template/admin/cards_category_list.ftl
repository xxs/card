<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>商品分类列表 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $deleteCardsCategory = $("#listTable .deleteCardsCategory");
	var $cardsCategoryName = $("#listTable .cardsCategoryName");
	
	// 删除商品分类
	$deleteCardsCategory.click( function() {
		if (confirm("您确定要删除此商品分类吗?") == false) {
			return false;
		}
	});
	
	// 树折叠
	$cardsCategoryName.click( function() {
		var grade = $(this).parent().attr("grade");
		var isHide;
		$(this).parent().nextAll("tr").each(function(){
			var thisLevel = $(this).attr("grade");
			if(thisLevel <=  grade) {
				return false;
			}
			if(isHide == null) {
				if($(this).is(":hidden")){
					isHide = true;
				} else {
					isHide = false;
				}
			}
			if( isHide) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});

})
</script>
</head>
<body class="list cardsCategory">
	<div class="bar">
		商品分类列表&nbsp;<span class="pageInfo">总记录数: ${cardsCategoryTreeList?size}
	</div>
	<div class="body">
		<form id="listForm" action="cards_category!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='cards_category!add.action'" value="添加分类" hidefocus />
			</div>
			<table id="listTable" class="listTable">
				<tr>
					<th>
						<span>分类名称</span>
					</th>
					<th>
						<span>排序</span>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<#list cardsCategoryTreeList as cardsCategory>
					<tr grade="${cardsCategory.grade}">
						<td class="cardsCategoryName">
							<#if cardsCategory.grade == 0>
								<span class="pointer firstCategory" style="margin-left: ${cardsCategory.grade * 20}px;">
									${cardsCategory.name}
								</span>
							<#else>
								<span class="pointer category" style="margin-left: ${cardsCategory.grade * 20}px;">
									${cardsCategory.name}
								</span>
							</#if>
						</td>
						<td>
							${cardsCategory.orderList}
						</td>
						<td>
							<a href="${base}${cardsCategory.url}" target="_blank" title="查看">[查看]</a>
							<#if (cardsCategory.children?size > 0)>
								<span title="无法删除">[删除]</span>
							<#else>
								<a href="cards_category!delete.action?id=${cardsCategory.id}" class="deleteCardsCategory" title="删除">[删除]</a>
							</#if>
							<a href="cards_category!edit.action?id=${cardsCategory.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
				</#list>
			</table>
			<#if cardsCategoryTreeList?size == 0>
				<div class="noRecord">没有找到任何记录!</div>
			</#if>
		</form>
	</div>
</body>
</html>