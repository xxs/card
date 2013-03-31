package net.xxs.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 会员私有充值卡折扣
 */

@Entity
public class MemberDiscount extends BaseEntity {


	private static final long serialVersionUID = -291824187404377627L;
	
	private Member member;		// 会员信息
	private Brand brand;		// 充值卡品牌
	private Double discount;	//折扣率

	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_member_discount_member")
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@ForeignKey(name = "fk_member_discount_brand")
	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public Double getDiscount() {
		return discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (discount == null || discount < 0D) {
			discount = 0D;
		}
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (discount == null || discount < 0D) {
			discount = 0D;
		}
	}

}