package net.xxs.action.shop;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import net.xxs.bean.Setting;
import net.xxs.bean.Setting.ScoreType;
import net.xxs.bean.Setting.StoreFreezeTime;
import net.xxs.entity.Area;
import net.xxs.entity.Brand;
import net.xxs.entity.CartItem;
import net.xxs.entity.DeliveryType;
import net.xxs.entity.DeliveryType.DeliveryMethod;
import net.xxs.entity.Goods;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Order.PaymentStatus;
import net.xxs.entity.Order.ShippingStatus;
import net.xxs.entity.OrderItem;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.Product;
import net.xxs.entity.Receiver;
import net.xxs.service.AreaService;
import net.xxs.service.CartItemService;
import net.xxs.service.DeliveryTypeService;
import net.xxs.service.OrderItemService;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.ProductService;
import net.xxs.service.ReceiverService;
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

@ParentPackage("shop")
@InterceptorRefs({
	@InterceptorRef(value = "memberVerifyInterceptor"),
	@InterceptorRef(value = "token", params = {"excludeMethods", "info,list,view,saveCard"}),
	@InterceptorRef(value = "shopStack")
})
public class OrderAction extends BaseShopAction {
	
	private static final long serialVersionUID = 2553137844831167917L;
	
	private String areaId;// 收货地区ID
	private Boolean isSaveReceiver;// 是否保存收货地址
	private Integer totalProductQuantity;// 总商品数
	private Integer totalProductWeight;// 总商品重量(单位: 克)
	private BigDecimal totalProductPrice;// 总商品价格
	private Integer totalScore;// 总积分
	private String memo;// 附言
	
	private String productId;//商品编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String cardString;//卡密组的字符串
	
	private Receiver receiver;// 其它收货地址
	private DeliveryType deliveryType;// 配送方式
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单
	private Set<CartItem> cartItemSet;// 购物车项

