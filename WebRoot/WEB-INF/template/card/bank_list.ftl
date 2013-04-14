<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>账户列表<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {
	// 修改前验证密保问题
	$(".xiugai").bind("click",function(event){
		$redirectUrl = event.target.name;
		$question = $("#question").val();
		//alert("123:"+$redirectUrl);
		$.showQuestionVerifyWindow($question,$redirectUrl);
		return false;
	});
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
		<div class="common">
		<div class="panel-1 trade_info">
				<h2>提现账户<a class="formButton red" href="bank!add.action">添加账户</a></h2>
				<form id="refForm" >
				<table style="margin-top:10px;">
					<thead>
							<tr>
								<th>账号	</th>
								<th>开户名</th>
								<th>开户银行</th>
								<th>开户城市</th>
								<th>支行明细</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<#list member.memberBankSet as memberBank>
							<tr>
								<td>
									${memberBank.banknum}
								</td>
								<td>
									${memberBank.openname}
								</td>
								<td>
									${memberBank.bankname}
								</td>
								<td>
									${memberBank.bankcity}
								</td>
								<td>
									${memberBank.bankdetail}
								</td>
								<td align="center">
									${memberBank.isDefault?string('是','否')}
								</td>
								<td align="center">
									<a name="bank!check.action?id=${memberBank.id}" class="xiugai">默认</a>
									<a name="bank!edit.action?id=${memberBank.id}" class="xiugai">修改</a>
								</td>
							</tr>
						</#list>
						</tbody>
					</table>
			</div>
		</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>