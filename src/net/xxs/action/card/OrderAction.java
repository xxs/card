package net.xxs.action.card;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Card;
import net.xxs.entity.Brand;
import net.xxs.entity.Cards;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Order.PaymentStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.Payment;
import net.xxs.entity.Payment.PaymentType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.Product;
import net.xxs.payment.BasePaymentProduct;
import net.xxs.payment.PaymentResult;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.PaymentService;
import net.xxs.service.ProductService;
import net.xxs.util.PaymentProductUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 订单处理
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "token", params = {"excludeMethods", "info,list,view,save,batch,query"}),
	@InterceptorRef(value = "cardStack")
})
public class OrderAction extends BaseCardAction {
	
	private static final long serialVersionUID = 2553137844831167917L;
	
	
	
	private String productId;//充值卡编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String cardString;//卡密组的字符串
	
	private String memo;// 附言
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单
	private PaymentResult paymentResult;// 支付返回参数
	private Payment payment;
	
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	
	public List<Card> jiexi(String str){
		List<Card> cardList = new ArrayList<Card>();
	    String tempFilex[]=str.split("\n");//以换行符拆分
	    for (int j = 0; j < tempFilex.length; j++) {
	    	String nums[] = tempFilex[j].split(",");
	    	Card card = new Card();
	    	card.setNum(Integer.parseInt(nums[0].trim()));
	    	card.setPwd(Integer.parseInt(nums[1].trim()));
	    	//card.setFace(Integer.parseInt(nums[2].trim()));//暂时不支持自定义面额
	    	cardList.add(card);
		}
		return cardList;
	}
	
