<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><#if setting.isShowPoweredInfo> - XXS</#if></title>
<meta name="Author" content="XXS-DW" />
<meta name="Copyright" content="XXS" />
<#if (cards.metaKeywords)! != ""><meta name="keywords" content="${cards.metaKeywords}" /></#if>
<#if (cards.metaDescription)! != ""><meta name="description" content="${cards.metaDescription}" /></#if>
<#include "/WEB-INF/template/card/member_head.ftl">

</head>
<body id="cardsContent" class="cardsContent">
	<#include "/WEB-INF/template/card/member_header.ftl">
	<div class="content">
	<div class="contentLeft">
		<#include "/WEB-INF/template/card/menu_cards.ftl">
	</div>
	<div class="contentRight">
		<div class="katong">
			<div class="fangz">${substring(cards.name, 50, "...")}</div>
			<div class="red">注：请一定正确选择卡面值提交,否则造成损失商户自行承担； </div>
			<div class="hei">卡信息提交成功后，可在<a href="#">订单查询</a>页面查询支付结果。处理结果以订单查询页为准。</div>
			<div class="tab">
			<div class="tab_menu">
			  	<ul>
					<li class="selected">单张消耗</li>
					<li style="border-right:1px solid #e1e2e2;">批量消耗</li>
			  	</ul>
				</div>
				<div class="tab_box"> 
	 			  <div class="tab_box_1">
	 			  	<div class="memberCenter">
					<form id="sForm" autocomplete="off">
					<table class="tabTable">
						<#if cards.isSpecificationEnabled>
							<#assign specificationValueSet = cards.specificationValueSet>
							<#list cards.specificationSet as specification>
									<tr class="text1">
										<th>${specification.name}:</th>
										<td>
											<ul id="buyInfo">
												<#list cards.productSet as product>
													<input type="radio" class="sface" name="productId" value="${product.id}" price="${product.price}" <#if product.isDefault >checked="checked"</#if> />&nbsp;${product.price}元
												</#list>
											</ul>
										</td>
									</tr>
							</#list>
						</#if>
						<tr class="tongdaoS">
							<th>支付通道:</th>
							<td>
								<#list paymentDiscountList as paymentDiscount>
									<input type="radio" class="stongdao" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" face="${paymentDiscount.face}" <#if paymentDiscount.paymentConfig.isDefault >checked="checked"</#if> />&nbsp;${paymentDiscount.paymentConfig.name}(<span style="color:red">折扣率：${paymentDiscount.discount}</span>)
								</#list>
							</td>
						</tr>
						<tr>
							<th>确认金额:</th>
							<td>
								<span id="price1" class="red">￥${cards.price} 元</span>
							</td>
						</tr>
						<tr>
							<th>卡号:</th>
							<td>
								<input type="text" id="cardNum" name="cardNum"  class="formText"/>
							</td>
						</tr>
						<tr>
							<th>密码:</th>
							<td>
								<input type="text" id="cardPwd" name="cardPwd"  class="formText"/>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="button" id="sBtn" class="button" value="生成订单" />
								<span id="sload"><label class="loadingIcon"></label>提交中...</span>
							</td>
						</tr>
					</table>
				</form>
				</div>
				</div>
		 			<div class="hide">
				 	<div class="memberCenter">
					<form id="pForm" autocomplete="off">
					<input type="hidden" name="cardNum" id="cardNum" value="" />
					<input type="hidden" name="cardPwd" id="cardPwd" value="" />
					<table class="tabTable" id="cardsTable">
						<#if cards.isSpecificationEnabled>
							<#assign specificationValueSet = cards.specificationValueSet>
							<#list cards.specificationSet as specification>
									<tr class="text2">
										<th>${specification.name}:</th>
										<td>
											<ul id="buyInfo">
												<#list cards.productSet as product>
													<input type="radio" class="pface" name="productId" value="${product.id}" price="${product.price}" <#if product.isDefault >checked="checked"</#if> />&nbsp;${product.price}元
												</#list>
											</ul>
										</td>
									</tr>
							</#list>
						</#if>
						<tr class="tongdaoP">
							<th>支付通道:</th>
							<td>
								<#list paymentDiscountList as paymentDiscount>
									<input type="radio" class="ptongdao" name="paymentConfig.id" value="${paymentDiscount.paymentConfig.id}" face="${paymentDiscount.face}" <#if paymentDiscount.paymentConfig.isDefault >checked="checked"</#if> />&nbsp;${paymentDiscount.paymentConfig.name}(<span style="color:red">折扣率：${paymentDiscount.discount}</span>)
								</#list>
							</td>
						</tr>
						<tr>
							<th>确认金额:</th>
							<td>
								<span id="price2" class="red">￥${cards.price} 元</span>
							</td>
						</tr>
						<tr>
							<th>卡密组合:</th>
							<td>
								<p>输入格式如:xxxxx(账号)xxxxx,xxxxxx(密码)xxxx</p>
								<textarea cols="60" rows="10" name="cardString" id="kamizu"  class="formTextarea"></textarea>
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								您填写了  <span id="shuliang" class="red">0</span>  张${substring(cards.name, 50, "...")}
							</td>
						</tr>
						<tr>
							<th></th>
							<td>
								<input type="button" id="pBtn" class="button" value="生成订单" />
								<span id="pload"><label class="loadingIcon"></label>提交中...</span>
							</td>
						</tr>
						<tr>
							<th></th>
							<td id="jieguo">
							</td>
						</tr>
					</table>
				</form>
				</div>
		 			</div>
				</div>
			</div> 

			</div>
			</div>
		</div>
	</div>
	</div>
	<div class="clear"></div>
	<#include "/WEB-INF/template/card/member_footer.ftl">
	<script type="text/javascript" src="${base}/template/common/js/jquery.js"></script>
	<script type="text/javascript" src="${base}/template/common/js/jquery.tools.js"></script>
	<script type="text/javascript" >
	//<![CDATA[
		$(function(){
		    var $div_li =$("div.tab_menu ul li");
		    $div_li.click(function(){//要点击切换这click
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
	<script type="text/javascript">
		$().ready(function() {
			
	        $(".text1 input[type='radio']").click(function(){     //绑定radio绑定事件                
	             $("#price1").text("￥  "+$(this).attr("price")+" 元");
		    });
			$(".text2 input[type='radio']").click(function(){     //绑定radio绑定事件                
	             $("#price2").text("￥  "+$(this).attr("price")+" 元");
		    });
		    
		    var price1 = $(".text1 input[type='radio']:checked").attr("price");
		    $(".tongdaoS input[type='radio']").each(function(){
				$(this).attr("disabled","disabled");
			});
		    $(".tongdaoS input[type='radio']").each(function(){
		    	var str = $(this).attr("face");
		    	var strs = str.split(","); //字符分割
		        for (i=0;i<strs.length ;i++ ){
					if(strs[i]!="0"){
					   	if(price1==strs[i]){ 
					    	$(this).removeAttr("disabled");
					    }
					}else{
						$(this).removeAttr("disabled");
					}
				}
			});
			
			var price2 = $(".text2 input[type='radio']:checked").attr("price");
		    $(".tongdaoP input[type='radio']").each(function(){
				$(this).attr("disabled","disabled");
			});
		    $(".tongdaoP input[type='radio']").each(function(){
		    	var str = $(this).attr("face");
		    	var strs = str.split(","); //字符分割
		        for (i=0;i<strs.length ;i++ ){
					if(strs[i]!="0"){
					   	if(price2==strs[i]){ 
					    	$(this).removeAttr("disabled");
					    }
					}else{
						$(this).removeAttr("disabled");
					}
				}
			});
		    
			$(".text1 input[type='radio']").click(function(){     //绑定radio绑定事件             
				var price1 = $(".text1 input[type='radio']:checked").attr("price");  
				//alert(price); 
				$(".tongdaoS input[type='radio']").each(function(){
					$(this).attr("disabled","disabled");
				});
	            $(".tongdaoS input[type='radio']").each(function(){
		    	var str = $(this).attr("face");
		    	var strs = str.split(","); //字符分割
		        for (i=0;i<strs.length ;i++ ){
					if(strs[i]!="0"){
					   	if(price1==strs[i]){ 
					    	$(this).removeAttr("disabled");
					    }
					}else{
						$(this).removeAttr("disabled");
					}
				}
				});
		    });
		    $(".text2 input[type='radio']").click(function(){     //绑定radio绑定事件             
				var price2 = $(".text2 input[type='radio']:checked").attr("price");  
				$(".tongdaoP input[type='radio']").each(function(){
					$(this).attr("disabled","disabled");
				});
	            $(".tongdaoP input[type='radio']").each(function(){
		    	var str = $(this).attr("face");
		    	var strs = str.split(","); //字符分割
		        for (i=0;i<strs.length ;i++ ){
					if(strs[i]!="0"){
					   	if(price2==strs[i]){ 
					    	$(this).removeAttr("disabled");
					    }
					}else{
						$(this).removeAttr("disabled");
					}
				}
				});
		    });
		    
			var $sForm = $("#sForm");
			var $pForm = $("#pForm");
			var $sBtn = $("#sBtn");
			var $pBtn = $("#pBtn");
			var $sload = $("#sload");
			var $pload = $("#pload");
			var $kamizu = $("#kamizu");
			var $cardsTable = $("#cardsTable");
			$sload.hide();
			$pload.hide();
			$sBtn.click( function() {
				if ($.trim($("#cardNum").val()) == "") {
					$.dialog({type: "warn", content: "账号不能为空", modal: true, autoCloseTime: 3000});
					return false;
				}
				if($.trim($("#cardPwd").val()) == ""){
					$.dialog({type: "warn", content: "密码不能为空", modal: true, autoCloseTime: 3000});
					return false;
				}
				if($.trim($("input[class='sface']:checked").val()) == ""){
					$.dialog({type: "warn", content: "请选择面额", modal: true, autoCloseTime: 3000});
					return false;
				}
				if($.trim($("input[class='stongdao']:checked").val()) == ""){
					$.dialog({type: "warn", content: "请选择通道", modal: true, autoCloseTime: 3000});
					return false;
				}
				$.ajax({
					url: "order!save.action",
					data: $sForm.serialize(),
					type: "POST",
					dataType: "json",
					cache: false,
					beforeSend: function(data) {
						$sBtn.attr("disabled", true);
						$sBtn.removeAttr("button");
						$sload.show();
						$sBtn.attr("class", "button_click");
					},
					success: function(data) {
						if (data.status == "success") {
							$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
							$("input[type='text'],textarea").val("");
						} else {
							$.dialog({type: data.status, content: data.message, modal: true, autoCloseTime: 3000});
						}
							$sBtn.attr("disabled", false);
							$sBtn.removeAttr("button_click");
							$sBtn.attr("class", "button");
							$pload.attr("class", "red");
							$sload.text(data.message);
					}
				});
				return false;
			});
			$kamizu.keydown(function(){
				$("#shuliang").text($kamizu.val().split("\n").length);
			})
			
			$pBtn.click( function() {
				if($.trim($kamizu.val())==""){
					$.dialog({type: "warn", content: "请至少输入一行账号密码组合", modal: true, autoCloseTime: 3000});
					return false;
				}
				if($.trim($("input[class='pface']:checked").val()) == ""){
					$.dialog({type: "warn", content: "请选择面额", modal: true, autoCloseTime: 3000});
					return false;
				}
				if($.trim($("input[class='ptongdao']:checked").val()) == ""){
					$.dialog({type: "warn", content: "请选择通道", modal: true, autoCloseTime: 3000});
					return false;
				}
				var cards=$kamizu.val().split("\n");
				for(i=0; i<cards.length; i++){
					if(cards[i]!=""){
						var items=cards[i].split(",");
						alert(items.length);
						if(items.length==2){
							$("#cardNum").val(items[0]);
							$("#cardPwd").val(items[1]);
							$.ajax({
								url: "order!save.action",
								data: $pForm.serialize(),
								type: "POST",
								dataType: "json",
								cache: false,
								beforeSend: function(data) {
									//$.dialog({type: 'warn', content: '<span class="loadingIcon">&nbsp;</span>提交中...', modal: true, autoCloseTime: 1000});
									$pBtn.attr("disabled", true);
									$pBtn.removeAttr("button");
									$pBtn.attr("class", "button_click");
									$sload.show();
								},
								success: function(data) {
									if (data.status == "success") {
										var addDiv = '<div class=red newDiv >第'+(i+1)+'张['+data.message+']</div>';
										alert(addDiv);
										$("#jieguo").append(addDiv);
									} else {
										var addDiv = '<div class=red newDiv >第'+(i+1)+'张['+data.message+']</div>';
										$("#jieguo").append(addDiv);
									}
									$pBtn.attr("disabled", false);
									$pBtn.removeAttr("button_click");
									$pBtn.attr("class", "button");
									$pload.attr("class", "red");
									$pload.text(data.message);
								}
							});
						}else{
							var addDiv = '<div class=red newDiv >第'+(i+1)+'张['+data.message+']<br/></div>';
							$("#jieguo").append(addDiv);
						}
					}else{
						var addDiv = '<div class=red newDiv >第'+(i+1)+'张['+data.message+']<br/></div>';
						$("#jieguo").append(addDiv);
					}
				}
				return false;
			});
		})
	</script>
</body>
</html>