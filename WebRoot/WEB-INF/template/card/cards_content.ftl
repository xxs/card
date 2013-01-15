<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (cards.metaKeywords)! != ""><meta name="keywords" content="${cards.metaKeywords}" /></#if>
<#if (cards.metaDescription)! != ""><meta name="description" content="${cards.metaDescription}" /></#if>
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body id="cardsContent" class="cardsContent">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_cards.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">${substring(cards.name, 50, "...")}</div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="memberCenter">
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
			</div>
		</div>
	</div>
	</div>
<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>