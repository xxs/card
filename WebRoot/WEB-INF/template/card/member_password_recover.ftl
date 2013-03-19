<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>密码找回<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<script type="text/javascript">
	$().ready(function() {
	
		var $passwordRecoverForm = $("#passwordRecoverForm");
		var $memberUsername = $("#memberUsername");
		var $memberEmail = $("#memberEmail");
		
		var $memberSafeQuestionTr = $("#memberSafeQuestionTr");
		var $memberSafeQuestion = $("#memberSafeQuestion");
		var $memberSafeAnswerTr = $("#memberSafeAnswerTr");
		var $memberSafeAnswer = $("#memberSafeAnswer");
		var $submitButton = $("#submitButton");
		var $status = $("#status");
	
		$memberSafeQuestionTr.hide();
		$memberSafeAnswerTr.hide();
		
		$passwordRecoverForm.submit( function() {
			if ($.trim($memberUsername.val()) == "") {
				$.dialog({type: "warn", content: "请输入用户名!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($memberEmail.val()) == "") {
				$.dialog({type: "warn", content: "请输入E-mail!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if (!/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test($memberEmail.val())) {
				$.dialog({type: "warn", content: "E-mail格式错误!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($memberSafeAnswer.attr("disabled") == false && $.trim($memberSafeAnswer.val()) == "") {
				$.dialog({type: "warn", content: "请输入密码保护答案!", modal: true, autoCloseTime: 3000});
				return false;
			}
			
			$.ajax({
				url: "member!ajaxSendPasswordRecoverMail.action",
				data: $passwordRecoverForm.serialize(),
				type: "POST",
				dataType: "json",
				cache: false,
				beforeSend: function(data) {
					$status.html('<span class="loadingIcon">&nbsp;</span>正在检测密码保护状态,请稍后...');
					$submitButton.attr("disabled", true);
				},
				success: function(data) {
					if (data.status == "warn") {
						$memberSafeQuestion.text(data.safeQuestion);
						$memberSafeQuestionTr.show();
						$memberSafeAnswer.attr("disabled", false);
						$memberSafeAnswerTr.show();
						$status.text(data.message);
					} else if (data.status == "success") {
						$memberUsername.val("");
						$memberSafeAnswer.val("");
						$memberEmail.val("");
						$memberSafeQuestionTr.hide();
						$memberSafeAnswer.attr("disabled", true);
						$memberSafeAnswerTr.hide();
						$status.text(data.message);
						$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
					} else {
						$status.text(data.message);
						$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
					}
					$submitButton.attr("disabled", false);
				}
			});
			return false;
		});
		
		$memberUsername.change( function() {
			$memberSafeAnswer.val("");
			$memberSafeQuestionTr.hide();
			$memberSafeAnswer.attr("disabled", true);
			$memberSafeAnswerTr.hide();
			$status.text("");
		});
	
	})
</script>
<style type="text/css">
<!--
.center {
	width: 960px;
	line-height: 18px;
	margin:20px auto 0 auto;
}
.sendTable {
	width: 960px;
	line-height: 30px;
}

.sendTable .title td {
	height: 30px;
	padding-left: 100px;
	text-align: left;
	font-weight: bold;
	background-color: #ecf2f8;
}

.sendTable th {
	width: 195px;
	text-align: right;
	font-weight: normal;
}

.sendTable td {
	padding: 5px;
}

.sendTable .captcha {
	width: 95px;
	margin-right: 5px;
	text-transform: uppercase;
}

.sendTable .captchaImage {
	vertical-align: middle;
	cursor: pointer;
}
-->
</style>
</head>
<body>
	<#include "/WEB-INF/template/card/header.ftl">

<div class="column">
	<div class="column_left">
		<div class="column_left_1">
			<a href="${base}/card/member!register.action">免费注册</a>
			<a href="${base}/card/member!passwordRecover.action">找回密码</a>
			<a href="${base}/html/login.html">立刻登陆</a>
        </div>
        <ul>
			<@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a"  count=6; articleList>
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
   	    <div class="column_right_1">
   	    	<p><img src="/template/card/images/hhh.jpg" width="38" height="37" alt="jj" /></p>
   	    	忘记账号密码了？填写用户名和注册时留下的邮箱后进查收邮件修改密码！
   	    </div>
        <div class="column_right_2">
        	<div class="column_right_2_shang">
            	<span>
                <font>找回密码</font>
                </span>
            </div>     
   	    
	        <form id="passwordRecoverForm">
		        <ol id="need">
					<li>
						<label class="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：</label>
						<input type="text" id="memberUsername" name="member.username" class="formText" />
						<dfn>填写您登录时使用的账号</dfn>
					</li>
					<li>
						<label class="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;箱：</label> 
						<input type="text" id="memberEmail" name="member.email" class="formText" />
						<dfn>填写注册时留下的邮箱</dfn>
					</li>
					<li id="memberSafeQuestionTr" class="hidden">
						<label class="email">密码保护问题：</label> 
						<span id="memberSafeQuestion"></span>
					</li>
					<li id="memberSafeAnswerTr" class="hidden">
						<label class="email">密码保护答案：</label> 
						<input type="text" id="memberSafeAnswer" name="member.safeAnswer" class="formText" disabled />
					</li>
					<li id="memberSafeAnswerTr" class="hidden">
						<label class="email"></label> 
						<span class="gray"><span id="status"></span></span>&nbsp;
					</li>
				</ol>
		 		<div class="anniu">
		 			<input type="submit" value="确 定" class="button"/>
		 			<input type="reset" value="重新填写" class="button" style="margin-left:30px;" />
		 			<span class="warnIcon">&nbsp;</span>如果忘记密码,请填写您的用户名和注册邮箱重新获取密码!
		 		</div>
	         </form>
         </div>
        </div>
    </div>

		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	</div>
	<#include "/WEB-INF/template/card/footer.ftl">
	
</body>
</html>