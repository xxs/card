	<div class="column2">
    	<ul>
    			<@friend_link_list type="picture" count=10; friendLinkList>
					<#list friendLinkList as friendLink>
						<li>
							<a href="${friendLink.url}" title="${friendLink.name}" width="48" height="61" target="_blank">
								<img src="${base}${friendLink.logoPath}"> ${friendLink.name}
							</a>
						</li>
					</#list>
				</@friend_link_list>
        </ul>
    </div>
