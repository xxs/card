<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${articleCategory.name} 文章列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (articleCategory.metaKeywords)! != ""><meta name="keywords" content="${articleCategory.metaKeywords}" /></#if>
<#if (articleCategory.metaDescription)! != ""><meta name="description" content="${articleCategory.metaDescription}" /></#if>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/shop/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/shop.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/shop/head.ftl">
</head>
<body class="articleList">
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
   
	  <!-- START tabs_type_1 -->  
      <dl class="tabs_type_1">
      
						<#list pager.result as article>
							<dt <#if article.title == '联系我们'>class="current" </#if> >${substring(article.title, 40, "...")}</dt>
							<dd <#if article.title == '联系我们'>class="current" </#if> >
					            <p>${article.contentText}</p>
					            <p>作者: <#if article.author == "">未知<#else>${article.author}</#if> 发布日期：${article.createDate}</p>
					        </dd>
                		</#list>
      </dl>
      <!-- END tabs_type_1 --> 
   </div>
   <!-- END main-wrap -->   
</section>
<!-- END content-container -->
	<#include "/WEB-INF/template/shop/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/shop.js"></script>
	<script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
</body>
</html>