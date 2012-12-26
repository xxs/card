package net.xxs.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import net.xxs.util.SerialNumberUtil;

import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 支付
 */

@Entity
public class Payment extends BaseEntity {

	private static final long serialVersionUID = 6404772131152718534L;
	
	// 支付类型（在线支付）
	public enum PaymentType {
		online
	};
	
	// 支付状态（准备、超时、作废、成功、失败）
	public enum PaymentStatus {
		ready, timeout, invalid, success, failure
	};
	
	private String paymentSn;// 支付编号
	private PaymentType paymentType;// 支付类型
	private String paymentConfigName;// 支付配置名称
	private String bankName;// 收款银行名称
	private String bankAccount;// 收款银行账号
	private BigDecimal amount;// 支付金额
	private String payer;// 付款人
	private String operator;// 操作员
	private String memo;// 备注
	private PaymentStatus paymentStatus;// 支付状态
	
	private Member member;// 会员
	private PaymentConfig paymentConfig;// 支付方式
	private Deposit deposit;// 预存款
	private Order order;// 订单
	
	@Column(nullable = false, updatable = false, unique = true)
	public String getPaymentSn() {
		return paymentSn;
	}
	
	public void setPaymentSn(String paymentSn) {
		this.paymentSn = paymentSn;
	}
	
	@Enumerated
	@Column(nullable = false, updatable = false)
	public PaymentType getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(PaymentType paymentType) {
		this.paymentType = paymentType;
	}

	@Column(nullable = false, updatable = false)
	public String getPaymentConfigName() {
		return paymentConfigName;
	}

	public void setPaymentConfigName(String paymentConfigName) {
		this.paymentConfigName = paymentConfigName;
	}

	@Column(updatable = false)
	public String getBankName() {
		return bankName;
	}
	
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	
	@Column(updatable = false)
	public String getBankAccount() {
		return bankAccount;
	}
	
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	@Column(nullable = false, updatable = false, precision = 15, scale = 5)
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
	@Enumerated
	@Column(nullable = false)
	public PaymentStatus getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(PaymentStatus paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	@Column(updatable = false)
	public String getPayer() {
		return payer;
	}
	
	public void setPayer(String payer) {
		this.payer = payer;
	}
	
	@Column(updatable = false)
	public String getOperator() {
		return operator;
	}
	
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	@Column(updatable = false, length = 3000)
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_payment_member")
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_payment_payment_config")
	public PaymentConfig getPaymentConfig() {
		return paymentConfig;
	}

	public void setPaymentConfig(PaymentConfig paymentConfig) {
		this.paymentConfig = paymentConfig;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_payment_deposit")
	public Deposit getDeposit() {
		return deposit;
	}

	public void setDeposit(Deposit deposit) {
		this.deposit = deposit;
	}

	
	@OneToOne(mappedBy = "payment", fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_payment_order")
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		paymentSn = SerialNumberUtil.buildPaymentSn();
	}

}