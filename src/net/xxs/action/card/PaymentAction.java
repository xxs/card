package net.xxs.action.card;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.Map;

import javax.annotation.Resource;

import net.xxs.entity.Brand;
import net.xxs.entity.Deposit;
import net.xxs.entity.Deposit.DepositType;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.Payment;
import net.xxs.entity.Payment.PaymentStatus;
import net.xxs.entity.Payment.PaymentType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.PaymentConfig.PaymentConfigType;
import net.xxs.entity.PaymentDiscount;
import net.xxs.payment.BasePaymentProduct;
import net.xxs.payment.PaymentResult;
import net.xxs.service.BrandService;
import net.xxs.service.DepositService;
import net.xxs.service.MemberService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.PaymentDiscountService;
import net.xxs.service.PaymentService;
import net.xxs.util.PaymentProductUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 支付处理
 */

@ParentPackage("card")
@InterceptorRefs({
		@InterceptorRef(value = "memberVerifyInterceptor", params = {
				"excludeMethods", "payreturn,paynotify,result" }),
		@InterceptorRef(value = "cardStack") })
public class PaymentAction extends BaseCardAction {

	private static final long serialVersionUID = -4817743897444468581L;

	private BigDecimal rechargeAmount;// 充值金额
	private Payment payment;
	private String paymentUrl;// 支付请求URL
	private String paymentsn;// 支付编号
	private String payreturnMessage;// 支付返回信息
	private String paynotifyMessage;// 支付通知信息

