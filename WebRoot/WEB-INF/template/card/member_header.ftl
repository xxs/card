<div id="member_nav">
	<div id="member_logo"></div>
	<div id="member_logininfo">
		<a >帮助中心</a>
		<a >退出  |</a>
		<h3>${loginMember.username}!您好  |</h3>
		
	</div>
	<div class="clean"></div>
</div>
<div id="menu_out">
	<div id="menu_in">
		<div id="menu">
			<UL id="nav">
				<LI><A class="nav_on" id="mynav0" onmouseover=javascript:qiehuan(0) href="member_center!index.action"><SPAN>会员中心</SPAN></A></LI>
				<LI class="menu_line"></LI>
				<li><a href="member_center!index.action" onmouseover="javascript:qiehuan(1)" id="mynav1" class="nav_off"><span>我要卖卡</span></a></li>
				<li class="menu_line"></li>
				<li><a href="order!list.action" onmouseover="javascript:qiehuan(2)" id="mynav2" class="nav_off"><span>订单查询</span></a></li>
				<li class="menu_line"></li> 
				<li><a href="deposit!list.action" onmouseover="javascript:qiehuan(3)" id="mynav3" class="nav_off"><span>提取货款</span></a></li>
				<li class="menu_line"></li>
				<li><a href="member!logout.action" onmouseover="javascript:qiehuan(4)" id="mynav4" class="nav_off"><span>安全中心</span></a></li>
				<li class="menu_line"></li>
			</UL>
		<div id="menu_con"><div id="qh_con0" style="DISPLAY: block">
			<UL>
			  	<li><a href="member_center!index.action"><span>账户首页</span></a></li><LI class=menu_line2></LI>
			  	<li><a href="profile!edit.action"><span>个人信息</span></a></li><LI class=menu_line2></LI>
				<li><a href="bank!list.action"><span>提现账户</span></a></li><LI class=menu_line2></LI>
				<li><a href="promotion.action"><span>推广链接</span></a></li>
			  	
			</UL>
		</div> 
		<div id="qh_con1" style="DISPLAY: none">
			<UL>
  				<LI><A href="#"><SPAN>充值卡回收</SPAN></A></LI>
			</UL>
		</div> 
		<div id="qh_con2" style="DISPLAY: none">
			<UL>
		  		<LI><A href="#"><SPAN>历史订单查询</SPAN></A></LI>
			</UL>
		</div> 
		<div id="qh_con3" style="DISPLAY: none">
			<UL>
		  		<li><a href="deposit!list.action"><span>交易记录查询</span></a></li><LI class=menu_line2></LI>
				<li><a href="withdraw!list.action"><span>提现记录查询</span></a></li><LI class=menu_line2></LI>
				<li><a href="withdraw!apply.action"><span>立即申请提现</span></a></li>
			</UL>
		</div> 
		<div id="qh_con4" style="DISPLAY: none">
			<UL>
				<li><a href="member_log!list.action"><span>操作记录</span></a></li><LI class=menu_line2></LI>
				<li><a href="password!edit.action"><span>登录密码</span></a></li><LI class=menu_line2></LI>
				<li><a href="password!withdrawPwd.action"><span>提现密码</span></a></li><LI class=menu_line2></LI>
				<li><a href="password!safe.action"><span>密保问题</span></a></li><LI class=menu_line2></LI>
				<li><a href="withdraw!apply.action"><span>安全退出</span></a></li>
			</UL>
		</div> 
	</div>
</div>

<script language="javascript">
	function qiehuan(num){
		for(var id = 0;id<=4;id++)
		{
			if(id==num)
			{
				document.getElementById("qh_con"+id).style.display="block";
				document.getElementById("mynav"+id).className="nav_on";
			}
			else
			{
				document.getElementById("qh_con"+id).style.display="none";
				document.getElementById("mynav"+id).className="";
			}
		}
	}
</script>