	@Resource(name = "receiverServiceImpl")
	private ReceiverService receiverService;
	@Resource(name = "areaServiceImpl")
	private AreaService areaService;
	@Resource(name = "deliveryTypeServiceImpl")
	private DeliveryTypeService deliveryTypeService;
	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "cartItemServiceImpl")
	private CartItemService cartItemService;
	@Resource(name = "orderItemServiceImpl")
	private OrderItemService orderItemService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	
	// 订单信息
	@InputConfig(resultName = "error")
	public String info() {
		Setting setting = getSetting();
		Member loginMember = getLoginMember();
		cartItemSet = loginMember.getCartItemSet();
		if (cartItemSet == null || cartItemSet.size() == 0) {
			addActionError("购物车目前没有加入任何商品!");
			return ERROR;
		}
		for (CartItem cartItem : cartItemSet) {
			Product product = cartItem.getProduct();
			if (product.getStore() != null && (cartItem.getQuantity() + product.getFreezeStore()) > product.getStore()) {
				addActionError("商品库存不足,请返回修改!");
				return ERROR;
			}
		}
		
		totalProductQuantity = 0;
		totalProductWeight = 0;
		totalProductPrice = new BigDecimal(0);
		totalScore = 0;
		for (CartItem cartItem : cartItemSet) {
			Product product = cartItem.getProduct();
			totalProductQuantity += cartItem.getQuantity();
			totalProductWeight += product.getWeight() * cartItem.getQuantity();
			totalProductPrice = cartItem.getProduct().getPreferentialPrice(loginMember).multiply(new BigDecimal(cartItem.getQuantity())).add(totalProductPrice);
			if (setting.getScoreType() == ScoreType.goodsSet) {
				totalScore = product.getGoods().getScore() * cartItem.getQuantity() + totalScore;
			}
		}
		totalProductPrice = SettingUtil.setPriceScale(totalProductPrice);
		if (setting.getScoreType() == ScoreType.orderAmount) {
			totalScore = totalProductPrice.multiply(new BigDecimal(setting.getScoreScale().toString())).setScale(0, RoundingMode.DOWN).intValue();
		}
		return "info";
	}
	
	// 订单保存
	@Validations(
		requiredStrings = {
			@RequiredStringValidator(fieldName = "deliveryType.id", message = "请选择配送方式!")
		},
		stringLengthFields = {
			@StringLengthFieldValidator(fieldName = "receiver.name", maxLength = "200", message = "收货人长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "receiver.address", maxLength = "200", message = "联系地址长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "receiver.zipCode", maxLength = "200", message = "邮编长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "receiver.phone", maxLength = "200", message = "联系电话长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "receiver.mobile", maxLength = "200", message = "联系手机长度超出限制!"),
			@StringLengthFieldValidator(fieldName = "order.memo", maxLength = "200", message = "附言长度必须小于等于200!")
		}
	)
	@InputConfig(resultName = "error")
	public String save() {
		Setting setting = getSetting();
		Member loginMember = getLoginMember();
		cartItemSet = loginMember.getCartItemSet();
		if (cartItemSet == null || cartItemSet.size() == 0) {
			addActionError("购物车目前没有加入任何商品!");
			return ERROR;
		}
		if (StringUtils.isNotEmpty(receiver.getId())) {
			receiver = receiverService.load(receiver.getId());
		} else {
			if (StringUtils.isEmpty(receiver.getName())) {
				addActionError("收货人不允许为空!");
				return ERROR;
			}
			if (StringUtils.isEmpty(areaId)) {
				addActionError("地区不允许为空!");
				return ERROR;
			}
			if (StringUtils.isEmpty(receiver.getAddress())) {
				addActionError("联系地址不允许为空!");
				return ERROR;
			}
			if (StringUtils.isEmpty(receiver.getZipCode())) {
				addActionError("邮编不允许为空!");
				return ERROR;
			}
			if (StringUtils.isEmpty(receiver.getPhone()) && StringUtils.isEmpty(receiver.getMobile())) {
				addActionError("联系电话、联系手机必须填写其中一项!");
				return ERROR;
			}
			if (isSaveReceiver == null) {
				addActionError("是否保存不允许为空!");
				return ERROR;
			}
			if (isSaveReceiver) {
				Area area = areaService.get(areaId);
				if (area == null) {
					addActionError("请选择收货地区!");
					return ERROR;
				}
				
				receiver.setArea(area);
				receiver.setIsDefault(false);
				receiver.setMember(loginMember);
				receiverService.save(receiver);
			}
		}
		for (CartItem cartItem : cartItemSet) {
			Product product = cartItem.getProduct();
			if (product.getStore() != null && (cartItem.getQuantity() + product.getFreezeStore() > product.getStore())) {
				addActionError("商品[" + product.getName() + "]库存不足!");
				return ERROR;
			}
		}
		
		deliveryType = deliveryTypeService.load(deliveryType.getId());
		if (deliveryType.getDeliveryMethod() == DeliveryMethod.deliveryAgainstPayment && (paymentConfig == null || StringUtils.isEmpty(paymentConfig.getId()))) {
			addActionError("请选择支付方式!");
			return ERROR;
		}
		
		totalProductQuantity = 0;
		totalProductWeight = 0;
		totalProductPrice = new BigDecimal(0);
		for (CartItem cartItem : cartItemSet) {
			Product product = cartItem.getProduct();
			totalProductQuantity += cartItem.getQuantity();
			totalProductPrice = cartItem.getProduct().getPreferentialPrice(loginMember).multiply(new BigDecimal(cartItem.getQuantity())).add(totalProductPrice);
			totalProductWeight += product.getWeight() * cartItem.getQuantity();
			cartItemService.delete(cartItem);
		}
		totalProductPrice = SettingUtil.setPriceScale(totalProductPrice);
		BigDecimal deliveryFee = deliveryType.getDeliveryFee(totalProductWeight);
		
		String paymentConfigName = null;
		BigDecimal paymentFee = null;
		if (deliveryType.getDeliveryMethod() == DeliveryMethod.deliveryAgainstPayment) {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
			paymentConfigName = paymentConfig.getName();
			paymentFee = paymentConfig.getPaymentFee(totalProductPrice.add(deliveryFee));
		} else {
			paymentConfig = null;
			paymentConfigName = "货到付款";
			paymentFee = new BigDecimal(0);
		}
		
		BigDecimal totalAmount = totalProductPrice.add(deliveryFee).add(paymentFee);
		
		order = new Order();
		order.setOrderStatus(OrderStatus.unprocessed);
		order.setPaymentStatus(PaymentStatus.unpaid);
		order.setShippingStatus(ShippingStatus.unshipped);
		order.setDeliveryTypeName(deliveryType.getName());
		order.setPaymentConfigName(paymentConfigName);
		order.setTotalProductQuantity(totalProductQuantity);
		order.setTotalProductWeight(totalProductWeight);
		order.setTotalProductPrice(totalProductPrice);
		order.setDeliveryFee(deliveryFee);
		order.setPaymentFee(paymentFee);
		order.setTotalAmount(totalAmount);
		order.setPaidAmount(new BigDecimal(0));
		order.setShipName(receiver.getName());
		order.setShipArea(receiver.getArea());
		order.setShipAddress(receiver.getAddress());
		order.setShipZipCode(receiver.getZipCode());
		order.setShipPhone(receiver.getPhone());
		order.setShipMobile(receiver.getMobile());
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setDeliveryType(deliveryType);
		order.setPaymentConfig(paymentConfig);
		orderService.save(order);
		
		// 订单项
		for (CartItem cartItem : cartItemSet) {
			Product product = cartItem.getProduct();
			Goods goods = product.getGoods();
			OrderItem orderItem = new OrderItem();
			orderItem.setProductSn(product.getProductSn());
			orderItem.setProductName(product.getName());
			orderItem.setProductPrice(product.getPreferentialPrice(loginMember));
			orderItem.setProductQuantity(cartItem.getQuantity());
			orderItem.setDeliveryQuantity(0);
			orderItem.setGoodsHtmlPath(goods.getHtmlPath());
			orderItem.setOrder(order);
			orderItem.setProduct(product);
			orderItemService.save(orderItem);
		}
		
		// 库存处理
		if (setting.getStoreFreezeTime() == StoreFreezeTime.order) {
			for (CartItem cartItem : cartItemSet) {
				Product product = cartItem.getProduct();
				if (product.getStore() != null) {
					product.setFreezeStore(product.getFreezeStore() + cartItem.getQuantity());
					productService.update(product);
				}
			}
		}
		
		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.create);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(null);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		
		return "result";
	}
	//保存提交的充值卡订单
	@InputConfig(resultName = "error")
	public String saveCard() {
		System.out.println("excute saveCard............");
		Member loginMember = getLoginMember();
		Product product = productService.load("8ae4839c3a887878013a88d343ae0036"); //默认20元腾讯充值卡
		receiver = receiverService.load("4028bc743ab4e741013ab5390ed60007");//默认设置一个收获地址
		//paymentConfig.setId("4028bc743ab4e741013ab538ee9c0006");//设置默认的支付方式
		deliveryType = deliveryTypeService.load("8a8f81d93afa3e77013afa5526f80000");
		totalProductQuantity = 0;
		totalProductWeight = 0;
		totalProductPrice = product.getPrice();
		System.out.println("----------");
		totalProductPrice = SettingUtil.setPriceScale(totalProductPrice);
		BigDecimal deliveryFee = deliveryType.getDeliveryFee(totalProductWeight);
		
		String paymentConfigName = null;
		BigDecimal paymentFee = null;
		System.out.println("-------fffffff--");
		if (deliveryType.getDeliveryMethod() == DeliveryMethod.deliveryAgainstPayment) {
			paymentConfig = paymentConfigService.load(paymentConfig.getId());
			paymentConfigName = paymentConfig.getName();
			paymentFee = paymentConfig.getPaymentFee(totalProductPrice.add(deliveryFee));
			System.out.println("计算前的金额为："+totalProductPrice.toString());
//			//设置totalProductPrice的价格（乘上支付方式中支付通道定义的折扣率）
//			Brand brand = product.getGoods().getBrand();
//			PaymentDiscount paymentDiscount = paymentDiscountService.getPaymentDiscountByPaymentConfigAndBrand(paymentConfig, brand);
//			if(null == paymentDiscount){
//				System.out.println("没有找到相应的通道折扣率配置");
//			}else{
//				totalProductPrice = totalProductPrice.multiply(paymentDiscount.getDiscount());
//			}
//			System.out.println("计算后的金额为："+totalProductPrice.toString());
			
		} else {
			paymentConfig = null;
			paymentConfigName = "货到付款";
			paymentFee = new BigDecimal(0);
		}
		System.out.println("----------");
		BigDecimal totalAmount = totalProductPrice.add(deliveryFee).add(paymentFee);
		Brand brand = product.getGoods().getBrand();//为order准备brandId
		order = new Order();
		order.setBrandId(brand.getId());//此列不能为空
		order.setOrderStatus(OrderStatus.unprocessed);
		order.setPaymentStatus(PaymentStatus.unpaid);
		order.setShippingStatus(ShippingStatus.unshipped);
		order.setDeliveryTypeName(deliveryType.getName());
		order.setPaymentConfigName(paymentConfigName);
		order.setTotalProductQuantity(totalProductQuantity);
		order.setTotalProductWeight(totalProductWeight);
		order.setTotalProductPrice(totalProductPrice);
		order.setDeliveryFee(deliveryFee);
		order.setPaymentFee(paymentFee);
		order.setTotalAmount(totalAmount);
		order.setPaidAmount(new BigDecimal(0));
		order.setShipName(receiver.getName());
		order.setShipArea(receiver.getArea());
		order.setShipAddress(receiver.getAddress());
		order.setShipZipCode(receiver.getZipCode());
		order.setShipPhone(receiver.getPhone());
		order.setShipMobile(receiver.getMobile());
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setDeliveryType(deliveryType);
		order.setPaymentConfig(paymentConfig);
		orderService.save(order);
		
		// 订单项
		Goods goods = product.getGoods();
		OrderItem orderItem = new OrderItem();
		orderItem.setProductSn(product.getProductSn());
		orderItem.setProductName(product.getName());//货品名称
		orderItem.setProductPrice(product.getPrice());//价格默认为销售价
		orderItem.setProductQuantity(1);//数量默认为1
		orderItem.setDeliveryQuantity(0);//发货数量默认为0
		orderItem.setGoodsHtmlPath(goods.getHtmlPath());
		orderItem.setOrder(order);
		orderItem.setProduct(product);
		orderItem.setCardNum(cardNum);//卡号
		orderItem.setCardPwd(cardPwd);//密码
		orderItemService.save(orderItem);
		
		// 订单日志
		OrderLog orderLog = new OrderLog();
		orderLog.setOrderLogType(OrderLogType.create);
		orderLog.setOrderSn(order.getOrderSn());
		orderLog.setOperator(null);
		orderLog.setInfo(null);
		orderLog.setOrder(order);
		orderLogService.save(orderLog);
		
		return "result";
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
		totalScore = 0;
		order = orderService.load(id);
		Setting setting = getSetting();
		if (setting.getScoreType() == ScoreType.goodsSet) {
			for (OrderItem orderItem : order.getOrderItemSet()) {
				Product product = orderItem.getProduct();
				if (product != null) {
					totalScore = product.getGoods().getScore() * orderItem.getProductQuantity() + totalScore;
				}
			}
		} else if (setting.getScoreType() == ScoreType.orderAmount) {
			totalScore = order.getTotalProductPrice().multiply(new BigDecimal(setting.getScoreScale().toString())).setScale(0, RoundingMode.DOWN).intValue();
		}
		return "view";
	}
	
	// 获取所有配送方式集合
	public List<DeliveryType> getAllDeliveryTypeList() {
		return deliveryTypeService.getAllList();
	}
	
	// 获取所有支付方式集合
	public List<PaymentConfig> getAllPaymentConfigList() {
		return paymentConfigService.getAllList();
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public Boolean getIsSaveReceiver() {
		return isSaveReceiver;
	}

	public void setIsSaveReceiver(Boolean isSaveReceiver) {
		this.isSaveReceiver = isSaveReceiver;
	}

	public Integer getTotalProductQuantity() {
		return totalProductQuantity;
	}

	public void setTotalProductQuantity(Integer totalProductQuantity) {
		this.totalProductQuantity = totalProductQuantity;
	}

	public Integer getTotalProductWeight() {
		return totalProductWeight;
	}

	public void setTotalProductWeight(Integer totalProductWeight) {
		this.totalProductWeight = totalProductWeight;
	}

	public BigDecimal getTotalProductPrice() {
		return totalProductPrice;
	}

	public void setTotalProductPrice(BigDecimal totalProductPrice) {
		this.totalProductPrice = totalProductPrice;
	}

	public Integer getTotalScore() {
		return totalScore;
	}

	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Receiver getReceiver() {
		return receiver;
	}

	public void setReceiver(Receiver receiver) {
		this.receiver = receiver;
	}

	public DeliveryType getDeliveryType() {
		return deliveryType;
	}

	public void setDeliveryType(DeliveryType deliveryType) {
		this.deliveryType = deliveryType;
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

	public Set<CartItem> getCartItemSet() {
		return cartItemSet;
	}

	public void setCartItemSet(Set<CartItem> cartItemSet) {
		this.cartItemSet = cartItemSet;
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

}