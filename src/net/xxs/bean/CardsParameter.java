package net.xxs.bean;

import net.xxs.util.CommonUtil;

/**
 * Bean类 - 充值卡参数
 */

public class CardsParameter implements Comparable<CardsParameter> {
	
	private String id;// ID
	private String name;// 参数名称
	private Integer orderList;// 排序
	
	public CardsParameter() {
		this.id = CommonUtil.getUUID();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOrderList() {
		return orderList;
	}

	public void setOrderList(Integer orderList) {
		this.orderList = orderList;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (obj instanceof CardsParameter) {
			CardsParameter cardsParameter = (CardsParameter) obj;
			if (this.getId() == null || cardsParameter.getId() == null) {
				return false;
			} else {
				return (this.getId().equals(cardsParameter.getId()));
			}
		}
		return false;
	}
	
	@Override
	public int hashCode() {
		return id == null ? System.identityHashCode(this) : (this.getClass().getName() + this.getId()).hashCode();
	}

	public int compareTo(CardsParameter cardsParameter) {
		if (cardsParameter.getOrderList() == null) {
			return 1;
		}
		if (this.getOrderList() == null) {
			return -1;
		}
		return this.getOrderList().compareTo(cardsParameter.getOrderList());
	}

}