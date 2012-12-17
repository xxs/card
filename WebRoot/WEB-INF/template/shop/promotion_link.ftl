<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>推广链接<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/shop/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/shop/css/shop.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/base.js"></script>
<script type="text/javascript" src="${base}/template/shop/js/shop.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/shop/member_head.ftl">
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/shop/member_header.ftl">
		<section id="content-container" class="clearfix">
         <div id="main-wrap" class="clearfix">
            <#include "/WEB-INF/template/shop/member_left_info.ftl">
            <div class="page_content_right sub-content">
                 <!-- START tabs_type_2 --> 
		         <dl class="tabs_type_2">
		            <dt class="current">修改密码</dt>
		            <dd class="current">
		               <p>推广链接：<input type="text" class="formText" value="http://127.0.0.1:8080/shop/member!memberreg.action?id=${member.id}"/></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="small green button" value="推广" /></p>
		            </dd>
		         </dl>
		         <!-- END tabs_type_2 --> 
            </div>
            <!-- END of page_content-->
         </div>
         <!-- END main-wrap -->
      </section>
	<#include "/WEB-INF/template/shop/footer.ftl">
	<script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
</body>
</html>