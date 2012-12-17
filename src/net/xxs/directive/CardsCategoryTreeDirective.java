package net.xxs.directive;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.entity.CardsCategory;
import net.xxs.service.CardsCategoryService;

import org.springframework.stereotype.Component;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

@Component("cardsCategoryTreeDirective")
public class CardsCategoryTreeDirective implements TemplateDirectiveModel {
	
	public static final String TAG_NAME = "cards_category_tree";
	
	@Resource(name = "cardsCategoryServiceImpl")
	private CardsCategoryService cardsCategoryService;

	@SuppressWarnings("unchecked")
	public void execute(Environment env, Map params, TemplateModel[] loopVars, TemplateDirectiveBody body) throws TemplateException, IOException {
		List<CardsCategory> cardsCategoryTree = cardsCategoryService.getCardsCategoryTree();
		if (body != null && cardsCategoryTree != null) {
			if (loopVars.length > 0) {
				loopVars[0] = ObjectWrapper.BEANS_WRAPPER.wrap(cardsCategoryTree);
			}
			body.render(env.getOut());
		}
	}

}