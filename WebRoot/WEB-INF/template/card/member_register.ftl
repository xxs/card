<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员注册<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (article.metaKeywords)! != ""><meta name="keywords" content="${article.metaKeywords}" /></#if>
<#if (article.metaDescription)! != ""><meta name="description" content="${article.metaDescription}" /></#if>

<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>

<#include "/WEB-INF/template/card/head.ftl">
<script type="text/javascript">
	$().ready(function() {
			var $registerForm = $("#registerForm");
			var $registerMemberUsername = $("#registerMemberUsername");
			var $registerMemberPassword = $("#registerMemberPassword");
			var $registerReMemberPassword = $("#registerReMemberPassword");
			var $registerMemberEmail = $("#registerMemberEmail");
			var $registerMemberReferrer = $("#registerMemberReferrer");
			var $registerCaptcha = $("#registerCaptcha");
			var $registerCaptchaImage = $("#registerCaptchaImage");
			var $registerIsAgreeAgreement = $("#registerIsAgreeAgreement");
			var $registerShowAgreement = $("#registerShowAgreement");
			var $submitButton = $("#submitButton");
			
			// 刷新验证码图片
			$registerCaptchaImage.click( function() {
				$registerCaptchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
			});
			
			$registerShowAgreement.click( function() {
				$.showAgreement();
			});
			
			// 表单验证
			$submitButton.click( function() {
				if ($.trim($registerMemberUsername.val()) == "") {
					$registerMemberUsername.focus();
					$.dialog({type: "warn", content: "请输入用户名!"});
					return false;
				}
				if (!/^[\u0391-\uFFE5\w]+$/.test($registerMemberUsername.val())) {
					$registerMemberUsername.focus();
					$.dialog({type: "warn", content: "用户名只允许包含中文、英文、数字和下划线!"});
					return false;
				}
				if ($.trim($registerMemberUsername.val()).length < 2 || $.trim($registerMemberUsername.val()).length > 20) {
					$registerMemberUsername.focus();
					$.dialog({type: "warn", content: "用户名长度只允许在2-20之间!"});
					return false;
				}
				if ($.trim($registerMemberPassword.val()) == "") {
					$registerMemberPassword.focus();
					$.dialog({type: "warn", content: "请输入密码!"});
					return false;
				}
				if ($.trim($registerMemberPassword.val()).length < 4 || $.trim($registerMemberPassword.val()).length > 20) {
					$registerMemberPassword.focus();
					$.dialog({type: "warn", content: "密码长度只允许在4-20之间!"});
					return false;
				}
				if ($.trim($registerReMemberPassword.val()) == "") {
					$registerReMemberPassword.focus();
					$.dialog({type: "warn", content: "请输入重复密码!"});
					return false;
				}
				if ($.trim($registerReMemberPassword.val()) != $.trim($registerMemberPassword.val())) {
					$registerReMemberPassword.focus();
					$.dialog({type: "warn", content: "两次密码输入不相同!"});
					return false;
				}
				if ($.trim($registerMemberEmail.val()) == "") {
					$registerMemberEmail.focus();
					$.dialog({type: "warn", content: "请输入E-mail!"});
					return false;
				}
				if (!/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test($registerMemberEmail.val())) {
					$registerMemberEmail.focus();
					$.dialog({type: "warn", content: "E-mail格式错误!"});
					return false;
				}
				if ($.trim($registerMemberReferrer.val()) == "") {
					$registerMemberReferrer.focus();
					$.dialog({type: "warn", content: "请输入推荐人!"});
					return false;
				}
				if ($.trim($registerCaptcha.val()) == "") {
					$registerCaptcha.focus();
					$.dialog({type: "warn", content: "请输入验证码!"});
					return false;
				}
				if (!$registerIsAgreeAgreement.attr("checked")) {
					$registerIsAgreeAgreement.focus();
					$.dialog({type: "warn", content: "注册前必须阅读并同意《注册协议》!"});
					return false;
				}
				$.ajax({
						url: xxs.base + "/card/member!checkUsername.action",
						data: {"member.username": $registerMemberUsername.val()},
						type: "POST",
						cache: false,
						success: function(data) {
							if (data == "true") {
								$.ajax({
									url: xxs.base + "/card/member!checkReferrer.action",
									data: {"member.referrer": $registerMemberReferrer.val()},
									type: "POST",
									cache: false,
									success: function(data) {
										if (data == "true") {
											$.ajax({
												url: xxs.base + "/card/member!ajaxRegister.action",
												data: $registerForm.serialize(),
												type: "POST",
												dataType: "json",
												cache: false,
												success: function(data) {
													if (data.status == "success") {
														$.dialog({type: data.status, content: data.message});
														window.location.href ="${base}/card/member_center!index.action";
													}else{
														$.dialog({type: data.status, content: data.message});
														$registerCaptchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
														return false;
													}
												}
											});
											return false;
										} else {
											$registerMemberUsername.focus();
											$.dialog({type: "warn", content: "推荐人不存在,请重新输入!"});
											$registerCaptchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
											return false;
										}
									}
								});
								//return false;
							} else {
								$registerMemberUsername.focus();
								$.dialog({type: "warn", content: "用户名已存在,请重新输入!"});
								$registerCaptchaImage.attr("src", xxs.base + "/captcha.jpeg?timestamp" + (new Date()).valueOf());
								return false;
							}
						}
					});
			});
		
		$.showAgreement = function() {
			if ($("#agreement").length == 0) {
				var agreementHtml = '<div id="agreementContent" class="agreementContent"></div>';
				
				function agreeAgreement() {
					var $registerIsAgreeAgreement = $("#registerIsAgreeAgreement");
					$registerIsAgreeAgreement.attr("checked", true);
				}
			
				$.dialog({title: "注册协议", content: agreementHtml, ok: "同 意", cancel: "取 消", id: "agreement", className: "agreement", width: 520, okCallback: agreeAgreement});
				
				var $agreementContent = $("#agreementContent");
				
				$.ajax({
					url: xxs.base + "/html/register_agreement.html",
					datatype: "html",
					beforeSend: function(data) {
						$agreementContent.html('<span class="loadingIcon">&nbsp;</span> 加载中...');
					},
					success: function(data) {
						$agreementContent.html(data);
					}
				});
			}
		}
});
</script>
</head>
<body class="login">
	<#include "/WEB-INF/template/card/header.ftl">

