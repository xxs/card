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
				<li style="margin-left:10px;background:none;width:auto"><a href="#">全国免费咨询热线：400-611-8420</a></li>
            </ul>
		</div>
    	<div class="top_995_right">
    	<p><a href="${base}/card/member!register.action">注册</a></p>
    		<span><a href="${base}/card/member_center!index.action">登陆</a></span> 
    	</div>
  	</div>
</div>

<!--标志-->
<div class="logo">
	<div class="logo_995">
    	<div class="logo_left"><a href="${base}/" ><img src="/template/card/images/logo.jpg" alt="${(setting.shopName)!}" width="162" height="46" border="0" /></a><span>名臣收卡平台</span><div class="shu"></div></div>
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

