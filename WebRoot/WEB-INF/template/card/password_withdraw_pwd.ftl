<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>设置提现密码<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
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
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">修改密码 </div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="memberCenter">
			<form id="passwordForm" action="password!updateWithdrawPwd.action" method="post">
				<table class="inputTable">
							<tr>
								<th>
									旧提现密码: 
								</th>
								<td>
									<input type="password" id="oldPassword" name="oldPassword" class="formText" /> 如果第一次设置，可以为空不填。
								</td>
							</tr>
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
									<span class="warnInfo"><span class="icon">&nbsp;</span>系统提示: 若密码留空则保持不变</span>
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
</div>
<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>