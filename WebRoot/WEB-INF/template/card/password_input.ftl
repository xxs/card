<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>修改密码<#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<link href="${base}/template/card/css/base.css" rel="stylesheet" type="text/css" />
<link href="${base}/template/card/css/card.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/template/common/js/jquery.validate.methods.js"></script>
<script type="text/javascript" src="${base}/template/card/js/base.js"></script>
<script type="text/javascript" src="${base}/template/card/js/card.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="${base}/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
<#include "/WEB-INF/template/card/member_head.ftl">
</head>
<body class="memberCenter">
	<#include "/WEB-INF/template/card/member_header.ftl">
		<section id="content-container" class="clearfix">
         <div id="main-wrap" class="clearfix">
            <aside class="subnav_cont sidebar">
               <div class="subnav">
                  <ul>
                     <li><a href="member_center!index.action"><span>会员中心首页</span></a></li>
                     <li><a href="member_center!index.action"><span>${loginMember.username}</span></a></li>
                     <li>会员等级: ${loginMember.memberRank.name}</li>
                     <li><a href="profile!edit.action">个人信息</a></li>
                     <li class="has_subnav">
                        <a href="password!edit.action">修改密码</a>
                        <ul>
                           <li><a href="deposit!list.action">我的预存款</a></li>
                           <li><a href="deposit!recharge.action">预存款充值</a></li>
                        </ul>
                     </li>
                     <li><a href="order!list.action">我的订单</a></li>
                  </ul>
               </div>
               <!-- END subnav -->
            </aside>
            <div class="page_content_right sub-content">
            	<form id="passwordForm" action="password!update.action" method="post">
                 <!-- START tabs_type_2 --> 
		         <dl class="tabs_type_2">
		            <dt class="current">修改密码</dt>
		            <dd class="current">
		               <p>旧&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：&nbsp;<input type="password" id="oldPassword" name="oldPassword" class="formText" /><span>3333333333333333333333333333333</span></p>
		               <p>新&nbsp;&nbsp;&nbsp;密&nbsp;&nbsp;&nbsp;码：&nbsp;<input type="password" id="password" name="member.password" class="formText" /></p>
		               <p>确认新密码：<input type="password" name="rePassword" class="formText" /></p>
		               <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="small green button" value="确认提交" /></p>
		            </dd>
		         </dl>
		         <!-- END tabs_type_2 --> 
		         </form>
            </div>
            <!-- END of page_content-->
         </div>
         <!-- END main-wrap -->
      </section>
	<#include "/WEB-INF/template/card/footer.ftl">
	<script type="text/javascript" src="${base}/template/xxs/js/custom-main.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.cycle.all.min.js"></script>
    <script type="text/javascript" src="${base}/template/xxs/js/jquery.easing.1.3.js"></script>
</body>
</html>