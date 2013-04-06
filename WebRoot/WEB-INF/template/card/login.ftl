<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员登录<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#if (article.metaKeywords)! != ""><meta name="keywords" content="${article.metaKeywords}" /></#if>
<#if (article.metaDescription)! != ""><meta name="description" content="${article.metaDescription}" /></#if>

<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<link href="${base}/template/card/css/article.css" rel="stylesheet" type="text/css" />
<#include "/WEB-INF/template/card/head.ftl">
<script type="text/javascript">
	$().ready(function() {
	
		var $loginForm = $("#loginForm");
		var $loginRedirectUrl = $("#loginRedirectUrl");
		var $memberUsername = $("#memberUsername");
		var $memberPassword = $("#memberPassword");
		var $captcha = $("#captcha");
		var $captchaImage = $("#captchaImage");
		var $submitButton = $("#submitButton");
		
		$loginRedirectUrl.val(getParameter("loginRedirectUrl"));
		
		// 刷新验证码图片
		$captchaImage.click( function() {
			$captchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
		});
	
		// 表单验证
		$loginForm.submit( function() {
			if ($.trim($memberUsername.val()) == "") {
				$.dialog({type: "warn", content: "请输入用户名!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($memberPassword.val()) == "") {
				$.dialog({type: "warn", content: "请输入密码!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($captcha.val()) == "") {
				$.dialog({type: "warn", content: "请输入验证码!", modal: true, autoCloseTime: 3000});
				return false;
			}
		});
		
		// 获取参数
		function getParameter(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) {
				return decodeURIComponent(r[2]);
			} else {
				return null;
			}
		}
	
	})
</script>
</head>
<body class="login">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="main">
		<div class="left">
			<div class="item_one">
				<a href="${base}/card/member!register.action">免费注册</a>
				<a href="${base}/card/member!passwordRecover.action">找回密码</a>
				<a href="${base}/html/login.html">立刻登陆</a>
	        </div>
			<div class="item_two">
		        <ul>
					<@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a" count=4; articleList>
						<#list articleList as article>
							<li >
								<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a>
							</li>
						</#list>
					</@article_list>		
		        </ul>
	        </div>
	        <div class="item_three">
	        	<dl>
	            	<span>帮助中心</span>
	               	<dt><@article_list type="hot"  article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList><#list articleList as article><img src="/template/card/images/${article.title}.png" width="16" height="16" alt="${article.title}" /></#list></@article_list></dt>
	                <@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList>
						<#list articleList as article>
							<dd><a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a></dd>
						</#list>
					</@article_list>
	        	</dl>
	        </div>
	    </div>
    <div class="right">
   	    <div class="item_one">
			<p><img src="/template/card/images/hhh.jpg" width="38" height="37" alt="jj" /></p>
   	    		马上登陆，登陆后进入会员中心寄售点卡供货！
   		</div>
        <div class="item_two">
        	<div class="item_two_top">
            	<span>
                <font>立刻登陆</font>
                </span>
            </div>     
	       	<form id="loginForm" action="${base}/card/member!login.action" method="post">
				<input type="hidden" id="loginRedirectUrl" name="loginRedirectUrl" />
		        <ol id="need">
					<li>
						<label class="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账&nbsp;&nbsp;号：</label> 
						<input type="text" id="memberUsername" name="member.username" class="formText" />
						<dfn>注册时填写的用户名</dfn>
					</li>
					<li>
						<label class="new_password">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;码：</label> 
						<input type="password" id="memberPassword" name="member.password" class="formText" />
						<dfn>您的登录密码</dfn>
					</li>
					<li>
						<div class="ssh3"><label class="email">&nbsp;&nbsp;&nbsp;&nbsp;验证码：</label></div>
						<div class="ssh"><input type="text" id="captcha" name="j_captcha" maxlength="4" class="formText captcha" style="width:90px"/></div>
						<div class="ssh1"><img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" /></div>
						<dfn>输入图片中的验证码</dfn>
					</li>
				</ol>
		 		<div class="anniu">
		 			<input type="submit" value="登 录" class="button"/><input type="reset" value="重新填写" class="button" style="margin-left:30px;" />
		 		</div>
	         </form>
         </div>
        </div>
        <div class="blank"></div>
    </div>
	<#include "/WEB-INF/template/card/article_footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
</body>
</html>
