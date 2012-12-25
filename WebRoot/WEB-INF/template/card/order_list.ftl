<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>订单列表<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/card.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body>
	<#include "/WEB-INF/template/card/member_header.ftl">
	
	
            <#include "/WEB-INF/template/card/member_left_order.ftl">
            <!-------------------------------订单------------------------------------->
<div class="box2">
<div class="title2">最近8条订单</div>
<div class="box00">
<div class="line"></div>
<span>提示：订单如果还在处理中可以点击刷新按钮查看最新订单状态<b><input name="" type="image" src="images/2_btn3.jpg" /></b></span>
<div class="span">
<ul>
<li>充值卡名称</li>
<li>订单编号</li>
<li>下单时间</li>
<li>订单金额</li>
<li>订单状态</li>
<li style="border-right: solid 1px #ddd;">操作</li>
</ul>



<#list pager.result as order>
						<ul >
							<li class="ul222">
									<a href="order!view.action?id=${order.id}">
										<#list order.orderItemSet as productItem>
											<#if productItem_index != 0>、</#if>
											${productItem.productName}
											<#if productItem_index == 3 && productItem_has_next>
												...
												<#break />
											</#if>
										</#list>
									</a>
								</li>
								<li class="ul222">
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</li>
								<li class="ul222">
									
								</li>
								<li class="ul222">
									${order.amount?string(currencyFormat)}
								</li>
								<li class="ul222">
									<#if order.orderStatus != "completed" && order.orderStatus != "invalid">
										[${action.getText("OrderStatus." + order.orderStatus)}]
									<#else>
										[${action.getText("OrderStatus." + order.orderStatus)}]
									</#if>
								</li>
							<li class="ul222" style="border-right: solid 1px #ddd;">查看</li>
				</ul>
</#list>
<span>－_－^..暂无订单记录</span>

</div>


</div>

</div>

</div>
</div>
            <div class="page_content_right sub-content">
            	<table id="wp-calendar">
						<tr>
							<th>充值卡名称</th>
							<th>订单编号</th>
							<th>下单时间</th>
							<th>订单金额</th>
							<th>订单状态</th>
						</tr>
						<#list pager.result as order>
							<tr>
								<td width="350">
									<a href="order!view.action?id=${order.id}">
										<#list order.orderItemSet as productItem>
											<#if productItem_index != 0>、</#if>
											${productItem.productName}
											<#if productItem_index == 3 && productItem_has_next>
												...
												<#break />
											</#if>
										</#list>
									</a>
								</td>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td>
									
								</td>
								<td>
									${order.amount?string(currencyFormat)}
								</td>
								<td>
									<#if order.orderStatus != "completed" && order.orderStatus != "invalid">
										[${action.getText("OrderStatus." + order.orderStatus)}]
									<#else>
										[${action.getText("OrderStatus." + order.orderStatus)}]
									</#if>
								</td>
							</tr>
						</#list>
					</table>
            </div>
            <!-- END of page_content-->
         </div>
         <!-- END main-wrap -->
      </section>
      <!-- END content-container -->
      
      
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
	                        	<li class="current"><a href="order!list.action">我的订单</a></li>
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
				<div class="top">订单列表</div>
				<div class="middle">
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<th>充值卡名称</th>
							<th>订单编号</th>
							<th>下单时间</th>
							<th>订单金额</th>
							<th>订单状态</th>
						</tr>
						<#list pager.result as order>
							<tr>
								<td width="350">
									<a href="order!view.action?id=${order.id}">
										<#list order.orderItemSet as productItem>
											<#if productItem_index != 0>、</#if>
											${productItem.productName}
											<#if productItem_index == 3 && productItem_has_next>
												...
												<#break />
											</#if>
										</#list>
									</a>
								</td>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td>
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
								</td>
								<td>
									${order.amountPayable?string(currencyFormat)}
								</td>
								<td>
									<#if order.orderStatus != "completed" && order.orderStatus != "invalid">
										[${action.getText("PaymentStatus." + order.paymentStatus)}]
										[${action.getText("ShippingStatus." + order.shippingStatus)}]
									<#else>
										[${action.getText("OrderStatus." + order.orderStatus)}]
									</#if>
								</td>
							</tr>
						</#list>
					</table>
					<div class="blank"></div>
					<@pagination pager=pager baseUrl="/card/order!list.action">
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