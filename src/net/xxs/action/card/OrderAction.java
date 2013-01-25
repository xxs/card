package net.xxs.action.card;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Card;
import net.xxs.entity.Brand;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.Payment;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.PaymentDiscount;
import net.xxs.entity.Product;
import net.xxs.payment.BasePaymentProduct;
import net.xxs.payment.PaymentResult;
import net.xxs.service.BrandService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.PaymentDiscountService;
import net.xxs.service.PaymentService;
import net.xxs.service.ProductService;
import net.xxs.util.PaymentProductUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredFieldValidator;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.StringLengthFieldValidator;
import com.opensymphony.xwork2.validator.annotations.Validations;

/**
 * 前台Action类 - 订单处理
 */

@ParentPackage("card")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "token", params = {"excludeMethods", "info,list,view,save,batch,query,search"}),
	@InterceptorRef(value = "cardStack")
})
public class OrderAction extends BaseCardAction {
	
	private static final long serialVersionUID = 2553137844831167917L;
	
	
	
	private String productId;//充值卡编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String cardString;//卡密组的字符串
	private String memo;// 附言
	
	private Date beginDate;// 开始日期
	private Date endDate;// 结束日期
	
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单
	private PaymentResult paymentResult;// 支付返回参数
	private Payment payment;
	
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "paymentDiscountServiceImpl")
	private PaymentDiscountService paymentDiscountService;
	@Resource(name = "paymentServiceImpl")
	private PaymentService paymentService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	@Resource(name = "brandServiceImpl")
	private BrandService brandService;
	
	
	public List<Card> jiexi(String str){
		List<Card> cardList = new ArrayList<Card>();
	    String tempFilex[]=str.split("\n");//以换行符拆分
	    for (int j = 0; j < tempFilex.length; j++) {
	    	String nums[] = tempFilex[j].split(",");
	    	Card card = new Card();
	    	Integer.parseInt(nums[0].trim());
	    	Integer.parseInt(nums[1].trim());
	    	card.setNum(nums[0].trim());
	    	card.setPwd(nums[1].trim());
	    	//card.setFace(Integer.parseInt(nums[2].trim()));//暂时不支持自定义面额
	    	cardList.add(card);
		}
		return cardList;
	}
	public static boolean containsAny(String str, String searchChars) { 
		if(str.length()!=str.replace(searchChars,"").length())  { 
			return false; 
		} 
	  		return true;
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
		paymentConfig = paymentConfigService.load(paymentConfig.getId());//获取支付方式
		Brand brand = product.getCards().getBrand();//为order准备brandId
		PaymentDiscount paymentDiscount = paymentDiscountService.getPaymentDiscountByPaymentConfigAndBrand(paymentConfig, brand);
		if (null == paymentDiscount){
			addActionError("通道信息异常!请与客服联系解决！");
			return ERROR;
		}
		if(!"0".equals(paymentDiscount.getFace())){
			if (containsAny(paymentDiscount.getFace(),String.valueOf(product.getPrice().intValue()))){
				addActionError(paymentConfig.getName()+"暂不支持名额为："+product.getPrice()+"元的"+product.getCards().getName());
				return ERROR;
			}
		}
		//生成订单
		order = new Order();
		order.setBrandId(brand.getId());//此列不能为空
		order.setOrderStatus(OrderStatus.paymenting);
		order.setPaymentConfigName(paymentConfig.getName());
		order.setAmount(SettingUtil.setPriceScale(product.getPrice()));//默认充值卡面额为订单金额
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setPaymentConfig(paymentConfig);
		order.setProductSn(product.getProductSn());
		order.setProductName(product.getName());//货品名称
		order.setProductPrice(product.getPrice());//价格默认为销售价
		order.setCardCode(paymentDiscount.getCode());//通道编码
		order.setCardDiscount(paymentDiscount.getDiscount());//即时折扣率
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
		try {
			paymentResult = paymentProduct.cardPay(paymentConfig,payment.getPaymentSn(), order, getRequest());
		} catch (Exception e) {
			addActionError("订单支付提交失败!"+paymentResult.getReason());
			return ERROR;
		}
		if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
			addActionError("缺失支付单号!");
			return ERROR;
		}
		payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
		System.out.println("payment result:"+payment.getId());
		order = payment.getOrder();
		if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
			if(paymentResult.getIsSuccess()){
				order.setOrderStatus(OrderStatus.paymenting);
			}else{
				order.setOrderStatus(OrderStatus.failure);
			}
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
		List<Card> cardList = null;
		try {
			cardList = jiexi(cardString);
		} catch (Exception e) {
			addActionError("卡号组解析异常，请严格按照给定的格式填写!");
			return ERROR;
		}
		if(null == cardList){
			addActionError("请至少输入一个卡密组合!");
			return ERROR;
		}
		Member loginMember = getLoginMember();
		Product product = productService.load(productId);
		paymentConfig = paymentConfigService.load(paymentConfig.getId());//获取支付方式
		String paymentConfigName = paymentConfig.getName();//设置支付方式名称
		Brand brand = product.getCards().getBrand();//为order准备brandId
		PaymentDiscount paymentDiscount = paymentDiscountService.getPaymentDiscountByPaymentConfigAndBrand(paymentConfig, brand);
		if (null == paymentDiscount){
			addActionError("通道信息异常!请与客服联系解决！");
			return ERROR;
		}
		if(!"0".equals(paymentDiscount.getFace())){
			if (containsAny(paymentDiscount.getFace(),String.valueOf(product.getPrice().intValue()))){
				addActionError(paymentConfig.getName()+"暂不支持名额为："+product.getPrice()+"元的"+product.getCards().getName());
				return ERROR;
			}
		}
		for (int i = 0; i < cardList.size(); i++) {
			Card card = cardList.get(i);
			//生成订单
			order = new Order();
			order.setBrandId(brand.getId());//此列不能为空
			order.setOrderStatus(OrderStatus.paymenting);
			order.setPaymentConfigName(paymentConfigName);
			order.setAmount(SettingUtil.setPriceScale(product.getPrice()));//默认充值卡面额为订单金额
			order.setMemo(memo);
			order.setMember(loginMember);
			order.setPaymentConfig(paymentConfig);
			order.setProductSn(product.getProductSn());
			order.setProductName(product.getName());//货品名称
			order.setProductPrice(product.getPrice());//价格默认为销售价
			order.setCardCode(paymentDiscount.getCode());//通道编码
			order.setCardDiscount(paymentDiscount.getDiscount());//即时折扣率
			order.setProduct(product);
			order.setCardNum(card.getNum());//卡号
			order.setCardPwd(card.getPwd());//密码
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
			try {
				paymentResult = paymentProduct.cardPay(paymentConfig,payment.getPaymentSn(), order, getRequest());
			} catch (Exception e) {
				addActionError("订单支付提交失败!");
				return ERROR;
			}
			
			if ((paymentResult == null || StringUtils.isEmpty(paymentResult.getOrderSn()))){
				addActionError("缺失支付单号!");
				return ERROR;
			}
			payment = paymentService.getPaymentByPaymentSn(paymentResult.getOrderSn());
			order = payment.getOrder();
			if(StringUtils.isEmpty(order.getRetCode())||!paymentResult.getCode().equals(order.getRetCode())){
				if(paymentResult.getIsSuccess()){
					order.setOrderStatus(OrderStatus.paymenting);
				}else{
					order.setOrderStatus(OrderStatus.failure);
				}
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
		requiredFields = { 
			@RequiredFieldValidator(fieldName = "ids", message = "订单ID不能为空!")
		}		
	)
	@InputConfig(resultName = "error")	
	public String query() {
		if(ids!=null && ids.length>0){
			for (int i = 0; i < ids.length; i++) {
				id = ids[i];
				order = orderService.get(id);
				if(order.getOrderStatus()==OrderStatus.failure || order.getOrderStatus() == OrderStatus.paid){
					continue;
				}
				paymentConfig = order.getPaymentConfig();
				BasePaymentProduct paymentProduct = PaymentProductUtil.getPaymentProduct(paymentConfig.getPaymentProductId());
				//发送查询请求
				try {
					paymentResult = paymentProduct.cardQuery(paymentConfig,order.getPayment().getPaymentSn(), getRequest());
				} catch (Exception e) {
					addActionError("订单支付提交失败!");
					return ERROR;
				}
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
		}
		return ajax(Status.success,"刷新成功");
	}
	// 订单列表
	public String list() {
		pager = orderService.getOrderPager(getLoginMember(), pager);
		return LIST;
	}
	
	// 查询订单
	public String search() {
		pager = orderService.getOrderPager(beginDate,endDate,order,pager);
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
	// 获取所有品牌
	public List<Brand> getAllBrandList() {
		return brandService.getAllList();
	}
	//获取所有的订单状态
	public List<OrderStatus> getOrderStatusList() {
		return Arrays.asList(OrderStatus.values());
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
	public Date getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
}