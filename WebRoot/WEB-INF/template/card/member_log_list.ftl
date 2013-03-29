<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>用户操作日志<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">用户操作日志 </div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">可点击<a class="formButton" href="bank!add.action">添加账户</a>页面添加</div>
			<br/>
			<div class="memberCenter">
			<div class="tab3">
			<table width="760px" cellspacing=0>
				<tr>
					<th>操作类型	</th>
					<th>日志信息</th>
					<th>操作时间</th>
					<th>IP地址</th>
				</tr>
					<#list pager.result as memberLog>
						<tr>
							<td>
								${memberLog.operation}
							</td>
							<td>
								${memberLog.info}
							</td>
							<td>
								${memberLog.createDate}
							</td>
							<td>
								${memberLog.ip}
							</td>
						</tr>
					</#list>		
				</table>
				<@pagination pager=pager baseUrl="/card/member_log!list.action">
         			<#include "/WEB-INF/template/card/pager.ftl">
         		</@pagination>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>