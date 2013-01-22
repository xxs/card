
xxs = {
	base: "${base}",
	currencySign: "${setting.currencySign}",
	currencyUnit: "${setting.currencyUnit}",
	priceScale: "${setting.priceScale}",
	priceRoundType: "${setting.priceRoundType}"
};

// 货币格式化
function currencyFormat(price) {
	price = setScale(price, xxs.priceScale, xxs.priceRoundType);
	return xxs.currencySign + price + xxs.currencyUnit;
}

$().ready( function() {

	var $body = $("body");
	
	/* ---------- MemberVerify ---------- */
	
	$.memberVerify = function () {
		if(getCookie("memberUsername") != null) {
			var isMemberLogin = false;
			$.ajax({
				url: xxs.base + "/card/member!ajaxMemberVerify.action",
				type: "POST",
				dataType: "json",
				async: false,
				cache: false,
				success: function(data) {
					if (data.status) {
						isMemberLogin = true;
					}
				}
			});
			return isMemberLogin;
		} else {
			return false;
		}
	}
	
	/* ---------- ArticleContent ---------- */
	
	var $articleContent = $("#articleContent");
	if ($articleContent.size() > 0) {
		$changeBigFontSize = $("#changeBigFontSize");
		$changeNormalFontSize = $("#changeNormalFontSize");
		$changeSmallFontSize = $("#changeSmallFontSize");
		
		$changeBigFontSize.click(function () {
			$articleContent.css({"font-size": "16px"});
		});
		
		$changeNormalFontSize.click(function () {
			$articleContent.css({"font-size": "14px"});
		});
		
		$changeSmallFontSize.click(function () {
			$articleContent.css({"font-size": "12px"});
		});
	}
	
	/* ---------- Sonline server ---------- */
	$(function(){
		$("body").Sonline({
			Position:"right",//left或right
			Top:200,//顶部距离，默认200px
			Effect:false, //滚动或者固定两种方式，布尔值：true或false
			DefaultsOpen:false, //默认展开：true,默认收缩：false
			Qqlist:"
				<@instant_messaging_list; instantMessagingList>
					<#list instantMessagingList as instantMessaging>
							<#if instantMessaging.instantMessagingType == "qq">
								${instantMessaging.value}|${instantMessaging.title},
							</#if>
					</#list>
				</@instant_messaging_list>
			" //多个QQ用','隔开，QQ和客服名用'|'隔开
		});
	})	
});