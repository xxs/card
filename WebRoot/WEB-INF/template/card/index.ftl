<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${(setting.shopName)!}<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (setting.metaKeywords)! != ""><meta name="keywords" content="${setting.metaKeywords}" /></#if>
<#if (setting.metaDescription)! != ""><meta name="description" content="${setting.metaDescription}" /></#if>
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<script type="text/javascript" src="${base}/template/card/js/slides.jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
	<![endif]-->
	<script type="text/javascript" >
	//<![CDATA[
		$(function(){
		    var $div_li =$("div.tab_menu ul li");
		    $div_li.mouseover(function(){//要点击切换这click
				$(this).addClass("selected")            //当前<li>元素高亮
					   .siblings().removeClass("selected");  //去掉其它同辈<li>元素的高亮
	            var index =  $div_li.index(this);  // 获取当前点击的<li>元素 在 全部li元素中的索引。
				$("div.tab_box > div")   	//选取子节点。不选取子节点的话，会引起错误。如果里面还有div 
						.eq(index).show()   //显示 <li>元素对应的<div>元素
						.siblings().hide(); //隐藏其它几个同辈的<div>元素
			}).hover(function(){
				$(this).addClass("hover");
			},function(){
				$(this).removeClass("hover");
			})
		})
	//]]>
	</script>
	<script>
		//保证导航栏背景与图片轮播背景一起显示
		$("#mainbody").removeClass();
		$("#mainbody").addClass("index_bg05");
	</script>
	<script>
		$(function(){
			//滚动Banner图片的显示
			$('#slides').slides({
				preload: false,
				preloadImage: '/template/card/images/loading.gif',
				effect: 'fade',
				slideSpeed: 400,
				fadeSpeed: 100,
				play: 3000,
				pause: 100,
				hoverPause: true
			});
	        	$('#js-news').ticker();
	    	});
		</script>
</head>
<body  id="mainbody">
	<#include "/WEB-INF/template/card/header.ftl">
	<div id="warp">
	<div id="slides" class="banner">
		<div class="banner_l"><a class="prev" href="#"><img alt="上一"页 src="/template/card/images/banner_l.png" width="24" height="43"></a></div>
		<div class="bannerImg">
			<div class="slides_container">
				<div id="banner_pic_1"><a href="http://www.16sucai.com/" target="_blank"><img alt="16素材网" src="images/banner05.jpg" width="925" height="357"></a></div>
				<div style="DISPLAY: none" id="banner_pic_2"><a href="http://www.16sucai.com/" target="_blank"><img alt="16素材网" src="/template/card/images/banner01.gif" width="925" height="357"></a></div>
				<div style="DISPLAY: none" id="banner_pic_3"><a href="http://www.16sucai.com/" target="_blank"><img alt="16素材网" src="/template/card/images/banner02.jpg" width="925" height="357"></a></div>
				<div style="DISPLAY: none" id="banner_pic_4"><a href="http://www.16sucai.com/" target="_blank"><img alt="16素材网" src="/template/card/images/banner03.jpg" width="925" height="357"></a></div>
				<div style="DISPLAY: none" id="banner_pic_5"><a href="http://www.16sucai.com/" target="_blank"><img alt="16素材网" src="/template/card/images/banner04.jpg" width="925" height="357"></a></div>
			</div>
		</div>
		<div class="banner_r"><a class="next" href="#"><img alt="下一页" src="/template/card/images/banner_r.png" width="24" height="43"></a></div>
	</div>
	<!--banner-->
	<div class="banner">
		<div class="banner_left">
	    	<ul>
	        	<li style="margin-bottom:17px;"><p>付到银行卡</p>  <span>1小时内到帐</span></li>
	            <li>服务费最低一元</li>
	            <li>覆盖银行近20家</li>
	            <li>全天24小时服务</li>
	        </ul>
	    </div>
    	<div class="banner_right">
    		<div class="banner_xiao">
				<div class="tab">
					<div class="tab_menu">
						<ul>
							<li class="selected">会员登录</li>
							<li>名臣登录</li>
						</ul>
		 			</div>
		 			<div class="tab_box"> 
		 				<div class="anan">
            			<form action="" method="get">
			                <div><p>帐户名</p> <span><input name="" type="text"  size="12"/></span></div>
            				    <div style="margin-top:19px;"><p>密  码</p> <span><input name="input" type="text" /></span></div>
                					<div class="annnsa">
           	      						<span style="float:left;"><input type="checkbox" /> <a href="#">记住密码？</a></span>
                    					<span style="float:right;"><input name="" type="checkbox" value="" /> <a href="#">安全控件登录</a></span>
                					</div>
					                <div class="ddsa"><a href="#"><img src="images/index/dd.jpg" width="110" height="30" alt="hh" /></a>  <a href="#">忘记密码？</a></div>
                					<div class="wenz"><a href="#">使用手机号码登陆</a> |  <a href="#">免费注册</a></div>
                		</form>
            			</div>
		 				<div class="hide">体育</div>
         			</div>
				</div>
			</div>
  		</div>  
    </div>   
	<!--内容区-->
<div class="content_line">
	<#include "/WEB-INF/template/card/friend_link.ftl">
</div>
	<div class="content_line">
	<div class="Service">
    	<ul>
        	<li><a href="#"><img src="images/index/tu1.jpg" width="329" height="153" alt="s" /></a></li>
            <li style="margin-right:4px;"><a href="#"><img src="images/index/tu2.jpg" width="329" height="153" alt="s" /></a></li>
            <li style="margin-top:5px;"><a href="#"><img src="images/index/tu3.jpg" width="329" height="153" alt="s" /></a></li>
            <li style="margin-top:5px;margin-right:4px;"><a href="#"><img src="images/index/tu4.jpg" width="329" height="153" alt="s" /></a></li>
        </ul>
    <div class="Service_right">
        	<div class="Service_right_top">
            	<span><a href="#">充话费</a> | <a href="#">购彩票</a> | <a href="#">买Q币</a> | <a href="#">还信用卡</a></span>
                <p><a href="#">下载手机名臣福利</a></p>
            </div>
            <dl>
           	  	<dt>活动</dt>
                <dd><a href="#">音乐跨年礼，听歌100%赚话费</a></dd>
                <dd><a href="#">名臣福利联手中国银行，话费Q币大放送</a></dd>
            </dl>
            <dl style=" border:none; padding-top:12px; height:60px;">
           	  	<dt>公告</dt>
                <dd><a href="#">12月14日农业银行维护通知</a></dd>
                <dd><a href="#">12月14日农业银行维护通知</a></dd>
            </dl>
        </div>
  </div>
</div>
	
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
</body>
</html>