<div class="column">
	<div class="column_left">
		<div class="column_left_1">
			<a href="reg.html">免费注册</a>
			<a href="findpassword.html">找回密码</a>
			<a href="login.html">立刻登陆</a>
        </div>
        <ul>
			<@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a"  count=6; articleList>
				<#list articleList as article>
					<li class="number${article_index + 1}">
						<a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a>
					</li>
				</#list>
			</@article_list>		
        </ul>
        <div class="column_left_3">
        	<dl>
            	<span>帮助中心</span>
                <dt>
                <@article_list type="hot"  article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList>
					<#list articleList as article>
						<img src="/template/card/images/${article.title}.png" width="16" height="16" alt="${article.title}" />
					</#list>
				</@article_list>
                </dt>
                <@article_list type="hot" article_category_id="4028bc743c286bdc013c289277c5000a"  count=5; articleList>
					<#list articleList as article>
						<dd><a href="${base}${article.htmlPath}" title="${article.title}">${substring(article.title, 10, "...")}</a></dd>
					</#list>
				</@article_list>
        	</dl>
        </div>
    </div>
    <div class="column_right">
        <div class="column_right_2" style="height:550px;">
        	<div class="column_right_2_shang">
            	<span>
                <font>免费注册</font>
                </span>
            </div>     
        <form id="registerForm" autocomplete="off" action="${base}/card/member!ajaxRegister.action">
        <ol id="need">
			<li><label class="email">&nbsp;&nbsp;&nbsp;&nbsp;用户名：</label>
				<input type="text" id="registerMemberUsername" name="member.username" class="formText" title="用户名只允许包含中文、英文、数字和下划线!" />*
				<dfn>登陆时使用，长度为6-18位，用数字，字母或"_"</dfn>
			</li>
			<li>
				<label class="new_password">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;码：</label> 
				<input type="password" id="registerMemberPassword" name="member.password" class="formText" />*
				<dfn>（密码长度为6~20位数字，字母或符号组合）</dfn>
			</li>
			<li>
				<label class="rePassword">&nbsp;重复密码：</label> 
				<input type="password" id="registerReMemberPassword" name="reMemberPassword" class="formText" title="密码长度只允许在4-20之间!" />*
			</li>
			<li>
				<label class="email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;箱：</label> 
				<input type="text" id="registerMemberEmail" name="member.email" class="formText" />*
				<dfn>（修改密码或通知使用，请认真填写）</dfn>
			</li>
			<li>
				<label class="email">&nbsp;&nbsp;&nbsp;&nbsp;推荐人：</label> 
				<input type="text" id="registerMemberReferrer" name="member.referrer" value="${(member.username)!}" class="formText" title="填写后不能修改!"/>（选填）
				<dfn>卖卡后，推荐人可获奖励，推广赚钱！</dfn>
			</li>
			<li>
				<div class="ssh3"><label class="email">&nbsp;&nbsp;&nbsp;&nbsp;验证码：</label></div>
				<div class="ssh"><input type="text" id="registerCaptcha" name="j_captcha" class="formText captcha" style="width:90px"/></div>
				<div class="ssh1"><img id="registerCaptchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" /></div>
				<dfn>输入图片中的验证码</dfn>
			</li>
		</ol>
 		<div class="anniu">
 			<input type="button" value="注 册" id="submitButton" class="button" hidefocus/>
 			<input type="reset" value="重新填写" class="button" style="margin-left:30px;" />
 		</div>
 		<div style="margin:10px 0px 10px 120px;">
			<p>
				<input type="checkbox" id="registerIsAgreeAgreement" name="isAgreeAgreement" value="true" checked />我已阅读并同意《名臣福利充值卡回收协议明细》
			</p>
			<br />
			<p>
				<textarea style="width:410px;height:71px;"readonly="readonly" cols="100" rows="5" overflow-x="hidden" overflow-y="scroll">
