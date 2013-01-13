<!--头部-->
<div class="top">
	<div class="top_995">
		<div class="top_995_left">
        	<ul> 
            	<li style=" width:66px; text-align:left;"><a href="#">进入旧版</a></li>
            	<@navigation_list position="top"; navigationList>
					<#list navigationList as navigation>
						<li>
							<a href="<@navigation.url?interpret />"
								<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}
							</a>
						</li>
					</#list>
				</@navigation_list>
            </ul>
		</div>
    	<div class="top_995_right"><span><a href="${base}/card/member_center!index.action">激活我的名臣</a></span> <p><a href="#">退出</a></p></div>
  	</div>
</div>

<!--标志-->
<div class="logo">
	<div class="logo_995">
    	<div class="logo_left"><a href="${base}" ><img src="/template/card/images/logo.jpg" alt="${(setting.shopName)!}" width="162" height="46" border="0" /></a></div>
    	<div class="logo_right">
        	<ul>
        		<@navigation_list position="middle"; navigationList>
					<#list navigationList as navigation>
						<li>
							<a href="<@navigation.url?interpret />"
								<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}
							</a>
						</li>
					</#list>
				</@navigation_list>
            </ul>
      </div>
	</div>
    <div class="clear"></div>
</div>

