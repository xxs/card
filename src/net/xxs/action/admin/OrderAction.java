package net.xxs.action.admin;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.Payment;
import net.xxs.entity.PaymentConfig;
import net.xxs.service.AdminService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.BeanUtils;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 后台Action类 - 订单
 */

@ParentPackage("admin")
@Results({ @Result(name = "processAction", location = "order!process.action", params = {
		"id", "${order.id}" }, type = "redirect") })
public class OrderAction extends BaseAdminAction {

	private static final long serialVersionUID = -2080980180511054311L;

	private String shipAreaId;
	private String reshipAreaId;

	private Order order;
	private Payment payment;
	private PaymentConfig paymentConfig;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	// 列表
	public String list() {
		pager = orderService.findPager(pager);
		return LIST;
	}

	// 订单删除
	public String delete() {
		try {
			orderService.delete(ids);
		} catch (Exception e) {
			return ajax(Status.error, "删除失败,订单数据被引用!");
		}
		return ajax(Status.success, "删除成功!");
	}

	// 订单编辑
	public String edit() {
		order = orderService.load(id);
		if (order.getOrderStatus() == OrderStatus.completed
				|| order.getOrderStatus() == OrderStatus.invalid) {
			addActionError("此订单状态无法编辑!");
			return ERROR;
		}
		if (order.getPaymentStatus() != net.xxs.entity.Order.PaymentStatus.unpaid) {
			addActionError("此订单付款状态无法编辑!");
			return ERROR;
		}
		return INPUT;
	}

	// 订单更新
	@Validations(requiredStrings = {
			@RequiredStringValidator(fieldName = "shipAreaId", message = "收货人地区不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipName", message = "收货人姓名不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipAddress", message = "收货人地址不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipZipCode", message = "邮编不允许为空!") }, requiredFields = {
			@RequiredFieldValidator(fieldName = "deliveryType.id", message = "配送方式不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.deliveryFee", message = "配送费用不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.paymentFee", message = "支付费用不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.totalProductWeight", message = "充值卡重量不允许为空!") })
	@InputConfig(resultName = "error")
	public String update() {
		Order persistent = orderService.load(id);
		if (persistent.getOrderStatus() == OrderStatus.completed
				|| persistent.getOrderStatus() == OrderStatus.invalid) {
			addActionError("此订单状态无法编辑!");
			return ERROR;
		}
		if (persistent.getPaymentStatus() != net.xxs.entity.Order.PaymentStatus.unpaid) {
			addActionError("此订单付款状态无法编辑!");
			return ERROR;
		}
		if (order.getProductPrice().compareTo(new BigDecimal(0)) < 0) {
			addActionError("充值卡价格错误!");
			return ERROR;
		}
		//Product product = persistent.getProduct();
		BigDecimal totalAmount = new BigDecimal(0);// 订单总金额

		String paymentConfigName = null;
		if (paymentConfig != null
				&& StringUtils.isNotEmpty(paymentConfig.getId())) {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
			paymentConfigName = paymentConfig.getName();
		} else {
			paymentConfig = null;
			paymentConfigName = "货到付款";
		}

		totalAmount = persistent.getAmountPayable();
		order.setAmountPayable(totalAmount);
		order.setOrderStatus(OrderStatus.processed);
		order.setPaymentConfigName(paymentConfigName);
		order.setPaymentConfig(paymentConfig);
		BeanUtils.copyProperties(order, persistent, new String[] { "id",
				"createDate", "modifyDate", "orderSn", "orderStatus",
				"paymentStatus", "shippingStatus", "paidAmount", "memo",
				"member" });
		orderService.update(persistent);
		logInfo = "订单编号: " + persistent.getOrderSn();

		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.modify);
		orderLog.setOrderSn(persistent.getOrderSn());
		orderLog.setOperator(adminService.getLoginAdmin().getUsername());
		orderLog.setInfo(null);
		orderLog.setOrder(persistent);
		orderLogService.save(orderLog);

		redirectUrl = "order!list.action";
		return SUCCESS;
	}

	// 订单处理
	public String process() {
		order = orderService.load(id);
		return "process";
	}

	// 订单完成
	public String completed() {
		order = orderService.load(id);
		if (order.getOrderStatus() == OrderStatus.completed) {
			return ajax(Status.warn, "此订单已经完成!");
		} else if (order.getOrderStatus() == OrderStatus.invalid) {
			return ajax(Status.error, "此订单已经作废!");
		} else {
			order.setOrderStatus(OrderStatus.completed);
			orderService.update(order);
			logInfo = "订单编号: " + order.getOrderSn();
			String orderLogInfo = "订单完成,获得积分: ";
			// 订单日志
			OrderLog orderLog = new OrderLog();
			orderLog.setOrderLogType(OrderLogType.completed);
			orderLog.setOrderSn(order.getOrderSn());
			orderLog.setOperator(adminService.getLoginAdmin().getUsername());
			orderLog.setInfo(orderLogInfo);
			orderLog.setOrder(order);
			orderLogService.save(orderLog);

			return ajax(Status.success, "您的操作已成功!");
		}
	}

	// 作废
	public String invalid() {
		order = orderService.load(id);
		if (order.getOrderStatus() == OrderStatus.completed
				|| order.getOrderStatus() == OrderStatus.invalid) {
			addActionError("此订单状态无法编辑!");
			return ERROR;
		}
		if (order.getPaymentStatus() != net.xxs.entity.Order.PaymentStatus.unpaid) {
			addActionError("此订单支付状态无法编辑!");
			return ERROR;
		}
		if (order.getOrderStatus() == OrderStatus.completed) {
			return ajax(Status.warn, "此订单已经完成!");
		} else if (order.getOrderStatus() == OrderStatus.invalid) {
			return ajax(Status.error, "此订单已经作废!");
		} else if (order.getPaymentStatus() != net.xxs.entity.Order.PaymentStatus.unpaid) {
			return ajax(Status.error, "此订单付款状态无法作废!");
		} else {
			order.setOrderStatus(OrderStatus.invalid);
			orderService.update(order);
			logInfo = "订单编号: " + order.getOrderSn();

			// 订单日志
			OrderLog orderLog = new OrderLog();
			orderLog.setOrderLogType(OrderLogType.invalid);
			orderLog.setOrderSn(order.getOrderSn());
			orderLog.setOperator(adminService.getLoginAdmin().getUsername());
			orderLog.setInfo(null);
			orderLog.setOrder(order);
			orderLogService.save(orderLog);

			return ajax(Status.success, "您的操作已成功!");
		}
	}

	// 订单查看
	public String view() {
		order = orderService.load(id);
		return "view";
	}

	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}

	// 获取当前日期
	public Date getCurrentDate() {
		return new Date();
	}

	// 获取当前日期(年)
	public int getCurrentYear() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.YEAR);
	}

	// 获取当前日期(月)
	public int getCurrentMonth() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.MONTH) + 1;
	}

	// 获取当前日期(日)
	public int getCurrentDay() {
		Calendar calendar = Calendar.getInstance();
		return calendar.get(Calendar.DAY_OF_MONTH) + 1;
	}

	public String getShipAreaId() {
		return shipAreaId;
	}

	public void setShipAreaId(String shipAreaId) {
		this.shipAreaId = shipAreaId;
	}

	public String getReshipAreaId() {
		return reshipAreaId;
	}

	public void setReshipAreaId(String reshipAreaId) {
		this.reshipAreaId = reshipAreaId;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

}