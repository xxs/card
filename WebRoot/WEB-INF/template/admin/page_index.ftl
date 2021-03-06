<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理中心首页 - XXS</title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>
<body class="index">
	<div class="bar">
		您已进入${setting.systemName}管理系统！(目前版本${setting.systemVersion} 正式版)
	</div>
	<div class="body">
		<div class="bodyLeft">
			<table class="listTable">
				<tr>
					<th colspan="2">
						待处理事务
					</th>
				</tr>
				<tr>
					<td>
						未读消息: 
					</td>
					<td>
						${unreadMessageCount} <a href="message!inbox.action">[收件箱]</a>
					</td>
				</tr>
				<tr>
					<td>
						未处理提现申请数: 
					</td>
					<td>
						${unprocessedWithdrawCount} <a href="withdraw!applying.action">[提现申请]</a>
					</td>
				</tr>
				<tr>
					<td width="110">
						未处理订单: 
					</td>
					<td>
						${unprocessedOrderCount} <a href="order!list.action">[订单列表]</a>
					</td>
				</tr>
				<tr>
					<td>
						未处理提现申请数: 
					</td>
					<td>
						${unprocessedWithdrawCount} <a href="withdraw!applying.action">[提现申请]</a>
					</td>
				</tr>
			</table>
			<div class="blank"></div>
		</div>
		<div class="bodyRight">
			<table class="listTable">
				<tr>
					<th colspan="2">
						信息统计
					</th>
				</tr>
				<tr>
					<td width="110">
						目前在线人数: 
					</td>
					<td>
						${onlineList?size} 人
					</td>
				</tr>
				<tr>
					<td width="110">
						历史在线高峰: 
					</td>
					<td>
						同时 ${setting.onLineMaxCount} 人在线，发生在${setting.onLineMaxCountDate}
					</td>
				</tr>
				<tr>
					<td width="110">
						目前充值卡种类: 
					</td>
					<td>
						${marketableCardsCount} 种
					</td>
				</tr>
				<tr>
					<td>
						会员总数: 
					</td>
					<td>
						${memberTotalCount}  人
					</td>
				</tr>
			</table>
			<div class="blank"></div>
		<!--	
			<table class="listTable">
				<tr>
					<th colspan="2">
						系统信息
					</th>
				</tr>
				<tr>
					<td width="110">
						Java版本: 
					</td>
					<td>
						${javaVersion}
					</td>
				</tr>
				<tr>
					<td>
						操作系统名称: 
					</td>
					<td>
						${osName}
					</td>
				</tr>
				<tr>
					<td>
						操作系统构架: 
					</td>
					<td>
						${osArch}
					</td>
				</tr>
				<tr>
					<td>
						操作系统版本: 
					</td>
					<td>
						${osVersion}
					</td>
				</tr>
				<tr>
					<td>
						Server信息: 
					</td>
					<td>
						${serverInfo}
					</td>
				</tr>
				<tr>
					<td>
						Servlet版本: 
					</td>
					<td>
						${servletVersion}
					</td>
				</tr>
			</table>
		-->
		</div>
		<p class="copyright">Copyright © 2012-2013 mcfl.</p>
	</div>
</body>
</html>