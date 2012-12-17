package net.xxs.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.entity.CardsCategory;
import net.xxs.service.CardsCategoryService;
import net.xxs.util.DirectiveUtil;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("cardsCategoryListDirective")
public class CardsCategoryListDirective implements TemplateDirectiveModel {
	
	public static final String TAG_NAME = "cards_category_list";
	private static final String PARENT_ID_PARAMETER_NAME = "parent_id";
	private static final String PARENT_SIGN_PARAMETER_NAME = "parent_sign";
	private static final String COUNT_PARAMETER_NAME = "count";
	private static final String IS_CONTAIN_CHILDREN_PARAMETER_NAME = "isContainChildren";
	private static final Boolean DEFAULT_IS_CONTAIN_CHILDREN = false;
	
	@Resource(name = "cardsCategoryServiceImpl")
	private CardsCategoryService cardsCategoryService;

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		String parentId = DirectiveUtil.getStringParameter(PARENT_ID_PARAMETER_NAME, params);
		String parentSign = DirectiveUtil.getStringParameter(PARENT_SIGN_PARAMETER_NAME, params);
		Integer count = DirectiveUtil.getIntegerParameter(COUNT_PARAMETER_NAME, params);
		Boolean isContainChildren = DirectiveUtil.getBooleanParameter(IS_CONTAIN_CHILDREN_PARAMETER_NAME, params);
		
		if (isContainChildren == null) {
			isContainChildren = DEFAULT_IS_CONTAIN_CHILDREN;
		}
		
		CardsCategory cardsCategory = null;
		List<CardsCategory> cardsCategoryList = null;
		if (StringUtils.isNotEmpty(parentId)) {
			cardsCategory = cardsCategoryService.load(parentId);
		} else if (StringUtils.isNotEmpty(parentSign)) {
			cardsCategory = cardsCategoryService.getCardsCategoryBySign(parentSign);
		}
		cardsCategoryList = cardsCategoryService.getChildrenCardsCategoryList(cardsCategory, isContainChildren, count);
		
		if (body != null && cardsCategoryList != null) {
			if (loopVars.length > 0) {
				loopVars[0] = ObjectWrapper.BEANS_WRAPPER.wrap(cardsCategoryList);
			}
			body.render(env.getOut());
		}
	}

}