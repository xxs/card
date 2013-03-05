<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>管理中心首页 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>
<body class="index">
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
					</td>
				</tr>
				<tr>
					<td>
						未处理提现申请数: 
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td width="110">
						未处理订单: 
					</td>
					<td>
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
						已上架充值卡: 
					</td>
					<td>
						${marketableCardsCount}
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
				<tr>
					<td>
						文章总数: 
					</td>
					<td>
						${articleTotalCount}  篇
					</td>
				</tr>
			</table>
			<div class="blank"></div>
		</div>	
			<table class="listTable">
				<tr>
					<th colspan="2">
						通道类型
					</th>
					<th colspan="2">
						订单总数
					</th>
					<th colspan="2">
						累计货款
					</th>
				</tr>
				<tr>
					<#list reportList as report>
						<td colspan="2">
							${report.tongdao}
						</td>
						<td colspan="2">
							${report.saleCount}
						</td>
						<td colspan="2">
							${report.saleMoney}
						</td>
					</#list>	
				</tr>
			</table>
	</div>
</body>
</html>