"名臣福利充值卡回购服务"（以下简称本服务）是由名臣福利网站（以下简称本网站）向名臣福利网站用户提供的中国移动/中国联通/中国电信手机充值卡回购服务。本协议由您和本网站签订。

一、 声明与承诺
（一） 您确认，在您注册成为名臣福利网站用户以接受本服务之前，你已充分阅读、理解并接受本协议的全部内容，一旦您使用本服务，即表示您同意遵循本协议之所有约定。
（二） 您同意，本网站有权随时对本协议内容进行单方面的变更，并以在本网站公告的方式予以公布，无需另行单独通知您；若您在本协议内容公告变更后继续使用本服务的，表示您已充分阅读、理解并接受修改后的协议内容，也将遵循修改后的协议内容使用本服务；若您不同意修改后的协议内容，您应停止使用本服务。
（三） 您声明，在您同意接受本协议并注册成为名臣福利网站用户时，您是具有法律规定的完全民事权利能力和民事行为能力，能够独立承担民事责任的自然人、法人或其他组织；本协议内容不受您所属国家或地区的排斥。不具备前述条件的，您应立即终止注册或停止使用本服务。

二、 "名臣福利充值卡回购服务"概要
（一） 名臣福利网站账户：指在您使用本服务时，本网站向您提供的唯一编号。您可自行设置密码，并用以查询或计量您的交易订单。名臣福利网站账户同时对应您自己在本网站填写的银行卡账号/账户名称/开户银行/支付宝账户等信息（以下简称银行账户信息）。
（二） 充值卡：中国移动、中国联通和中国电信发行的全国范围通用的未使用并且在有效期内的手机充值卡。
（三） 充值卡回购服务：即本网站向您提供的中国移动/中国联通/中国电信手机充值卡回购服务，其中包含
1、 提交充值卡卡号和密码：您可以使用本服务指定的方式把您拥有的手机充值卡卡号和密码提交给本网站的在线系统，以便验证手机充值卡的有效性，并且完成充值卡回购。由于充值卡的特殊性，该提交过程可能是不可逆的，因此，请在提交前仔细阅读本网站及关联系统的提示，并且按照要求进行操作。
2、 接收充值卡回购款项：在您成功提交充值卡卡号和密码以后，请您与本网站的在线客服联络，并提供您在本网站的账户名称和交易订单号，本网站将按照订单约定的金额向当时您在本网站保存的银行账户信息给您汇款支付回购款项。
3、 查询：本网站将对您在本网站中的所有操作进行记录，不论该操作之目的最终是否实现。您可以在本网站中实时查询您的交易记录，您认为记录有误的，本网站将向您提供本网站已按照您的指示操作的记录。您理解并同意您最终收到款项的服务是由您提供的银行账户对应的银行提供的，您需向该银行请求查证。

