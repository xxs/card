package net.xxs.bean;


/**
 * Bean类 - 打印模板配置
 */

public class PrintTemplateConfig {
	
	public static final String ORDER = "order";// 订单
	public static final String GOODS = "goods";// 购物单
	public static final String SHIPPING = "shipping";// 配送单
	
	private String name;// 配置名称
	private String description;// 描述
	private String templatePath;// Freemarker模板文件路径

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTemplatePath() {
		return templatePath;
	}

	public void setTemplatePath(String templatePath) {
		this.templatePath = templatePath;
	}

}