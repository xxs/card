package net.xxs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import net.xxs.util.JsonUtil;

import org.apache.commons.lang.StringUtils;
import org.hibernate.annotations.ForeignKey;

/**
 * 实体类 - 收货地址
 */

@Entity
public class Receiver extends BaseEntity {

	private static final long serialVersionUID = 6667934590013089481L;
	
	public static final Integer MAX_RECEIVER_COUNT = 10;// 会员收货地址最大保存数,为null则无限制

	private String name;// 收货人姓名
	private String areaStore;// 地区存储
	private String address;// 地址
	private String zipCode;// 邮编
	private String phone;// 电话
	private String mobile;// 手机
	private Boolean isDefault;// 是否默认
	
	private Member member;// 会员

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false, length = 3000)
	public String getAreaStore() {
		return areaStore;
	}

	public void setAreaStore(String areaStore) {
		this.areaStore = areaStore;
	}
	
	@Column(nullable = false, length = 3000)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(nullable = false)
	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	@Column(nullable = false)
	public Boolean getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(Boolean isDefault) {
		this.isDefault = isDefault;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(nullable = false)
	@ForeignKey(name = "fk_receiver_member")
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	// 获取地区
	@Transient
	public Area getArea() {
		if (StringUtils.isEmpty(areaStore)) {
			return null;
		}
		return JsonUtil.toObject(areaStore, Area.class);
	}
	
	// 设置地区
	@Transient
	public void setArea(Area area) {
		if (area == null) {
			areaStore = null;
			return;
		}
		areaStore = JsonUtil.toJson(area);
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (isDefault == null) {
			isDefault = false;
		}
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (isDefault == null) {
			isDefault = false;
		}
	}

}