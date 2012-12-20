<!-- START Top-Toolbar -->
      <aside class="top-aside clearfix">
         <div class="center-wrap">
            <div class="one_half">
               <div class="sidebar-widget">
                  <ul class="custom-menu">
                  	<@navigation_list position="top"; navigationList>
					<#list navigationList as navigation>
						<li><a href="<@navigation.url?interpret />"
							<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}
						</a></li>
					</#list>
				   </@navigation_list>
                  </ul>
               </div>
            </div>
            <!-- END top-toolbar-left -->
            <div class="one_half">
               <div class="sidebar-widget">
                  <ul class="custom-menu">
                    <li class="current-menu-item">您好<span id="headerLoginMemberUsername"></span>, 欢迎来到${(setting.shopName)!}!</li>
                     <li><a href="javascript: void(0);" id="headerShowLoginWindow">登录</a></li>
                     <li><a href="page-template-sitemap.html">Sitemap</a></li>
                     <li><a href="${base}/shop/member_center!index.action" id="headerMemberCenter">会员中心</a></li>
                     <li><a href="javascript: void(0);" id="headerShowRegisterWindow">注册</a></li>
                     <li><a href="${base}/shop/member!memberreg.action?id=8a9182e13ab73c9e013ab74780e80000">注册页面</a></li>
                     <li><a href="${base}/shop/member!logout.action" id="headerLogout">[退出]</a></li>
                  </ul>
               </div>
            </div>
            <!-- END top-toolbar-right -->
         </div>
         <!-- END center-wrap -->
         <div class="top-aside-shadow"></div>
      </aside>
      <!-- END Top-Toolbar -->
      
      
      
      
      <!-- START Header -->
      <header>
         <div class="center-wrap">
            <div class="companyIdentity">
               <a href="./index.html"><img src="${base}/template/xxs/images/sylogo.jpg" alt="名称福利" /></a>
            </div>
            <!-- END companyIdentity -->
            <!-- START Main Navigation -->
            <nav>
               <ul>
               	<@navigation_list position="middle"; navigationList>
					<#list navigationList as navigation>
						<li>
							<a href="<@navigation.url?interpret />"
								<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}
							</a>
							<#if navigation.name == '首页'>
							<@cards_list type="hot" count=10; cardsList>
									<#if (cardsList?size > 0)>
									<ul class="sub-menu">
										<#list cardsList as cards>
											<li><a href="${base}${cards.htmlPath}">${substring(cards.name, 24, "...")}   &rarr;   点击卖卡</a></li>		
										</#list>
				                     </ul>
									</#if>
								</@cards_list>
							</#if>
						</li>
					</#list>
				</@navigation_list>
               </ul>
            </nav>
            <!-- END Main Navigation -->
         </div>
         <!-- END center-wrap -->
      </header>
      <!-- END Header -->