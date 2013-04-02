<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>提示信息<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/card.css" rel="stylesheet" type="text/css" />
<style type="text/css">
body {
	background: url(${base}/template/common/images/404.png) center 10px no-repeat;
	text-align: center;
}

.speed-area {
	position: relative;
	margin: 20px auto;
	width: 500px;
	text-align: left;
}

.speed-area h1 {
	float: left;
	clear: both;
	font-size: 25px;
	color: #fff;
	background-color: #f60;
	padding: 5px 20px;
	text-transform: uppercase;
	letter-spacing: 4px;
}

.speed-area div {
	float: left;
	display: block;
	clear: both;
	margin-top: 520px;
	margin-left: 60px;
	font-size: 16px;
}
</style>
</head>
<body class="errorPage">
		<div id="content" class="petty-screen clearfix">
			<div class="speed-area">
				<div>
					抱歉,你访问的页面不存在!系统正在跳转到首页...
				</div>
				<form name="loading">
					<p>
						<input name="chart"
							style="height: 32px; line-height: 30px; width: 216px; font-size: 15px; border-style: none; display: none; padding: 0px; font-family: Arial; letter-spacing: -1px; color: #fff; background-color: #f60;"
							type="text" />
						<input name="percent" size="4"
							style="border-style: none; position: absolute; top: -160px; left: 80px; display: none; font-size: 12px; background: none; border-width: medium; font-family: Arial; color: #000; text-align: center;"
							type="text" />
						<script>var bar = 0
							var line = "--"
							var amount ="--"
							count()
							function count(){
							bar= bar+2
							amount =amount + line
							document.loading.chart.value=amount
							document.loading.percent.value=bar+"%"
							if (bar<99)
							{setTimeout("count()",100);}
							else
						{window.location = "${base}/";}
						}
						</script>
					</p>
				</form>
			</div>
			<!-- content end -->
</body>
</html>