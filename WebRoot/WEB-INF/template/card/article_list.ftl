<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${articleCategory.name} 文章列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (articleCategory.metaKeywords)! != ""><meta name="keywords" content="${articleCategory.metaKeywords}" /></#if>
<#if (articleCategory.metaDescription)! != ""><meta name="description" content="${articleCategory.metaDescription}" /></#if>
<#include "/WEB-INF/template/card/head.ftl">
</head>
<body class="articleList">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="column">
	<div class="column_left">
    	<div class="column_left_1">
    		<@article_list article_category_id=articleCategory.id type="recommend" count=10; articleList>
				<#list articleList as article>
					<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 24, "...")}</a>
				</#list>
			</@article_list>	
    	</div>
        <ul>
        	<li><a href="#">快捷支付</a></li>
            <li><a href="#">安全中心</a></li>
            <li style=" text-align:left; padding-left:19px;width:66px;"><a href="#">微支付</a></li>
            <li><a href="#">境外支付</a></li>
            <li><a href="#">刷卡支付</a></li>
            <li><a href="#">境外支付</a></li>
        </ul>
        <div class="column_left_3">
        	<dl>
            	<span>我的应用（6）</span>
                <dt>
                <img src="images/saaaa/a1.jpg" width="16" height="16" alt="s" />
                <img src="images/saaaa/a2.jpg" width="16" height="16" alt="s" /> 
                <img src="images/saaaa/a3.jpg" width="16" height="16" alt="s" /> 
                <img src="images/saaaa/a4.jpg" width="16" height="16" alt="s" /> 
                <img src="images/saaaa/a5.jpg" width="16" height="16" alt="s" /> 
                <img src="images/saaaa/a6.jpg" width="16" height="16" alt="s" />
                </dt>
                <dd><a href="#">手机充值</a></dd>
                <dd><a href="#">信用卡还贷</a></dd>
                <dd><a href="#">彩票卖场</a></dd>
                <dd><a href="#">水电煤缴费</a></dd>
                <dd><a href="#">游戏充值</a></dd>
                <dd><a href="#">彩贝导航</a></dd>
                <p style="background:url(images/saaaa/a7.jpg) no-repeat;"><a href="#">添加</a></p>     
                <p  style="background:url(images/saaaa/a8.jpg) no-repeat;"><a href="#">管理</a></p>
        	</dl>
        </div>
    </div>
    <div class="column_right">
   	    <div class="column_right_1"><p><img src="images/hhh.jpg" width="38" height="37" alt="jj" /></p>您的QQ帐号尚未激活，激活后才能使用财付通的更多支付功能</div>
        <div class="column_right_2">
        	<div class="column_right_2_shang">
            	<span>
                <strong>QQ号码激活</strong>
                <b><a href="#"><img src="images/saaaa/sa1.jpg" width="110" height="30" alt="s" /></a></b>
                <p>QQ号码直接激活，满足名臣福利基本功能</p>
                </span>
            </div>     
   	    <div class="column_right_2_xia">
	  <div class="ddd">
            	<div class="column_right_ooo1">
                	<strong>银行卡快捷激活</strong> 
                    <b><a href="#"><img src="images/saaaa/sa1.jpg" width="110" height="30" alt="s" /></a></b>
                    <img src="images/saaaa/sa5.jpg" width="176" height="26" alt="sa" /> 规则<a href="#"><img src="images/saaaa/a99.jpg" width="10" height="26" alt="s" /></a>  
				</div>
                </div>
                <div class="column_right_ooo2">
                	<a href="#"><strong style="color:#e10911; font-size:16px;">1</strong>注册后即开通网上支付功能</a>
                    <a href="#"><strong style="color:#e10911; font-size:16px;"> 2</strong>支付密码+短信验证双重保障</a>
                	<a href="#"><strong style="color:#e10911; font-size:16px;">3</strong>9折起购买腾讯服务</a>
                </div>
          </div>
        </div>
    </div>
</div>
	<div class="body">
		<div class="bodyLeft">
			<div class="recommendArticle">
				<div class="top">推荐文章</div>
				<div class="middle">
					<ul>
						<@article_list article_category_id=articleCategory.id type="recommend" count=10; articleList>
							<#list articleList as article>
								<li>
									<span class="icon">&nbsp;</span>
									<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 24, "...")}</a>
								</li>
							</#list>
						</@article_list>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="hotArticle">
				<div class="top">热点文章</div>
				<div class="middle">
					<ul>
						<@article_list article_category_id=articleCategory.id type="hot" count=10; articleList>
							<#list articleList as article>
								<li class="number${article_index + 1}">
									<span class="icon">&nbsp;</span>
									<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 24, "...")}</a>
								</li>
							</#list>
						</@article_list>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="listBar">
				<div class="left"></div>
				<div class="middle">
					<div class="path">
						<a href="${base}/" class="home"><span class="icon">&nbsp;</span>首页</a> &gt;
						<#list pathList as path>
							<a href="${base}${path.url}">${path.name}</a> &gt;
						</#list>
					</div>
					<div id="articleSearch" class="articleSearch">
						<form id="articleSearchForm" action="${base}/card/article!search.action" method="post">
							<input type="text" name="pager.keyword" id="articleSearchKeyword" class="keyword" value="请输入关键词..." />
							<input type="submit" class="searchButton" value="" />
						</form>
					</div>
				</div>
				<div class="right"></div>
			</div>
			<div class="blank"></div>
			<div class="articleList">
				<div class="articleListTop"></div>
				<div class="articleListMiddle">
					<ul class="articleListDetail">
						<#list pager.result as article>
                			<li>
                            	<a href="${base}${article.htmlPath}" class="title">
									${substring(article.title, 40, "...")}
								</a>
                                <span class="author">
                                	作者: <#if article.author == "">未知<#else>${article.author}</#if>
                                </span>
                                <span class="createDate">
                                	${article.createDate}
                                </span>
                                <div class="contentText">
									${substring(article.contentText, 200, "...")}
									<a href="${base}${article.htmlPath}">[阅读全文]</a>
								</div>
      		        		</li>
                		</#list>
					</ul>
					<div class="blank"></div>
					<@pagination pager=pager baseUrl=articleCategory.url>
         				<#include "/WEB-INF/template/card/pager.ftl">
         			</@pagination>
				</div>
				<div class="articleListBottom"></div>
			</div>
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