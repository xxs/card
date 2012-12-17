package net.xxs.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

/**
 * 实体类 - 物流公司
 */

@Entity
public class DeliveryCorp extends BaseEntity {

	private static final long serialVersionUID = 10595703086045998L;

	private String name;// 名称
	private String url;// 网址
	private Integer orderList;// 排序
	
	private Set<DeliveryType> deliveryTypeSet = new HashSet<DeliveryType>();// 配送方式

	@Column(nullable = false)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getOrderList() {
		return orderList;
	}

	public void setOrderList(Integer orderList) {
		this.orderList = orderList;
	}

	@OneToMany(mappedBy = "defaultDeliveryCorp", fetch = FetchType.LAZY)
	public Set<DeliveryType> getDeliveryTypeSet() {
		return deliveryTypeSet;
	}

	public void setDeliveryTypeSet(Set<DeliveryType> deliveryTypeSet) {
		this.deliveryTypeSet = deliveryTypeSet;
	}
	
	// 保存处理
	@Override
	@Transient
	public void onSave() {
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}
	
	// 更新处理
	@Override
	@Transient
	public void onUpdate() {
		if (orderList == null || orderList < 0) {
			orderList = 0;
		}
	}

}