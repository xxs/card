package net.xxs.action.admin;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Setting;
import net.xxs.bean.Setting.ScoreType;
import net.xxs.entity.Deposit;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Member;
import net.xxs.entity.MemberRank;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.OrderItem;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.Payment;
import net.xxs.entity.Payment.PaymentStatus;
import net.xxs.entity.Payment.PaymentType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.Product;
import net.xxs.service.AdminService;
import net.xxs.service.DepositService;
import net.xxs.service.MemberRankService;
import net.xxs.service.MemberService;
import net.xxs.service.OrderItemService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.PaymentService;
import net.xxs.service.ProductService;
import net.xxs.util.SettingUtil;

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
@Results({ 
	@Result(name = "processAction", location = "order!process.action", params = {"id", "${order.id}"}, type = "redirect")
})
public class OrderAction extends BaseAdminAction {

	private static final long serialVersionUID = -2080980180511054311L;

	private String shipAreaId;
	private String reshipAreaId;
	
	private Order order;
	private Payment payment;
	private PaymentConfig paymentConfig;
	
	private List<OrderItem> orderItemList;

	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;
	@Resource(name = "depositServiceImpl")
	private DepositService depositService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "memberRankServiceImpl")
	private MemberRankService memberRankService;
	@Resource(name = "adminServiceImpl")
	private AdminService adminService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;

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
		if (order.getOrderStatus() == OrderStatus.completed || order.getOrderStatus() == OrderStatus.invalid) {
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
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "shipAreaId", message = "收货人地区不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipName", message = "收货人姓名不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipAddress", message = "收货人地址不允许为空!"),
			@RequiredStringValidator(fieldName = "order.shipZipCode", message = "邮编不允许为空!")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "deliveryType.id", message = "配送方式不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.deliveryFee", message = "配送费用不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.paymentFee", message = "支付费用不允许为空!"),
			@RequiredFieldValidator(fieldName = "order.totalProductWeight", message = "商品重量不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String update() {
		Order persistent = orderService.load(id);
		if (persistent.getOrderStatus() == OrderStatus.completed || persistent.getOrderStatus() == OrderStatus.invalid) {
			addActionError("此订单状态无法编辑!");
			return ERROR;
		}
		if (persistent.getPaymentStatus() != net.xxs.entity.Order.PaymentStatus.unpaid) {
			addActionError("此订单付款状态无法编辑!");
			return ERROR;
		}
		if (order.getPaymentFee().compareTo(new BigDecimal(0)) < 0) {
			addActionError("支付费用不允许小于0!");
			return ERROR;
		}
		if (orderItemList == null || orderItemList.size() == 0) {
			addActionError("请保留至少一个商品!");
			return ERROR;
		}
		
		Setting setting = getSetting();
		for (OrderItem orderItem : orderItemList) {
			if (orderItem.getProductQuantity() < 1) {
				addActionError("商品数量错误!");
				return ERROR;
			}
			if (orderItem.getProductPrice().compareTo(new BigDecimal(0)) < 0) {
				addActionError("商品价格错误!");
				return ERROR;
			}
			OrderItem persistentOrderItem = orderItemService.load(orderItem.getId());
			Product product = persistentOrderItem.getProduct();
		}
		
		Integer totalProductQuantity = 0;// 商品总数
		BigDecimal totalProductPrice = new BigDecimal(0);// 商品总价格
		BigDecimal totalAmount = new BigDecimal(0);// 订单总金额
		for (OrderItem orderItem : orderItemList) {
			OrderItem orderItemPersistent = orderItemService.load(orderItem.getId());
			totalProductQuantity += orderItem.getProductQuantity();
			totalProductPrice = totalProductPrice.add(orderItem.getProductPrice().multiply(new BigDecimal(orderItem.getProductQuantity().toString())));
			BeanUtils.copyProperties(orderItem, orderItemPersistent, new String[] {"id", "createDate", "modifyDate", "productSn", "productName", "productHtmlPath", "deliveryQuantity", "totalDeliveryQuantity", "order", "product"});
			orderItemService.update(orderItemPersistent);
		}
		for (OrderItem orderItem : persistent.getOrderItemSet()) {
			if (!orderItemList.contains(orderItem)) {
				orderItemService.delete(orderItem);
			}
		}
		
		String paymentConfigName = null;
		if (paymentConfig != null && StringUtils.isNotEmpty(paymentConfig.getId())) {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
			paymentConfigName = paymentConfig.getName();
		} else {
			paymentConfig = null;
			paymentConfigName = "货到付款";
		}
		
		totalAmount = totalProductPrice.add(totalProductPrice);
		order.setTotalAmount(totalAmount);
		order.setOrderStatus(OrderStatus.processed);
		order.setPaymentConfigName(paymentConfigName);
		order.setTotalProductPrice(totalProductPrice);
		order.setTotalProductQuantity(totalProductQuantity);
		order.setPaymentConfig(paymentConfig);
		BeanUtils.copyProperties(order, persistent, new String[] {"id", "createDate", "modifyDate", "orderSn", "orderStatus", "paymentStatus", "shippingStatus", "paidAmount", "memo", "member"});
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
	
	// 订单支付
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "paymentConfig.id", message = "支付方式不允许为空!")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "payment.paymentType", message = "支付类型不允许为空!"),
			@RequiredFieldValidator(fieldName = "payment.totalAmount", message = "支付金额不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String payment() {
		order = orderService.load(id);
		if (order.getOrderStatus() == OrderStatus.completed || order.getOrderStatus() == OrderStatus.invalid) {
			addActionError("此订单状态无法支付!");
			return ERROR;
		}
		if (order.getPaymentStatus() == net.xxs.entity.Order.PaymentStatus.paid || order.getPaymentStatus() == net.xxs.entity.Order.PaymentStatus.partRefund || order.getPaymentStatus() == net.xxs.entity.Order.PaymentStatus.refunded) {
			addActionError("此订单付款状态无法支付!");
			return ERROR;
		}
		if (payment.getPaymentType() == PaymentType.recharge) {
			addActionError("支付类型错误!");
			return ERROR;
		}
		if (payment.getTotalAmount().compareTo(new BigDecimal(0)) < 0) {
			addActionError("支付金额不允许小于0!");
			return ERROR;
		}
		if (payment.getTotalAmount().compareTo(order.getTotalAmount().subtract(order.getPaidAmount())) > 0) {
			addActionError("支付金额超出订单需付金额!");
			return ERROR;
		}
		Deposit deposit = null;
		if (payment.getPaymentType() == PaymentType.deposit) {
			Member member = order.getMember();
			if (member == null) {
				addActionError("会员不存在,不允许使用预存款支付!");
				return ERROR;
			}
			if (payment.getTotalAmount().compareTo(member.getDeposit()) > 0) {
				addActionError("会员预存款余额不足!");
				return ERROR;
			}
			member.setDeposit(member.getDeposit().subtract(payment.getTotalAmount()));
			memberService.update(member);
			
			deposit = new Deposit();
			deposit.setDepositType(DepositType.adminPayment);
			deposit.setCredit(new BigDecimal(0));
			deposit.setDebit(payment.getTotalAmount());
			deposit.setBalance(member.getDeposit());
			deposit.setMember(member);
			depositService.save(deposit);
		}
		
		paymentConfig = paymentConfigService.load(paymentConfig.getId());
		payment.setPaymentConfigName(paymentConfig.getName());
		payment.setPaymentFee(new BigDecimal(0));
		payment.setOperator(adminService.getLoginAdmin().getUsername());
		payment.setPaymentStatus(PaymentStatus.success);
		payment.setDeposit(deposit);
		payment.setOrder(order);
		paymentService.save(payment);
		
		order.setOrderStatus(OrderStatus.processed);
		if (payment.getTotalAmount().compareTo(order.getTotalAmount().subtract(order.getPaidAmount())) < 0) {
			order.setPaymentStatus(net.xxs.entity.Order.PaymentStatus.partPayment);
		} else {
			order.setPaymentStatus(net.xxs.entity.Order.PaymentStatus.paid);
		}
		order.setPaidAmount(payment.getTotalAmount().add(order.getPaidAmount()));
		orderService.update(order);
		logInfo = "订单编号: " + order.getOrderSn();
		
		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.payment);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(adminService.getLoginAdmin().getUsername());
		orderLog.setInfo("支付金额: " + SettingUtil.currencyFormat(payment.getTotalAmount()));
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		
		return "processAction";
	}
	
	// 订单发货
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "shipAreaId", message = "收货人地区不允许为空!"),
			@RequiredStringValidator(fieldName = "shipping.shipName", message = "收货人姓名不允许为空!"),
			@RequiredStringValidator(fieldName = "shipping.shipAddress", message = "收货人地址不允许为空!"),
			@RequiredStringValidator(fieldName = "shipping.shipZipCode", message = "邮编不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryType.id", message = "配送方式不允许为空!"),
			@RequiredStringValidator(fieldName = "deliveryCorp.id", message = "物流公司不允许为空!")
		},
		requiredFields = {
			@RequiredFieldValidator(fieldName = "shipping.deliveryFee", message = "物流费用不允许为空!")
		}
	)
	
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
			
			Setting setting = getSetting();
			Integer totalScore = 0;
			String orderLogInfo = null;
			if (setting.getScoreType() == ScoreType.orderAmount) {
				totalScore = order.getTotalProductPrice().multiply(new BigDecimal(setting.getScoreScale().toString())).setScale(0, RoundingMode.DOWN).intValue();
			} else if (setting.getScoreType() == ScoreType.cardsSet) {
				for (OrderItem orderItem : order.getOrderItemSet()) {
					totalScore = orderItem.getProduct().getCards().getScore() * orderItem.getProductQuantity() + totalScore;
				}
			}
			if (totalScore > 0) {
				orderLogInfo = "订单完成,获得积分: " + totalScore;
				Member member = order.getMember();
				member.setScore(member.getScore() + totalScore);
				MemberRank upMemberRank = memberRankService.getUpMemberRankByScore(member.getScore());
				if (upMemberRank != null && member.getScore() >= upMemberRank.getScore()) {
					member.setMemberRank(upMemberRank);
				}
				memberService.update(member);
			}
			
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
		if (order.getOrderStatus() == OrderStatus.completed || order.getOrderStatus() == OrderStatus.invalid) {
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
	
	// 获取支付类型集合（不包含在线充值）
	public List<PaymentType> getNonRechargePaymentTypeList() {
		List<PaymentType> paymentTypeList = new ArrayList<PaymentType>();
		for (PaymentType paymentType : PaymentType.values()) {
			if (paymentType != PaymentType.recharge) {
				paymentTypeList.add(paymentType);
			}
		}
		return paymentTypeList;
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
	

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}

}