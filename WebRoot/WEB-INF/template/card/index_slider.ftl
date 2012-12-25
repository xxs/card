<!--------------------------banner以及登录框------------------------------->
<div id="banner">
	<div class="login">
	<span class="denglu1"><a href="#">会员登录</a></span>
	<span class="denglu2"><a href="#">名臣登录</a></span>
		<div class="id" style="clear:both;">
			<p>账户名</p><span><input type="text" class="span" /></span>
		</div>
		<div class="id" >
			<p>密密码</p><span><input type="text" class="span" /></span>
		</div>
		<div class="id" style="padding-bottom:8px;" >
			<p>验证码</p><span><input type="text" class="span" style="width:70px;"/>&nbsp;&nbsp;<img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" /></span>
		</div>
		<div class="btn" style="padding-top:20px;">
			<span style="float:left;"><input name="" type="image" src="${base}/template/card/images/login_btn.jpg" /></span>
			<p><a style="color:#666; text-decoration:none;" href="#">忘记密码？</a></p>
		</div>
		<div class="btn" style="clear:both; padding-top:8px;">
			<span><a href="#">使用手机号码登陆</a></span>  |  <span><a href="#">免费注册</a></span>
		</div>
	</div>
</div>
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