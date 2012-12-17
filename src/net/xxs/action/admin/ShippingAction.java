package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.Shipping;
import net.xxs.service.ShippingService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 发货
 */

@ParentPackage("admin")
public class ShippingAction extends BaseAdminAction {

	private static final long serialVersionUID = 3763457558863574061L;

	private Shipping shipping;

	@Resource(name = "shippingServiceImpl")
	private ShippingService shippingService;

	// 查看
	public String view() {
		shipping = shippingService.load(id);
		return VIEW;
	}

	// 列表
	public String list() {
		pager = shippingService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		try {
			shippingService.delete(ids);
		} catch (Exception e) {
			return ajax(Status.error, "删除失败,会员数据被引用!");
		}
		return ajax(Status.success, "删除成功!");
	}

	public Shipping getShipping() {
		return shipping;
	}

	public void setShipping(Shipping shipping) {
		this.shipping = shipping;
	}

}