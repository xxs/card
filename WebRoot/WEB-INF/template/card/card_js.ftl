
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
});