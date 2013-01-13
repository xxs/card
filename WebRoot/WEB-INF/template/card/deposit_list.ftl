<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>预存款列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="nei">
	<div class="neiLeft">
		<#include "/WEB-INF/template/card/menu_deposit.ftl">
	</div>
	<div class="neiRight">
		<div class="katong">
			<div class="fangz">腾讯一卡通 <a href="#">(设为首选)</a></div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="anniu"><form action="" method="get"><input type="submit" class="QQ" />
			</form></div>
		</div>
		<div class="zuiJin">
		<div class="zuiJinTitle">最近8条订单</div>
		<div class="zuiJinText">
			<div class="tiSi"><div class="din">提示：订单如果还在处理中可以点击刷新按钮查看最新订单状态</div><div class="shuai"><form action="" method="get">
			  <input name="Input" type="button" class="xin"/>
			</form></div></div>
			<div class="clear"></div>
			<div class="biao">
				<div class="biaoTitle">
					<ul>
						<li style="width:147px;">通道类型</li>
						<li style="width:75px;">卡号</li>
						<li style="width:147px;">提交金额</li>
						<li style="width:147px;">成功金额</li>
						<li style="width:74px;">状态</li>
						<li style="width:74px;">说明</li>
						<li style="width:74px;">操作</li>
					</ul>
				</div>
				<div class="biaoText"></div>
			</div>
		</div>
	</div>
	</div>
</div>
<div class="clear"></div>
<div class="bottom">Copyright © 2011-2012 名臣福利 laka5.Com ,Inc. All rights reserved. 版权所有
渝ICP备12000968号 八天科技 渝公网备：50010801500291</div>
	<div class="body orderList">
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
	                    		<li class="current"><a href="deposit!list.action">我的预存款</a></li>
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
				<div class="top">预存款记录 <span class="red">[预存款余额: ${loginMember.deposit?string(currencyFormat)}]</span></div>
				<div class="middle">
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<th>操作类型</th>
							<th>存入金额</th>
							<th>支出金额</th>
							<th>当前余额</th>
							<th>日期</th>
						</tr>
						<#list pager.result as deposit>
							<tr>
								<td>
									<#if (deposit.payment?? && deposit.payment.order??)!>
										<a href="order!view.action?id=${deposit.payment.order.id}">
											${action.getText("DepositType." + deposit.depositType)}
										</a>
									<#else>
										${action.getText("DepositType." + deposit.depositType)}
									</#if>
								</td>
								<td>
									<#if deposit.credit != 0>
										${deposit.credit?string(currencyFormat)}
									<#else>
										-
									</#if>
								</td>
								<td>
									<#if deposit.debit != 0>
										${deposit.debit?string(currencyFormat)}
									<#else>
										-
									</#if>
								</td>
								<td>
									${deposit.balance?string(currencyFormat)}
								</td>
								<td>
									<span title="${deposit.createDate?string("yyyy-MM-dd HH:mm:ss")}">${deposit.createDate}</span>
								</td>
							</tr>
						</#list>
					</table>
					<div class="blank"></div>
					<@pagination pager=pager baseUrl="/card/deposit!list.action">
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