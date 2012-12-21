<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心<#if setting.isShowPoweredInfo> - XXS</#if></title>
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
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	  <!-- START small_banner -->
      <section class="small_banner">
         <div class="center-wrap">
            <p class="page-banner-heading">会员中心首页</p>
            <p class="page-banner-description">This area is super easy to customize. It can include a search bar, custom text or absolutely nothing at all.</p>
            
            <div class="breadcrumbs">
            	<a href="#">首页</a> &rarr; <a href="page-template-homepage-lightbox-hero.html">会员中心</a> &rarr; <span class="current_crumb">Left Nav </span>
            </div>
            <!-- END breadcrumbs -->
         </div>
         <!-- END center-wrap -->
         
         <div class="shadow top"></div>
         <div class="shadow bottom"></div>
         <div class="tt-overlay"></div>
      </section>
      
	<section id="content-container" class="clearfix">
         <div id="main-wrap" class="clearfix">
            <#include "/WEB-INF/template/card/member_left_info.ftl">
            <div class="page_content_right sub-content">
                 <!-- START tabs_type_2 --> 
		         <dl class="tabs_type_2">
		            <dt class="current">单张支付</dt>
		            <dd class="current">
		               <p>面额：<input type="radio" name="1"/>100元
		               			<input type="radio" name="1"/>50元
		               			<input type="radio" name="1"/>30元
		               			<input type="radio" name="1"/>20元
		               			<input type="radio" name="1"/>10元
		               	</p>
		               <p>账号：<input type="text"/></p>
		               <p>密码：<input type="text"/></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a>
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		            </dd>
		            
		            
		            <dt>多张同面额</dt>
		            <dd class="current">
		               <p>每行卡信息支持格式为：“卡号,密码,金额” 或者 “卡号 密码 金额”</p>
		               <p>例如：11925110103023132,111387516814561221 或者 11925110103023132 111387516814561221</p>
		               <p><textarea name="comments" cols="40" rows="3" id="comments"></textarea></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a>
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		            </dd>
		            
		            <dt>多张不同面额</dt>
		            <dd class="current">
		               <p>每行卡信息支持格式为：“卡号,密码,金额” 或者 “卡号 密码 金额”</p>
		               <p>例如：11925110103023132,111387516814561221,10 或者 11925110103023132 111387516814561221 10</p>
		               <p><textarea name="comments" cols="40" rows="3" id="comments"></textarea></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="small green button" target="_self"> 确认提交 </a>
		               <a href="#" class="small white button" target="_self"> 重新填写 </a>	
		               </p>
		            </dd>
		            
		         </dl>
		         <!-- END tabs_type_2 --> 
            </div>
            <!-- END of page_content-->
         </div>
         <!-- END main-wrap -->
      </section>
      <!-- END content-container -->
	
	<div class="body memberCenterIndex">
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
	                        	<li><a href="deposit!recharge.action">预存款充值</a></li>
	                        	<li><a href="withdraw!list.action">预存款提现</a></li>
	                        </ul>
	                    </li>
	                </ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="memberCenterDetail">
				<div class="top">会员中心首页</div>
				<div class="middle">
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<td colspan="4">
								您目前是[${loginMember.memberRank.name}]
								<#if loginMember.memberRank.preferentialScale != 100>
									<span class="red">[优惠百分比: ${loginMember.memberRank.preferentialScale}%]</span>
								</#if>
							</td>
						</tr>
						<tr>
							<th>帐户总积分</th>
							<td>${loginMember.score}</td>
							<th>订单总数量</th>
							<td>
								${loginMember.orderSet?size}&nbsp;&nbsp;
								<a href="order!list.action">[查看订单列表]</a>
							</td>
						</tr>
						<tr>
							<th>预存款余额</th>
							<td>${loginMember.deposit?string(currencyFormat)}</td>
							<th>未读消息数</th>
							<td>
								${unreadMessageCount}&nbsp;&nbsp;
								<a href="message!inbox.action">[查看收件箱]</a>
							</td>
						</tr>
						<tr>
							<th>注册日期</th>
							<td>${loginMember.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
							<th>最后登录IP</th>
							<td>${loginMember.loginIp}</td>
						</tr>
					</table>
					<div class="blank"></div>
					<table class="listTable">
						<tr>
							<th>充值卡名称</th>
							<th>订单编号</th>
							<th>下单时间</th>
							<th>订单金额</th>
							<th>订单状态</th>
						</tr>
						<#list loginMember.orderSet as order>
							<tr>
								<td width="350">
									<a href="order!view.action?id=${order.id}">
										<span title="<#list order.productItemSet as productItem><#if productItem_index != 0>、</#if>${productItem.name}</#list>">
											<#list order.orderItemSet as orderItem>
												<#if orderItem_index != 0>、</#if>
												${orderItem.productName}
												<#if orderItem_index == 3 && orderItem_has_next>
													...<#break />
												</#if>
											</#list>
										</span>
									</a>
								</td>
								<td>
									<a href="order!view.action?id=${order.id}">${order.orderSn}</a>
								</td>
								<td>
									<span title="${order.createDate?string("yyyy-MM-dd HH:mm:ss")}">${order.createDate}</span>
								</td>
								<td>
									${order.totalAmount?string(currencyFormat)}
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
							<#if (order_index + 1 > 10)>
								<#break />
							</#if>
						</#list>
						<tr>
							<td colspan="5">
								<a href="order!list.action">更多订单>></a>
							</td>
						</tr>
					</table>
					<div class="blank"></div>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="blank"></div>
		<#include "/WEB-INF/template/card/friend_link.ftl">
	</div>
	<div class="blank"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
	  <script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
</body>
</html>