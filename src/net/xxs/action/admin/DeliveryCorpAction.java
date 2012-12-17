package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.DeliveryCorp;
import net.xxs.service.DeliveryCorpService;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.IntRangeFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 物流公司
 */

@ParentPackage("admin")
public class DeliveryCorpAction extends BaseAdminAction {

	private static final long serialVersionUID = -5162370084764617443L;

	private DeliveryCorp deliveryCorp;

	@Resource(name = "deliveryCorpServiceImpl")
	private DeliveryCorpService deliveryCorpService;

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		deliveryCorp = deliveryCorpService.load(id);
		return INPUT;
	}

	// 列表
	public String list() {
		pager = deliveryCorpService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		deliveryCorpService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	// 保存
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "deliveryCorp.name", message = "物流公司名称不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "deliveryCorp.orderList", min = "0", message = "排序必须为零或正整数!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		deliveryCorpService.save(deliveryCorp);
		redirectUrl = "delivery_corp!list.action";
		return SUCCESS;
	}

	// 更新
	@Validations(
		requiredStrings = { 
			@RequiredStringValidator(fieldName = "deliveryCorp.name", message = "物流公司名称不允许为空!")
		},
		intRangeFields = {
			@IntRangeFieldValidator(fieldName = "deliveryCorp.orderList", min = "0", message = "排序必须为零或正整数!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		DeliveryCorp persistent = deliveryCorpService.load(id);
		BeanUtils.copyProperties(deliveryCorp, persistent, new String[]{"id", "createDate", "modifyDate", "deliveryTypeSet"});
		deliveryCorpService.update(persistent);
		redirectUrl = "delivery_corp!list.action";
		return SUCCESS;
	}

	public DeliveryCorp getDeliveryCorp() {
		return deliveryCorp;
	}

	public void setDeliveryCorp(DeliveryCorp deliveryCorp) {
		this.deliveryCorp = deliveryCorp;
	}

}