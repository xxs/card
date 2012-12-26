package net.xxs.action.card;

import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

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
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 订单处理
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "token", params = {"excludeMethods", "info,list,view,save"}),
	@InterceptorRef(value = "cardStack")
})
public class OrderAction extends BaseCardAction {
	
	private static final long serialVersionUID = 2553137844831167917L;
	
	
	
	private String productId;//充值卡编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String str;
	private String cardString;//卡密组的字符串
	private String paymentUrl;// 支付请求URL
	
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
	
	public String strString(){
		System.out.println("str:"+str);
		
		return null;
	}
	
	//保存提交的充值卡订单
	public String save() {
		System.out.println("excute saveCard............");
		Member loginMember = getLoginMember();
		Product product = productService.load("4028bc743bb6fee6013bb755fed20002"); //默认20元腾讯充值卡
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
		paymentUrl = paymentProduct.getPaymentUrl();
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
		//发送支付信息
		paymentResult = paymentProduct.cardPay(paymentConfig,payment.getPaymentSn(), order.getAmount(), getRequest());
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
		return "chenggong";
	}
	//保存提交的充值卡订单
	public String query() {
		System.out.println("excute queryCard............");
		order = orderService.get("");//选取的order.id
		paymentConfig = order.getPaymentConfig();
		Set<Payment> paymentSet = order.getPaymentSet();
		BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
		//发送查询请求
		paymentResult = paymentProduct.cardQuery(paymentConfig,payment.getPaymentSn(), order.getAmount(), getRequest());
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
		return "chenggong";
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
	public String getPaymentUrl() {
		return paymentUrl;
	}
	public void setPaymentUrl(String paymentUrl) {
		this.paymentUrl = paymentUrl;
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

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

}