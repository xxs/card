<!--------------------------顶部黑色条部分------------------------------->
<div id="submenu">
<div class="submenu">
<ul>
<li><a href="#">进入旧版</a></li>
<@navigation_list position="top"; navigationList>
		<#list navigationList as navigation>
				<li><a href="<@navigation.url?interpret />"
					<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}
				</a></li>
		</#list>
</@navigation_list>
<li class="weibo"><a href="#">官方微博</a></li>
</ul>

<span>
<p style="background:none; width:60px;"><a style="color:#a9a9a9;" href="${base}/card/member!logout.action">退出</a></p>
<p><a href="#">激活我的名臣</a></p>
<p><a href="#">您好<span id="headerLoginMemberUsername"></span>, 欢迎来到${(setting.shopName)!}!</a></p>
<p><a href="${base}/card/member!memberreg.action?id=8a9182e13ab73c9e013ab74780e80000">注册页面</a></p>
<p><a href="${base}/card/member_center!index.action" id="headerMemberCenter">会员中心</a></p>
</span>
</div>
</div>
<!--------------------------头部------------------------------->
<div id="top">
	<div class="top">
		<h1><a href="./index.html"><img src="${base}/template/card/images/logo.jpg" alt="名称福利" /></a></h1>
		<span class="menu">
			<ul>
				<li><a href="#"><img src="../images/menu01.jpg" border="0" /></a></li>
				<li><a href="#"><img src="images/menu2.jpg" border="0" /></a></li>
				<li><a href="#"><img src="images/menu3.jpg" border="0" /></a></li>
				<li><a href="#"><img src="images/menu4.jpg" border="0" /></a></li>
				<li><a href="#"><img src="images/menu5.jpg" border="0" /></a></li>
				<li><a href="#"><img src="images/menu6.jpg" border="0" /></a></li>
			</ul>
		</span>
	</div>
</div>
