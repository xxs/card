<aside class="subnav_cont sidebar">
               <div class="subnav">
                  <ul>
                     <li><a href="member_center!index.action"><span>会员中心首页</span></a></li>
                     <li><a href="profile!edit.action">个人信息</a></li>
                     <li><a href="promotion.action">推广链接</a></li>
                     <li class="has_subnav">
                        <a href="password!edit.action">修改密码</a>
                        <ul>
                           <li><a href="deposit!list.action">我的预存款</a></li>
                           <li><a href="deposit!recharge.action">预存款充值</a></li>
                        </ul>
                     </li>
                     <li><a href="order!list.action">我的订单</a></li>
                     <@cards_list type="hot" count=10; cardsList>
									<#if (cardsList?size > 0)>
										<#list cardsList as cards>
											<li><a href="${base}${cards.htmlPath}"><span>${substring(cards.name, 24, "...")}   &rarr;   点击卖卡</span></a></li>		
										</#list>
									</#if>
								</@cards_list>
                  </ul>
               </div>
               <!-- END subnav -->
            </aside>