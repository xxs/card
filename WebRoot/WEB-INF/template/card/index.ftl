<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${(setting.shopName)!}<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (setting.metaKeywords)! != ""><meta name="keywords" content="${setting.metaKeywords}" /></#if>
<#if (setting.metaDescription)! != ""><meta name="description" content="${setting.metaDescription}" /></#if>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
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
<body class="index">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="body">
		<div class="bodyLeft">
			<div class="cardsCategory">
            	<div class="top">充值卡分类</div>
            	<div class="middle">
            		<ul id="cardsCategoryMenu" class="menu">
					</ul>
            	</div>
                <div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="slider">
				<div id="sliderScrollable" class="scrollable">
					<div class="items">
						<div>
							<img src="" />
						</div>
						<div>
							<img src="" />
						</div>
						<div>
							<img src="" />
						</div>
					</div>
					<div class="navi"></div>
					<div class="prevNext">
						<a class="prev browse left"></a>
						<a class="next browse right"></a>
					</div>
				</div>
			</div>
			<div class="blank"></div>
			<div class="hotGoodsSlider">
				<div class="title">
					<strong>热卖充值卡</strong>HOT
				</div>
				<a class="prev browse"></a>
				<@cards_list type="hot" count=12; cardsList>
					<#if (cardsList?? && cardsList?size > 0)>
						<div id="hotGoodsScrollable" class="scrollable">
							<div class="items">
								<#list cardsList as cards>
									<#if cards_index + 1 == 1>
										<div>
										<ul>
									</#if>
									<li>
										<a href="${base}${cards.htmlPath}">
											<img src="${base}${cards.defaultThumbnailGoodsImagePath}" alt="${cards.name}" />
											<p title="${cards.name}">${substring(cards.name, 18, "...")}</p>
										</a>
									</li>
									<#if (cards_index + 1) % 4 == 0 || !cards_has_next || cards_index + 1 == 12>
										</ul>
										</div>
									</#if>
									<#if (cards_index + 1) % 4 == 0 && cards_has_next>
										<div>
										<ul>
									</#if>
								</#list>
							</div>
						</div>
					</#if>
				</@cards_list>
				<a class="next browse"></a>
			</div>
		</div>
		<div class="blank"></div>
		<img src="" />
		<div class="blank"></div>
		<div class="newGoods">
			<div class="left">
				<ul id="newGoodsTab" class="newGoodsTab">
				</ul>
			</div>
			<div class="right">
			</div>
		</div>
		<div class="blank"></div>
		<div class="bodyLeft">
			<@cards_list type="hot" count=10; cardsList>
				<#if (cardsList?size > 0)>
					<div class="hotGoods">
						<div class="top">热销排行</div>
						<div class="middle">
							<ul>
								<#list cardsList as cards>
									<li class="number${cards_index + 1}">
										<span class="icon">&nbsp;</span>
										<a href="${base}${cards.htmlPath}" title="${cards.name}">${substring(cards.name, 24, "...")}</a>
									</li>
								</#list>
							</ul>
						</div>
						<div class="bottom"></div>
					</div>
					<div class="blank"></div>
				</#if>
			</@cards_list>
			<@article_list type="hot" count=10; articleList>
				<#if (articleList?size > 0)>
					<div class="hotArticle">
						<div class="top">热点文章</div>
						<div class="middle">
							<ul>
								<#list articleList as article>
									<li class="number${article_index + 1}">
										<span class="icon">&nbsp;</span>
										<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 24, "...")}</a>
									</li>
								</#list>
							</ul>
						</div>
						<div class="bottom"></div>
					</div>
				</#if>
			</@article_list>
		</div>
		<div class="bodyRight">
			<@cards_list type="best" count=12; cardsList>
				<#if (cardsList?size > 0)>
					<div class="bestGoods">
						<div class="top">
							<strong>精品推荐</strong>BEST
						</div>
						<div class="middle">
							<ul>
								<#list cardsList as cards>
									<li>
										<a href="${base}${cards.htmlPath}">
											<img src="${base}${cards.defaultThumbnailGoodsImagePath}" alt="${cards.name}" />
											<p title="${cards.name}">${substring(cards.name, 18, "...")}</p>
											<p class="red">${cards.price?string(currencyFormat)}</p>
										</a>
									</li>
								</#list>
							</ul>
						</div>
						<div class="bottom"></div>
					</div>
				</#if>
			</@cards_list>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
</body>
</html>