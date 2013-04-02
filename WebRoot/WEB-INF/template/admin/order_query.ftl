<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单查询 - XXS</title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/admin/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/admin/css/admin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/base.js"></script>
<script type="text/javascript" src="${base}/template/admin/js/admin.js"></script>
</head>
<body class="list">
	<div class="body">
		<form id="queryForm" method="post">
			<table class="listTable">
					<tr>
						<td align="right">
							订单号批量查询：
						</td>
						<td>
							<textarea name="cardString" id="orderSns"  class="formTextarea"></textarea>
							<input type="hidden" id="orderSn" name="orderSn" class="formText" />
						</td>
					</tr>
					<tr>
						<td >
							
						</td>
						<td>
							<input type="button" id="searchButton" class="formButton" value="查询" hidefocus />
						</td>
					</tr>
			</table>
		</form>
		<table id="listTable" class="listTable">
			<tr>
				<th><a href="#" class="sort">订单号</a></th>
				<th><a href="#" class="sort">流水号</a></th>
				<th><a href="#" class="sort">支付金额</a></th>
				<th><a href="#" class="sort">详细</a></th>
				<th><a href="#" class="sort">状态码</a></th>
				<th><a href="#" class="sort">到账金额</a></th>
				<th><a href="#" class="sort">处理时间</a></th>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		$().ready(function() {
			$orderSns = $("#orderSns");
			$listTable = $("#listTable");
			$orderSn = $("#orderSn");
			$queryForm = $("#queryForm");
			$searchButton = $("#searchButton");
			$searchButton.click( function() {
				$(".dataTr").hide();
				if($orderSns.val()==""){
					$.dialog({type: "warn", content: "请至少输入一个订单号", modal: true, autoCloseTime: 3000});
				}
				var sn=$orderSns.val().split("\n");
				for(i=0; i<sn.length; i++){
					if(sn[i]!=""){
						$orderSn.val(sn[i]);
							$.ajax({
								url: "order!Rquery.action",
								data: $queryForm.serialize(),
								type: "POST",
								dataType: "json",
								cache: false,
								beforeSend: function(data) {
									//$.dialog({type: 'warn', content: '<span class="loadingIcon">&nbsp;</span>提交中...', modal: true, autoCloseTime: 1000});
									$searchButton.attr("disabled", true);
								},
								success: function(data) {
										if (data.status == "success") {
											//$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
											var appTr = '<tr class=dataTr ><td>'+data.orderSn+'</td><td>'+data.paySn+'</td><td>'+data.amount+'</td><td>'+data.retMsg+'</td><td>'+data.retCode+'</td><td>'+data.paidAmount+'</td><td>'+data.time+'</td></tr>';
											$listTable.append(appTr);
										} else {
											//$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
											var appTr = '<tr class=dataTr ><td>'+data.orderSn+'</td><td colspan=6 >'+data.message+'</td></tr>';
											$listTable.append(appTr);
										}
										$pBtn.attr("disabled", false);
									}
								});
							}else{
								$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
							}
						}
						$searchButton.attr("disabled", false);
						return false;
					});
		})
	</script>
</body>
</html>