三、 名臣福利网站账户
（一） 注册相关
在使用本服务前，您必须先行注册，取得本网站提供给您的"名臣福利网站账户"（以下简称该账户），您同意：
1、 依本服务注册表之提示准确提供并在取得该账户后及时更新您的正确、最新及完整的资料。若有合理理由怀疑您提供的资料错误、不实、过时或不完整的，本网站有权暂停或终止向您提供部分或全部服务。本网站对此不承担任何责任，您将承担因此产生的任何直接或间接损失。
2、 因您未及时更新资料，导致本服务无法提供或提供时发生任何错误，您不得将此作为取消交易、拒绝付款的理由，您将承担因此产生的一切后果，本网站不承担任何责任。
3、 您应对您的名臣福利网站账户负责，只有您本人可以使用您的名臣福利网站账户，该账户不可转让、不可赠与、不可继承。在您决定不再使用该账户时，您应向本网站申请将该账户下所对应的未打款订单进行处理，并向本网站申请注销（永久冻结）该账户。
您同意，若您丧失全部或部分民事权利能力或民事行为能力，本网站有权根据有效法律文书（包括但不限于生效的法院判决、生效的遗嘱等）处置与您的名臣福利网站账户相关的款项。
（二） 账户安全
您将对使用该账户及密码进行的一切操作及言论负完全的责任，您同意：
1、本网站通过您的用户名和密码识别您的指示，请您妥善保管您的用户名和密码，对于因密码泄露所致的损失，由您自行承担。您保证不向其他任何人泄露该账户及密码，亦不使用其他任何人的"名臣福利网站账户"及密码。
2、 如您发现有他人冒用或盗用您的账户及密码或任何其他未经合法授权之情形时，应立即以有效方式通知本网站，要求本网站暂停相关服务。同时，您理解本网站对您的请求采取行动需要合理期限，在此之前，本网站对已执行的指令及(或)所导致的您的损失不承担任何责任。
3、 交易异常处理：您使用本服务时，可能由于银行本身系统问题、银行相关作业网络连线问题或其他不可抗拒因素，造成本服务无法提供。您确保您所输入的您的资料无误，如果因资料错误造成本网站于上述异常状况发生时，无法及时通知您相关交易后续处理方式的，本网站不承担任何损害赔偿责任。
4、 您同意，基于运行和交易安全的需要，本网站可以暂时停止提供或者限制本服务部分功能，或提供新的功能，在任何功能减少、增加或者变化时，只要您仍然使用本服务，表示您仍然同意本协议或者变更后的协议。

