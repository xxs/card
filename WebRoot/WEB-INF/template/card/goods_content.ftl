<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${cards.name}<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (cards.metaKeywords)! != ""><meta name="keywords" content="${cards.metaKeywords}" /></#if>
<#if (cards.metaDescription)! != ""><meta name="description" content="${cards.metaDescription}" /></#if>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/common/css/jquery.zoomimage.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/card.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
</head>
<body id="cardsContent" class="cardsContent">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="body">
		<div class="bodyLeft">
			<div class="cardsCategory">
            	<div class="top">充值卡分类</div>
            	<div class="middle">
            		<ul id="cardsCategoryMenu" class="menu">
            			<@cards_category_tree; cardsCategoryTree>
	            			<#list cardsCategoryTree as firstCardsCategory>
	            				<li class="mainCategory">
									<a href="${base}${firstCardsCategory.url}">${firstCardsCategory.name}</a>
								</li>
								<#if (firstCardsCategory.children?? && firstCardsCategory.children?size > 0)>
									<#list firstCardsCategory.children as secondCardsCategory>
										<li>
											<a href="${base}${secondCardsCategory.url}">
												<span class="icon">&nbsp;</span>${secondCardsCategory.name}
											</a>
										</li>
										<#if secondCardsCategory_index + 1 == 5>
											<#break />
										</#if>
									</#list>
								</#if>
								<#if firstCardsCategory_index + 1 == 3>
									<#break />
								</#if>
	            			</#list>
	            		</@cards_category_tree>
					</ul>
            	</div>
                <div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="hotCards">
				<div class="top">热销排行</div>
				<div class="middle">
					<ul>
						<@cards_list cards_category_id=cards.cardsCategory.id type="hot" count=10; cardsList>
							<#list cardsList as cards>
								<li class="number${cards_index + 1}">
									<span class="icon">&nbsp;</span>
									<a href="${base}${cards.htmlPath}" title="${cards.name}">${substring(cards.name, 24, "...")}</a>
								</li>
							</#list>
						</@cards_list>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div id="cardsHistory" class="cardsHistory">
				<div class="top">浏览记录</div>
				<div class="middle">
					<ul id="cardsHistoryListDetail"></ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="listBar">
				<div class="left"></div>
				<div class="middle">
					<div class="path">
						<a href="${base}/" class="shop"><span class="icon">&nbsp;</span>首页</a> &gt;
						<#list pathList as path>
							<a href="${base}${path.url}">${path.name}</a> &gt;
						</#list>
					</div>
				</div>
				<div class="right"></div>
			</div>
			<div class="blank"></div>
			<div class="cardsTop">
				<div class="cardsTopLeft">
					<div class="cardsImage">
						<#if cards.cardsImageList??>
		                	<#list cards.cardsImageList as cardsImage>
		                		<a href="${base}${cardsImage.bigImagePath}" class="tabContent zoom<#if (cardsImage_index > 0)> nonFirst</#if>">
									<img src="${base}${cardsImage.smallImagePath}" alt="点击放大" />
								</a>
							</#list>
						<#else>
	            			<a href="${base}${setting.defaultBigCardsImagePath}" class="zoom">
								<img src="${base}${setting.defaultSmallCardsImagePath}" alt="点击放大" />
							</a>
	                	</#if>
                	</div>
					<div class="thumbnailCardsImage">
						<a class="prev browse" href="javascript: void(0);" hidefocus></a>
						<div id="thumbnailCardsImageScrollable" class="scrollable">
							<ul id="cardsImageTab" class="items cardsImageTab">
								<#if cards.cardsImageList??>
									<#list cards.cardsImageList as cardsImage>
										<li><img src="${base}${cardsImage.thumbnailImagePath}" alt="${cardsImage.description}" /></li>
									</#list>
								<#else>
									<li><img src="${base}${setting.defaultThumbnailCardsImagePath}" /></li>
	                        	</#if>
							</ul>
						</div>
						<a class="next browse" href="javascript: void(0);" hidefocus></a>
					</div>
				</div>
				<form action="order!saveCard.action" method="post">
				<div class="cardsTopRight">
					<h1 class="title">${substring(cards.name, 50, "...")}</h1>
					<ul class="cardsAttribute">
						<li>充值卡编号: ${cards.cardsSn}</li>
						<li>货品编号: <span id="productSn">${cards.defaultProduct.productSn}</span><input type="text" name="productId" value="${cards.defaultProduct.id}" /></li>
						<#list (cards.cardsType.cardsAttributeSet)! as cardsAttribute>
							<#if cards.getCardsAttributeValue(cardsAttribute)?? && cards.getCardsAttributeValue(cardsAttribute) != "">
	                    		<li>${cardsAttribute.name}: ${substring(cards.getCardsAttributeValue(cardsAttribute), 26)}</li>
							</#if>
						</#list>
					</ul>
					<div class="blank"></div>
					<div class="cardsPrice">
						<div class="left"></div>
						<div class="right">
							<div class="top">
								销 售 价:
								<span id="price" class="price">${cards.price?string(currencyFormat)}</span>
							</div>
							<div class="bottom">
								市 场 价:
								<#if setting.isShowMarketPrice>
									<span id="marketPrice" class="marketPrice">${cards.marketPrice?string(currencyFormat)}</span>
								<#else>
									-
								</#if>
							</div>
						</div>
					</div>
					<div class="blank"></div>
					
					<table id="buyInfo" class="buyInfo">
						<#if cards.isSpecificationEnabled>
							<#assign specificationValueSet = cards.specificationValueSet>
							<tr class="specificationTips">
								<th id="tipsTitle">请选择:</th>
								<td>
									<div id="tipsContent" class="tipsContent">
										<#list cards.specificationSet as specification>
											${specification.name} 
										</#list>
									</div>
									<div id="closeHighlight" class="closeHighlight" title="关闭"></div>
								</td>
							</tr>
							<#list cards.specificationSet as specification>
								<#if specification.specificationType == "text">
									<tr class="text">
										<th>${specification.name}:</th>
										<td>
											<ul>
												<#list specification.specificationValueList as specificationValue>
													<#if specificationValueSet.contains(specificationValue)>
														<li class="${specificationValue.id}" title="${specificationValue.name}" specificationValueId="${specificationValue.id}">
															${specificationValue.name}qq
															<span title="点击取消选择"></span>
														</li>
													</#if>
												</#list>
											</ul>
										</td>
									</tr>
								<#else>
									<tr class="image">
										<th>${specification.name}:</th>
										<td>
											<ul>
												<#list specification.specificationValueList as specificationValue>
													<#if specificationValueSet.contains(specificationValue)>
														<li class="${specificationValue.id}" title="${specificationValue.name}" specificationValueId="${specificationValue.id}">
															<#if specificationValue.imagePath??>
																<img src="${base}${specificationValue.imagePath}" alt="${specificationValue.name}" />
															<#else>
																<img src="${base}/template/card/images/default_specification.gif" />
															</#if>
															<span title="点击取消选择"></span>
														</li>
													</#if>
												</#list>
											</ul>
										</td>
									</tr>
								</#if>
							</#list>
						</#if>
						<tr>
							<th>购买数量:</th>
							<td>
								<input type="text" id="quantity" value="1" />
								<#if setting.scoreType == "cardsSet" && cards.score != 0>
									&nbsp;&nbsp;( 所得积分: ${cards.score} )
								</#if>
							</td>
						</tr>
						<tr>
							<th>确认金额:</th>
							<td>
								<span id="price1" class="price">${cards.price?string(currencyFormat)}</span>
							</td>
						</tr>
						<tr>
							<th>支付方式:</th>
							<td>
								<input type="radio" name="222" />单张支付
								<input type="radio" name="222" />多张支付
							</td>
						</tr>
						<tr>
							<th>卡号组合:</th>
							<td>
								<input type="text"  />
								
							</td>
						</tr>
						<tr>
							<th>密码组合:</th>
							<td>
								<input type="text" />
								
							</td>
						</tr>
						<tr>
							<th>支付途径:</th>
							<td>
								<input type="radio" name="444" />易宝支付<input type="text" name="paymentConfig.id" value="4028bc743ab4e741013ab538ee9c0006" />
								<input type="radio" name="444" />拉卡支付
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" value="生成订单" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<#if !cards.isSpecificationEnabled && cards.isOutOfStock>
									<input type="button" id="cardsButton" class="cardsNotifyButton" value="" hidefocus />
								<#else>
									<input type="button" id="cardsButton" class="addCartItemButton" value="" hidefocus />
								</#if>
								 
								 <input type="button" id="addFavorite" class="addFavoriteButton" cardsId="${cards.id}" hidefocus />
							</td>
						</tr>
					</table>
					</form>
				</div>
			</div>
			<div class="blank"></div>
			<div class="cardsBottom">
				<ul id="cardsParameterTab" class="cardsParameterTab">
					<li>
						<a href="javascript: void(0);" class="current" hidefocus>充值卡介绍</a>
					</li>
					<li>
						<a href="javascript: void(0);" name="cardsAttribute" hidefocus>充值卡参数</a>
					</li>
					<#if setting.isCommentEnabled>
						<li>
							<a href="javascript: void(0);" hidefocus>充值卡评论</a>
						</li>
					</#if>
				</ul>
				<div class="tabContent cardsIntroduction">
					${cards.introduction}
				</div>
				<div class="tabContent cardsAttribute">
					<table class="cardsParameterTable">
						<#list (cards.cardsType.cardsParameterList)! as cardsParameter>
							<#if cards.cardsParameterValueMap.get(cardsParameter.id)?? && cards.cardsParameterValueMap.get(cardsParameter.id) != "">
								<tr>
									<th>
										${cardsParameter.name}
									</th>
									<td>
										${(cards.cardsParameterValueMap.get(cardsParameter.id))!}
									</td>
								</tr>
							</#if>
						</#list>
					</table>
				</div>
				<#if setting.isCommentEnabled>
					<div id="comment" class="tabContent comment">
						<@comment_list cards_id=cards.id count=5; commentList>
							<#list commentList as comment>
								<#assign isHasComment = true />
								<div class="commentItem" id="commentItem${comment.id}">
									<p><span class="red">${(comment.username)!"游客"}</span> ${comment.createDate?string("yyyy-MM-dd HH: mm")} <a href="#commentForm" class="commentReply" forCommentId="${comment.id}">[回复此评论]</a></p>
									<p><pre>${comment.content}</pre></p>
									<#list comment.replyCommentSet as replyComment>
										<#if replyComment.isShow>
											<div class="reply">
												<p><span class="red"><#if replyComment.isAdminReply>管理员<#else>${(replyComment.username)!"游客"}</#if></span> ${replyComment.createDate?string("yyyy-MM-dd HH: mm")}</p>
												<p><pre>${replyComment.content}</pre></p>
											</div>
										</#if>
									</#list>
								</div>
								<#if comment_has_next>
									<div class="blank"></div>
								</#if>
							</#list>
							<#if (commentList?size > 0)>
								<div class="info">
									<a href="${base}/card/comment_list/${cards.id}.htm">查看所有评论&gt;&gt;</a>
								</div>
							</#if>
						</@comment_list>
						<form id="commentForm" name="commentForm" method="post">
							<input type="hidden" name="comment.cards.id" value="${cards.id}" />
							<input type="hidden" id="forCommentId" name="forCommentId" />
							<table class="sendTable">
								<tr class="title">
									<td width="100">
										<span id="sendTitle">发表评论</span>
									</td>
									<td>
										<a href="javascript: void(0);" id="sendComment" class="sendComment">切换到发表新评论&gt;&gt;</a>
									</td>
								</tr>
								<tr>
									<th>
										评论内容: 
									</th>
									<td>
										<textarea id="commentContent" name="comment.content" class="formTextarea"></textarea>
									</td>
								</tr>
								<tr>
									<th>
										联系方式: 
									</th>
									<td>
										<input type="text" name="comment.contact" class="formText" />
									</td>
								</tr>
								<#if setting.isCommentCaptchaEnabled>
									<tr>
					                	<th>
					                		验证码: 
					                	</th>
					                    <td>
					                    	<input type="text" id="commentCaptcha" name="j_captcha" class="formText captcha" />
					                    	<img id="commentCaptchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" />
					                    </td>
					                </tr>
				                </#if>
								<tr>
									<th>
										&nbsp;
									</th>
									<td>
										<input type="submit" class="formButton" value="提交评论" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</#if>
			</div>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.zoomimage.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
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
		$cardsButton = $("#cardsButton");
	
		// 添加充值卡浏览记录
		$.addCardsHistory("${substring(cards.name, 24, "...")}", "${base}${cards.htmlPath}");
		
		<#if cards.isSpecificationEnabled>
			var productDatas = {};
			<#list cards.productSet as product>
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
			<#list cards.productSet as product>
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
					$tipsContent.text("<#list cards.specificationSet as specification>${specification.name} </#list>");
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
							$cardsButton.addClass("cardsNotifyButton");
							$cardsButton.removeClass("addCartItemButton");
						} else {
							$cardsButton.addClass("addCartItemButton");
							$cardsButton.removeClass("cardsNotifyButton");
						}
					}
				});
			});
			
			// 添加充值卡至购物车/到货通知
			$cardsButton.click(function () {
				var $this = $(this);
				if (selectedProductId != null) {
					if ($this.hasClass("addCartItemButton")) {
						$.addCartItem(selectedProductId, $quantity.val());
					} else {
						location.href = '${base}/card/cards_notify!add.action?product.id=' + selectedProductId;
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
				$tipsContent.html("<#list cards.specificationSet as specification>${specification.name} </#list>");
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
			var selectedProductId = "${cards.defaultProduct.id}";
			
			// 添加充值卡至购物车/到货通知
			$cardsButton.click(function () {
				var $this = $(this);
				if ($this.hasClass("addCartItemButton")) {
					$.addCartItem(selectedProductId, $quantity.val());
				} else {
					location.href='${base}/card/cards_notify!add.action?product.id=' + selectedProductId;
				}
			});
		</#if>
	
	})
	</script>
</body>
</html>