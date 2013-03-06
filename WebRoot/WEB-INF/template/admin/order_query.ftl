<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单查询 - XXS</title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
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
			<table id="listTable" class="listTable">
					<tr>
						<td align="right">
							订单号批量查询：
						</td>
						<td>
							<textarea name="cardString" id="orderSns"  class="formTextarea"></textarea>
							<input type="text" id="orderSn" name="orderSn" class="formText" />
						</td>
					</tr>
					<tr>
						<td >
							
						</td>
						<td>
							<input type="button" id="searchButton" class="formButton" value="查询" hidefocus />
						</td>
					</tr>
					<tr>
						<td ></td>
						<td>
							<div id="jieguo" class="red"></div>
						</td>
					</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		$().ready(function() {
			$orderSns = $("#orderSns");
			$jieguo = $("#jieguo");
			$orderSn = $("#orderSn");
			$queryForm = $("#queryForm");
			$searchButton = $("#searchButton");
			$searchButton.click( function() {
				if($orderSns.val()==""){
					$.dialog({type: "warn", content: "请至少输入一个订单号", modal: true, autoCloseTime: 3000});
				}
				var sn=$orderSns.val().split("\n");
				//alert(orderSn);
				for(i=0; i<sn.length; i++){
					if(sn[i]!=""){
						//alert(sn[i]);
						$orderSn.val(sn[i]);
						alert($orderSn.val());
							$.ajax({
								url: "order!Rquery.action",
								data: $queryForm.serialize(),
								type: "POST",
								dataType: "json",
								cache: false,
								beforeSend: function(data) {
								//$.dialog({type: 'warn', content: '<span class="loadingIcon">&nbsp;</span>提交中...', modal: true, autoCloseTime: 1000});
									$searchButton.attr("disabled", true);
									alert("commit......");
								},
								success: function(data) {
										if (data.status == "success") {
											$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
										} else {
											$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
										}
											$pBtn.attr("disabled", false);
										}
									});
							}else{
								$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
							}
						}
						return false;
					});
		})
	</script>
</body>
</html>