<ul>
	<p>欢迎您!&nbsp;&nbsp;<span class="username">${loginMember.username}</span>&nbsp;&nbsp;[<a class="userLogout" href="member!logout.action"">退出</a>]</p>
		<p>可用余额: <span class="red"> ${loginMember.deposit}</span> 元</p>
		<p>账户状态: <#if loginMember.isAccountEnabled && !loginMember.isAccountLocked && !loginMember.isAccountExpired && !loginMember.isCredentialsExpired>
								<span class="green">正常</span>
							<#elseif !loginMember.isAccountEnabled>
								<span class="red"> 未启用 </span>
							<#elseif loginMember.isAccountLocked>
								<span class="red"> 已锁定 </span>
							</#if></p>
		<p>会员等级: <span class="red"> ${loginMember.memberRank.name}</span></p>
		<p>会员等级: <span class="red"> ${loginMember.memberRank.name}</span></p>
		<p>会员等级: <span class="red"> ${loginMember.memberRank.name}</span></p>
	<div class="heng"></div>	
	<li><a href="business!info.action">商户信息</a></li>
	<li><a href="deposit!apidoc.action">API文档</a></li>
	<li><a href="withdraw!list.action">接入说明</a></li>
</ul>
