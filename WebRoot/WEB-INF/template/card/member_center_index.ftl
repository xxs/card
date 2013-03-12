<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>会员中心<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
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
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_center.ftl">
	</div>
	<div class="contentRight">
		<div class="column_right_1"><strong>您好，${loginMember.username}&nbsp;&nbsp;</strong>  <p>[认证邮箱：${loginMember.email}]</p></div>
        <div class="column_right_2">
	        	<div class="right_2">
	        	<ul>
	            	<li>您的账户余额：<strong style="font-size:18px;color:#e10911;">${loginMember.deposit?string(currencyFormat)}</strong></li>
	                <li>账户安全：<img src="/template/card/images/ds.jpg" alt="dsa" />    <span class="STYLE1">低</span>  <strong style="color:#e10911; margin-left:12px;">提升</strong>      资料完整度：<img src="/template/card/images/fdf.jpg" alt="fg" width="39" height="9" />        40% <strong style="color:#e10911; margin-left:6px;">完善</strong></li>
	                <li>注册时间：${loginMember.createDate?string("yyyy-MM-dd HH:mm:ss")}  上次登录IP：${loginMember.loginIp} <span class="red">登录历史</span></li>
	            </ul>
	            </div>
	            <div class="wenzi"><span>个人数据最后修改时间：${loginMember.createDate?string("yyyy-MM-dd")}</span>   <p><img src="/template/card/images/dsfsd.jpg" alt="sd" /></p></div>
	        
	      </div>
	     <div class="column_right_3">
        	<dl>
            	<dt><img src="/template/card/images/da.jpg" width="42" height="40" alt="s" /></dt>
                <dd style="color:#e10911; font-weight:bold;">系统检测到您还有以下几项安全资料没有完成，现在就去完成账户安全升级吧！</dd>
                <dd>《<a href="#"> 实名认证</a> 《<a href="#"> 手机认证</a> 《<a href="#"> 提现密码</a> 《<a href="#"> 设置密保</a> 《<a href="#"> 结算账户</a></dd>
            </dl>
        </div>
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