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
<script type="text/javascript" src="${base}/template/common/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>
<body class="index">
	<div class="body">
		<div class="bodyLeft">
			<table class="listTable">
				<tr>
					<th colspan="2">
						提现信息
					</th>
				</tr>
				<tr>
					<td>
						累计提现:
					</td>
					<td>
						${successWithdrawMoney?string(currencyFormat)}
					</td>
				</tr>
				<tr>
					<td>
						累计提现实发：
					</td>
					<td>
						${successWithdrawTotalMoney?string(currencyFormat)}
					</td>
				</tr>
				<tr>
					<td>
						未处理提现:
					</td>
					<td>
						${applyWithdrawMoney?string(currencyFormat)}
					</td>
				</tr>
				<tr>
					<td>
						未处理提现待实发：
					</td>
					<td>
						${applyWithdrawTotalMoney?string(currencyFormat)}
					</td>
				</tr>
			</table>
			<div class="blank"></div>
		</div>
		<div class="bodyRight">
			<table class="listTable">
				<tr>
					<th colspan="2">
						订单信息   日期范围：
						<form action="report!info.action" method="post" name="thisform">
							<input name="beginDate" onclick="WdatePicker()" value="${tempBeginDate}" />
							~
							<input name="endDate" onclick="WdatePicker()" value="${tempEndDate}"/>
							<input type="submit" value="查询"/>
						</form>	
					</th>
				</tr>
				<tr>
					<td >
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
				<#list reportList as report>
					<tr>
						<td colspan="2">
							${report.tongdao}
						</td>
						<td colspan="2">
							${report.saleCount}
						</td>
						<td colspan="2">
							${report.saleMoney}
						</td>
					</tr>
				</#list>	
			</table>
	</div>
</body>
</html>