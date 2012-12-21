package net.xxs.entity;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import net.xxs.util.SerialNumberUtil;
import net.xxs.util.SettingUtil;

import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 订单
 */

@Entity
public class Order extends BaseEntity {

	private static final long serialVersionUID = -8541323033439515148L;

	// 订单状态（未处理、已处理、已完成、已作废）
	public enum OrderStatus {
		unprocessed, processed, completed, invalid
	};

	// 付款状态（未支付、支付中、已支付）
	public enum PaymentStatus {
		unpaid, paymenting, paid
	};

	private String orderSn;// 订单编号
	private String brandId;// 品牌编号（为获取通道及费率单独添加）
	private OrderStatus orderStatus;// 订单状态
	private PaymentStatus paymentStatus;// 支付状态
	private String paymentConfigName;// 支付方式名称
	private BigDecimal amountPayable;// 应付金额
	private BigDecimal paidAmount;// 实付金额
	private String memo;// 附言
	private String payStatus;//记录支付过程中的状态码
	
	private String productSn;// 充值卡货号
	private String productName;// 充值卡名称
	private BigDecimal productPrice;// 充值卡价格（面额）
	private String cardsHtmlPath;// 充值卡HTML静态文件路径
	private String cardNum;//卡号
	private String cardPwd;//密码
	
	private Product product;// 充值卡
	private Member member;// 会员
	private PaymentConfig paymentConfig;// 支付方式
	
	private Set<OrderLog> orderLogSet = new HashSet<OrderLog>();// 订单日志
	private Set<Payment> paymentSet = new HashSet<Payment>();// 收款
	
	@Column(nullable = false, updatable = false, unique = true)
	public String getOrderSn() {
		return orderSn;
	}
	
	public void setOrderSn(String orderSn) {
		this.orderSn = orderSn;
	}
	
	@Enumerated
	@Column(nullable = false)
	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Enumerated
	@Column(nullable = false)
	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	
	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getAmountPayable() {
		return amountPayable;
	}

	public void setAmountPayable(BigDecimal amountPayable) {
		this.amountPayable = SettingUtil.setPriceScale(amountPayable);
	}

	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = paidAmount;
	}

	@Column(nullable = false)
	public String getPaymentConfigName() {
		return paymentConfigName;
	}

	public void setPaymentConfigName(String paymentConfigName) {
		this.paymentConfigName = paymentConfigName;
	}
	
	@Column(nullable = false)
	public String getBrandId() {
		return brandId;
	}

	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	
	@Column(length = 100)
	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	@Column(length = 3000)
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_order_member")
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	@OneToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_order_payment_config")
	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

	@OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
	@OrderBy("createDate asc")
	public Set<OrderLog> getOrderLogSet() {
		return orderLogSet;
	}

	public void setOrderLogSet(Set<OrderLog> orderLogSet) {
		this.orderLogSet = orderLogSet;
	}

	@OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade = {CascadeType.REMOVE})
	@OrderBy("createDate desc")
	public Set<Payment> getPaymentSet() {
		return paymentSet;
	}

	public void setPaymentSet(Set<Payment> paymentSet) {
		this.paymentSet = paymentSet;
	}

	// 保存处理
	@Override
	@Transient
	public void onSave() {
		orderSn = SerialNumberUtil.buildOrderSn();
		if (paidAmount == null || paidAmount.compareTo(new BigDecimal(0)) < 0) {
			paidAmount = new BigDecimal(0);
		}
	}
	
	@Column(nullable = false, updatable = false)
	public String getProductSn() {
		return productSn;
	}
	
	public void setProductSn(String productSn) {
		this.productSn = productSn;
	}
	@Column(nullable = false, updatable = false)
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(BigDecimal productPrice) {
		this.productPrice = productPrice;
	}
	@Column(nullable = false, updatable = false)
	public String getCardsHtmlPath() {
		return cardsHtmlPath;
	}

	public void setCardsHtmlPath(String cardsHtmlPath) {
		this.cardsHtmlPath = cardsHtmlPath;
	}
	@Column(nullable = false, updatable = false)
	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	@Column(nullable = false, updatable = false)
	public String getCardPwd() {
		return cardPwd;
	}
	
	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_order_product")
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
}