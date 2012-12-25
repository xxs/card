<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员注册<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link href="${base}/template/card/css/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${base}/template/card/js/jquery.js"></script>
<#include "/WEB-INF/template/card/head.ftl">
</head>
<body>
<#include "/WEB-INF/template/card/header.ftl">
<br><p align="center">名臣福利注册页面</p>
<div id="formbox">
	<form id="formpersonal" method="post" onsubmit="return false;">
	<div class="form">
		<h3>会员信息</h3>
		<div class="item">
			<span class="label"><span class="red">*</span>用户名：</span>
			<div class="fl">
				<input type="text" id="username" name="username" class="text" tabindex="1" />
				<label id="username_succeed" class="blank"></label>
				<span class="clear"></span>
				<div id="username_error"></div>
			</div>
		</div><!--item end-->
		
		<div id="o-password">
			<div class="item">
				<span class="label"><span class="red">*</span>设置密码：</span>
				<div class="fl">
					<input type="password" id="pwd" name="pwd" class="text" tabindex="2"/>
					<label id="pwd_succeed" class="blank"></label>
					<input type="checkbox" class="checkbox" id="viewpwd"/>
					<label class="ftx23" for="viewpwd">显示密码字符</label>
					<span class="clear"></span>
					<label class="hide" id="pwdstrength"><span class="fl">安全程度：</span><b></b></label>
					<label id="pwd_error"></label>
				</div>
			</div><!--item end-->
			
			<div class="item">
				<span class="label"><span class="red">*</span>确认密码：</span>
				<div class="fl">
					<input type="password" id="pwd2" name="pwd2" class="text" tabindex="3"/>
					<label id="pwd2_succeed" class="blank"></label>
					<span class="clear"></span>
					<label id="pwd2_error"></label>
				</div>
			</div><!--item end-->
			
		</div><!--o-password end-->
		
		<div class="item">
			<span class="label"><span class="red">*</span>邮箱：</span>
			<div class="fl">
				<input type="text" id="mail" name="mail" class="text" tabindex="4"/>
				<label id="mail_succeed" class="blank"></label>
				<span class="clear"></span>
				<div id="mail_error"></div>
			</div>
		</div><!--item end-->
		
		<div class="item">
			<span class="label">推荐人用户名：</span>
			<div class="fl">
				<input type="text" id="referrer" name="referrer" class="text" value="${(member.referrer)!""}" tabindex="5" />
				<label id="referrer_succeed" class="blank invisible"></label>
				<span class="clear"></span>
				<label id="referrer_error"></label>
			</div>
		</div><!--item end-->
		
		<div class="item">
			<span class="label"><span class="red">*</span>验证码：</span>
			<div class="fl">
				<input type="text" id="authcode" name="authcode" class="text text-1" autocomplete="off" MaxLength="6" tabindex="6" />
				<label class="img"><img id="JD_Verification1" Ver_ColorOfNoisePoint="#888888" src="http://www.mailuke.com/Inc/Code/adminCode.php?sesstr=regCode" onClick="chanageCode('regCode')" alt="" style="cursor:pointer;width:100px;height:26px;"/>
				</label>
				<label>&nbsp;看不清？点击验证码图片更换</label>
				<label id="authcode_succeed" class="blank invisible"></label>
				<span class="clear"></span>
				<label id="authcode_error"></label>
			</div>
		</div><!--item end-->
	
		<h3>收款账户信息</h3>
		<div class="item">
			<span class="label"><span class="red">*</span>银行卡号：</span>
			<div class="fl">
				<input type="text" id="realname" name="realname" class="text" tabindex="7"/>
				<label id="realname_succeed" class="blank"></label>
				<span class="clear"></span>
				<label id="realname_error"></label>
			</div>
		</div><!--item end-->
		
		<div class="item">
			<span class="label"><span class="red">*</span>开户姓名：</span>
			<div class="fl">
				<input type="text" id="realname" name="realname" class="text" tabindex="7"/>
				<label id="realname_succeed" class="blank"></label>
				<span class="clear"></span>
				<label id="realname_error"></label>
			</div>
		</div><!--item end-->
		<div class="item">
			<span class="label"><span class="red">*</span>开户银行：</span>
			<div class="fl">
				<select rel="select" id="department" name="department" tabindex="8">
					<option value="-1"  >请选择</option>
					<option value="1"  >建设银行</option>
					<option value="2"  >农业银行</option>
					<option value="3"  >工商银行</option>
				</select>
				<label id="department_succeed" class="blank"></label>
				<span class="clear"></span>
				<label id="department_error"></label>
			</div>
		</div><!--item end-->
		<div class="item">
			<span class="label"><span class="red">*</span>支行名称：</span>
			<div class="fl">
				<input type="text" id="realname" name="realname" class="text" tabindex="7"/>
				<label id="realname_succeed" class="blank"></label>
				<span class="clear"></span>
				<label id="realname_error"></label>
			</div>
		</div><!--item end-->
	
		<div class="item">
			<span class="label">&nbsp;</span>
			<div class="fl">
				<input type="checkbox" name="protocol" id="protocol" tabindex="7" /><label for="protocol">网站用户注册协议</label>
			</div>
		</div><!--item end-->
		
		<div class="item">
			<span class="label">&nbsp;</span>
			<input type="button" class="yellow_button disabled" id="registsubmit" value="提交注册信息" tabindex="8" disabled="disabled" />
		</div><!--item end-->
		
	</div>
	</form>
	<#include "/WEB-INF/template/card/footer.ftl">
</div><!--formbox end-->
<script type="text/javascript" src="${base}/template/card/js/Validate.js"></script>
<script type="text/javascript" src="${base}/template/card/js/Validate.form.js"></script>
</body>
</html>