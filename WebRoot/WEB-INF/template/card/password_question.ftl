<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改密保<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
	$().ready( function() {
		var $questionForm = $("#questionForm");
		var $subbtn = $("#subbtn");
		// 表单验证
		$questionForm.submit( function() {
				if ($.trim($("#memberSafeQuestion").val()) == "") {
					$.dialog({type: "warn", content: "请输入密保问题!", modal: true, autoCloseTime: 3000});
					return false;
				}
				if ($.trim($("#memberSafeAnswer").val()) == "") {
					$.dialog({type: "warn", content: "请输入密保答案!", modal: true, autoCloseTime: 3000});
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
				<h2>设置密保问题</h2>
				<div class="account_info">
	        		<form id="questionForm" action="password!updateSafeQuestion.action" method="post">
				<#if member.safeQuestion == "">
					<table class="inputTable tabContent">
						<tr>
							<th>
								安全问题: 
							</th>
							<td>
								<input type="text" id="memberSafeQuestion" name="member.safeQuestion" class="formText" />
							</td>
						</tr>
						<tr>
							<th>
								安全答案: 
							</th>
							<td>
								<input type="text" id="memberSafeAnswer" name="member.safeAnswer" class="formText" />
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<span class="warnInfo"><span class="icon">&nbsp;</span>系统提示: 若安全问题留空则保持不变</span>
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" id="subbtn"  class="button" value="提 交" hidefocus />
							</td>
						</tr>
					</table>
					<#else>
					<table class="inputTable tabContent">
						<tr>
							<th>
								旧密保问题: 
							</th>
							<td>
								${member.safeQuestion}
							</td>
						</tr>
						<tr>
							<th>
								旧密保答案: 
							</th>
							<td>
								<input type="text" id="oldSafeAnswer" name="oldSafeAnswer" class="formText" />
							</td>
						</tr>
						<tr>
							<th>
								新密保问题: 
							</th>
							<td>
								<input type="text" id="memberSafeQuestion" name="member.safeQuestion" class="formText" />
							</td>
						</tr>
						<tr>
							<th>
								新密保答案: 
							</th>
							<td>
								<input type="text" id="memberSafeAnswer" name="member.safeAnswer" class="formText" />
							</td>
						</tr>
						<tr>
							<th>
								&nbsp;
							</th>
							<td>
								<input type="submit" id="subbtn"  class="button" value="提 交" hidefocus />
							</td>
						</tr>
					</table>
					</#if>
					</form>
				</div>
			</div>
		</div>
		<!-- common end-->
		<div class="clear"></div>
		<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>