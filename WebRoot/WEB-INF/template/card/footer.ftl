<div class="bottom">
<span>
	<@navigation_list position="bottom"; navigationList>
		<#list navigationList as navigation>
		   	<a href="<@navigation.url?interpret />"<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}</a>
		</#list>
	</@navigation_list>
</span>
<span>Copyright?2005-2012  Tenpay All Tights Reserved 名臣福利公司  版权所有</span>

</div>