	private PaymentType paymentType;// 支付类型
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单
	private Map<String, String> parameterMap;// 支付参数
	private PaymentResult paymentResult;// 支付返回参数

	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;
	@Resource(name = "depositServiceImpl")
	private DepositService depositService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "memberServiceImpl")
	private MemberService memberService;
	@Resource(name = "paymentDiscountServiceImpl")
	private PaymentDiscountService paymentDiscountService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;

	// 支付提交
	public String submit() {
		System.out.println("提交支付......");
		if ((order == null || StringUtils.isEmpty(order.getId()))
				&& (paymentConfig == null || StringUtils.isEmpty(paymentConfig
						.getId()))) {
			addActionError("参数错误!");
			return ERROR;
		}
		if (order != null) {
			order = orderService.load(order.getId());
			paymentConfig = order.getPaymentConfig();
		} else {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
		}
		System.out.println("112221");
		if (paymentConfig == null) {
			addActionError("支付方式不允许为空!");
			return ERROR;
		}
		PaymentConfigType paymentConfigType = paymentConfig.getPaymentConfigType();
		if (paymentConfigType != PaymentConfigType.online) {
			addActionError("支付方式错误!");
			return ERROR;
		}
		if (order == null || StringUtils.isEmpty(order.getId())) {
			addActionError("订单信息错误!");
			return ERROR;
		}
		order = orderService.load(order.getId());
		if (order.getOrderStatus() == OrderStatus.completed
				|| order.getOrderStatus() == OrderStatus.invalid) {
			addActionError("订单状态错误!");
			return ERROR;
		}
		if (order.getPaymentStatus() == net.xxs.entity.Order.PaymentStatus.paid) {
			addActionError("订单付款状态错误!");
			return ERROR;
		}
		System.out.println("开始订单信息........"+order.getOrderSn());
		BigDecimal amount = order.getAmount();
		System.out.println("开始订单信息..1111......"+order.getOrderSn());
		Member loginMember = getLoginMember();
		System.out.println("开始订单信息..2222......"+order.getOrderSn());
		BasePaymentProduct paymentProduct = PaymentProductUtil
				.getPaymentProduct(paymentConfig.getPaymentProductId());
		paymentUrl = paymentProduct.getPaymentUrl();

		String bankName = paymentProduct.getName();
		String bankAccount = paymentConfig.getBargainorId();
		System.out.println("开始订单信息..2222...ssss..."+order.getOrderSn());
		Payment payment1 = new Payment();
		payment1.setPaymentType(PaymentType.online);
		payment1.setPaymentConfigName(paymentConfig.getName());
		payment1.setBankName(bankName);
		payment1.setBankAccount(bankAccount);
		payment1.setAmount(amount);
		payment1.setPayer(getLoginMember().getUsername());
		payment1.setOperator(null);
		payment1.setMemo(null);
		payment1.setPaymentStatus(PaymentStatus.ready);
		payment1.setMember(loginMember);
		payment1.setPaymentConfig(paymentConfig);
		payment1.setDeposit(null);
		payment1.setOrder(order);
		paymentService.save(payment1);
		System.out.println("开始订单信息..wwww......"+order.getOrderSn());
		System.out.println(payment1.getPaymentSn());
		System.out.println(paymentConfig.getId());
		System.out.println(amount);
		System.out.println(getRequest());
		parameterMap = paymentProduct.getParameterMap(paymentConfig,
				payment1.getPaymentSn(), amount, getRequest());
		return "submit";
	}
	// 支付发送（批量）
	public String send() {
		System.out.println("发送支付......");
		if ((order == null || StringUtils.isEmpty(order.getId()))
				&& (paymentConfig == null || StringUtils.isEmpty(paymentConfig
						.getId()))) {
			addActionError("参数错误!");
			return ERROR;
		}
		if (order != null) {
			order = orderService.load(order.getId());
			paymentConfig = order.getPaymentConfig();
		} else {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
		}
		System.out.println("112221");
		if (paymentConfig == null) {
			addActionError("支付方式不允许为空!");
			return ERROR;
		}
		PaymentConfigType paymentConfigType = paymentConfig.getPaymentConfigType();

		if (paymentConfigType != PaymentConfigType.online) {
			addActionError("支付方式错误!");
			return ERROR;
		}
		if (order == null || StringUtils.isEmpty(order.getId())) {
			addActionError("订单信息错误!");
			return ERROR;
		}
		order = orderService.load(order.getId());
		if (order.getOrderStatus() == OrderStatus.completed
				|| order.getOrderStatus() == OrderStatus.invalid) {
			addActionError("订单状态错误!");
			return ERROR;
		}
		if (order.getPaymentStatus() == net.xxs.entity.Order.PaymentStatus.paid) {
			addActionError("订单付款状态错误!");
			return ERROR;
		}
		System.out.println("开始订单信息........"+order.getOrderSn());
		BigDecimal amount = order.getAmount();
		System.out.println("开始订单信息..1111......"+order.getOrderSn());
		Member loginMember = getLoginMember();
		System.out.println("开始订单信息..2222......"+order.getOrderSn());
		BasePaymentProduct paymentProduct = PaymentProductUtil
				.getPaymentProduct(paymentConfig.getPaymentProductId());
		paymentUrl = paymentProduct.getPaymentUrl();

		String bankName = paymentProduct.getName();
		String bankAccount = paymentConfig.getBargainorId();
		System.out.println("开始订单信息..2222...ssss..."+order.getOrderSn());
		Payment payment1 = new Payment();
		payment1.setPaymentType(PaymentType.online);
		payment1.setPaymentConfigName(paymentConfig.getName());
		payment1.setBankName(bankName);
		payment1.setBankAccount(bankAccount);
		payment1.setAmount(amount);
		payment1.setPayer(getLoginMember().getUsername());
		payment1.setOperator(null);
		payment1.setMemo(null);
		payment1.setPaymentStatus(PaymentStatus.ready);
		payment1.setMember(loginMember);
		payment1.setPaymentConfig(paymentConfig);
		payment1.setDeposit(null);
		payment1.setOrder(order);
		paymentService.save(payment1);
		System.out.println("开始订单信息..wwww......"+order.getOrderSn());
		System.out.println(payment1.getPaymentSn());
		System.out.println(paymentConfig.getId());
		System.out.println(getRequest());
		paymentResult = paymentProduct.cardPay(paymentConfig,
				payment1.getPaymentSn(), amount, getRequest());
		System.out.println("支付处理结果订单号："+paymentResult.getOrderSn());
		System.out.println("支付处理结果："+paymentResult.getReturnMsg()+"code："+paymentResult.getCode());
		if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
			addActionError("缺失支付单号!");
			return ERROR;
		}
		payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
		System.out.println("payment result:"+payment.getId());
		order = payment.getOrder();
		if(null!=order){
			System.err.println("kkkkkk");
			System.out.println(order.getOrderSn());
		}else{
			System.out.println("yyyyy");
		}
		if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
			order.setRetCode(paymentResult.getCode());
			order.setRetMsg(paymentResult.getReturnMsg());
			System.out.println("订单状态已变更");
			orderService.update(order);
		}else{
			System.out.println("订单状态未变化");
		}
		return "submit";
	}
	
	// 支付回调处理
	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "paymentsn", message = "支付编号不允许为空!") })
	@InputConfig(resultName = "error")
	public String payreturn() {
		try {
			String xmlString = this.getRequest().getInputStream().toString();
			System.out.println("相应的字符串为：" + xmlString);
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("支付回调处理......");
		payment = paymentService.getPaymentByPaymentSn(paymentsn);
		if (payment == null) {
			addActionError("支付记录不存在!");
			return ERROR;
		}
		BasePaymentProduct paymentProduct = PaymentProductUtil
				.getPaymentProduct(payment.getPaymentConfig()
						.getPaymentProductId());
		if (paymentProduct == null) {
			addActionError("支付产品不存在!");
			return ERROR;
		}

		BigDecimal totalAmount = paymentProduct.getPaymentAmount(getRequest());
		boolean isSuccess = paymentProduct.isPaySuccess(getRequest());
		payreturnMessage = paymentProduct.getPayreturnMessage(payment
				.getPaymentSn());

		if (!paymentProduct
				.verifySign(payment.getPaymentConfig(), getRequest())) {
			addActionError("支付签名错误!");
			return ERROR;
		}
		if (!isSuccess) {
			addActionError("支付失败!");
			return ERROR;
		}

		if (payment.getPaymentStatus() == PaymentStatus.success) {
			return "result";
		}
		if (payment.getPaymentStatus() != PaymentStatus.ready) {
			addActionError("交易状态错误!");
			return ERROR;
		}
		if (totalAmount.compareTo(payment.getAmount()) != 0) {
			addActionError("交易金额错误!");
			return ERROR;
		}

		payment.setPaymentStatus(PaymentStatus.success);
		paymentService.update(payment);

		System.out.println();
		order = payment.getOrder();
		order.setPaymentStatus(net.xxs.entity.Order.PaymentStatus.paid);
		order.setPaidAmount(order.getAmount().add(totalAmount));
		orderService.update(order);

		// ---------支付成功后为用户添加上预存款，并计算提现率
		System.out.println("支付金额为totalAmount：" + totalAmount);
		Member member = payment.getMember();
		System.out.println("提现人为：" + member.getUsername());
		System.out.println("用户提现前的预存款：" + member.getDeposit());
		// System.out.println("用户的提现率为："+member.getMemberRank().getLossrate());
		// System.out.println("用户提现实际充值金额为："+totalAmount.multiply(BigDecimal.valueOf(member.getMemberRank().getLossrate())));
		// member.setDeposit(member.getDeposit().add(totalAmount.multiply(BigDecimal.valueOf(member.getMemberRank().getLossrate()))));

		// 设置totalProductPrice的价格（乘上支付方式中支付通道定义的折扣率）
		Brand brand = brandService.get(order.getBrandId());
		PaymentDiscount paymentDiscount = paymentDiscountService
				.getPaymentDiscountByPaymentConfigAndBrand(
						payment.getPaymentConfig(), brand);
		System.out.println("订单成功金额为：" + totalAmount);
		if (null == paymentDiscount) {
			System.out.println("没有找到相应的通道折扣率配置");
		} else {
			totalAmount = totalAmount.multiply(paymentDiscount.getDiscount());

		}
		System.out.println("计算折扣率后的应为会员充值的金额为：" + totalAmount);
		member.setDeposit(member.getDeposit().add(totalAmount));
		System.out.println("用户提现后的预存款：" + member.getDeposit());
		memberService.update(member);

		System.out.println("执行了销卡存款");
		Deposit deposit = new Deposit();
		deposit.setDepositType(DepositType.memberRecharge);
		deposit.setCredit(totalAmount);
		deposit.setDebit(new BigDecimal(0));
		deposit.setBalance(member.getDeposit());
		System.out.println("正常");
		deposit.setLossrate(new BigDecimal(0));
		System.out.println("已经异常了");
		deposit.setMember(member);
		deposit.setPayment(payment);
		depositService.save(deposit);
		// 为推荐人加提成
		if (!"".equals(member.getReferrer()) && null != member.getReferrer()) {
			Member referrerMember = memberService.getMemberByUsername(member
					.getReferrer());
			System.out.println("推荐人为：" + referrerMember.getUsername());
			System.out.println("推荐人提成前的预存款为：" + referrerMember.getDeposit());
			System.out.println("推荐人提成率为："
					+ referrerMember.getMemberRank().getBenefits());
			System.out.println("待提成的金额为：" + totalAmount);
			System.out.println("提成的金额为："
					+ totalAmount.multiply(BigDecimal.valueOf(referrerMember
							.getMemberRank().getBenefits())));
			referrerMember.setDeposit(referrerMember.getDeposit().add(
					totalAmount.multiply(BigDecimal.valueOf(referrerMember
							.getMemberRank().getBenefits()))));
			memberService.update(referrerMember);
			// 记录提成增加的预存款
			Deposit benefits = new Deposit();
			benefits.setDepositType(DepositType.benefits);
			benefits.setCredit(totalAmount.multiply(BigDecimal
					.valueOf(referrerMember.getMemberRank().getBenefits())));
			benefits.setDebit(new BigDecimal(0));
			benefits.setBalance(referrerMember.getDeposit());
			deposit.setLossrate(new BigDecimal(0));
			benefits.setReferrer(member.getUsername());
			benefits.setOrderSn(order.getOrderSn());
			benefits.setMember(referrerMember);
			benefits.setPayment(payment);
			depositService.save(benefits);
		}

		// 订单日志
		String logInfo = "支付总金额: " + SettingUtil.currencyFormat(payment.getAmount());
		
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.payment);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(logInfo);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		return "payreturn";
	}

	// 支付结果
	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "paymentsn", message = "支付编号不允许为空!") })
	@InputConfig(resultName = "error")
	public String result() {
		System.out.println("支付结果......");
		payment = paymentService.getPaymentByPaymentSn(paymentsn);
		if (payment == null
				|| payment.getPaymentStatus() != PaymentStatus.success) {
			addActionError("参数错误!");
			return ERROR;
		}
		return "result";
	}

	// 支付通知处理
	@Validations(requiredStrings = { @RequiredStringValidator(fieldName = "paymentsn", message = "支付编号不允许为空!") })
	@InputConfig(resultName = "error")
	public String paynotify() {
		System.out.println("支付通知......");
		payment = paymentService.getPaymentByPaymentSn(paymentsn);
		if (payment == null) {
			addActionError("支付记录不存在!");
			return ERROR;
		}
		BasePaymentProduct paymentProduct = PaymentProductUtil
				.getPaymentProduct(payment.getPaymentConfig()
						.getPaymentProductId());
		if (paymentProduct == null) {
			addActionError("支付产品不存在!");
			return ERROR;
		}
		System.out.println("---------------------------");
		System.out.println("---------验证易宝的通知处理--------");
		System.out.println("---------------------------");
		BigDecimal totalAmount = paymentProduct.getPaymentAmount(getRequest());
		boolean isSuccess = paymentProduct.isPaySuccess(getRequest());
		payreturnMessage = paymentProduct.getPayreturnMessage(payment
				.getPaymentSn());

		if (!paymentProduct
				.verifySign(payment.getPaymentConfig(), getRequest())) {
			addActionError("支付签名错误!");
			return ERROR;
		}
		if (!isSuccess) {
			addActionError("支付失败!");
			return ERROR;
		}
		if (payment.getPaymentStatus() == PaymentStatus.success) {
			return "result";
		}
		if (payment.getPaymentStatus() != PaymentStatus.ready) {
			addActionError("交易状态错误!");
			return ERROR;
		}
		if (totalAmount.compareTo(payment.getAmount()) != 0) {
			addActionError("交易金额错误!");
			return ERROR;
		}

		order = payment.getOrder();
		order.setPaymentStatus(net.xxs.entity.Order.PaymentStatus.paid);
		order.setPaidAmount(order.getPaidAmount().add(totalAmount));
		orderService.update(order);

		// 订单日志
		String logInfo = "支付总金额: " + payment.getAmount();
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.payment);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(logInfo);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		payment.setPaymentStatus(PaymentStatus.success);
		paymentService.update(payment);
		return "paynotify";
	}

	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

	public BigDecimal getRechargeAmount() {
		return rechargeAmount;
	}

	public void setRechargeAmount(BigDecimal rechargeAmount) {
		this.rechargeAmount = rechargeAmount;
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

	public String getPaymentUrl() {
		return paymentUrl;
	}

	public void setPaymentUrl(String paymentUrl) {
		this.paymentUrl = paymentUrl;
	}

	public Map<String, String> getParameterMap() {
		return parameterMap;
	}

	public void setParameterMap(Map<String, String> parameterMap) {
		this.parameterMap = parameterMap;
	}

	public String getPaymentsn() {
		return paymentsn;
	}

	public void setPaymentsn(String paymentsn) {
		this.paymentsn = paymentsn;
	}

	public String getPayreturnMessage() {
		return payreturnMessage;
	}

	public void setPayreturnMessage(String payreturnMessage) {
		this.payreturnMessage = payreturnMessage;
	}

	public String getPaynotifyMessage() {
		return paynotifyMessage;
	}

	public void setPaynotifyMessage(String paynotifyMessage) {
		this.paynotifyMessage = paynotifyMessage;
	}
	public PaymentResult getPaymentResult() {
		return paymentResult;
	}
	public void setPaymentResult(PaymentResult paymentResult) {
		this.paymentResult = paymentResult;
	}

}