四、 "充值卡回购服务"使用规则
为有效保障您使用本服务进行交易时的合法权益，您理解并同意接受以下规则：
（一）  一旦您使用本服务，您即授权本网站及其关联系统接收您输入的充值卡卡号和密码，并且在充值卡卡号和密码回购成功以后，向您在本网站输入的银行账户信息付款。 
（二）  本网站及其关联系统接收您输入的充值卡卡号和密码进行充值卡回购时，该过程可能不可逆转，您不能在完整的提交了充值卡卡号和密码造成充值卡失效后，申请取消交易。
（三） 本网站在成功回购您的充值卡以后，会按照订单约定金额向您在本网站输入的银行账户信息汇款支付回购款项。一旦本网站完成支付后，该支付过程无法取消或者更改。您不能要求本网站向其他银行账户支付充值卡回购款项。
（四）  您在使用本服务过程中，本协议内容、网页上出现的关于交易操作的提示或本网站发送到您手机的信息（短信或电话等）或者电子邮箱的内容是您使用本服务的相关规则，您使用本服务即表示您同意接受本服务的相关规则。您了解并同意本网站单方修改服务的相关规则，而无须征得您的同意，服务规则应以您使用服务时的页面提示（或发送到该手机的短信或电话，发送到电子邮箱的电子邮件等）为准，您同意并遵照服务规则是您使用本服务的前提。 
（五）  本网站会以电子邮件（或发送到该手机的短信或电话等）方式通知您交易进展情况以及提示您进行下一步的操作，但本网站不保证您能够收到或者及时收到该邮件（或发送到该手机的短信或电话等），且不对此承担任何后果，因此，在交易过程中您应当及时登录到本网站查看和进行交易操作。因您没有及时查看和对交易状态进行修改或确认或未能提交相关申请而导致的任何纠纷或损失，本网站不负任何责任。
（六）  本网站不会事先对您的充值卡卡号和密码提供任何形式的鉴定、证明服务。您的充值卡卡号和密码的有效性，只有在您通过本网站及关联系统提交时才进行验证和处理。您授权本网站及关联系统（第三方平台等）作为本服务中对充值卡卡号和密码进行验证和回购的唯一机制。您声明放弃因为充值卡卡号和密码的有效性问题与本网站产生的任何交易纠纷。
（七）  如果您在本网站填写的银行账户信息有误，相应回购款项将无法划汇给您，您授权本网站暂时代为保管该款项，直到您与本网站联系并更新银行账户信息。
（八）  您声明已经充分理解充值卡回购服务，并且同意该服务与现实生活中的充值卡回购/收购服务类似。
（九）  本网站为支持公益事业而进行的捐助为本网站的自愿行为，与您使用本服务应得的回购款项无关。 
（十）  本网站并非银行或其它金融机构，本服务也非金融业务，本协议项下的资金移转均通过银行来实现，你理解并同意您的资金于流转途中的合理时间。 
（十一）  您完全承担您使用本服务期间由本网站保管的款项的货币贬值风险及可能的孳息损失。
（十二）在您注册成为名臣福利网站用户时，您授权本网站通过银行或向第三者审核您的身份和资格。
（十三）您使用本服务进行交易或使用该账户登陆其他支持本服务的网站时，您即授权本网站将您的个人信息和交易信息披露给与您交易的另一方或您登陆的网站，该信息包括但不限于：您的真实姓名、联系方式、银行账户等。
（十四）您不得将本服务用于非本网站许可的其他用途。 
（十五）交易风险 
1）在使用本服务时，若您未遵从本服务条款或网站说明、交易页面中之操作提示、规则），则本网站有权拒绝为您提供相关服务，且本网站不承担损害赔偿责任。
2）因您的过错导致的任何损失由您自行承担，该过错包括但不限于：不按照交易提示操作，未及时进行交易操作，遗忘或泄漏密码，密码被他人破解，您使用的计算机被他人侵入。
（十六）服务费用
1）在您使用本服务时，本网站有权依照"订单标明的规则"向您收取服务费用。本网站拥有制订及调整服务费之权利，具体服务费用以您使用本服务时本网站上所列之收费方式公告或您与本网站达成的其他书面协议为准。
2）除非另有说明或约定，您同意本网站有权自您委托本网站代管的款项中直接扣除上述服务费用。
（十七）本服务所涉及到的任何款项只以人民币计结，不提供任何形式的汇兑业务。


