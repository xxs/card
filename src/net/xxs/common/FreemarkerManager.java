package net.xxs.common;

import javax.servlet.ServletContext;

import net.xxs.directive.ArticleCategoryListDirective;
import net.xxs.directive.ArticleCategoryTreeDirective;
import net.xxs.directive.ArticleListDirective;
import net.xxs.directive.CheckboxDirective;
import net.xxs.directive.CommentListDirective;
import net.xxs.directive.FriendLinkListDirective;
import net.xxs.directive.GoodsCategoryListDirective;
import net.xxs.directive.GoodsCategoryTreeDirective;
import net.xxs.directive.GoodsListDirective;
import net.xxs.directive.InstantMessagingListDirective;
import net.xxs.directive.NavigationListDirective;
import net.xxs.directive.PaginationDirective;
import net.xxs.directive.PaymentDiscountListDirective;
import net.xxs.directive.PaymentResultMethod;
import net.xxs.directive.SubstringMethod;
import net.xxs.util.SpringUtil;
import freemarker.template.TemplateException;

public class FreemarkerManager extends org.apache.struts2.views.freemarker.FreemarkerManager {

	public synchronized freemarker.template.Configuration getConfiguration(ServletContext servletContext) throws TemplateException {
		freemarker.template.Configuration config = (freemarker.template.Configuration) servletContext.getAttribute(CONFIG_SERVLET_CONTEXT_KEY);
		if (config == null) {
			config = createConfiguration(servletContext);
			// config.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
			
			SubstringMethod substringMethod = (SubstringMethod) SpringUtil.getBean("substringMethod");
			PaymentResultMethod paymentResultMethod = (PaymentResultMethod) SpringUtil.getBean("paymentResultMethod");
			CheckboxDirective checkboxDirective = (CheckboxDirective) SpringUtil.getBean("checkboxDirective");
			PaginationDirective paginationDirective = (PaginationDirective) SpringUtil.getBean("paginationDirective");
			CommentListDirective commentListDirective = (CommentListDirective) SpringUtil.getBean("commentListDirective");
			NavigationListDirective navigationListDirective = (NavigationListDirective) SpringUtil.getBean("navigationListDirective");
			PaymentDiscountListDirective paymentDiscountListDirective = (PaymentDiscountListDirective) SpringUtil.getBean("paymentDiscountListDirective");
			FriendLinkListDirective friendLinkListDirective = (FriendLinkListDirective) SpringUtil.getBean("friendLinkListDirective");
			InstantMessagingListDirective instantMessagingListDirective = (InstantMessagingListDirective) SpringUtil.getBean("instantMessagingListDirective");
			ArticleCategoryListDirective articleCategoryListDirective = (ArticleCategoryListDirective) SpringUtil.getBean("articleCategoryListDirective");
			ArticleCategoryTreeDirective articleCategoryTreeDirective = (ArticleCategoryTreeDirective) SpringUtil.getBean("articleCategoryTreeDirective");
			ArticleListDirective articleListDirective = (ArticleListDirective) SpringUtil.getBean("articleListDirective");
			GoodsCategoryListDirective goodsCategoryListDirective = (GoodsCategoryListDirective) SpringUtil.getBean("goodsCategoryListDirective");
			GoodsCategoryTreeDirective goodsCategoryTreeDirective = (GoodsCategoryTreeDirective) SpringUtil.getBean("goodsCategoryTreeDirective");
			GoodsListDirective goodsListDirective = (GoodsListDirective) SpringUtil.getBean("goodsListDirective");
			
			config.setSharedVariable(PaymentResultMethod.TAG_NAME, paymentResultMethod);
			config.setSharedVariable(SubstringMethod.TAG_NAME, substringMethod);
			config.setSharedVariable(CheckboxDirective.TAG_NAME, checkboxDirective);
			config.setSharedVariable(PaginationDirective.TAG_NAME, paginationDirective);
			config.setSharedVariable(CommentListDirective.TAG_NAME, commentListDirective);
			config.setSharedVariable(NavigationListDirective.TAG_NAME, navigationListDirective);
			config.setSharedVariable(PaymentDiscountListDirective.TAG_NAME, paymentDiscountListDirective);
			config.setSharedVariable(FriendLinkListDirective.TAG_NAME, friendLinkListDirective);
			config.setSharedVariable(InstantMessagingListDirective.TAG_NAME, instantMessagingListDirective);
			config.setSharedVariable(ArticleCategoryListDirective.TAG_NAME, articleCategoryListDirective);
			config.setSharedVariable(ArticleCategoryTreeDirective.TAG_NAME, articleCategoryTreeDirective);
			config.setSharedVariable(ArticleListDirective.TAG_NAME, articleListDirective);
			config.setSharedVariable(GoodsCategoryListDirective.TAG_NAME, goodsCategoryListDirective);
			config.setSharedVariable(GoodsCategoryTreeDirective.TAG_NAME, goodsCategoryTreeDirective);
			config.setSharedVariable(GoodsListDirective.TAG_NAME, goodsListDirective);
			
			servletContext.setAttribute(CONFIG_SERVLET_CONTEXT_KEY, config);
		}
		config.setWhitespaceStripping(true);
		return config;
	}

}