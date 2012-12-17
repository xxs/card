package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.Area;
import net.xxs.entity.DeliveryCenter;
import net.xxs.service.AreaService;
import net.xxs.service.DeliveryCenterService;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 发货点
 */

@ParentPackage("admin")
public class DeliveryCenterAction extends BaseAdminAction {

	private static final long serialVersionUID = 7833922325834476473L;

	private String areaId;
	private DeliveryCenter deliveryCenter;

	@Resource(name = "deliveryCenterServiceImpl")
	private DeliveryCenterService deliveryCenterService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;

	// 添加
	public String add() {
		return INPUT;
	}

	// 编辑
	public String edit() {
		deliveryCenter = deliveryCenterService.load(id);
		return INPUT;
	}

	// 列表
	public String list() {
		pager = deliveryCenterService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		deliveryCenterService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	// 保存
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "deliveryCenter.name", message = "发货点名称不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryCenter.consignor", message = "发货人不允许为空!"),
			@RequiredStringValidator(fieldName = "areaId", message = "地区不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryCenter.address", message = "地址不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		Area area = areaService.get(areaId);
		if (area == null) {
			addActionError("请选择地区!");
			return ERROR;
		}
		deliveryCenter.setArea(area);
		deliveryCenterService.save(deliveryCenter);
		redirectUrl = "delivery_center!list.action";
		return SUCCESS;
	}

	// 更新
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "deliveryCenter.name", message = "发货点名称不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryCenter.consignor", message = "发货人不允许为空!"),
			@RequiredStringValidator(fieldName = "areaId", message = "地区不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryCenter.address", message = "地址不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		Area area = areaService.get(areaId);
		if (area == null) {
			addActionError("请选择地区!");
			return ERROR;
		}
		deliveryCenter.setArea(area);
		DeliveryCenter persistent = deliveryCenterService.load(id);
		BeanUtils.copyProperties(deliveryCenter, persistent, new String[] {"id", "createDate", "modifyDate"});
		deliveryCenterService.update(persistent);
		redirectUrl = "delivery_center!list.action";
		return SUCCESS;
	}

	public DeliveryCenter getDeliveryCenter() {
		return deliveryCenter;
	}

	public void setDeliveryCenter(DeliveryCenter deliveryCenter) {
		this.deliveryCenter = deliveryCenter;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

}