五、 "充值卡回购"使用限制
（一） 您在使用本服务时应遵守中华人民共和国相关法律法规、您所在国家或地区之法令及相关国际惯例，不将本服务用于任何非法目的（包括用于禁止或限制交易物品的交易），也不以任何非法方式使用本服务。
（二） 您不得利用本服务从事侵害他人合法权益之行为，否则本网站有权拒绝提供本服务，且您应承担所有相关法律责任，因此导致本网站或本网站雇员受损的，您应承担赔偿责任。上述行为包括但不限于：
1、侵害他人名誉权、隐私权、商业秘密、商标权、著作权、专利权等合法权益。
2、违反依法定或约定之保密义务。
3、冒用他人名义使用本服务。
4、从事不法交易行为，如洗钱、贩卖枪支、毒品、禁药、盗版软件、黄色淫秽物品、其他本网站认为不得使用本服务进行交易的充值卡等。
5、提供赌博资讯或以任何方式引诱他人参与赌博。
6、非法使用他人银行账户（包括信用卡账户）或无效银行账号（包括信用卡账户）交易。
7、违反《银行卡业务管理办法》使用银行卡，或利用信用卡套取现金（以下简称套现）。
8、进行与您宣称的交易内容不符的交易，或不真实的交易。
9、从事任何可能含有电脑病毒或是可能侵害本服务系统、资料之行为。
10、其他本网站有正当理由认为不适当之行为。
（三） 您理解并同意，本网站不对因下述任一情况导致的任何损害赔偿承担责任，包括但不限于利润、商誉、使用、数据等方面的损失或其他无形损失的损害赔偿 (无论本网站是否已被告知该等损害赔偿的可能性)：
1、 本网站有权基于单方判断，包含但不限于本网站认为您已经违反本协议的明文规定及精神，暂停、中断或终止向您提供本服务或其任何部分，并移除您的资料。
2、 本网站在发现异常交易或有疑义或有违反法律规定或本协议约定之虞时，有权不经通知先行暂停或终止该账户的使用（包括但不限于对该账户名下的款项和在途交易采取取消交易等限制措施），并拒绝您使用本服务之部分或全部功能。
3、 在必要时，本网站无需事先通知即可终止提供本服务，并暂停、关闭或删除该账户及您账号中所有相关资料及档案，并将您滞留在该账户的全部合法资金退回到您的银行账户。
（四） 如您需要注销（永久冻结）您的名臣福利网站账户，应先经本网站审核同意。本网站注销（永久冻结）该账户，即表明本网站与您之间的协议已解除，但您仍应对您使用本服务期间的行为承担可能的违约或损害赔偿责任，同时本网站仍可保有您的相关信息。

六、隐私权保护
一旦您同意本协议或使用本服务，您即同意本网站按照以下条款来使用和披露您的个人信息。
（一）  未成年人的特别注意事项 
在阅读本协议以注册名臣福利网站用户时，您尚未满18周岁的，您不能使用本服务，请您终止您的注册行为，不要向我们提供您的任何个人信息。
（二）  用户名和密码
在您注册为名臣福利网站用户时，我们会要求您设置用户名和密码来识别您的身份，并通过您填写的电子邮件地址在您丢失密码时用以确认您的身份。您仅可通过您设置的密码来使用该账户，如果您泄漏了密码，您可能会丢失您的个人识别信息，并可能导致对您不利的法律后果。该账户和密码因任何原因受到潜在或现实危险时，您应该立即和本网站取得联系，在本网站采取行动前，本网站对此不负任何责任。
（三）  注册信息 
您注册该账户时应向本网站提供您的真实银行账户信息、QQ和电子邮件地址，您还可以选择来填写相关附加信息（包括但不限于您所在的省份和城市、时区和邮政编码、传真号码、个人主页和您的职务）。为有针对性地向您提供新的服务和机会，您了解并同意本网站及其关联网站或您登录的其他网站将通过您的电子邮件地址或该手机通知您这些信息。
（四）  银行账户信息 
本网站所提供的服务将需要您提供您的银行账户信息，在您提供相应信息后，本网站将严格履行相关保密约定。
（五）  交易行为 
为了保障您使用本服务的安全以及不断改进服务质量，本网站将记录并保存您登录和使用本服务的相关信息，但本网站承诺不将此类信息提供给任何第三方（除双方另有约定或法律法规另有规定及本网站关联网站外）。
（六）  广告 
本网站会对名臣福利网站用户的身份数据进行综合统计，并出于销售和奖励的需要使用或披露。
（七）  Cookie的使用 
您了解并同意，本网站使用cookie来使本网站对用户更友好，它可以帮您省去为使用我们的服务而重复输入注册信息和跟踪您的浏览器的状态。
（八）为更为有效的向您提供服务，您同意，本网站有权将您注册及使用本服务过程中所提供、形成的信息提供给本网站关联网站。除本协议另有规定外，本网站不对外公开或向第三方提供您的信息，但以下情况除外： 
A、事先获得您的明确授权； 
B、只有披露您的个人资料，才能提供您需要的产品和（或）服务； 
C、按照本协议的要求进行的披露； 
D、根据法律法规的规定； 
E、按照政府主管部门的要求； 
F、为维护本网站及其关联网站的合法权益； 
I、您使用名臣福利网站账户成功登录过的其他网站。
（九）  信息的存储和交换 
您的信息和资料存储在位于中国的服务器上，为了备份的需要，本网站可能将您的信息和资料传送到位于别国的服务器上。
（十）  外部链接 
本网站含有到其他网站的链接，但本网站对其他网站的隐私保护措施不负任何责任。本网站可能在任何需要的时候增加商业伙伴或共用品牌的网站。
（十一）安全 
本网站仅按现有技术提供相应的安全措施来使本网站掌握的信息不丢失，不被滥用和变造。这些安全措施包括向其它服务器备份数据和对用户密码加密。尽管有这些安全措施，但本网站不保证这些信息的绝对安全。

