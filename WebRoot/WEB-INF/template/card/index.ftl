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
<link href="${base}/template/card/css/style.css" rel="stylesheet" type="text/css" />

	<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
	<![endif]-->
	<script type="text/javascript">
	$(function(){
		$("body").Sonline({
			Position:"right",//left或right
			Top:200,//顶部距离，默认200px
			Effect:false, //滚动或者固定两种方式，布尔值：true或false
			DefaultsOpen:false, //默认展开：true,默认收缩：false
			Qqlist:"734074125|xxs,435027|客服02,435027|客服03,435027|客服04,435027|客服05" //多个QQ用','隔开，QQ和客服名用'|'隔开
		});
	})	
	</script>
	<script type="text/javascript" >
	//<![CDATA[
		$(function(){
		    var $div_li =$("div.tab_menu ul li");
		    $div_li.mouseover(function(){//要点击切换这click
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
		
</head>
<body>
	<#include "/WEB-INF/template/card/header.ftl">
	<div id="warp">
	<!--内容区-->
	<div class="content_line">
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/card/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/jquery.Sonline.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
</body>
</html>