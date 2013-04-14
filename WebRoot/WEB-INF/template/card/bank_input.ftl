<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>添加/编辑账户信息<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript">
$().ready( function() {
		var $bankForm = $("#bankForm");
		var $username = $("#username");
		var $banknum = $("#banknum");
		var $openname = $("#openname");
		var $bankname = $("#bankname");
		var $bankcity = $("#bankcity");
		var $banddetail = $("#banddetail");
		$bankname.change(function(){
			if($.trim($bankname.val()) == '支付宝'){
				$banddetail.val("支付宝");
			}
			if($.trim($bankname.val()) == '财付通'){
				$banddetail.val("财付通");
			}
		});
		// 表单验证
		$bankForm.submit( function() {
			if ($.trim($username.val()) == "") {
				$.dialog({type: "warn", content: "请输入会员名!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($bankname.val()) == "") {
				$.dialog({type: "warn", content: "请选择所属银行!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($bankcity.val()) == "") {
				$.dialog({type: "warn", content: "请选择银行归属地!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($banknum.val()) == "") {
				$.dialog({type: "warn", content: "请输入银行账号!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($openname.val()) == "") {
				$.dialog({type: "warn", content: "请输入开户姓名!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($banddetail.val()) == "") {
				$.dialog({type: "warn", content: "请输入所属支行!", modal: true, autoCloseTime: 3000});
				return false;
			}
		});
	
});
</script>
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<!-- common begin -->
		<div class="common">
			<div class="panel-1">
				<h2>修改登陆密码</h2>
				<div class="account_info">
	        		<form id="bankForm" action="<#if isAddAction>bank!save.action<#else>bank!update.action</#if>" method="post">
						<table class="inputTable">
							<input type="hidden" name="memberBank.id" value="${id}" />
							<tr>
								<th>
									所属会员名: 
								</th>
								<td>
									<input type="hidden" id="username" name="memberBank.member.username" value="${loginMember.username}" />
									${loginMember.username}
								</td>
							</tr>
							<tr>
								<th>
									所属银行: 
								</th>
								<td>
									<select id="bankname" name="memberBank.bankname" class="formText" >
										<#if (memberBank.bankname)??><option value="${(memberBank.bankname)!}">${(memberBank.bankname)!}</option></#if>
										<option value="">--请选择所属银行--</option>
										<option value="支付宝">支付宝</option>	
										<option value="财付通">财付通</option>
										<option value="工商银行">工商银行</option>
										<option value="农业银行">农业银行</option>
										<option value="建设银行">建设银行</option>
										<option value="中国银行">中国银行</option>
										<option value="交通银行">交通银行</option>
										<option value="招商银行">招商银行</option>
										<option value="光大银行">中国光大银行</option>
										<option value="民生银行">民生银行</option>
										<option value="浦发银行">浦发银行</option>
										<option value="兴业银行">兴业银行</option>
										<option value="深圳发展">深圳发展银行</option>
										<option value="中信银行">中信银行</option>
										<option value="平安银行">平安银行</option>
										<option value="广发银行">广发银行</option>
										<option value="北京银行">北京银行</option>
										<option value="上海银行">上海银行</option>
										<option value="江苏银行">江苏银行</option>
										<option value="北京农商银行">北京农商银行</option>
					                      <option value="江苏农信社">江苏农信社</option>
										<option value="农村信用社">农村信用社</option>
										<option value="邮政储蓄银行">邮政储蓄银行</option>
											
									</select>
									<label class="requireField">尽量选择<font color="red">银行卡</font>结算，财付通、支付宝结算产生的手续费将会从结算金额中扣除*</label>
								</td>
							</tr>
							<tr>
								<th>
									银行归属地: 
								</th>
								<td>
									<select id="bankcity" name="memberBank.bankcity" >
										<#if (memberBank.bankcity)??><option value="${(memberBank.bankcity)!}">${(memberBank.bankcity)!}</option></#if>
										<option value="">--请选择银行归属地--</option>
										<option value="北京市">北京市</option>
										<option value="天津市">天津市</option>
										<option value="河北省">河北省</option>
										<option value="山西省">山西省</option>
										<option value="内蒙古">内蒙古</option>
										<option value="辽宁省">辽宁省</option>
										<option value="吉林省">吉林省</option>
										<option value="黑龙江省">黑龙江省</option>
										<option value="上海市">上海市</option>
										<option value="江苏省">江苏省</option>
										<option value="浙江省">浙江省</option>
										<option value="安徽省">安徽省</option>
										<option value="福建省">福建省</option>
										<option value="江西省">江西省</option>
										<option value="山东省">山东省</option>
										<option value="河南省">河南省</option>
										<option value="湖北省">湖北省</option>
										<option value="湖南省">湖南省</option>
										<option value="广东省">广东省</option>
										<option value="广西">广西</option>
										<option value="海南省">海南省</option>
										<option value="重庆市">重庆市</option>
										<option value="四川省">四川省</option>
										<option value="贵州省">贵州省</option>
										<option value="云南省">云南省</option>
										<option value="西藏">西藏</option>
										<option value="陕西省">陕西省</option>
										<option value="甘肃省">甘肃省</option>
										<option value="青海省">青海省</option>
										<option value="宁夏">宁夏</option>
										<option value="新疆">新疆</option>				
									</select>
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									银行账号: 
								</th>
								<td>
									<input type="text" id="banknum" name="memberBank.banknum" class="formText" value="${(memberBank.banknum)!}" />
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									开户姓名: 
								</th>
								<td>
									<input type="text" id="openname" name="memberBank.openname" class="formText" value="${(memberBank.openname)!}" title="" />
									<label class="requireField">*</label>
								</td>
							</tr>
							<tr>
								<th>
									所属支行: 
								</th>
								<td>
									<input type="text" id="banddetail" name="memberBank.bankdetail" class="formText" value="${(memberBank.bankdetail)!}" title="只允许输入零或正整数" />
									<label class="requireField">格式：xx市支行；(例如“乌鲁木齐市支行”，支付宝和财付通为自动默认)*</label>
								</td>
							</tr>
							<tr>
								<th>
									设置: 
								</th>
								<td>
									<label>
										<@checkbox name="memberBank.isDefault" value="${(memberBank.isDefault)!false}" />  设置为默认
									</label>
								</td>
							</tr>
							<tr>
								<th>
									&nbsp;
								</th>
								<td>
									
									<input type="submit" class="button" value="提   交" hidefocus />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- common end-->
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
</body>
</html>