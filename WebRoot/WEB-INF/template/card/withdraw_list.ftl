<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>预存款提现<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/card.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<script type="text/javascript">
$().ready( function() {
	
	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $withdrawRechargeForm = $("#withdrawRechargeForm");
	
	// 表单验证
	$withdrawRechargeForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"rechargeAmount": {
				required: true,
				positive: true
			},
			"paymentConfig.id": "required"
		},
		messages: {
			"rechargeAmount": {
				required: "请填写充值金额",
				positive: "充值金额必须为正数"
			},
			"paymentConfig.id": "请选择支付方式"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="body depositRecharge">
		<div class="bodyLeft">
			<div class="memberInfo">
				<div class="top"></div>
				<div class="middle">
					<p>欢迎您!&nbsp;&nbsp;<span class="username">${loginMember.username}</span>&nbsp;&nbsp;[<a class="userLogout" href="member!logout.action"">退出</a>]</p>
					<p>会员等级: <span class="red"> ${loginMember.memberRank.name}</span></p>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="memberMenu">
				<div class="top">
					<a href="member_center!index.action">会员中心首页</a>
				</div>
				<div class="middle">
					<ul>
	                	<li class="order">
	                    	<ul>
	                        	<li><a href="order!list.action">我的订单</a></li>
	                        </ul>
	                    </li>
	                    <li class="category favorite">
	                    	<ul>
	                        	<li><a href="favorite!list.action">充值卡收藏</a></li>
	                        	<li><a href="goods_notify!list.action">缺货登记</a></li>
	                        </ul>
	                    </li>
	                  	<li class="message">
	                    	<ul>
	                        	<li><a href="message!send.action">发送消息</a></li>
	                            <li><a href="message!inbox.action">收件箱</a></li>
	                            <li><a href="message!draftbox.action">草稿箱</a></li>
	                            <li><a href="message!outbox.action">发件箱</a></li>
	                        </ul>
	                    </li>
	                    <li class="profile">
	                    	<ul>
	                        	<li><a href="profile!edit.action">个人信息</a></li>
	                            <li><a href="password!edit.action">修改密码</a></li>
	                            <li><a href="receiver!list.action">收货地址</a></li>
	                        </ul>
	                    </li>
	                    <li class="deposit">
	                    	<ul>
	                    		<li><a href="deposit!list.action">我的预存款</a></li>
	                        	<li class="current"><a href="deposit!recharge.action">预存款充值</a></li>
	                        	<li><a href="withdraw!list.action">提现</a></li>
	                        </ul>
	                    </li>
	                </ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="memberCenterDetail">
				<div class="top">预存款提现 <span class="red">[预存款余额: ${loginMember.deposit?string(currencyFormat)}]</span></div>
				<#list withdrawList as withdraw>
					${withdraw.withdrawSn}...
				</#list>
				<div class="middle">
					<div id="validateErrorContainer" class="validateErrorContainer">
						<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
						<ul></ul>
					</div>
					<div class="blank"></div>
					<form id="withdrawRechargeForm66" action="withdraw!save.action" method="post">
						<input type="hidden" name="paymentType" value="recharge" />
						<table class="inputTable">
							<tr>
								<th>
									当前金额: 
								</th>
								<td>
									${loginMember.deposit?string(currencyFormat)}
								</td>
							</tr>
							<tr>
								<th>
									提现金额: 
								</th>
								<td>
									<input type="text" name="withdraw.money" class="formText" />
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									提现备注: 
								</th>
								<td>
									<textarea cols="30" rows="5" name="withdraw.memo" class="formText" ></textarea>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submitButton" value="申  请" hidefocus />
								</td>
							</tr>
						</table>
					</form>
					<div class="blank"></div>
				</div>
				<div class="bottom"></div>
				<div class="top">提现记录</div>
				<div class="middle">
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<th>操作信息</th>
							<th>提现金额</th>
							<th>备注</th>
							<th>实发金额</th>
							<th>日期</th>
							<th>状态</th>
						</tr>
						<#list pager.result as withdraw>
							<tr>
								<td>
									
										${withdraw.message}
									
								</td>
								<td>
									
										${withdraw.money?string(currencyFormat)}
									
								</td>
								<td>
									
										${withdraw.memo}
									
								</td>
								<td>
									
										${withdraw.totalMoney?string(currencyFormat)}
									
								</td>
								<td>
									<span title="${withdraw.createDate?string("yyyy-MM-dd HH:mm:ss")}">${withdraw.createDate}</span>
								</td>
								<td>
									[${action.getText("WithdrawStatus." + withdraw.withdrawStatus)}]
								</td>
							</tr>
						</#list>
					</table>
					<div class="blank"></div>
					<@pagination pager=pager baseUrl="/card/withdraw!list.action">
         				<#include "/WEB-INF/template/card/pager.ftl">
         			</@pagination>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
</body>
</html>