<!---------------------------------左边列表-------------------------------------->
<div id="content">
<div class="list">
<ul>
	<li><a href="member_center!index.action"><span>会员中心首页</span></a></li>
	<li style="background:#eee; font-weight:bold; margin-top:10px;"><a style="color:#ff0000; " href="#">腾讯——卡通 <b>>></b></a></li>
 	<@cards_list type="hot" count=10; cardsList>
		<#if (cardsList?size > 0)>
			<#list cardsList as cards>
				<li><a href="${base}${cards.htmlPath}">${substring(cards.name, 24, "...")}   &rarr;   点击卖卡</a></li>		
			</#list>
		</#if>
	</@cards_list>
</ul>
</div>
