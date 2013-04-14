<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心<#if setting.isShowPoweredInfo> - 名臣福利</#if></title>
<meta name="Author" content="MCFL" />
<meta name="Copyright" content="2.0" />
<#include "/WEB-INF/template/card/member_head.ftl">
<script type="text/javascript">
	$().ready( function() {
		$(".gonggao").bind("click",function(event){
			$content = event.target.name;
			$title = event.target.title;
			$.showAdviceWindow($title,$content);
			return false;
		});
	});
</script>
</head>
<body>
	<#include "/WEB-INF/template/card/member_header.ftl">
		<h1 style="font-size:22px;">您好，下城</h1>
		<!-- common begin -->
		<div class="common">
			<div class="panel-1">
				<h2>电脑店 常用软件快速安装包</h2>
				<div class="rj">
					<h3>精选软件一次下载  省时省力自动装机 </h3>
					安装包精选常用实用的软件，一次整体下载至制作好启动的U盘里，无需每次装机下载软件，大大减少装机时间；经杀毒软件和人工安装测试，均无捆绑插件，保障安全；同类软件进行归类管理，一目了然，方便快捷；一键安装，一键即可完成安装的全过程，一步到位。
				</div>
			</div>
			<a name="intro"></a>
			<div class="panel-1">
				<h2>功能特色</h2>
				<ul class="function">
					<li><em class="function-1"></em><h3>精挑细选</h3><p>所带的软件经过认真筛选，是同类产品中较为常用的软件</p></li>
					<li><em class="function-2"></em><h3>绿色安全</h3><p>所带的软件经杀毒软件和人工安装测试，均无捆绑插件，绿色安全</p></li>
					<li><em class="function-3"></em><h3>更新及时</h3><p>所带的软件均是最新版，软件包每月定期更新，一次整包下载，减少升级步聚</p></li>
					<li><em class="function-4"></em><h3>方便快捷</h3><p>省时省力，一键安装，一键即可完成安装的全过程，一步到位</p></li>
					<li><em class="function-5"></em><h3>高速下载</h3><p>软件包支持多线程下载，用户可高速下载到U盘，方便使用</p></li>
					<li><em class="function-6"></em><h3>智能安装</h3><p>如果原有安装同个软件，无需删除原程序安装，自动覆盖升级</p></li>
				</ul>
			</div>
		</div>
		<!-- common end-->
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="column_right_1"><strong>您好，${loginMember.username}&nbsp;&nbsp;</strong>  <p>[认证邮箱：${loginMember.email}]</p></div>
        <div class="column_right_2">
	        	<div class="right_2">
	        	<ul>
	            	<li style="margin-bottom:10px;margin-top:0px;">
	            		您的账户余额：
	            		<strong style="font-size:18px;color:#e10911;">${loginMember.deposit?string(currencyFormat)}</strong>
	            	</li>
	                <li>账户安全：<img src="/template/card/images/ds.jpg" width="${safeperfect*40}" height="9" style="margin-top:3px;margin-right:6px;"/>
	                	<#if safeperfect <= 0.3>
		                	<span class="STYLE1">${safeperfect*100}%-很低</span>
	                	<#elseif safeperfect = 0.9>
		                	<span class="STYLE1">${safeperfect*100}%-中等</span>
	                	<#elseif safeperfect = 1>
		                	<span class="STYLE1">${safeperfect*100}%-安全</span>
	                	<#else>
		                	<span class="STYLE1">${safeperfect*100}%-较低</span>
	                	</#if>
	                	<span style="margin-right:60px;"></span>
	                	资料完整度：<img src="/template/card/images/fdf.jpg"  width="${personalinfo*40}" height="9" style="margin-top:3px;margin-right:6px;"/>${personalinfo*100}%
	                	<#if personalinfo != 1>
	                		<a style="color:#e10911; margin-left:6px;font-weight:blod;" href="profile!edit.action">立即完善</a>
	                	</#if>	
	                </li>
	                <li>注册时间：${loginMember.createDate?string("yyyy-MM-dd HH:mm:ss")}
	                	<span style="margin-right:40px;"></span>
	                	上次登录IP：${loginMember.loginIp}<a href="member_log!list.action?pager.searchBy=actionMethod&pager.keyword=login" style="margin-left:6px;" >登录历史</a>
	                </li>
	            </ul>
	            </div>
	            <div class="wenzi">
	            	<span>个人数据最后修改时间：${loginMember.createDate?string("yyyy-MM-dd")}</span>
	            	<p><img src="/template/card/images/dsfsd.jpg"/></p>
	            </div>
	        
	      </div>
	     <#if isverifyname || isverifyphone || isverifywithdrawpwd || isverifysafe || isverifybank > 
	     <div class="column_right_3">
        	<dl>
            	<dt><img src="/template/card/images/da.jpg" width="42" height="40" alt="s" /></dt>
                <dd style="color:#e10911; font-weight:bold;">系统检测到您还有以下几项安全资料没有完成，现在就去完成账户安全升级吧！</dd>
                <dd>
                	<#if isverifyname>
	                	<a href="profile!edit.action" > 实名认证</a> 《
                	</#if>
                	<#if isverifyphone>
            	    	<a href="profile!edit.action" > 手机认证</a> 《
                	</#if>
                	<#if isverifywithdrawpwd>
        	        	<a href="password!withdrawPwd.action"> 提现密码</a> 《
                	</#if>
                	<#if isverifysafe>
    	            	<a href="password!safe.action"> 设置密保</a> 《
                	</#if>
                	<#if isverifybank>
	                	<a href="bank!add.action"> 结算账户</a> 《
                	</#if>
                </dd>
            </dl>
        </div>
                	</#if>
		<div class="tab3">
					<table width="770px" cellspacing=0>
						<tr>
							<th width="640px">公告信息</th>
							<th>发布日期</th>
						</tr>
						<@article_list type="advice" count=10; articleList>
							<#list articleList as article>
							<tr>
								<td align="left">
								<a href="#" name="${article.content}" class="red gonggao" title="${article.title}">${substring(article.title, 150, "...")}</a>
							</td>
								<td>
								<span title="${article.createDate?string("yyyy-MM-dd HH:mm:ss")}">${article.createDate?string("yyyy-MM-dd")}</span>
								</td>
							</tr>	
							</#list>
						</@article_list>
					</table>
					<#include "/WEB-INF/template/card/pager.ftl">
					</div>
		</div>
	</div>
</div>
<div class="blank"></div>
<#include "/WEB-INF/template/card/member_footer.ftl">
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
</body>
</html>