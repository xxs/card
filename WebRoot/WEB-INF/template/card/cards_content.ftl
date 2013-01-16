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
			<div class="tab">
			<div class="tab_menu">
			  	<ul>
					<li class="selected">单张消耗</li>
					<li style="border-right:1px solid #e1e2e2;">批量消耗</li>
			  	</ul>
				</div>
				<div class="tab_box"> 
	 			  <div class="tab_box_1">
	 			  	<div class="memberCenter">
					<form action="order!save.action" method="post">
					<table class="tabTable">
						<tr>
							<th>充值卡编号: </th>
							<td>
								${cards.cardsSn}
							</td>
						</tr>
						<#if cards.isSpecificationEnabled>
							<#assign specificationValueSet = cards.specificationValueSet>
							<#list cards.specificationSet as specification>
									<tr class="text">
										<th>${specification.name}:</th>
										<td>
											<ul id="buyInfo">
												<#list cards.productSet as product>
													<input type="radio" name="productId" value="${product.id}" <#if cards.defaultProduct.productSn != product.productSn >selected="selected"</#if> />&nbsp;${product.price}元
												</#list>
											</ul>
										</td>
									</tr>
							</#list>
						</#if>
						<tr>
							<th>确认金额:</th>
							<td>
								<span id="price1" class="red">${cards.price?string(currencyFormat)}</span>
							</td>
						</tr>
						<tr>
							<th>卡号:</th>
							<td>
								<input type="text" name="cardNum" />
								
							</td>
						</tr>
						<tr>
							<th>密码:</th>
							<td>
								<input type="text" name="cardPwd"/>
								
							</td>
						</tr>
						<tr>
							<th>支付通道:</th>
							<td>
								<#list allPaymentConfigList as paymentConfig>
									<input type="radio" name="paymentConfig.id" value="${paymentConfig.id}"/>&nbsp;${paymentConfig.name}
								</#list>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" class="red_button" value="生成订单" />
							</td>
						</tr>
					</table>
				</form>
				</div>
				</div>
		 			<div class="hide">
				 	<div class="memberCenter">
					<form action="order!batch.action" method="post">
					<table class="tabTable">
						<tr>
							<th>充值卡编号: </th>
							<td>
								${cards.cardsSn}
							</td>
						</tr>
						<#if cards.isSpecificationEnabled>
							<#assign specificationValueSet = cards.specificationValueSet>
							<#list cards.specificationSet as specification>
									<tr class="text">
										<th>${specification.name}:</th>
										<td>
											<ul id="buyInfo">
												<#list cards.productSet as product>
													<input type="radio" name="productId" value="${product.id}"/>&nbsp;${product.price}元
												</#list>
											</ul>
										</td>
									</tr>
							</#list>
						</#if>
						<tr>
							<th>确认金额:</th>
							<td>
								<span id="resultPrice" class="red">${cards.price?string(currencyFormat)}</span>
							</td>
						</tr>
						<tr>
							
						</tr>
							<th>卡密组合:</th>
							<td>
								<p>输入格式如:xxxxx(账号)xxxxx,xxxxxx(密码)xxxx</p>
								<textarea cols="60" rows="10" name="cardString"></textarea>
							</td>
						<tr>
							<th>支付通道:</th>
							<td>
								<#list allPaymentConfigList as paymentConfig>
									<input type="radio" name="paymentConfig.id" value="${paymentConfig.id}"/>&nbsp;${paymentConfig.name}
								</#list>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="submit" class="red_button" value="生成订单" />
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
		</div>
	</div>
	</div>
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript">
		$().ready( function() {
			var $refOrder = $(".refOrder");
			alter("qqq");
			$refOrder.click( function() {
				alert("qqq");
				var $this = $(this);
				var orderId = $this.attr("orderId");
				$.ajax({url: "/card/order!query.action",
						data: {id: orderId},
						type: "POST",
						dataType: "json",
						cache: false,
						success: function(data) {
							$.message({type: data.status, content: data.message});
							//$this.parent().parent().remove();
						}
					});
				}
				return false;
			});
		});
	</script>
	<script type="text/javascript" >
	//<![CDATA[
		$(function(){
		    var $div_li =$("div.tab_menu ul li");
		    $div_li.click(function(){//要点击切换这click
				$(this).addClass("selected")            //当前<li>元素高亮
					   .siblings().removeClass("selected");  //去掉其它同辈<li>元素的高亮
	            var index =  $div_li.index(this);  // 获取当前点击的<li>元素 在 全部li元素中的索引。
				$("div.tab_box > div")   	//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
						.eq(index).show()   //显示 <li>元素对应的<div>元素
						.siblings().hide(); //隐藏其它几个同辈的<div>元素
			}).hover(function(){
				$(this).addClass("hover");
			},function(){
				$(this).removeClass("hover");
			})
		})
	//]]>
	</script>
</body>
</html>