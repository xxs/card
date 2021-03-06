<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>设置提现密码<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {

	var $subbtn = $("#subbtn");
	var $passwordForm = $("#passwordForm");
	// 表单验证
	$passwordForm.submit( function() {
			if ($.trim($("#password").val()) == "") {
				$.dialog({type: "warn", content: "请输入新密码!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($("#rePassword").val()) == "") {
				$.dialog({type: "warn", content: "请再次输入新密码!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($("#rePassword").val()) != $.trim($("#password").val())) {
				$.dialog({type: "warn", content: "两次新密码不相同!", modal: true, autoCloseTime: 3000});
				return false;
			}
			$subbtn.attr("disabled", false);
			$subbtn.removeAttr("button_click");
			$subbtn.attr("class", "button");
		});

});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<!-- common begin -->
		<div class="common">
			<div class="panel-1">
				<h2>设置提现密码</h2>
				<div class="account_info">
	        		<form id="passwordForm" action="password!updateWithdrawPwd.action" method="post">
						<table class="inputTable">
							<#if member.withdrawPwd != "">
								<tr>
									<th>
										旧提现密码: 
									</th>
									<td>
										<input type="password" id="oldPassword" name="oldPassword" class="formText" />* 系统检测到您已设置提现密码，如需修改，此项为必填项。
									</td>
								</tr>
							<#else>
								<tr>
									<th>
										旧提现密码: 
									</th>
									<td>
										系统检测到您尚未设置提现密码。
									</td>
								</tr>
							</#if>
							<tr>
								<th>
									新提现密码: 
								</th>
								<td>
									<input type="password" id="password" name="member.withdrawPwd" class="formText" />
								</td>
							</tr>
							<tr>
								<th>
									确认新提现密码: 
								</th>
								<td>
									<input type="password" id="rePassword" name="rePassword" class="formText" />
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<span class="warnInfo"><span class="icon">&nbsp;</span>系统提示: 第一次设置提现密码请直接填写新密码及确认新密码</span>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									
									<input type="submit" class="button" value="提   交" hidefocus />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- common end-->
		<div class="clear"></div>
		<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>