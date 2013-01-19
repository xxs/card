<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员注册<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (article.metaKeywords)! != ""><meta name="keywords" content="${article.metaKeywords}" /></#if>
<#if (article.metaDescription)! != ""><meta name="description" content="${article.metaDescription}" /></#if>

<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>

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
	var $loginWindowForm = $("#loginWindowForm");
			var $loginWindowMemberUsername = $("#loginWindowMemberUsername");
			var $loginWindowMemberPassword = $("#loginWindowMemberPassword");
			var $loginWindowCaptcha = $("#loginWindowCaptcha");
			var $loginWindowCaptchaImage = $("#loginWindowCaptchaImage");
			
			function loginWindowCaptchaImageRefresh() {
				$loginWindowCaptchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp=" + (new Date()).valueOf());
			}
			
			$loginWindowCaptchaImage.click( function() {
				loginWindowCaptchaImageRefresh();
			});
			
			// 刷新验证码图片
		$captchaImage.click( function() {
			$captchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
		});
			
			function login() {
				if ($.trim($loginWindowMemberUsername.val()) == "") {
					$loginWindowMemberUsername.focus();
					$.message({type: "warn", content: "请输入用户名!"});
					return false;
				}
				if ($.trim($loginWindowMemberPassword.val()) == "") {
					$loginWindowMemberPassword.focus();
					$.message({type: "warn", content: "请输入密码!"});
					return false;
				}
				if ($.trim($loginWindowCaptcha.val()) == "") {
					$loginWindowCaptcha.focus();
					$.message({type: "warn", content: "请输入验证码!"});
					return false;
				}
				
				$.ajax({
					url: xxs.base + "/card/member!ajaxLogin.action",
					data: $loginWindowForm.serialize(),
					type: "POST",
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$loginWindowForm.find("button").attr("disabled", true);
					},
					success: function(data) {
						if (data.status == "success") {
							$.flushHeaderInfo();
							$.closeDialog("loginWindow");
						}
						$.message({type: data.status, content: data.message});
						if(redirectUrl != null) {
							location.href = redirectUrl;
						}
					},
					complete: function() {
						$loginWindowForm.find("button").attr("disabled", false);
						$loginWindowCaptcha.val("");
						loginWindowCaptchaImageRefresh();
					}
				});
				return false;
			}
		}
</script>
</head>
<body class="login">
	<!--标志-->
	<div class="logo">
		<div class="logo_995">
	    	<div class="logo_left"><a href="${base}/" ><img src="/template/card/images/logo.jpg" alt="${(setting.shopName)!}" width="162" height="46" border="0" /></a></div>
		</div>
	    <div class="clear"></div>
	</div>

	<div class="blank"></div>
	<div class="body">
		<div class="loginDetail">
			<div class="top">会员注册</div>
			<div class="middle">
				<form id="registerWindowForm">
					<table>
						<tr>
							<th>用户名: </th>
							<td>
								<input type="text" id="registerWindowMemberUsername" name="member.username" class="formText" title="用户名只允许包含中文、英文、数字和下划线!" />
							</td>
						</tr>
						<tr>
							<th>密&nbsp;&nbsp;&nbsp;码: </th>
							<td>
								<input type="password" id="registerWindowMemberPassword" name="member.password" class="formText" />
							</td>
						</tr>
						<tr>
							<th>重复密码: </th>
							<td>
								<input type="password" id="registerWindowReMemberPassword" name="reMemberPassword" class="formText" title="密码长度只允许在4-20之间!" />
							</td>
						</tr>
						<tr>
							<th>E-mail: </th>
							<td>
								<input type="text" id="registerWindowMemberEmail" name="member.email" class="formText" />
							</td>
						</tr>
						<tr>
							<th>推荐人: </th>
							<td>
								<input type="text" id="registerWindowMemberReferrer" name="member.referrer" class="formText" title="填写后不能修改!"/>
							</td>
						</tr>
						<tr>
							<th>验证码: </th>
							<td>
								<input type="text" id="captcha" name="j_captcha" class="formText captcha" />
								<img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" />
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
								<label>
									<input type="checkbox" id="registerWindowIsAgreeAgreement" name="isAgreeAgreement" value="true" checked />已阅读并同意
									<a id="registerWindowShowAgreementWindow" class="showAgreementWindow" href="javascript: void(0);" title="查看会员注册协议">《会员注册协议》</a>
								</label>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="bottom"></div>
		</div>
		<div class="blank"></div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
</body>
</html>