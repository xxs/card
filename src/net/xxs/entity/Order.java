package net.xxs.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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

import net.xxs.util.JsonUtil;
import net.xxs.util.SerialNumberUtil;
import net.xxs.util.SettingUtil;

import org.apache.commons.lang.StringUtils;
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

	// 付款状态（未支付、部分支付、已支付、部分退款、全额退款）
	public enum PaymentStatus {
		unpaid, partPayment, paid, partRefund, refunded
	};

	// 配送状态（未发货、部分发货、已发货、部分退货、已退货）
	public enum ShippingStatus {
		unshipped, partShipped, shipped, partReshiped, reshiped
	};

	private String orderSn;// 订单编号
	private String brandId;// 品牌编号（为获取通道及费率单独添加）
	private OrderStatus orderStatus;// 订单状态
	private PaymentStatus paymentStatus;// 支付状态
	private String paymentConfigName;// 支付方式名称
	private BigDecimal totalProductPrice;// 总商品价格
	private BigDecimal paymentFee;// 支付费用
	private BigDecimal totalAmount;// 订单总额
	private BigDecimal paidAmount;// 已付金额
	private Integer totalProductQuantity;// 总商品数量
	private String memo;// 附言
	private String cardsIdListStore;// 商品ID集合储存
	
	private Member member;// 会员
	private PaymentConfig paymentConfig;// 支付方式
	
	private String payStatus;//记录支付过程中的状态码
	
	private Set<OrderItem> orderItemSet = new HashSet<OrderItem>();// 订单项
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
	public BigDecimal getTotalProductPrice() {
		return totalProductPrice;
	}
	
	public void setTotalProductPrice(BigDecimal totalProductPrice) {
		this.totalProductPrice = SettingUtil.setPriceScale(totalProductPrice);
	}
	
	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getPaymentFee() {
		return paymentFee;
	}

	public void setPaymentFee(BigDecimal paymentFee) {
		this.paymentFee = SettingUtil.setPriceScale(paymentFee);
	}

	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = SettingUtil.setPriceScale(totalAmount);
	}

	@Column(nullable = false, precision = 15, scale = 5)
	public BigDecimal getPaidAmount() {
		return paidAmount;
	}
	
	public void setPaidAmount(BigDecimal paidAmount) {
		this.paidAmount = SettingUtil.setPriceScale(paidAmount);
	}
	
	@Column(nullable = false)
	public String getPaymentConfigName() {
		return paymentConfigName;
	}

	public void setPaymentConfigName(String paymentConfigName) {
		this.paymentConfigName = paymentConfigName;
	}
	
	@Column(nullable = false)
	public Integer getTotalProductQuantity() {
		return totalProductQuantity;
	}

	public void setTotalProductQuantity(Integer totalProductQuantity) {
		this.totalProductQuantity = totalProductQuantity;
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
	
	@Column(length = 3000)
	public String getCardsIdListStore() {
		return cardsIdListStore;
	}

	public void setCardsIdListStore(String cardsIdListStore) {
		this.cardsIdListStore = cardsIdListStore;
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
	public Set<OrderItem> getOrderItemSet() {
		return orderItemSet;
	}

	public void setOrderItemSet(Set<OrderItem> orderItemSet) {
		this.orderItemSet = orderItemSet;
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

	// 获取商品ID集合
	@SuppressWarnings("unchecked")
	@Transient
	public List<String> getCardsIdList() {
		if (StringUtils.isEmpty(cardsIdListStore)) {
			return null;
		}
		return JsonUtil.toObject(cardsIdListStore, ArrayList.class);
	}
	
	// 设置商品ID集合
	@Transient
	public void setCardsIdList(List<String> cardsIdList) {
		if (cardsIdList == null || cardsIdList.size() == 0) {
			cardsIdListStore = null;
			return;
		}
		cardsIdListStore = JsonUtil.toJson(cardsIdList);
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		orderSn = SerialNumberUtil.buildOrderSn();
	}

}