package net.xxs.action.shop;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import javax.annotation.Resource;

import net.xxs.bean.Setting;
import net.xxs.bean.Setting.ScoreType;
import net.xxs.entity.Brand;
import net.xxs.entity.Cards;
import net.xxs.entity.Member;
import net.xxs.entity.Order;
import net.xxs.entity.Order.OrderStatus;
import net.xxs.entity.Order.PaymentStatus;
import net.xxs.entity.OrderLog;
import net.xxs.entity.OrderLog.OrderLogType;
import net.xxs.entity.PaymentConfig;
import net.xxs.entity.Product;
import net.xxs.service.OrderLogService;
import net.xxs.service.OrderService;
import net.xxs.service.PaymentConfigService;
import net.xxs.service.ProductService;
import net.xxs.util.SettingUtil;

import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;

import com.opensymphony.xwork2.interceptor.annotations.InputConfig;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
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
	private Integer totalProductQuantity;// 总充值卡数
	private Integer totalProductWeight;// 总充值卡重量(单位: 克)
	private BigDecimal totalProductPrice;// 总充值卡价格
	private Integer totalScore;// 总积分
	private String memo;// 附言
	
	private String productId;//充值卡编码
	private String cardNum;//卡号
	private String cardPwd;//密码
	private String cardString;//卡密组的字符串
	
	private PaymentConfig paymentConfig;// 支付方式
	private Order order;// 订单

	@Resource(name = "paymentConfigServiceImpl")
	private PaymentConfigService paymentConfigService;
	@Resource(name = "orderServiceImpl")
	private OrderService orderService;
	@Resource(name = "orderLogServiceImpl")
	private OrderLogService orderLogService;
	@Resource(name = "productServiceImpl")
	private ProductService productService;
	
	//保存提交的充值卡订单
	@InputConfig(resultName = "error")
	public String saveCard() {
		System.out.println("excute saveCard............");
		Member loginMember = getLoginMember();
		Product product = productService.load("8ae4839c3a887878013a88d343ae0036"); //默认20元腾讯充值卡
		//paymentConfig.setId("4028bc743ab4e741013ab538ee9c0006");//设置默认的支付方式
		totalProductPrice = SettingUtil.setPriceScale(product.getPrice());//默认为订单金额
		String paymentConfigName = null;
		paymentConfig = paymentConfigService.load(paymentConfig.getId());
		paymentConfigName = paymentConfig.getName();//设置支付方式名称
		Brand brand = product.getCards().getBrand();//为order准备brandId
		order = new Order();
		order.setBrandId(brand.getId());//此列不能为空
		order.setOrderStatus(OrderStatus.unprocessed);
		order.setPaymentStatus(PaymentStatus.unpaid);
		order.setPaymentConfigName(paymentConfigName);
		order.setAmountPayable(totalProductPrice);
		order.setMemo(memo);
		order.setMember(loginMember);
		order.setPaymentConfig(paymentConfig);
		
		Cards cards = product.getCards();
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
		if (setting.getScoreType() == ScoreType.cardsSet) {
			totalScore = order.getProduct().getCards().getScore();
		} else if (setting.getScoreType() == ScoreType.orderAmount) {
			totalScore = order.getAmountPayable().multiply(new BigDecimal(setting.getScoreScale().toString())).setScale(0, RoundingMode.DOWN).intValue();
		}
		return "view";
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

}