	//保存提交的充值卡订单
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "paymentConfig.id", message = "请选择一个支付通道!"),
			@RequiredStringValidator(fieldName = "productId", message = "请选择一种面额!"),
			@RequiredStringValidator(fieldName = "cardNum", message = "请输入卡号!"),
			@RequiredStringValidator(fieldName = "cardPwd", message = "请输入密码!")
		},
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "cardNum", minLength = "1", maxLength = "50", message = "卡号长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "cardPwd", minLength = "1", maxLength = "50", message = "密码长度超出限制!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		Member loginMember = getLoginMember();
		Product product = productService.load(productId); 
		paymentConfig = paymentConfigService.load(paymentConfig.getId());
		String paymentConfigName = paymentConfig.getName();//设置支付方式名称
		Brand brand = product.getCards().getBrand();//为order准备brandId
		Cards cards = product.getCards();
		//生成订单
		order = new Order();
		order.setBrandId(brand.getId());//此列不能为空
		order.setOrderStatus(OrderStatus.unprocessed);
		order.setPaymentStatus(PaymentStatus.unpaid);
		order.setPaymentConfigName(paymentConfigName);
		order.setAmount(SettingUtil.setPriceScale(product.getPrice()));//默认充值卡面额为订单金额
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setPaymentConfig(paymentConfig);
		order.setProductSn(product.getProductSn());
		order.setProductName(product.getName());//货品名称
		order.setProductPrice(product.getPrice());//价格默认为销售价
		order.setCardsHtmlPath(cards.getHtmlPath());
		order.setProduct(product);
		order.setCardNum(cardNum);//卡号
		order.setCardPwd(cardPwd);//密码
		orderService.save(order);
		order = orderService.get(order.getId());
		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.create);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(null);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		//生成支付单
		BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
		String bankName = paymentProduct.getName();
		String bankAccount = paymentConfig.getBargainorId();
		payment = new Payment();
		payment.setPaymentType(PaymentType.online);
		payment.setPaymentConfigName(paymentConfig.getName());
		payment.setBankName(bankName);
		payment.setBankAccount(bankAccount);
		payment.setAmount(order.getAmount());
		payment.setPayer(getLoginMember().getUsername());
		payment.setOperator(null);
		payment.setMemo(null);
		payment.setPaymentStatus(net.xxs.entity.Payment.PaymentStatus.ready);
		payment.setMember(loginMember);
		payment.setPaymentConfig(paymentConfig);
		payment.setDeposit(null);
		payment.setOrder(order);
		paymentService.save(payment);
		order.setPayment(payment);
		orderService.update(order);
		//发送支付信息
		paymentResult = paymentProduct.cardPay(paymentConfig,payment.getPaymentSn(), order.getAmount(), getRequest());
		if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
			addActionError("缺失支付单号!");
			return ERROR;
		}
		payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
		System.out.println("payment result:"+payment.getId());
		order = payment.getOrder();
		if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
			order.setRetCode(paymentResult.getCode());
			order.setRetMsg(paymentResult.getReturnMsg());
			System.out.println("订单状态已变更");
			orderService.update(order);
		}else{
			System.out.println("订单状态未变化");
		}
		redirectUrl = "order!list.action";
		return SUCCESS;
	}
	//保存提交的充值卡订单
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "paymentConfig.id", message = "请选择一个支付通道!"),
			@RequiredStringValidator(fieldName = "productId", message = "请选择一种面额!"),
			@RequiredStringValidator(fieldName = "cardString", message = "请输入卡密组合!")
		},
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "cardString", minLength = "1", maxLength = "1000", message = "卡密组长度超出限制!")
		}
	)
	@InputConfig(resultName = "error")
	public String batch() {
		List<Card> cardList = jiexi(cardString);
		Member loginMember = getLoginMember();
		Product product = productService.load(productId);
		paymentConfig = paymentConfigService.load(paymentConfig.getId());
		String paymentConfigName = paymentConfig.getName();//设置支付方式名称
		Brand brand = product.getCards().getBrand();//为order准备brandId
		Cards cards = product.getCards();
		for (int i = 0; i < cardList.size(); i++) {
			Card card = cardList.get(i);
			//生成订单
			order = new Order();
			order.setBrandId(brand.getId());//此列不能为空
			order.setOrderStatus(OrderStatus.unprocessed);
			order.setPaymentStatus(PaymentStatus.unpaid);
			order.setPaymentConfigName(paymentConfigName);
			order.setAmount(SettingUtil.setPriceScale(product.getPrice()));//默认充值卡面额为订单金额
			order.setMemo(memo);
			order.setMember(loginMember);
			order.setPaymentConfig(paymentConfig);
			order.setProductSn(product.getProductSn());
			order.setProductName(product.getName());//货品名称
			order.setProductPrice(product.getPrice());//价格默认为销售价
			order.setCardsHtmlPath(cards.getHtmlPath());
			order.setProduct(product);
			order.setCardNum(card.getNum().toString());//卡号
			order.setCardPwd(card.getPwd().toString());//密码
			orderService.save(order);
			System.out.println("刚保存的order的ID："+order.getId());
			order = orderService.get(order.getId());
			// 订单日志
			OrderLog orderLog = new OrderLog();
			orderLog.setOrderLogType(OrderLogType.create);
			orderLog.setOrderSn(order.getOrderSn());
			orderLog.setOperator(null);
			orderLog.setInfo(null);
			orderLog.setOrder(order);
			orderLogService.save(orderLog);
			//生成支付单
			BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
			String bankName = paymentProduct.getName();
			String bankAccount = paymentConfig.getBargainorId();
			payment = new Payment();
			payment.setPaymentType(PaymentType.online);
			payment.setPaymentConfigName(paymentConfig.getName());
			payment.setBankName(bankName);
			payment.setBankAccount(bankAccount);
			payment.setAmount(order.getAmount());
			payment.setPayer(getLoginMember().getUsername());
			payment.setOperator(null);
			payment.setMemo(null);
			payment.setPaymentStatus(net.xxs.entity.Payment.PaymentStatus.ready);
			payment.setMember(loginMember);
			payment.setPaymentConfig(paymentConfig);
			payment.setDeposit(null);
			payment.setOrder(order);
			paymentService.save(payment);
			order.setPayment(payment);
			orderService.update(order);
			//发送支付信息
			paymentResult = paymentProduct.cardPay(paymentConfig,payment.getPaymentSn(), order.getAmount(), getRequest());
			if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
				addActionError("缺失支付单号!");
				return ERROR;
			}
			payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
			order = payment.getOrder();
			if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
				order.setRetCode(paymentResult.getCode());
				order.setRetMsg(paymentResult.getReturnMsg());
				System.out.println("订单状态已变更");
				orderService.update(order);
			}else{
				System.out.println("订单状态未变化");
			}
		}
		redirectUrl = "order!list.action";
		return SUCCESS;
	}
	//查询订单最新状态
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "订单ID不能为空!")
		}
	)
	@InputConfig(resultName = "error")	
	public String query() {
		order = orderService.get(id);
		paymentConfig = order.getPaymentConfig();
		BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
		//发送查询请求
		paymentResult = paymentProduct.cardQuery(paymentConfig,order.getPayment().getPaymentSn(), order.getAmount(), getRequest());
		if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
			addActionError("缺失支付单号!");
			return ERROR;
		}
		payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
		order = payment.getOrder();
		if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
			order.setRetCode(paymentResult.getCode());
			order.setRetMsg(paymentResult.getReturnMsg());
			System.out.println("订单状态已变更");
			orderService.update(order);
		}else{
			System.out.println("订单状态未变化");
		}
		return ajax(Status.success,"刷新成功");
	}
	// 订单列表
	public String list() {
		pager = orderService.getOrderPager(getLoginMember(), pager);
		return LIST;
	}
	
	// 订单详情
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "id", message = "订单ID不允许为空!")
		}
	)
	@InputConfig(resultName = "error")
	public String view() {
		order = orderService.load(id);
		return "view";
	}
	
	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}


	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getCardPwd() {
		return cardPwd;
	}

	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}

	public String getCardString() {
		return cardString;
	}

	public void setCardString(String cardString) {
		this.cardString = cardString;
	}
	public PaymentResult getPaymentResult() {
		return paymentResult;
	}
	public void setPaymentResult(PaymentResult paymentResult) {
		this.paymentResult = paymentResult;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}

}