
xxs = {
	base: "${base}",
	currencySign: "${setting.currencySign}",
	currencyUnit: "${setting.currencyUnit}",
	priceScale: "${setting.priceScale}",
	priceRoundType: "${setting.priceRoundType}"
};

// 货币格式化
function currencyFormat(price) {
	price = setScale(price, xxs.priceScale, xxs.priceRoundType);
	return xxs.currencySign + price + xxs.currencyUnit;
}

$().ready( function() {

	/* ---------- MemberVerify ---------- */
	
	$.memberVerify = function () {
		if(getCookie("memberUsername") != null) {
			var isMemberLogin = false;
			$.ajax({
				url: xxs.base + "/card/member!ajaxMemberVerify.action",
				type: "POST",
				dataType: "json",
				async: false,
				cache: false,
				success: function(data) {
					if (data.status) {
						isMemberLogin = true;
					}
				}
			});
			return isMemberLogin;
		} else {
			return false;
		}
	}

	/* ---------- Header ---------- */
	
	var $header = $("#header");
	if ($header.size() > 0) {
		var $headerLogin = $("#headerLogin");
		var $headerRegister = $("#headerRegister");
		var $headerMemberCenter = $("#headerMemberCenter");
		var $headerLogout = $("#headerLogout");
		$.flushHeaderInfo = function () {
			if(getCookie("memberUsername") != null) {
				$headerMemberCenter.show();
				$headerLogout.show();
				$headerLogin.hide();
				$headerRegister.hide();
			} else {
				$headerLogin.show();
				$headerRegister.show();
				$headerMemberCenter.hide();
				$headerLogout.hide();
			}
		}
		
		$.flushHeaderInfo();
	}	
	/* ---------- LoginContext ---------- */
	<@compress single_line = true>
		var loginBeforeHtml = '<div id="beforeLogin" class="anan">
            			<form id="loginForm" action="${base}/card/member!login.action" method="post">
						<input type="hidden" id="loginRedirectUrl" name="loginRedirectUrl" />
	                	<div>
	                		<p>账&nbsp;&nbsp;号</p> 
		                	<span>
		                		<input type="text" id="memberUsername"  size="15" name="member.username" class="oo" />
		                	</span>
	                	</div>
	                	<div style="margin-top:19px;">
		                  	<p>密&nbsp;&nbsp;码</p> 
		                  	<span>
		                  		<input type="password" id="memberPassword" name="member.password" class="oo" />
		                  	</span>
	                	</div>
		                <div style="margin-top:19px;">
		                	<p>验证码</p>
		                  	<span>
		                  		<input type="text" id="captcha" maxlength="4" name="j_captcha" style="width:90px" class="oo captcha" />
		                  		<img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" />
		                  	</span>
		                </div>
		                <span id="loginError" style="font-size:15px;margin-top:10px;margin-bottom:5px;text-align:center;color:red;font-weight:bold">验证失败，此处提示错误信息</span>
		                <div class="ddsa" >
		                	<input id="loginButton" class="button" style="display:inline" type="button"  name="login" value="登&nbsp;&nbsp;&nbsp;录" />
		                </div>
		                <div class="wenz">
		                	还没有账号？<a href="${base}/card/member!register.action" style="font-size:14px;font-weight:bold">免费注册</a>&nbsp;|
		                	&nbsp;<a href="${base}/card/member!passwordRecover.action" style="font-size:13px;font-weight:bold">忘记密码？</a>
		                </div>
                		</form>
					</div>';
	</@compress>	
	<@compress single_line = true>
		var loginAfterHtml = '<div id="afterLogin">
			         	<h1 style="font-size:18px"><strong>欢迎使用名臣福利!</strong></h1>
			         	<hr noshade width=100% style="margin-left:-15px;margin-top:5px"><br />
			         	<font style="font-size:15px">你当前使用的名臣福利账号是：</font><br />
	         			<br/>
	         			<strong><span id="account" style="text-align:center;font-size:16px;color:#FF9700">'+getCookie("memberUsername")+'</span></strong><br />
	         			<br />
		         		<div style="margin-left:10px;margin-top:15px;">
		         			<a href="${base}/card/member_center!index.action"><img src="${base}/template/card/images/jinru.jpg" style="margin-left:0px;" /></a>
		         			<a href="${base}/card/member!logout.action"><img src="${base}/template/card/images/tc.jpg" style="margin-left:15px" name="logout" /></a>
		         		</div>
           			</div>';
	</@compress>	
	var $loginWindowContext = $("#loginWindowContext");
	if ($loginWindowContext.size() > 0) {
		$.flushLoginInfo = function () {
			if(getCookie("memberUsername") != null) {
				$loginWindowContext.html(loginAfterHtml);
			} else {
				$loginWindowContext.html(loginBeforeHtml);
			}
		}
		$.flushLoginInfo();
	}
	var $loginForm = $("#loginForm");
	var $memberUsername = $("#memberUsername");
	var $memberPassword = $("#memberPassword");
	var $captcha = $("#captcha");
	var $captchaImage = $("#captchaImage");
	var $loginButton = $("#loginButton");
	var $loginError = $("#loginError");
	$loginError.text("");
	function loginWindowCaptchaImageRefresh() {
		$captchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp=" + (new Date()).valueOf());
	}
	$captchaImage.click( function() {
		loginWindowCaptchaImageRefresh();
	});
	$loginButton.click( function() {
		if ($.trim($memberUsername.val()) == "") {
			$memberUsername.focus();
			$loginError.text("请输入用户名!");
			return false;
		}
		if ($.trim($memberPassword.val()) == "") {
			$memberPassword.focus();
			$loginError.text("请输入密码!");
			return false;
		}
		if ($.trim($captcha.val()) == "") {
			$captcha.focus();
			$loginError.text("请输入验证码!");
			return false;
		}
		$.ajax({
			url: xxs.base + "/card/member!ajaxLogin.action",
			data: $loginForm.serialize(),
			type: "POST",
			dataType: "json",
			cache: false,
			beforeSend: function() {
				$loginForm.find("button").attr("disabled", true);
			},
			success: function(data) {
				if (data.status == "success") {
					$.flushHeaderInfo();
					$.flushLoginInfo();
					location.reload();
				}
				$loginError.text(data.message);
				loginWindowCaptchaImageRefresh();
				if(redirectUrl != null) {
					location.href = redirectUrl;
				}
				$loginForm.find("button").attr("disabled", false);
			},
			complete: function() {
				$loginError.text(data.message);
				$captcha.val("");
				loginWindowCaptchaImageRefresh();
				$loginForm.find("button").attr("disabled", false);
			}
		});
		return false;
	});
	/* ---------- ArticleContent ---------- */
	
	var $articleContent = $("#articleContent");
	if ($articleContent.size() > 0) {
		$changeBigFontSize = $("#changeBigFontSize");
		$changeNormalFontSize = $("#changeNormalFontSize");
		$changeSmallFontSize = $("#changeSmallFontSize");
		
		$changeBigFontSize.click(function () {
			$articleContent.css({"font-size": "16px"});
		});
		
		$changeNormalFontSize.click(function () {
			$articleContent.css({"font-size": "14px"});
		});
		
		$changeSmallFontSize.click(function () {
			$articleContent.css({"font-size": "12px"});
		});
	}
	
	$.showQuestionVerifyWindow = function (question,redirectUrl) {
			
			<@compress single_line = true>
				if ($.trim(question) != "") {
					var questionVerifyWindowHtml = 
					'<form id="questionVerifyWindowForm" autocomplete="off">
						<table>
							<tr>
								<th>密保问题:  </th>
								<td>
									'+question+'
									<input type="hidden" id="questionVerifyWindowMemberQuestion" name="member.safeQuestion" value="'+question+'" />
								</td>
							</tr>
							<tr>
								<th>密保答案:  </th>
								<td>
									<input type="text" id="questionVerifyWindowMemberAnswer" name="member.safeAnswer" class="formText" />
								</td>
							</tr>
						</table>
					</form>';
				}else{
					var questionVerifyWindowHtml = 
					'<form id="questionVerifyWindowForm" autocomplete="off">
						<table>
							<tr>
								<th> </th>
								<td>
									您还没有设置密码问题，<a href="'+xxs.base +'/card/password!safe.action">请点击设置后再进行此操作</a>
								</td>
							</tr>
						</table>
					</form>';
				}
			</@compress>
			
			$.dialog({title: "会员密保验证", content: questionVerifyWindowHtml, ok: "验证", cancel: "取 消", id: "questionVerifyWindow", width: 420, okCallback: questionVerify, modal: true});
			
			var $questionVerifyWindowForm = $("#questionVerifyWindowForm");
			var $questionVerifyWindowMemberQuestion = $("#questionVerifyWindowMemberQuestion");
			var $questionVerifyWindowMemberAnswer = $("#questionVerifyWindowMemberAnswer");
			
			function questionVerify() {
				if ($.trim($questionVerifyWindowMemberQuestion.val()) == "") {
					$questionVerifyWindowMemberQuestion.focus();
					$.message({type: "warn", content: "密保问题不能为空!"});
					return false;
				}
				if ($.trim($questionVerifyWindowMemberAnswer.val()) == "") {
					$questionVerifyWindowMemberAnswer.focus();
					$.message({type: "warn", content: "密保答案不能为空!"});
					return false;
				}
				$.ajax({
					url: xxs.base + "/card/member!ajaxSafeQuestion.action",
					data: $questionVerifyWindowForm.serialize(),
					type: "POST",
					dataType: "json",
					cache: false,
					beforeSend: function() {
						$questionVerifyWindowForm.find("button").attr("disabled", true);
					},
					success: function(data) {
						if (data.status == "success") {
							$.closeDialog("questionVerifyWindow");
							if(redirectUrl != null) {
								location.href = redirectUrl;
							}
						}
						$.message({type: data.status, content: data.message});
					},
					complete: function() {
						$questionVerifyWindowForm.find("button").attr("disabled", false);
					}
				});
				return false;
			}
		}
		$.showAdviceWindow = function (title,content) {
			<@compress single_line = true>
				var adviceWindowHtml = 
					'<table>
							<tr>
								<th>标题：</th>
								<td>
									'+title+'
								</td>
							</tr>
							<tr>
								<th>内容：</th>
								<td>
									'+content+'
								</td>
							</tr>
						</table>';
			</@compress>
			$.dialog({title: "公告明细", content: adviceWindowHtml, ok: "确 定", cancel: "取 消", width: 420, modal: true});

		}
});