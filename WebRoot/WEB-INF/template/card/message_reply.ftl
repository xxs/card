<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>回复消息<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
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
	var $messageForm = $("#messageForm");
	
	// 表单验证
	$messageForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"message.title": "required",
			"message.content": "required"
		},
		messages: {
			"message.title": "请填写标题",
			"message.content": "请填写消息内容"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
});
</script>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/header.ftl">
	<div class="body messageReply">
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
	                        	<li class="current"><a href="message!send.action">发送消息</a></li>
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
	                        	<li><a href="deposit!recharge.action">预存款充值</a></li>
	                        </ul>
	                    </li>
	                </ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="memberCenterDetail">
				<div class="top">回复消息</div>
				<div class="middle">
					<div id="validateErrorContainer" class="validateErrorContainer">
						<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
						<ul></ul>
					</div>
					<div class="blank"></div>
					<form id="messageForm" action="message!save.action" method="post">
						<input type="hidden" name="toMemberUsername" value="${(message.fromMember.username)!}" />
						<table class="inputTable">
							<tr>
								<th>
									收件人: 
								</th>
								<td>
									${(message.fromMember.username)!"管理员"}
								</td>
							</tr>
							<tr>
								<th>
									标题: 
								</th>
								<td>
									<input type="text" name="message.title" class="formText" value="${message.title}" />
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									内容: 
								</th>
								<td>
									<textarea name="message.content" class="formTextarea" rows="5" cols="50">${message.content}</textarea>
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									选项: 
								</th>
								<td>
									<label><input type="radio" name="message.isSaveDraftbox" value="false" checked>立即发送</label>
									<label><input type="radio" name="message.isSaveDraftbox" value="true">保存到草稿箱</label>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									<input type="submit" class="submitButton" value="提 交" hidefocus />
								</td>
							</tr>
						</table>
					</form>
					<div class="blank"></div>
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