七、 系统中断或故障
系统因下列状况无法正常运作，使您无法使用各项服务时，本网站不承担损害赔偿责任，该状况包括但不限于：
（一） 本网站在本网站公告之系统停机维护期间。
（二） 电信设备出现故障不能进行数据传输的。
（三） 因台风、地震、海啸、洪水、停电、战争、恐怖袭击等不可抗力之因素，造成本网站系统障碍不能执行业务的。
（四） 由于黑客攻击、电信部门技术调整或故障、网站升级、银行方面的问题等原因而造成的服务中断或者延迟。

八、 责任范围及责任限制
（一） 本网站仅对本协议中列明的责任承担范围负责。
（二） 您明确因交易所产生的任何风险应由您承担。
（三） 名臣福利网站用户信息是由用户本人自行提供的，本网站无法保证该信息之准确、及时和完整，您应对您的判断承担全部责任。
（四） 本网站不对充值卡及本服务提供任何形式的保证，包括但不限于以下事项： 
1、本服务符合您的需求。 
2、本服务不受干扰、及时提供或免于出错。 
3、您经由本服务购买或取得之任何产品、服务、资讯或其他资料符合您的期望。 
（五） 本服务之合作单位，所提供之服务品质及内容由该合作单位自行负责。
（六） 您经由本服务之使用下载或取得任何资料，应由您自行考量且自负风险，因资料之下载而导致您电脑系统之任何损坏或资料流失，您应负完全责任。 
（七） 您自本网站及本网站工作人员或经由本服务取得之建议和资讯，无论其为书面或口头形式，均不构成本网站对本服务之保证。
（八） 在法律允许的情况下，本网站对于与本协议有关或由本协议引起的任何间接的、惩罚性的、特殊的、派生的损失（包括业务损失、收益损失、利润损失、使用数据或其他经济利益的损失），不论是如何产生的，也不论是由对本协议的违约（包括违反保证）还是由侵权造成的，均不负有任何责任，即使事先已被告知此等损失的可能性。另外即使本协议规定的排他性救济没有达到其基本目的，也应排除本网站对上述损失的责任。
（九） 除本协议另有规定外，在任何情况下，本网站对本协议所承担的违约赔偿责任总额不超过向您收取的当次服务费用总额。 

九、 完整协议 
你对本协议理解和认同，您即对本协议所有组成部分的内容理解并认同，一旦您使用本服务，你和本网站即受本协议所有组成部分的约束。
本协议部分内容被有管辖权的法院认定为违法的，不因此影响其他内容的效力。 

十、商标、知识产权的保护
（一） 本网站上所有内容，包括但不限于著作、图片、档案、资讯、资料、网站架构、网站画面的安排、网页设计，均由本网站或本网站关联企业依法拥有其知识产权，包括但不限于商标权、专利权、著作权、商业秘密等。
（二） 非经本网站或本网站关联企业书面同意，任何人不得擅自使用、修改、复制、公开传播、改变、散布、发行或公开发表本网站程序或内容。
（三） 尊重知识产权是您应尽的义务，如有违反，您应承担损害赔偿责任。
（四）本网站提到的其他商标由各自的商标持有人所有。

十一、法律适用与管辖
本协议之效力、解释、变更、执行与争议解决均适用中华人民共和国法律，没有相关法律规定的，参照通用国际商业惯例和（或）行业惯例。
因本协议产生之争议，均应依照中华人民共和国法律予以处理，并以北京市西城区人民法院为第一审管辖法院。
				</textarea>
			</p>        
         </div>
         </form>
         
         </div>
        </div> 
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/footer.ftl">
</body>
</html>