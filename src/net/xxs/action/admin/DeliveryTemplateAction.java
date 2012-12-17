package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.DeliveryTemplate;
import net.xxs.service.DeliveryTemplateService;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 快递单模板
 */

@ParentPackage("admin")
public class DeliveryTemplateAction extends BaseAdminAction {

	private static final long serialVersionUID = -5873330939499290882L;
	
	private DeliveryTemplate deliveryTemplate;

	@Resource(name = "deliveryTemplateServiceImpl")
	private DeliveryTemplateService deliveryTemplateService;

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		deliveryTemplate = deliveryTemplateService.load(id);
		return INPUT;
	}

	// 列表
	public String list() {
		pager = deliveryTemplateService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		deliveryTemplateService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	// 保存
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "deliveryTemplate.name", message = "模板名称不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryTemplate.content", message = "模板名称内容不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		deliveryTemplateService.save(deliveryTemplate);
		redirectUrl = "delivery_template!list.action";
		return SUCCESS;
	}

	// 更新
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "deliveryTemplate.name", message = "模板名称不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryTemplate.content", message = "模板名称内容不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		DeliveryTemplate persistent = deliveryTemplateService.load(id);
		BeanUtils.copyProperties(deliveryTemplate, persistent, new String[] {"id", "createDate", "modifyDate"});
		deliveryTemplateService.update(persistent);
		redirectUrl = "delivery_template!list.action";
		return SUCCESS;
	}
	
	public DeliveryTemplate getDeliveryTemplate() {
		return deliveryTemplate;
	}

	public void setDeliveryTemplate(DeliveryTemplate deliveryTemplate) {
		this.deliveryTemplate = deliveryTemplate;
	}

}