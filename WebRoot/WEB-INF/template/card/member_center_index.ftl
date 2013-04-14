<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
	$().ready( function() {
		$(".gonggao").bind("click",function(event){
			$content = event.target.name;
			$title = event.target.title;
			$.showAdviceWindow($title,$content);
			return false;
		});
	});
</script>
</head>
<body>
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
		<!-- common begin -->
		<div class="common-left">
			<div class = "title">
				<h1>欢迎您，${loginMember.username}</h1>
				<span>上次登录时间: ${loginMember.createDate?string("yyyy-MM-dd HH:mm:ss")} <a href="member_log!list.action?pager.searchBy=actionMethod&pager.keyword=login" >登录历史</a></span>
			</div>	
			<div class="panel-1">
				<h2>账户信息</h2>
				<div class="account_info">
	        		<div class="balance">
						<div class="m1">
							<p class="list"><span>账户总额：</span><strong>${loginMember.deposit?string(currencyFormat)}</strong></p>
							<p class="list"><span>累计提现总额：</span><strong>${loginMember.totalWithdrawMoneySuccess?string(currencyFormat)}</strong></p>
						</div>
						<div class="m1">
							<p class="list"><span>可用余额：</span><strong>${(loginMember.deposit-loginMember.totalWithdrawMoneyApplying)?string(currencyFormat)}</strong></p>
							<p class="list"><span>冻结金额：</span><strong>${loginMember.totalWithdrawMoneyApplying?string(currencyFormat)}</strong></p>
						</div>
						<div class="recharge">
							<p ><a href="#" class="formButton"><span>充 值</span></a><a href="#" class="formButton ml10"><span>提 现</span></a> </p>
						</div>
					</div>
					<div class="more_info">
						<p class="approve_box"><span class="side">账号状态</span> 
						<#if isverifyname || isverifyphone || isverifywithdrawpwd || isverifysafe || isverifybank > 
							<#if isverifyname>
			                	<a class="approve_gray" href="profile!edit.action" > 设置实名认证</a>
		                	</#if>
		                	<#if isverifyphone>
		            	    	<a class="approve_gray" href="profile!edit.action" > 设置手机认证</a> 
		                	</#if>
		                	<#if isverifywithdrawpwd>
		        	        	<a class="approve_gray" href="password!withdrawPwd.action"> 设置提现密码</a> 
		                	</#if>
		                	<#if isverifysafe>
		    	            	<a class="approve_gray" href="password!safe.action"> 设置设置密保</a> 
		                	</#if>
		                	<#if isverifybank>
			                	<a class="approve_gray" href="bank!add.action"> 设置结算账户</a> 
		                	</#if>
						<#else>
							您的账户已设置了全部的安全信息
						</#if>
						 </p>
						<!-- <p class="mod_safe"><span class="side">安全设置</span> <a href="#">修改登录密码</a><a href="#">修改支付密码</a><a href="#">找回支付密码</a></p> -->
					
					</div>
				</div>
			</div>
			<a name="intro"></a>
			<div class="panel-1 trade_info">
				<h2>最近10订单信息</h2>
				<table style="margin-top:10px;">
					<thead>
							<tr>
								<th>订单编号</th>
								<th>充值卡名称</th>
								<th>下单时间</th>
								<th>单据通道</th>
								<th>充值卡卡号</th>
								<th>订单金额</th>
								<th>订单状态</th>
								<th><a class="red" id="refBtn" >点击刷新</a></th>							</tr>
						</thead>
						<tbody>
							<#list orderList as order>
							<tr>
								<td>
									${order.orderSn}
								</td>
								<td width="250">
										${order.productName}
								</td>
								<td width="200">
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate?string("yyyy-MM-dd HH:mm:ss")}</span>
								</td>
								<td>
									${order.paymentConfig.name}
								</td>
								<td>
									${order.cardNum}
								</td>
								<td>
									${order.amount?string(currencyFormat)}
								</td>
								<td>
									<span class="state" id="ss${order.id}">
									<#if order.orderStatus == "paid">
										<span class="green">${action.getText("OrderStatus." + order.orderStatus)}</span>
									<#else>
										<span class="red"> ${action.getText("OrderStatus." + order.orderStatus)}</span>
									</#if>
									</span>
								</td>
							</tr>
						</#list>
							<#if orderList?exists>
								<tr>
									<td colspan="7" class="null" align="right"><a href="order!list.action" style="float:right;margin-right:10px;">更多订单</a></td>
								</tr>
							<#else>
								<tr>
									<td colspan="7" class="null">最近一月内没有交易记录...</td>
								</tr>
							</#if>
						</tbody>
					</table>
					<#include "/WEB-INF/template/card/pager.ftl">
			</div>
		</div>
		<!-- common end-->
		<div class="common-right">
			<div class="panel-2">
				<h2>名臣服务</h2>
				<ul class="helper_list">
					<li><a href="#" class="ioc-1">在线支付</a></li>
					<li><a href="#" class="ioc-2">在线支付</a></li>
					<li><a href="#" class="ioc-3">在线支付</a></li>
					<li><a href="#" class="ioc-4">在线支付</a></li>
					<li><a href="#" class="ioc-5">在线支付</a></li>
					<li><a href="#" class="ioc-6">在线支付</a></li>
				</ul>
			</div>
			<div class="panel-2">
				<h2>名臣公告</h2>
				<ul class="list">
						<@article_list type="advice" count=10; articleList>
							<#list articleList as article>
								<li><a href="#" name="${article.content}" class="gonggao" title="${article.title}">${substring(article.title, 150, "...")}</a></li>
							</#list>
						</@article_list>
				</ul>
			</div>
		</div>
	</div>
<div class="blank"></div>
<#include "/WEB-INF/template/card/member_footer.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
</body>
</html>