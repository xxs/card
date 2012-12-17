package net.xxs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

import net.xxs.util.JsonUtil;

import org.apache.commons.lang.StringUtils;

/**
 * 实体类 - 发货点
 */

@Entity
public class DeliveryCenter extends BaseEntity {

	private static final long serialVersionUID = 2686851860396541568L;
	
	private String name;// 发货点名称
	private String consignor;// 发货人
	private String areaStore;// 地区存储
	private String address;// 地址
	private String zipCode;// 邮编
	private String phone;// 电话
	private String mobile;// 手机
	private Boolean isDefault;// 是否默认
	private String memo;// 备注
	
	@Column(nullable = false)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false)
	public String getConsignor() {
		return consignor;
	}
	
	public void setConsignor(String consignor) {
		this.consignor = consignor;
	}
	
	@Column(nullable = false, length = 3000)
	public String getAreaStore() {
		return areaStore;
	}

	public void setAreaStore(String areaStore) {
		this.areaStore = areaStore;
	}
	
	@Column(nullable = false)
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
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
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
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

}