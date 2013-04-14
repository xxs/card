<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改密码<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
$().ready( function() {
	var $subbtn = $("#subbtn");
	var $passwordForm = $("#passwordForm");
	// 表单验证
	$passwordForm.submit( function() {
			if ($.trim($("#oldPassword").val()) == "") {
				$.dialog({type: "warn", content: "请输入旧密码!", modal: true, autoCloseTime: 3000});
				return false;
			}
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
<body>
	<#include "/WEB-INF/template/card/member_header.ftl">
	<!-- common begin -->
		<div class="common">
			<div class="panel-1">
				<h2>电脑店 常用软件快速安装包</h2>
				<div class="rj">
					<h3>精选软件一次下载  省时省力自动装机 </h3>
					安装包精选常用实用的软件，一次整体下载至制作好启动的U盘里，无需每次装机下载软件，大大减少装机时间；经杀毒软件和人工安装测试，均无捆绑插件，保障安全；同类软件进行归类管理，一目了然，方便快捷；一键安装，一键即可完成安装的全过程，一步到位。
				</div>
			</div>
			<a name="intro"></a>
			<div class="panel-1">
				<h2>功能特色</h2>
				<ul class="function">
					<li><em class="function-1"></em><h3>精挑细选</h3><p>所带的软件经过认真筛选，是同类产品中较为常用的软件</p></li>
					<li><em class="function-2"></em><h3>绿色安全</h3><p>所带的软件经杀毒软件和人工安装测试，均无捆绑插件，绿色安全</p></li>
					<li><em class="function-3"></em><h3>更新及时</h3><p>所带的软件均是最新版，软件包每月定期更新，一次整包下载，减少升级步聚</p></li>
					<li><em class="function-4"></em><h3>方便快捷</h3><p>省时省力，一键安装，一键即可完成安装的全过程，一步到位</p></li>
					<li><em class="function-5"></em><h3>高速下载</h3><p>软件包支持多线程下载，用户可高速下载到U盘，方便使用</p></li>
					<li><em class="function-6"></em><h3>智能安装</h3><p>如果原有安装同个软件，无需删除原程序安装，自动覆盖升级</p></li>
				</ul>
			</div>
		</div>
		<!-- common end-->
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
			<form id="passwordForm" action="password!update.action" method="post">
				<table class="inputTable">
							<tr>
								<th>
									旧登录密码: 
								</th>
								<td>
									<input type="password" id="oldPassword" name="oldPassword" class="formText" />
								</td>
							</tr>
							<tr>
								<th>
									新登录密码: 
								</th>
								<td>
									<input type="password" id="password" name="member.password" class="formText" />
								</td>
							</tr>
							<tr>
								<th>
									确认新登录密码: 
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
									
									<input type="submit" id="subbtn" class="button" value="提   交" hidefocus />
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