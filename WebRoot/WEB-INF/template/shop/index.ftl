<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${(setting.shopName)!}<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#include "/WEB-INF/template/shop/head.ftl">
</head>
<body class="index">
	<#include "/WEB-INF/template/shop/header.ftl">
	<#include "/WEB-INF/template/shop/index_slider.ftl">
      <!-- START Content Container -->
      <section id="content-container" class="clearfix">
         <div id="main-wrap" class="main-wrap-slider clearfix">
            
            
            <div class="one_third">
               <div class="img-frame full-third-short"><a href="content-responsive-design.html" target="_self"><img src="content-images/spa-still-life-280x124.jpg" alt="HTML5 Responsive Website Template by TrueThemes" width="280" height="124" /></a></div>
               <h5>Responsive Design</h5>
               <p>Sterling is premium website template built with a fully responsive design. This ensures that your website will look absolutely flawless on every mobile device.</p>
            </div>
            <!-- END one_third -->
            
            <div class="one_third">
               <div class="img-frame full-third-short"><a href="content-shortcodes.html" target="_self"><img src="content-images/happy-woman-working-on-laptop-280x124.jpg" alt="HTML5 Responsive Website Template by TrueThemes" width="280" height="124" /></a></div>
               <h5>100+ Powerful Shortcodes</h5>
               <p>Sterling comes packed with over 100 powerful shortcodes. This gives you the ability to add advanced features to your website without having to learn advanced coding technologies.</p>
            </div>
            <!-- END one_third -->
            
            <div class="one_third">
               <div class="img-frame full-third-short"><a href="content-customer-support.html" target="_self"><img src="content-images/online-shopping-280x124.jpg" alt="HTML5 Responsive Website Template by TrueThemes" width="280" height="124" /></a></div>
               <h5>Amazing Customer Support</h5>
               <p>Purchase this template with confidence knowing that we have an entire team dedicated to answering your questions in a professional and timely manner.</p>
            </div>
            <!-- END one_third -->
            
            
            <div class="hr hr-dotted">&nbsp;</div>
            
            
            <section id="home-marketing-blogposts">
               <span class="section_title">Latest from the blog</span>
               <div class="article_preview">
                  <strong><a href="page-template-blog-post.html">TrueThemes &#8211; CSS3 Responsive Web Template</a></strong>
                  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Praesent commodo cursus magna, vel scelerisque nisl consect...</p>
               </div>
               <div class="article_preview">
                  <strong><a href="page-template-blog-post.html">HTML5 Responsive Website Template</a></strong>
                  <p>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Donec...</p>
               </div>
            </section>
            <aside id="home-marketing-testimonials">
               <span class="section_title">Our Clients Say it Best</span>
               <div class="testimonials">
                  <div class="testimonial">
                     <blockquote>I can not tell how helpful, respectful and proactive this team is. I am a complete novice and was met with a level of service and support I have never encountered to date...</blockquote>
                     <strong class="client_identity">ThemeForest Customer 1</strong>
                  </div>
                  <div class="testimonial">
                     <blockquote>I have downloaded 8 themes from themeforest. This has been the easiest to customize out of them all. I've never turned a website around so fast!</blockquote>
                     <strong class="client_identity">ThemeForest Customer 2</strong>
                  </div>
                  <div class="testimonial">
                     <blockquote>Thanks so much for fixing my issue so quickly, I would just like to say that your company has provided such amazing customer service/ support to date it has really blown me away (it is very rare in business today)</blockquote>
                     <strong class="client_identity">ThemeForest Customer 3</strong>
                  </div>
               </div>
            </aside>
         </div>
         <!-- END main-wrap -->
      </section>
      <!-- END Content Container -->
            <!-- START Footer Callout -->
      <div class="footer-callout clearfix">
         <div class="center-wrap tt-relative">
            <div class="footer-callout-content">
               <p class="callout-heading">Site-wide callout section</p>
               <p class="callout-text">Engage your customers and promote a rewarding call-to-action. Easily toggle this on or off.</p>
            </div>
            <!-- END footer-callout-content -->
            <div class="footer-callout-button">
               <a href="content-responsive-design.html" class="large green button">马上卖卡 &rarr;</a>
            </div>
            <!-- END footer-callout-button -->
         </div>
         <!-- END center-wrap --> 
      </div>
      <!-- END Footer Callout -->
      
	<div class="blank"></div>
	<#include "/WEB-INF/template/shop/footer.ftl">
<!--	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/shop/js/shop.js"></script> -->
	  <script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/slides.min.jquery.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
      <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
      <script type="text/javascript">
         jQuery(document).ready(function(){
         	jQuery('#slides').slides({
         		  preload: false,
         		  //preloadImage: 'preloader url here',
         		  autoHeight: true,
         		  effect: 'slide',
         		  slideSpeed: 500,
         		  play: 0,
         		  randomize: false,
         		  hoverPause: false,
         	  });
         });
      </script>
</body>
</html>