package net.xxs.action.admin;

import javax.annotation.Resource;

import net.xxs.entity.Payment;
import net.xxs.service.PaymentService;

import org.apache.struts2.convention.annotation.ParentPackage;

/**
 * 后台Action类 - 支付
 */

@ParentPackage("admin")
public class PaymentAction extends BaseAdminAction {

	private static final long serialVersionUID = -4276446217262552805L;

	private Payment payment;

	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;

	// 查看
	public String view() {
		payment = paymentService.load(id);
		return VIEW;
	}

	// 列表
	public String list() {
		pager = paymentService.findPager(pager);
		return LIST;
	}

	// 删除
	public String delete() {
		paymentService.delete(ids);
		return ajax(Status.success, "删除成功!");
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

}