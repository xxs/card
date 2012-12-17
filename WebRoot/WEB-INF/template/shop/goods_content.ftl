<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${goods.name}<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (goods.metaKeywords)! != ""><meta name="keywords" content="${goods.metaKeywords}" /></#if>
<#if (goods.metaDescription)! != ""><meta name="description" content="${goods.metaDescription}" /></#if>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/common/css/jquery.zoomimage.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/shop.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/shop/head.ftl">
</head>
<body id="goodsContent" class="goodsContent">
	<#include "/WEB-INF/template/shop/header.ftl">
	<!-- START small_banner -->
      <section class="small_banner">
         <div class="center-wrap">
            <p class="page-banner-heading">会员中心首页</p>
            <p class="page-banner-description">This area is super easy to customize. It can include a search bar, custom text or absolutely nothing at all.</p>
            
            <div class="breadcrumbs">
            
            <a href="${base}/" class="shop"><span class="icon">&nbsp;</span>首页</a> &gt;
						<#list pathList as path>
							<a href="${base}${path.url}">${path.name}</a> &gt;
						</#list>
            </div>
            <!-- END breadcrumbs -->
         </div>
         <!-- END center-wrap -->
         
         <div class="shadow top"></div>
         <div class="shadow bottom"></div>
         <div class="tt-overlay"></div>
      </section>
      
	<section id="content-container" class="clearfix">
         <div id="main-wrap" class="clearfix">
            <aside class="subnav_cont sidebar">
               <div class="subnav">
                  <ul>
                     <@goods_list type="hot" count=10; goodsList>
									<#if (goodsList?size > 0)>
										<#list goodsList as goods>
											<li><a href="${base}${goods.htmlPath}"><span>${substring(goods.name, 24, "...")}   &rarr;   点击卖卡</span></a></li>		
										</#list>
									</#if>
								</@goods_list>
                  </ul>
               </div>
               <!-- END subnav -->
            </aside>
            <div class="page_content_right sub-content">
               <h4>${substring(goods.name, 50, "...")} <a href="/shop/order!saveCard.action?productId=${goods.id}">点击提交</a> </h4>
               <p>充值卡编号: ${goods.goodsSn}</p>
               <p>product编号: <span id="productSn">${goods.defaultProduct.id}</span></p>
               <div class="hr hr-dotted-double">&nbsp;</div>
            <div class="page_content_right sub-content">
                 <!-- START tabs_type_2 --> 
		         <dl class="tabs_type_2">
		            <dt class="current">单张支付</dt>
		            <dd class="current">
		            <form method="post" action="/shop/order!saveCard.action">
		            	<input type="text" name="productId" value="${goods.defaultProduct.id}" />
		               <p>
		               <#if goods.isSpecificationEnabled>
						<#assign specificationValueSet = goods.specificationValueSet>
			               <#list goods.specificationSet as specification>
									<#if specification.specificationType == "text">
										${specification.name}:
													<#list specification.specificationValueList as specificationValue>
														<#if specificationValueSet.contains(specificationValue)>
															<input type="radio" name="1"/>${specificationValue.name}
														</#if>
													</#list>
									</#if>
								</#list>
						</#if>
		               	</p>
		               	<p>
		               		支付通道：
		               		   <@paymentDiscount_list brandId="${goods.brand.id}"; paymentDiscountList>
								<#list paymentDiscountList as paymentDiscount>
									<input type="radio" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" <#if paymentDiscount.paymentConfig.isEnabled!=true >disabled</#if> <#if paymentDiscount.paymentConfig.isDefault>checked="checked"</#if> />通道${paymentDiscount_index+1} (折扣率：${paymentDiscount.discount} <#if paymentDiscount.paymentConfig.isDefault><span style="color:red;">推荐</span></#if>)
								</#list>
							   </@paymentDiscount_list>
		               	</p>
		               <p>账号：<input type="text" name="cardNum"/></p>
		               <p>密码：<input type="text" name="cardPwd"/></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a> <input type="submit" value="提交" />
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		               </form>
		            </dd>
		            
		            
		            <dt>多张同面额</dt>
		            <dd>
		            		               <p>
		               <#list goods.specificationSet as specification>
								<#if specification.specificationType == "text">
									${specification.name}:
												<#list specification.specificationValueList as specificationValue>
															<input type="radio" name="1"/>${specificationValue.name}
															<#if (specificationValue_index+1)%5 == 0>
																<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</#if>
												</#list>
								</#if>
							</#list>
		               	</p>
		               	<p >
		               		支付通道：
		               		   <@paymentDiscount_list brandId="${goods.brand.id}"; paymentDiscountList>
								<#list paymentDiscountList as paymentDiscount>
									<input type="radio" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" <#if paymentDiscount.paymentConfig.isDefault>checked="checked"</#if> />通道${paymentDiscount_index+1} (折扣率：${paymentDiscount.discount} <#if paymentDiscount.paymentConfig.isDefault><span style="color:red;">推荐</span></#if>)
								</#list>
							   </@paymentDiscount_list>
		               	</p>
		               <p>每行卡信息支持格式为：“卡号,密码,金额” 或者 “卡号 密码 金额”</p>
		               <p>例如：11925110103023132,111387516814561221 或者 11925110103023132 111387516814561221</p>
		               <p><textarea name="comments" cols="40" rows="3" id="comments"></textarea></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a>
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		            </dd>
		            
		            <dt>多张不同面额</dt>
		            <dd>
		            		               <p>
		               <#list goods.specificationSet as specification>
								<#if specification.specificationType == "text">
									${specification.name}:
												<#list specification.specificationValueList as specificationValue>
															<input type="radio" name="1"/>${specificationValue.name}
															<#if (specificationValue_index+1)%5 == 0>
																<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															</#if>
												</#list>
								</#if>
							</#list>
		               	</p>
		               	<p>
		               		支付通道：
		               		   <@paymentDiscount_list brandId="${goods.brand.id}"; paymentDiscountList>
								<#list paymentDiscountList as paymentDiscount>
									<input type="radio" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" <#if paymentDiscount.paymentConfig.isDefault>checked="checked"</#if> />通道${paymentDiscount_index+1} (折扣率：${paymentDiscount.discount} <#if paymentDiscount.paymentConfig.isDefault><span style="color:red;">推荐</span></#if>)
								</#list>
							   </@paymentDiscount_list>
		               	</p>
		               <p>每行卡信息支持格式为：“卡号,密码,金额” 或者 “卡号 密码 金额”</p>
		               <p>例如：11925110103023132,111387516814561221,10 或者 11925110103023132 111387516814561221 10</p>
		               <p><textarea name="comments" cols="40" rows="3" id="comments"></textarea></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a>
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		            </dd>
		            
		         </dl>
		         <!-- END tabs_type_2 --> 
            </div>
            <!-- END of page_content-->
         </div>
         <!-- END main-wrap -->
      </section>
      <!-- END content-container -->
	<#include "/WEB-INF/template/shop/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.zoomimage.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/shop.js"></script>
	<script type="text/javascript">
	$().ready( function() {
	
		$productSn = $("#productSn");
		$price = $("#price");
		$price1 = $("#price1");
		$marketPrice = $("#marketPrice");
		$buyInfo = $("#buyInfo");
		$tipsTitle = $("#tipsTitle");
		$tipsContent = $("#tipsContent");
		$closeHighlight = $("#closeHighlight");
		$specificationValue = $("#buyInfo li");
		$quantity = $("#quantity");
		$goodsButton = $("#goodsButton");
	
		// 添加充值卡浏览记录
		$.addGoodsHistory("${substring(goods.name, 24, "...")}", "${base}${goods.htmlPath}");
		
		<#if goods.isSpecificationEnabled>
			var productDatas = {};
			<#list goods.productSet as product>
				<#if product.isMarketable>
					productDatas['${product.id}'] = {
						productSn: "${product.productSn}",
						price: "${product.price?string(currencyFormat)}",
						marketPrice: "${product.marketPrice?string(currencyFormat)}",
						isOutOfStock: ${product.isOutOfStock?string("true", "false")}
					};
				</#if>
			</#list>
			
			var specificationValueDatas = {};
			<#list goods.productSet as product>
				<#if product.isMarketable>
					specificationValueDatas['${product.id}'] = new Array(<#list product.specificationValueList as specificationValue>"${specificationValue.id}"<#if specificationValue_has_next>, </#if></#list>);
				</#if>
			</#list>
			
			var specificationValueSelecteds = new Array();
			var selectedProductId = null;
			
			$specificationValue.click(function () {
				var $this = $(this);
				if ($this.hasClass("notAllowed")) {
					return false;
				}
				
				if ($this.hasClass("selected")) {
					$this.removeClass("selected");
				} else {
					$this.addClass("selected");
				}
				$this.siblings("li").removeClass("selected");
				$specificationValue.addClass("notAllowed");
				
				var $specificationValueSelected = $("#buyInfo li.selected");
				if ($specificationValueSelected.length == 1) {
					$specificationValueSelected.siblings("li").removeClass("notAllowed");
				}
				
				var specificationValueSelecteds = new Array();
				selectedProductId = null;
				var tipsContentText = "";
				$specificationValueSelected.each(function(i) {
					var $this = $(this);
					tipsContentText += $this.attr("title") + " ";
					specificationValueSelecteds.push($this.attr("specificationValueId"));
				});
				if (tipsContentText != "") {
					$tipsTitle.text("已选择: ");
					$tipsContent.text(tipsContentText);
				} else {
					$tipsTitle.text("请选择: ");
					$tipsContent.text("<#list goods.specificationSet as specification>${specification.name} </#list>");
				}
				$.each(specificationValueDatas, function(i) {
					if (arrayContains(specificationValueDatas[i], specificationValueSelecteds)) {
						for (var j in specificationValueDatas[i]) {
							$("." + specificationValueDatas[i][j]).removeClass("notAllowed");
						}
					}
					if (arrayEqual(specificationValueDatas[i], specificationValueSelecteds)) {
						$productSn = $productSn.text(productDatas[i].productSn);
						$price = $price.text(productDatas[i].price);
						$price1 = $price1.text(productDatas[i].price);
						$marketPrice = $marketPrice.text(productDatas[i].marketPrice);
						selectedProductId = i;
						$buyInfo.removeClass("highlight");
						if (productDatas[i].isOutOfStock) {
							$goodsButton.addClass("goodsNotifyButton");
							$goodsButton.removeClass("addCartItemButton");
						} else {
							$goodsButton.addClass("addCartItemButton");
							$goodsButton.removeClass("goodsNotifyButton");
						}
					}
				});
			});
			
			// 添加充值卡至购物车/到货通知
			$goodsButton.click(function () {
				var $this = $(this);
				if (selectedProductId != null) {
					if ($this.hasClass("addCartItemButton")) {
						$.addCartItem(selectedProductId, $quantity.val());
					} else {
						location.href = '${base}/shop/goods_notify!add.action?product.id=' + selectedProductId;
					}
				} else {
					$buyInfo.addClass("highlight");
					$tipsTitle.text('系统提示:');
					$tipsContent.text('请选择充值卡信息!');
				}
			});
			
			// 关闭购买信息提示
			$closeHighlight.click(function () {
				$buyInfo.removeClass("highlight");
				$tipsTitle.html("请选择: ");
				$tipsContent.html("<#list goods.specificationSet as specification>${specification.name} </#list>");
			});
			
			// 判断数组是否包含另一个数组中所有元素
			function arrayContains(array1, array2) {
				if(!(array1 instanceof Array) || !(array2 instanceof Array)) {
					return false;
				}
				if(array1.length < array2.length) {
					return false;
				}
				for (var i in array2) {
					if ($.inArray(array2[i], array1) == -1) {
						return false;
					}
				}
				return true;
			}
			
			// 判断两个数组中的所有元素是否相同
			function arrayEqual(array1, array2) {
				if(!(array1 instanceof Array) || !(array2 instanceof Array)) {
					return false;
				}
				if(array1.length != array2.length) {
					return false;
				}
				for (var i in array2) {
					if ($.inArray(array2[i], array1) == -1) {
						return false;
					}
				}
				return true;
			}
		<#else>
			var selectedProductId = "${goods.defaultProduct.id}";
			
			// 添加充值卡至购物车/到货通知
			$goodsButton.click(function () {
				var $this = $(this);
				if ($this.hasClass("addCartItemButton")) {
					$.addCartItem(selectedProductId, $quantity.val());
				} else {
					location.href='${base}/shop/goods_notify!add.action?product.id=' + selectedProductId;
				}
			});
		</#if>
	
	})
	</script>
	
	
	 <script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
</body>
</html>