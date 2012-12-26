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
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body>
	<#include "/WEB-INF/template/card/member_header.ftl">
    <#include "/WEB-INF/template/card/member_left_cards.ftl">
    <!--------------------------------右边内容-------------------------------------->

<div class="right">
<div class="title">
<span style="border-bottom:solid 1px #ddd; height:38px; "><b style=" font-size:14px; display:block; padding-left:30px; background:url(images/2_img1.jpg) no-repeat left center;"> 腾讯一卡通 </b><p> <a href="#">(设为首选)</a></p>
</span>
<span style="padding-top:10px;"><a href="#">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </a></span>
<span>卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。 </span><span>
<input name="Input" type="image" src="images/2_qq.jpg" />
</span></div>
<!--------------------------------提交框------------------------------------->
<div class="box1">
<span class="title1" style=" border-right:none;">单张提交</span>
<span class="title1" style="background:#f8f8f8;">批量提交</span>
<div class="box0">
<span class="line"></span>
<div class="box0_left">
<form method="post" action="/card/order!save.action">
<#if cards.isSpecificationEnabled>
						<#assign specificationValueSet = cards.specificationValueSet>
			               <#list cards.specificationSet as specification>
									<#if specification.specificationType == "text">
										<span><b>${specification.name}:</b>
											<div class="money">
													<#list specification.specificationValueList as specificationValue>
														<#if specificationValueSet.contains(specificationValue)>
															<p><input type="radio" name="1"/>${specificationValue.name}</p>
														</#if>
													</#list>
											</div>
										</span>		
									</#if>
								</#list>
						</#if>
<span>
<b>确认面额：</b>
<div class="money" style="padding-top:20px; color:#ff0000;">100元</div>
</span>
<span>
<b>支付通道：</b>
	<div class="money">
		<@paymentDiscount_list brandId="${cards.brand.id}"; paymentDiscountList>
			<#list paymentDiscountList as paymentDiscount>
				<p><input type="radio" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" <#if paymentDiscount.paymentConfig.isEnabled!=true >disabled</#if> <#if paymentDiscount.paymentConfig.isDefault>checked="checked"</#if> />通道${paymentDiscount_index+1} (折扣率：${paymentDiscount.discount} <#if paymentDiscount.paymentConfig.isDefault><span style="color:red;">推荐</span></#if>)</p>
			</#list>
		</@paymentDiscount_list>
	</div>
</span>
<div class="search">
<div class="search_l">卡号</div>
<div class="search_r">
    <input name="cardNum" type="text" class="ID"  />
</div><span class="yhm">用户名不能为空</span>
</div>
<div class="search">
<div class="search_l">卡密</div>
<div class="search_r"><input type="cardPwd" name="cardPwd" class="ID" />
</div>
<span class="yhm">密码不能为空</span>
</div>
</div>
<!--------------------------------按钮------------------------------------->
<div class="btn1">
<span><input name="" type="image" src="images/2_btn1.jpg" /></span><input type="submit" value="提交" />
<!--<span><input name="" type="image" src="images/确认提交2.jpg" /></span>-->
<span><input name="" type="image" src="images/2_btn2.jpg" /></a></span></div>

</div>
<div class="box0_right">
<span>1、如果确定卡号、卡密、卡面额输入正确，单系统提示错误，请重新输入提交一次；</span>
<span>1、如果确定卡号、卡密、卡面额输入正确，单系统提示错误，请重新输入提交一次；</span>
<span>1、如果确定卡号、卡密、卡面额输入正确，单系统提示错误，请重新输入提交一次；</span>

</div>

</div>
   </form>
</div>

<!-------------------------------订单------------------------------------->
<div class="box2">
<div class="title2">最近8条订单</div>
<div class="box00">
<div class="line"></div>
<span>提示：订单如果还在处理中可以点击刷新按钮查看最新订单状态<b><input name="" type="image" src="images/2_btn3.jpg" /></b></span>
<div class="span">
<ul>
<li>通道类型</li>
<li>卡号</li>
<li>提交金额</li>
<li>成功金额</li>
<li>状态</li>
<li>说明</li>
<li style="border-right: solid 1px #ddd;">操作</li>
</ul>

<ul >
<li class="ul222">通道类型</li>
<li class="ul222">卡号</li>
<li class="ul222">提交金额</li>
<li class="ul222">成功金额</li>
<li class="ul222">状态</li>
<li class="ul222">说明</li>
<li class="ul222" style="border-right: solid 1px #ddd;">操作</li>
</ul>
<span>－_－^..暂无订单记录</span>

</div>


</div>

</div>

</div>
</div>  
      <!-- END content-container -->
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
</body>
</html>