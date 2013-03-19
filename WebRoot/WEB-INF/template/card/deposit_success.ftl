<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>成功案例<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />

<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<#include "/WEB-INF/template/card/head.ftl">
</head>
<body class="articleContent">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="column">
	<div class="column_left">
		<div class="column_left_1">
			<a href="${base}/card/member!register.action">免费注册</a>
			<a href="${base}/card/member!passwordRecover.action">找回密码</a>
			<a href="${base}/html/login.html">立刻登陆</a>
        </div>
        <ul>
			<@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a" count=6; articleList>
				<#list articleList as article>
					<li class="number${article_index + 1}">
						<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a>
					</li>
				</#list>
			</@article_list>		
        </ul>
        <div class="column_left_3">
        	<dl>
            	<span>帮助中心</span>
                <dt>
                <@article_list type="hot"  article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList>
					<#list articleList as article>
						<img src="/template/card/images/${article.title}.png" width="16" height="16" alt="${article.title}" />
					</#list>
				</@article_list>
                </dt>
                <@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList>
					<#list articleList as article>
						<dd><a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a></dd>
					</#list>
				</@article_list>
        	</dl>
        </div>
    </div>
    <div class="column_right">
   	    <div class="column_right_1"><p>您尚未登陆，请点击<a href="${base}/card/promotion.action">登陆</a>立即参与到分享二维码，推荐会员拿提成活动</div>
        <div class="column_right_2">
            <#list pager.result as deposit>
            <div class="column_right_2_shang">
            	<span> <strong>${deposit.member.username}(${deposit.member.email})</strong>
            	<p>${deposit.createDate}在名臣福利平台<#if (deposit.payment?? && deposit.payment.order??)!>
						<a href="order!view.action?id=${deposit.payment.order.id}">
								${action.getText("DepositType." + deposit.depositType)}
						</a>
						<#else>
							${action.getText("DepositType." + deposit.depositType)}
						</#if>
						<#if deposit.credit != 0>
							${deposit.credit?string(currencyFormat)}
						<#else>
							${deposit.debit?string(currencyFormat)}
						</#if>
				</p>
					
            </div>     
			</#list>
          </div>
        </div>
    </div>
</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
</body>
</html>