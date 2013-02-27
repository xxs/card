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

	<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
	<![endif]-->
	<!--鼠标移动到登录挂件标签后自动切换的JS-->
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
</head>
<body>
	<#include "/WEB-INF/template/card/header.ftl">
	<div id="flashBg" style="background-color: rgb(11, 11, 11); ">
	<div id="flashLine">
	<div id="flash">
	<a href="#" target="_blank" id="flash1" style="display: block; " name="#0b0b0b"><img src="${base}/template/card/images/01.jpg" width="980" height="393"></a>
	<a href="#" target="_blank" id="flash2" name="#194982" style="display: none; "><img src="${base}/template/card/images/02.jpg" width="980" height="393"></a>
	<a href="#" target="_blank" id="flash3" name="#04304b" style="display: none; "><img src="${base}/template/card/images/03.jpg" width="980" height="393"></a>
	  <div class="flash_bar">
	<div class="dq" id="f1" onclick="changeflash(1)"></div>
	<div class="no" id="f2" onclick="changeflash(2)"></div>
	<div class="no" id="f3" onclick="changeflash(3)"></div>
	  </div>
	</div>
	</div>
	</div>
	
	 <!--中部banner上层-->
    <div class="banner2">
    <div class="banner_over">
     <div class="banner_right">
    	<div class="banner_xiao">
		<div class="tab">
			<div class="tab_menu">
				<ul>
					<li class="selected">会员登录</li>
					<li>已登录</li>
				</ul>
		 	</div>
		 <div class="tab_box"> 
		 	<div id="beforeLogin" class="anan">
            	<form id="loginForm" action="${base}/card/member!login.action" method="post">
					<input type="hidden" id="loginRedirectUrl" name="loginRedirectUrl" />
	                <div>
	                	<p>账&nbsp;&nbsp;号</p> 
	                	<span>
	                		<input type="text" id="memberUsername"  size="15" name="member.username" class="oo" />
	                	</span>
	                </div>
	                <div style="margin-top:19px;">
	                  	<p>密&nbsp;&nbsp;码</p> 
	                  	<span>
	                  		<input type="password" id="memberPassword" name="member.password" class="oo" />
	                  	</span>
	                </div>
	                <div style="margin-top:19px;">
	                	<p>验证码</p>
	                  	<span>
	                  		<input type="text" id="captcha" maxlength="4" name="j_captcha" style="width:90px" class="oo captcha" />
	                  		<img id="captchaImage" class="captchaImage" src="${base}/captcha.jpeg" alt="换一张" />
	                  	</span>
	                </div>
	                <span id="loginError" style="font-size:15px;margin-top:10px;margin-bottom:5px;text-align:center;color:red;font-weight:bold">验证失败，此处提示错误信息</span>
	                <div class="ddsa" >
	                	<input id="loginButton1" class="button" style="display:inline" type="button"  name="login" value="登&nbsp;&nbsp;&nbsp;录" onclick="change()" />
	                </div>
	                <div class="wenz">
	                	还没有账号？<a href="reg.html" style="font-size:14px;font-weight:bold">免费注册</a>&nbsp;|
	                	&nbsp;<a href="${base}/card/member!passwordRecover.action" style="font-size:13px;font-weight:bold">忘记密码？</a>
	                </div>
                </form>
            </div>
		 	<div id="afterLogin" class="hide">
	         	<h1 style="font-size:18px"><strong>欢迎使用名臣福利!</strong></h1>
	         	<hr noshade width=100% style="margin-left:-15px;margin-top:5px"><br />
	         	<font style="font-size:15px">你当前使用的名臣福利账号是：</font><br />
	         	<br/>
	         	<strong><span id="account" style="text-align:center;font-size:16px;color:#FF9700">里显示账号123456789@qq.com</span></strong><br />
	         	<br />
         		<div style="margin-left:10px;margin-top:15px;">
         			<a target="_blank" href="#"><img src="images/jinru.jpg" style="margin-left:0px;" /></a>
         			<a target="_self" href="#"><img src="images/tc.jpg" style="margin-left:15px" name="logout" /></a>
         		</div>
           	</div>
          </div>
		</div>
     </div>
    </div>  
 </div>   
 </div>
	<!--内容区-->
	<div class="column1">
	<div class="column2">
    	<ul>
        	<li style=" margin:0px;"><a href="#"  alt="此功能即将上线"><img src="/template/card/images/a1.jpg" width="48" height="61" alt="此功能即将上线" /><center>手机充值</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a2.jpg" width="48" height="61" alt="此功能即将上线" />  <center>信用卡</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a3.jpg" width="48" height="61" alt="此功能即将上线" />  <center>商城</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a4.jpg" width="48" height="61" alt="此功能即将上线" />  <center>彩票</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a6.jpg" width="48" height="61" alt="此功能即将上线" />  <center>缴费</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a7.jpg" width="48" height="61" alt="此功能即将上线" />  <center>快递</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a8.jpg" width="48" height="61" alt="此功能即将上线" /> <center>机票</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a5.jpg" width="48" height="61" alt="此功能即将上线" /> <center>信用还款</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a9.jpg" width="48" height="61" alt="此功能即将上线" />  <center>游戏</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a10.jpg" width="48" height="61" alt="此功能即将上线" /> <center>房租</center></a></li>
            <li><a href="#" alt="此功能即将上线"><img src="/template/card/images/a11.jpg" width="48" height="61" alt="此功能即将上线" />  <center>更多服务</center></a></li>
        </ul>
    </div>
      
	<div class="Service">
        <div class="Service_left">
        <span><p>什么是手机充值卡回购？</p></span><br /><img class="i1" src="/template/card/images/h1bg.gif" />
        <ul>

        <li><h1>A. 您有如下充值卡</h1> 
	赠送、公司福利得到的<br />
	各种面值的游戏卡和<br />
	移动/电信/联通手机充值卡
	        </li>
	        <li><h1>B. 自己手机话费够了</h1> 
	不玩游戏 送人没人要<br />扔了可惜<br />
	也不用充值卡购物
	        </li>
	        <li><h1>C. 我们帮您把它变现</h1> 
	通过在线销售系统<br />即刻完成充值卡回购<br />
	申请提现20分钟内处理
	        </li>
	        <li><h1>D. 您还可以贡献公益卡</h1> 
	每回购一张充值卡<br />我们将拿出0.1-1.0元<br />捐助公益
	     </li>
	        </ul>
	       
	        <span style="margin-top:55px;float:left;"><p>关于名臣福利</p></span><br /><img class="i1" src="/template/card/images/h1bg.gif" />
	        <ul>
	        <li><h1>1. 为您谋福利</h1> 
	名臣福利致力于帮您把<br />多余的手机充值卡、游戏卡<br />通过在线销售系统变成现金
	        </li>
	        <li><h1>2. 为大家谋福利</h1> 
	名臣福利会把收取的手续费<br />的一部分捐助给公益事业<br />从而实现更多人的福利 
	        </li>
	        <li><h1>3. 交易保障</h1> 
	通过在线支付系统即时<br />完成充值卡回购<br />提现后几分钟内给您打款 
	        </li>
	        <li><h1>4. 在线客服</h1> 
	<p><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=554368159&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:554368159:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>554368159</p><p><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=854768232&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:854768232:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>854768232</p>
	     </li>
	        </ul>
	        </div>
	    <div class="Service_right">
	        	<div class="Service_right_top">
	            	<span style="text-align:center;margin-left:30px;"><a href="#">手机充值卡回购</a> | <a href="#">人工回收</a> </span>
	                <p><a href="#">站内动态</a></p>
	            </div>
	            <dl style="margin-top:0px;border:none; padding:0px; height:120px;">
	           	  	<dt >最新站内公告：</dt>
	                <dd><a href="#">12月14日农业银行维护通知</a></dd>
	            		<@article_list type="advice" count=10; articleList>
							<#list articleList as article>
								<dd><a href="#" name="${article.content}" class="red gonggao" title="${article.title} 发布日期：${article.createDate?string("yyyy-MM-dd HH:mm:ss")}">${substring(article.title, 40, "...")} </a></dd>
							</tr>	
							</#list>
						</@article_list>    
	            </dl>
	        </div>
	  </div>
	</div>
	
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/card/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/jquery.Sonline.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
	<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
	<script>
	var currentindex=1;
	var length = $(".flash_bar div").length;
	
	$("#flashBg").css("background-color",$("#flash1").attr("name"));
	function changeflash(i) {	
	currentindex=i;
	
	for (j=1;j<=length;j++){
		if (j==i) 
		{$("#flash"+j).fadeIn("normal");
		$("#flash"+j).css("display","block");
		$("#f"+j).removeClass();
		$("#f"+j).addClass("dq");
		$("#flashBg").css("background-color",$("#flash"+j).attr("name"));
		}
		else
		{$("#flash"+j).css("display","none");
		$("#f"+j).removeClass();
		$("#f"+j).addClass("no");}
	}}
	function startAm(){
	timerID = setInterval("timer_tick()",5000);
	}
	function stopAm(){
	clearInterval(timerID);
	}
	function timer_tick() {
	    currentindex=currentindex>=length?1:currentindex+1;
		changeflash(currentindex);}
	$(document).ready(function(){
	$(".flash_bar div").mouseover(function(){stopAm();}).mouseout(function(){startAm();});
	startAm();
	});
	</script>
</body>
</html>