package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.Refund;
import net.xxs.service.RefundService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 退款
 */

@ParentPackage("admin")
public class RefundAction extends BaseAdminAction {

	private static final long serialVersionUID = 229015918586548826L;

	private Refund refund;

	@Resource(name = "refundServiceImpl")
	private RefundService refundService;

	// 查看
	public String view() {
		refund = refundService.load(id);
		return VIEW;
	}

	// 列表
	public String list() {
		pager = refundService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		try {
			refundService.delete(ids);
		} catch (Exception e) {
			return ajax(Status.error, "删除失败,会员数据被引用!");
		}
		return ajax(Status.success, "删除成功!");
	}

	public Refund getRefund() {
		return refund;
	}

	public void setRefund(Refund refund) {
		this.refund = refund;
	}

}