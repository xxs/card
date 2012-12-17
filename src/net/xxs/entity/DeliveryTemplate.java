package net.xxs.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Transient;

/**
 * 实体类 - 快递单模板
 */

@Entity
public class DeliveryTemplate extends BaseEntity {

	private static final long serialVersionUID = -8784696118717650632L;
	
	private String name;// 名称
	private String content;// 内容
	private Boolean isDefault;// 是否默认
	private String memo;// 备注
	
	@Column(nullable = false)
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(nullable = false, length = 3000)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

}