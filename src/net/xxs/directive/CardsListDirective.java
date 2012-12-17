package net.xxs.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.entity.Cards;
import net.xxs.entity.CardsCategory;
import net.xxs.service.CardsCategoryService;
import net.xxs.service.CardsService;
import net.xxs.util.DirectiveUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("cardsListDirective")
public class CardsListDirective implements TemplateDirectiveModel {
	
	public static final String TAG_NAME = "cards_list";
	private static final String CARDS_CATEGORY_ID_PARAMETER_NAME = "cards_category_id";
	private static final String CARDS_CATEGORY_SIGN_PARAMETER_NAME = "cards_category_sign";
	private static final String TYPE_PARAMETER_NAME = "type";
	private static final String COUNT_PARAMETER_NAME = "count";
	private static final String IS_CONTAIN_CHILDREN_PARAMETER_NAME = "isContainChildren";
	private static final Boolean DEFAULT_IS_CONTAIN_CHILDREN = true;
	
	@Resource(name = "cardsCategoryServiceImpl")
	private CardsCategoryService cardsCategoryService;
	@Resource(name = "cardsServiceImpl")
	private CardsService cardsService;

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		String cardsCategoryId = DirectiveUtil.getStringParameter(CARDS_CATEGORY_ID_PARAMETER_NAME, params);
		String cardsCategorySign = DirectiveUtil.getStringParameter(CARDS_CATEGORY_SIGN_PARAMETER_NAME, params);
		String type = DirectiveUtil.getStringParameter(TYPE_PARAMETER_NAME, params);
		Integer count = DirectiveUtil.getIntegerParameter(COUNT_PARAMETER_NAME, params);
		Boolean isContainChildren = DirectiveUtil.getBooleanParameter(IS_CONTAIN_CHILDREN_PARAMETER_NAME, params);
		
		if (isContainChildren == null) {
			isContainChildren = DEFAULT_IS_CONTAIN_CHILDREN;
		}
		
		CardsCategory cardsCategory = null;
		List<Cards> cardsList = null;
		if (StringUtils.isNotEmpty(cardsCategoryId)) {
			cardsCategory = cardsCategoryService.load(cardsCategoryId);
		} else if (StringUtils.isNotEmpty(cardsCategorySign)) {
			cardsCategory = cardsCategoryService.getCardsCategoryBySign(cardsCategorySign);
		}
		cardsList = cardsService.getCardsList(cardsCategory, type, isContainChildren, count);
		
		if (body != null && cardsList != null) {
			if (loopVars.length > 0) {
				loopVars[0] = ObjectWrapper.BEANS_WRAPPER.wrap(cardsList);
			}
			body.render(env.getOut());
		}
	}

}