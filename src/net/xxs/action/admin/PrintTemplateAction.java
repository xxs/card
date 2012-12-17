package net.xxs.action.admin;

import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.PrintTemplateConfig;
import net.xxs.util.TemplateConfigUtil;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.views.freemarker.FreemarkerManager;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

import freemarker.template.TemplateException;

/**
 * 后台Action类 - 打印模板
 */

@ParentPackage("admin")
public class PrintTemplateAction extends BaseAdminAction {

	private static final long serialVersionUID = 203597305884066084L;
	
	private PrintTemplateConfig printTemplateConfig;
	private String templateFileContent;
	
	@Resource(name = "freemarkerManager")
	private FreemarkerManager freemarkerManager;

	// 列表
	public String list() {
		return LIST;
	}

	// 编辑
	public String edit() {
		printTemplateConfig = TemplateConfigUtil.getPrintTemplateConfig(printTemplateConfig.getName());
		templateFileContent = TemplateConfigUtil.readTemplateFileContent(printTemplateConfig);
		return INPUT;
	}

	// 更新
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "templateFileContent", message = "模板内容不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		printTemplateConfig = TemplateConfigUtil.getPrintTemplateConfig(printTemplateConfig.getName());
		TemplateConfigUtil.writeTemplateFileContent(printTemplateConfig, templateFileContent);
		try {
			freemarkerManager.getConfiguration(getServletContext()).clearTemplateCache();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		redirectUrl = "print_template!list.action";
		return SUCCESS;
	}

	// 获取生成静态模板配置集合
	public List<PrintTemplateConfig> getAllPrintTemplateConfigList() {
		return TemplateConfigUtil.getAllPrintTemplateConfigList();
	}

	public PrintTemplateConfig getPrintTemplateConfig() {
		return printTemplateConfig;
	}

	public void setPrintTemplateConfig(PrintTemplateConfig printTemplateConfig) {
		this.printTemplateConfig = printTemplateConfig;
	}

	public String getTemplateFileContent() {
		return templateFileContent;
	}

	public void setTemplateFileContent(String templateFileContent) {
		this.templateFileContent = templateFileContent;
	}

}