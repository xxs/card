	  <!-- START Footer -->
      <footer>
         <div class="center-wrap tt-relative">
            <div class="footer-content clearfix">
               
               <@navigation_list position="bottom"; navigationList>
					<#list navigationList as navigation>
						<#if (navigation_index + 1) == 1>
							<div class="sidebar-widget">
						</#if>
							<div class="sidebar-widget">
		                     	<p class="foot-heading"><a href="<@navigation.url?interpret />"<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}</a></p>
		                    </div>
						<#if !navigation_has_next>
							</div>
						</#if>
					</#list>
				</@navigation_list>
            </div>
            <!-- END footer-content -->
         </div>
         <!-- END center-wrap -->
         <div class="footer-copyright clearfix">
            <div class="center-wrap clearfix">
               <div class="foot-copy">
                  <p>Copyright &copy; 2012 Your Company Name. All rights reserved.</p>
               </div>
               <!-- END foot-copy -->
               <a href="#" id="scroll_to_top" class="link-top">Scroll to Top</a>
               <ul class="footer-nav">
                  <li><a href="page-template-homepage-lightbox-hero.html">Pages</a></li>
                  <li><a href="content-responsive-design.html">Features</a></li>
                  <li><a href="content-color-autumn.html">Colors</a></li>
                  <li><a href="page-template-shortcodelist.html">Shortcodes</a></li>
                  <li><a href="page-template-blog.html">Blog</a></li>
               </ul>
            </div>
            <!-- END center-wrap -->
         </div>
         <!-- END footer-copyright -->	
         <div class="shadow top"></div>
         <div class="tt-overlay"></div>
      </footer>