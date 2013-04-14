
<!--标志-->
<div id="top"><a href="${base}/"><img src="/template/card/images/logo.jpg" /></a>
</div>

	<div id="menu2" class="menu">
		<ul>
			<@navigation_list position="middle"; navigationList>
				<#list navigationList as navigation>
					<li><a href="<@navigation.url?interpret />"	<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}</a></li>
				</#list>
			</@navigation_list>
		</ul>
		<div class="clear"></div>
	</div>
	<script language="javascript">
		$(document).ready(function() {
			$("#menu2 li a").wrapInner( '<span class="out"></span>' );
			$("#menu2 li a").each(function() {
				$( '<span class="over">' +  $(this).text() + '</span>' ).appendTo( this );
			});
			$("#menu2 li a").hover(function() {
				$(".out",	this).stop().animate({'top':	'40px'},	300); // move down - hide
				$(".over",	this).stop().animate({'top':	'0px'},		300); // move down - show
			}, function() {
				$(".out",	this).stop().animate({'top':	'0px'},		300); // move up - show
				$(".over",	this).stop().animate({'top':	'-40px'},	300); // move up - hide
			});
		});
	</script>