<#assign sec=JspTaglibs["/WEB-INF/tld/security.tld"] />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理菜单 - XXS</title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body class="menu">
	<div class="body">
		<dl>
			<dt>
				<span>会员管理</span>
			</dt>
			<@sec.authorize ifAnyGranted="ROLE_MEMBER">
				<dd>
					<a href="member!list.action" target="mainFrame">会员管理</a>
				</dd>
			</@sec.authorize>
			<@sec.authorize ifAnyGranted="ROLE_MEMBER_DISCOUNT">
				<dd>
					<a href="member_discount!list.action" target="mainFrame">会员折扣</a>
				</dd>
			</@sec.authorize>
			<@sec.authorize ifAnyGranted="ROLE_MEMBER_RANK">
				<dd>
					<a href="member_rank!list.action" target="mainFrame">会员等级</a>
				</dd>
			</@sec.authorize>
			<@sec.authorize ifAnyGranted="ROLE_MEMBER_ATTRIBUTE">
				<dd>
					<a href="member_attribute!list.action" target="mainFrame">会员注册项</a>
				</dd>
			</@sec.authorize>
		</dl>
		<@sec.authorize ifAnyGranted="ROLE_MEMBER_BANK">
			<dl>
				<dt>
					<span>银行卡管理</span>
				</dt>
				<dd>
					<a href="member_bank!list.action" target="mainFrame">全部银行卡</a>
				</dd>
			</dl>
		</@sec.authorize>
	</div>
</body>
</html>