package net.xxs.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import net.xxs.util.SettingUtil;

import org.compass.annotations.Index;
import org.compass.annotations.SearchableProperty;
import org.compass.annotations.Store;
import org.hibernate.annotations.ForeignKey;

/**
 * Bean类 - 订单项
 */

@Entity
public class OrderItem extends BaseEntity {
	
	private static final long serialVersionUID = 5030818078599298690L;
	
	private String productSn;// 商品货号
	private String productName;// 商品名称
	private BigDecimal productPrice;// 商品价格（面额）
	private Integer productQuantity;// 商品数量
	private Integer deliveryQuantity;// 发货数量
	private String goodsHtmlPath;// 商品HTML静态文件路径
	private String cardNum;//卡号
	private String cardPwd;//密码
	
	private Order order;// 订单
	private Product product;// 商品
	
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
		this.productPrice = SettingUtil.setPriceScale(productPrice);
	}
	
	@Column(nullable = false, updatable = false)
	public String getGoodsHtmlPath() {
		return goodsHtmlPath;
	}

	public void setGoodsHtmlPath(String goodsHtmlPath) {
		this.goodsHtmlPath = goodsHtmlPath;
	}

	@Column(nullable = false)
	public Integer getProductQuantity() {
		return productQuantity;
	}
	
	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	@Column(nullable = false)
	public Integer getDeliveryQuantity() {
		return deliveryQuantity;
	}

	public void setDeliveryQuantity(Integer deliveryQuantity) {
		this.deliveryQuantity = deliveryQuantity;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	@ForeignKey(name = "fk_order_item_order")
	public Order getOrder() {
		return order;
	}
	
	public void setOrder(Order order) {
		this.order = order;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_order_item_product")
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	// 获取小计价格
	@Transient
	public BigDecimal getSubtotalPrice() {
		BigDecimal subtotalPrice = productPrice.multiply(new BigDecimal(productQuantity.toString()));
		return SettingUtil.setPriceScale(subtotalPrice);
	}
	
	@Lob
	@Column(nullable = false, updatable = false)
	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	@Lob
	@Column(nullable = false, updatable = false)
	public String getCardPwd() {
		return cardPwd;
	}

	public void setCardPwd(String cardPwd) {
		this.cardPwd = cardPwd;
	}
}